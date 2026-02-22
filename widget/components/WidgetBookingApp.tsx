import React, { useEffect, useState, useRef } from 'react';
import { supabase } from '../../lib/supabase';
import { Experience } from '../../types';

/* ─── Availability helpers ───────────────────────────────────────────── */
interface Slot {
  id: number;
  experience_id: string;
  date: string;
  start_time: string;
  end_time: string;
  max_participants: number;
  booked_participants: number;
  is_available: boolean;
}
interface SlotGroup { label: string; date: string; slots: Slot[]; }

function fmtTime(t: string) {
  const [h, m] = t.split(':').map(Number);
  const ap = h >= 12 ? 'PM' : 'AM';
  return `${h % 12 || 12}:${String(m).padStart(2, '0')} ${ap}`;
}
function fmtDate(d: string) {
  const [y, mo, day] = d.split('-').map(Number);
  const dt = new Date(y, mo - 1, day);
  return dt.toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric' });
}
function haversineKm(lat1: number, lon1: number, lat2: number, lon2: number): number {
  const R = 6371;
  const toRad = (d: number) => d * Math.PI / 180;
  const dLat = toRad(lat2 - lat1);
  const dLon = toRad(lon2 - lon1);
  const a = Math.sin(dLat / 2) ** 2 + Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * Math.sin(dLon / 2) ** 2;
  return R * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
}

/* ─── Hotel config shape ────────────────────────────────────────────── */
interface HotelBrand {
  id: string;
  name: string;
  logoUrl?: string;
  latitude?: number;
  longitude?: number;
  transportationPrice?: number;
  theme: {
    primaryColor: string;
    primaryTextColor: string;
    accentColor: string;
    backgroundColor: string;
    surfaceColor: string;
    fontHeading: string;
    fontBody: string;
  };
}

/* ─── Countries ─────────────────────────────────────────────────────── */
const COUNTRIES = [
  { code: 'PT', dial: '+351', flag: '🇵🇹' },
  { code: 'ES', dial: '+34',  flag: '🇪🇸' },
  { code: 'GB', dial: '+44',  flag: '🇬🇧' },
  { code: 'FR', dial: '+33',  flag: '🇫🇷' },
  { code: 'DE', dial: '+49',  flag: '🇩🇪' },
  { code: 'US', dial: '+1',   flag: '🇺🇸' },
  { code: 'IT', dial: '+39',  flag: '🇮🇹' },
  { code: 'NL', dial: '+31',  flag: '🇳🇱' },
  { code: 'BR', dial: '+55',  flag: '🇧🇷' },
];

/* ─── Inline SVG icons ──────────────────────────────────────────────── */
const I = {
  back: <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><polyline points="15 18 9 12 15 6"/></svg>,
  share: <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><circle cx="18" cy="5" r="3"/><circle cx="6" cy="12" r="3"/><circle cx="18" cy="19" r="3"/><line x1="8.59" y1="13.51" x2="15.42" y2="17.49"/><line x1="15.41" y1="6.51" x2="8.59" y2="10.49"/></svg>,
  heart: <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M20.84 4.61a5.5 5.5 0 00-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 00-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 000-7.78z"/></svg>,
  clock: <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>,
  users: <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 00-3-3.87"/><path d="M16 3.13a4 4 0 010 7.75"/></svg>,
  globe: <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 014 10 15.3 15.3 0 01-4 10 15.3 15.3 0 01-4-10 15.3 15.3 0 014-10z"/></svg>,
  star: <svg width="13" height="13" viewBox="0 0 24 24" fill="currentColor" className="text-gray-900"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>,
  mapPin: <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/><circle cx="12" cy="10" r="3"/></svg>,
  play: <svg width="22" height="22" viewBox="0 0 24 24" fill="white"><polygon points="5 3 19 12 5 21 5 3"/></svg>,
  camera: <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M23 19a2 2 0 01-2 2H3a2 2 0 01-2-2V8a2 2 0 012-2h4l2-3h6l2 3h4a2 2 0 012 2z"/><circle cx="12" cy="13" r="4"/></svg>,
  info: <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="16" x2="12" y2="12"/><line x1="12" y1="8" x2="12.01" y2="8"/></svg>,
  alert: <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>,
  shield: <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>,
  award: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="8" r="7"/><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"/></svg>,
  x: <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>,
  nav: <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"><polygon points="3 11 22 2 13 21 11 13 3 11"/></svg>,
  car: <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"><path d="M5 17h14v-5l-2-5H7L5 12z"/><circle cx="7.5" cy="17.5" r="2.5"/><circle cx="16.5" cy="17.5" r="2.5"/></svg>,
  train: <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"><rect x="4" y="3" width="16" height="16" rx="2"/><path d="M4 11h16"/><path d="M12 3v8"/><circle cx="8.5" cy="15.5" r="1"/><circle cx="15.5" cy="15.5" r="1"/><path d="M8 19l-2 3"/><path d="M16 19l2 3"/></svg>,
  lock: <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#9ca3af" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0110 0v4"/></svg>,
  spin: <svg className="w-5 h-5 animate-spin" viewBox="0 0 24 24" fill="none"><circle cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="3" strokeDasharray="60" className="opacity-25"/><circle cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="3" strokeDasharray="15 45"/></svg>,
};

const Chk = ({ color = '#16a34a' }: { color?: string }) => (
  <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
);

/* ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ */
type Step = 'loading' | 'error' | 'detail' | 'time' | 'booking' | 'confirmed';

export function WidgetBookingApp() {
  const params  = new URLSearchParams(window.location.search);
  const hotelId = params.get('hotel') || '';
  const expId   = params.get('exp') || '';

  const [step, setStep]             = useState<Step>('loading');
  const [hotel, setHotel]           = useState<HotelBrand | null>(null);
  const [exp, setExp]               = useState<Experience | null>(null);
  const [slotGroups, setSlotGroups] = useState<SlotGroup[]>([]);
  const [slotsLoading, setSlotsLoading] = useState(true);
  const [selectedSlot, setSelectedSlot] = useState<Slot | null>(null);
  const [guests, setGuests]         = useState(1);
  const [showAllPhotos, setShowAllPhotos] = useState(false);
  const [showVideoModal, setShowVideoModal] = useState(false);
  const [addTransport, setAddTransport] = useState(false);
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName]   = useState('');
  const [email, setEmail]         = useState('');
  const [phone, setPhone]         = useState('');
  const [country, setCountry]     = useState(COUNTRIES[0]);
  const [submitting, setSubmitting] = useState(false);
  const scrollRef = useRef<HTMLDivElement>(null);

  /* ── Fetch hotel + experience ──────────────────────────────── */
  useEffect(() => {
    if (!hotelId || !expId) { setStep('error'); return; }
    (async () => {
      try {
        const { data: h } = await supabase.from('hotel_config').select('*').eq('id', hotelId).single();
        if (h) setHotel({
          id: h.id, name: h.name, logoUrl: h.logo_url,
          latitude: h.latitude, longitude: h.longitude,
          transportationPrice: h.transportation_price,
          theme: h.theme || { primaryColor:'#0f172a', primaryTextColor:'#fff', accentColor:'#10b981', backgroundColor:'#fafaf8', surfaceColor:'#fff', fontHeading:'Inter', fontBody:'Inter' },
        });
        const { data: e } = await supabase.from('experiences').select('*').eq('id', expId).single();
        if (!e) { setStep('error'); return; }
        setExp(e); setStep('detail');
      } catch { setStep('error'); }
    })();
  }, []);

  /* ── Inject branding CSS ───────────────────────────────────── */
  useEffect(() => {
    if (!hotel) return;
    const t = hotel.theme;
    const fontsNeeded = [...new Set([t.fontHeading, t.fontBody])].filter(f => !['Inter','system-ui','sans-serif','-apple-system'].includes(f));
    if (fontsNeeded.length) {
      const link = document.createElement('link'); link.rel = 'stylesheet';
      link.href = 'https://fonts.googleapis.com/css2?' + fontsNeeded.map(f => `family=${f.replace(/ /g, '+')}:wght@300;400;500;600;700`).join('&') + '&display=swap';
      document.head.appendChild(link);
    }
    const style = document.createElement('style'); style.id = 'wb-theme';
    style.textContent = `:root{--wb-primary:${t.primaryColor};--wb-primary-text:${t.primaryTextColor};--wb-accent:${t.accentColor};--wb-bg:${t.backgroundColor};--wb-surface:${t.surfaceColor};--wb-font-heading:'${t.fontHeading}',sans-serif;--wb-font-body:'${t.fontBody}',sans-serif}body{background:${t.backgroundColor};font-family:var(--wb-font-body);color:#1a1a1a}h1,h2,h3,h4,h5,h6{font-family:var(--wb-font-heading)}`;
    document.head.appendChild(style);
    return () => { style.remove(); };
  }, [hotel]);

  /* ── Fetch availability ────────────────────────────────────── */
  useEffect(() => {
    if (!exp) return;
    (async () => {
      setSlotsLoading(true);
      try {
        const today = new Date(); today.setHours(0,0,0,0);
        const from = today.toISOString().split('T')[0];
        const toD = new Date(today); toD.setDate(today.getDate() + 30);
        const to = toD.toISOString().split('T')[0];
        const { data } = await supabase.from('availability_slots').select('*').eq('experience_id', exp.id).gte('date', from).lte('date', to).eq('is_available', true).order('date').order('start_time');
        const now = new Date();
        const valid = (data || []).filter((s: Slot) => {
          if (s.max_participants - s.booked_participants <= 0) return false;
          const [y,mo,d] = s.date.split('-').map(Number);
          const [hh,mm] = s.start_time.split(':').map(Number);
          return new Date(y, mo-1, d, hh, mm) > now;
        });
        const map = new Map<string, Slot[]>();
        for (const s of valid) { if (!map.has(s.date)) map.set(s.date, []); map.get(s.date)!.push(s); }
        setSlotGroups(Array.from(map.entries()).map(([date, slots]) => ({ label: fmtDate(date), date, slots })));
      } catch { /* ignore */ }
      setSlotsLoading(false);
    })();
  }, [exp]);

  /* ── Derived ───────────────────────────────────────────────── */
  const tPrice      = hotel?.transportationPrice ?? 20;
  const feeRate     = 0.12;
  const basePP      = (exp?.price || 0) + (addTransport ? tPrice : 0);
  const subtotal    = basePP * guests;
  const serviceFee  = Math.round(subtotal * feeRate * 100) / 100;
  const total       = subtotal + serviceFee;
  const canSubmit   = firstName.trim() && lastName.trim() && email.trim() && phone.trim();
  const photos      = exp?.images?.length ? exp.images : exp?.image_url ? [exp.image_url] : [];
  const primary     = hotel?.theme.primaryColor || '#0f172a';
  const dist        = exp?.latitude && exp?.longitude && hotel?.latitude && hotel?.longitude ? haversineKm(hotel.latitude, hotel.longitude, exp.latitude, exp.longitude) : null;
  const preview     = slotGroups.flatMap(g => g.slots.map(s => ({ ...s, dateLabel: g.label }))).slice(0, 5);

  const handleBooking = async () => {
    if (!canSubmit || !selectedSlot || !exp) return;
    setSubmitting(true);
    try { await supabase.from('bookings').insert({ experience_id: exp.id, slot_id: selectedSlot.id, guests, first_name: firstName, last_name: lastName, email, phone: `${country.dial}${phone}`, total_price: total, status: 'pending' }); } catch {}
    setSubmitting(false); setStep('confirmed');
  };

  /* ━━━ LOADING ━━━ */
  if (step === 'loading') return (
    <div className="min-h-screen flex items-center justify-center">
      <div className="flex flex-col items-center gap-4">
        <div className="w-10 h-10 border-3 border-gray-200 border-t-gray-600 rounded-full animate-spin" />
        <span className="text-gray-400 text-sm">Loading experience…</span>
      </div>
    </div>
  );

  /* ━━━ ERROR ━━━ */
  if (step === 'error') return (
    <div className="min-h-screen flex items-center justify-center px-6">
      <div className="text-center max-w-md">
        <div className="text-5xl mb-4">😔</div>
        <h1 className="text-xl font-semibold text-gray-900 mb-2">Experience not found</h1>
        <p className="text-gray-500 text-sm">The experience you're looking for doesn't exist or is no longer available.</p>
      </div>
    </div>
  );

  /* ━━━ CONFIRMED ━━━ */
  if (step === 'confirmed') return (
    <div className="min-h-screen flex items-center justify-center px-6" style={{ background: hotel?.theme.backgroundColor }}>
      <div className="text-center max-w-sm">
        <div className="w-16 h-16 rounded-full bg-emerald-100 flex items-center justify-center mx-auto mb-6">
          <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="#059669" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
        </div>
        <h1 className="text-2xl font-semibold text-gray-900 mb-2" style={{ fontFamily: 'var(--wb-font-heading)' }}>Booking confirmed!</h1>
        <p className="text-gray-500 text-sm leading-relaxed">
          We've sent a confirmation to <strong>{email}</strong>.<br />
          {selectedSlot && <>See you on {fmtDate(selectedSlot.date)} at {fmtTime(selectedSlot.start_time)}!</>}
        </p>
        {hotel && <p className="text-gray-400 text-xs mt-4">Booked with {hotel.name} × Bored Tourist</p>}
        <button onClick={() => { setStep('detail'); setSelectedSlot(null); }} className="mt-8 px-8 py-3 text-white font-semibold rounded-full text-sm" style={{ backgroundColor: primary }}>Back to experience</button>
      </div>
    </div>
  );

  /* ━━━ BOOKING FORM ━━━ */
  if (step === 'booking' && selectedSlot && exp) return (
    <div className="min-h-screen bg-white">
      <div className="border-b border-gray-100 px-4 sm:px-8 py-4 flex items-center gap-4">
        <button onClick={() => setStep('time')} className="flex items-center gap-1.5 text-sm font-medium text-gray-600 hover:text-gray-900 transition-colors">{I.back} Back</button>
        <span className="text-xs text-gray-300">|</span>
        <span className="text-sm text-gray-500 font-medium">Checkout</span>
      </div>
      <div className="max-w-5xl mx-auto px-4 sm:px-8 py-10">
        <h1 className="text-3xl font-bold text-gray-900 mb-10" style={{ fontFamily: 'var(--wb-font-heading)' }}>Review and pay</h1>
        <div className="grid grid-cols-1 lg:grid-cols-[1fr_380px] gap-12">
          <div className="space-y-10">
            <section>
              <h2 className="text-xl font-semibold text-gray-900 mb-5">Guest details</h2>
              <div className="space-y-3">
                <div className="grid grid-cols-2 gap-3">
                  <FloatInput label="First name *" value={firstName} onChange={setFirstName} />
                  <FloatInput label="Last name *" value={lastName} onChange={setLastName} />
                </div>
                <FloatInput label="Email address *" value={email} onChange={setEmail} type="email" />
                <div className="grid grid-cols-[140px_1fr] gap-3">
                  <div className="relative">
                    <label className="absolute top-2 left-3 text-[10px] font-semibold text-gray-500 uppercase tracking-wide">Country</label>
                    <select value={country.code} onChange={e => setCountry(COUNTRIES.find(c => c.code === e.target.value) || COUNTRIES[0])} className="w-full pt-6 pb-2 pl-3 pr-6 border border-gray-300 rounded-lg text-sm text-gray-900 bg-white focus:outline-none focus:border-gray-900 appearance-none">
                      {COUNTRIES.map(c => <option key={c.code} value={c.code}>{c.flag} {c.dial}</option>)}
                    </select>
                  </div>
                  <FloatInput label="Phone number *" value={phone} onChange={setPhone} type="tel" />
                </div>
              </div>
            </section>
            <section className="border-t border-gray-100 pt-8">
              <h2 className="text-xl font-semibold text-gray-900 mb-5">Trip details</h2>
              <div className="space-y-3">
                <InfoRow label="Date" value={fmtDate(selectedSlot.date)} />
                <InfoRow label="Time" value={`${fmtTime(selectedSlot.start_time)} – ${fmtTime(selectedSlot.end_time)}`} />
                <InfoRow label="Guests" value={`${guests} adult${guests !== 1 ? 's' : ''}`} />
                {addTransport && <InfoRow label="Hotel transfer" value={`+€${tPrice}/person`} />}
              </div>
            </section>
            <section className="border-t border-gray-100 pt-8">
              <h2 className="text-xl font-semibold text-gray-900 mb-1">Payment details</h2>
              <p className="text-sm text-gray-400 mb-5">All transactions are secure and encrypted.</p>
              <div className="border border-gray-200 rounded-xl p-5 bg-gray-50 flex items-center gap-4">
                {I.lock}
                <div>
                  <p className="text-sm font-medium text-gray-700">Secure payment via Stripe</p>
                  <p className="text-xs text-gray-400 mt-0.5">You'll be redirected to complete payment after booking.</p>
                </div>
              </div>
            </section>
          </div>
          <div>
            <div className="sticky top-6 space-y-5">
              <div className="flex items-start gap-4 p-4 border border-gray-200 rounded-2xl">
                <img src={photos[0]} alt={exp.title} className="w-16 h-16 rounded-xl object-cover flex-shrink-0" />
                <div className="min-w-0">
                  <p className="text-sm font-semibold text-gray-900 leading-snug line-clamp-2">{exp.title}</p>
                  <p className="text-xs text-gray-500 mt-1">{fmtDate(selectedSlot.date)} · {guests} Adult{guests !== 1 ? 's' : ''}</p>
                </div>
              </div>
              <div className="border border-gray-200 rounded-2xl p-5 space-y-3">
                <h3 className="text-base font-semibold text-gray-900">Booking summary</h3>
                <div className="flex justify-between text-sm"><span className="text-gray-600">{exp.currency}{exp.price} × {guests}</span><span className="text-gray-900 font-medium">{exp.currency}{(exp.price * guests).toFixed(2)}</span></div>
                {addTransport && <div className="flex justify-between text-sm"><span className="text-gray-600">Hotel transfer × {guests}</span><span className="text-gray-900 font-medium">{exp.currency}{(tPrice * guests).toFixed(2)}</span></div>}
                <div className="flex justify-between text-sm"><span className="text-gray-600">Service fee</span><span className="text-gray-900 font-medium">{exp.currency}{serviceFee.toFixed(2)}</span></div>
                <div className="flex justify-between text-sm font-bold border-t border-gray-100 pt-3"><span>Total</span><span>{exp.currency}{total.toFixed(2)}</span></div>
              </div>
              <button onClick={handleBooking} disabled={!canSubmit || submitting} className="w-full py-4 text-white font-semibold text-sm rounded-full transition-colors disabled:bg-gray-200 disabled:text-gray-400" style={{ backgroundColor: canSubmit && !submitting ? primary : undefined }}>
                {submitting ? 'Processing…' : `Book now · ${exp.currency}${total.toFixed(2)}`}
              </button>
              <p className="text-xs text-gray-400 leading-relaxed text-center">By selecting Book now, I agree to the Terms of Use and Privacy Policy.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );

  /* ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ */
  /*  DETAIL VIEW — matches main site DetailModal exactly         */
  /* ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ */
  return (
    <div className="fixed inset-0 z-[100] bg-white flex flex-col">

      {/* ── Sticky Top Bar ─── */}
      <div className="flex-shrink-0 sticky top-0 z-50 bg-white border-b border-gray-100 px-4 sm:px-6 py-3 flex items-center justify-between">
        <div className="flex items-center gap-3">
          <button
            onClick={() => {
              if (window.history.length > 1) {
                window.history.back();
              } else {
                window.close();
              }
            }}
            className="flex items-center gap-1 px-2 py-2 -ml-2 text-sm font-medium text-gray-600 hover:text-gray-900 hover:bg-gray-100 rounded-full transition-colors"
            aria-label="Go back"
          >
            {I.back}
          </button>
          {hotel?.logoUrl ? <img src={hotel.logoUrl} alt={hotel.name} className="h-8 max-w-[160px] object-contain" /> : hotel ? <span className="text-lg font-bold text-gray-900" style={{ fontFamily: 'var(--wb-font-heading)' }}>{hotel.name}</span> : null}
        </div>
        <div className="flex items-center gap-1">
          <button className="flex items-center gap-1.5 px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100 rounded-full transition-colors underline">{I.share} Share</button>
          <button className="flex items-center gap-1.5 px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100 rounded-full transition-colors underline">{I.heart} Save</button>
          <div className="hidden sm:flex items-center gap-1.5 ml-3 text-xs text-gray-400">
            <span>Powered by</span>
            <a href="https://boredtourist.com" target="_blank" rel="noopener noreferrer" className="font-semibold text-gray-500 hover:text-gray-700 transition-colors">Bored Tourist</a>
          </div>
        </div>
      </div>

      {/* ── Scrollable Content ─── */}
      <div ref={scrollRef} className="flex-1 overflow-y-auto">
        <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">

          {/* Title & Rating */}
          <div className="pt-6 pb-4">
            <h1 className="text-2xl sm:text-3xl font-semibold text-gray-900 leading-tight" style={{ fontFamily: 'var(--wb-font-heading)' }}>{exp?.title}</h1>
            <div className="flex flex-wrap items-center gap-1.5 mt-2 text-sm">
              {(exp?.rating ?? 0) > 0 && <>{I.star}<span className="font-semibold text-gray-900">{exp!.rating}</span><span className="text-gray-300">·</span></>}
              {exp?.location && <span className="font-medium text-gray-900 underline">{exp.location}</span>}
            </div>
          </div>

          {/* ── Photo Gallery (Airbnb grid) ─── */}
          <div className="mb-8 -mx-4 sm:-mx-6 lg:-mx-8">
            {photos.length >= 2 ? (
              <div className="relative grid grid-cols-2 sm:grid-cols-4 grid-rows-2 gap-1 sm:gap-2 h-[260px] sm:h-[400px] overflow-hidden sm:rounded-2xl">
                <div className="col-span-1 sm:col-span-2 row-span-2 relative overflow-hidden bg-gray-100">
                  {exp?.video_url ? (<>
                    <video src={exp.video_url} className="absolute inset-0 w-full h-full object-cover" loop playsInline muted poster={photos[0]} />
                    <button onClick={() => setShowVideoModal(true)} className="absolute inset-0 flex items-center justify-center group">
                      <div className="w-14 h-14 rounded-full bg-black/40 backdrop-blur-sm flex items-center justify-center transition-all group-hover:bg-black/60">{I.play}</div>
                    </button>
                  </>) : <img src={photos[0]} alt={exp?.title} className="absolute inset-0 w-full h-full object-cover" />}
                </div>
                {photos.slice(1, 5).map((p, i) => <div key={i} className="relative overflow-hidden bg-gray-100"><img src={p} alt="" className="absolute inset-0 w-full h-full object-cover hover:brightness-95 transition-all cursor-pointer" /></div>)}
                {photos.length > 1 && <button onClick={() => setShowAllPhotos(true)} className="absolute bottom-3 right-3 sm:bottom-4 sm:right-4 flex items-center gap-2 bg-white border border-gray-300 text-gray-900 text-xs sm:text-sm font-medium px-3 sm:px-4 py-1.5 sm:py-2 rounded-lg hover:bg-gray-50 shadow-sm">{I.camera}<span>Show all photos</span></button>}
              </div>
            ) : (
              <div className="relative h-[300px] sm:h-[460px] overflow-hidden sm:rounded-2xl bg-gray-100">
                {exp?.video_url ? (<>
                  <video src={exp.video_url} className="absolute inset-0 w-full h-full object-cover" loop playsInline muted poster={photos[0]} />
                  <button onClick={() => setShowVideoModal(true)} className="absolute inset-0 flex items-center justify-center group">
                    <div className="w-16 h-16 rounded-full bg-black/40 backdrop-blur-sm flex items-center justify-center transition-all group-hover:bg-black/60">{I.play}</div>
                  </button>
                </>) : <img src={photos[0]} alt={exp?.title} className="absolute inset-0 w-full h-full object-cover" />}
              </div>
            )}
          </div>

          {/* ── Two-Column Layout ─── */}
          <div className="grid grid-cols-1 lg:grid-cols-[1fr_340px] gap-12 pb-32 lg:pb-12">

            {/* ══ LEFT ══ */}
            <div className="space-y-0 min-w-0">

              {/* Quick badges */}
              <div className="flex flex-wrap items-center gap-6 pb-7 border-b border-gray-200">
                {exp?.duration && <div className="flex items-center gap-2 text-gray-700">{I.clock}<span className="text-sm">{exp.duration}</span></div>}
                {exp?.max_group_size && <div className="flex items-center gap-2 text-gray-700">{I.users}<span className="text-sm">Up to {exp.max_group_size} guests</span></div>}
                <div className="flex items-center gap-2 text-gray-700">{I.globe}<span className="text-sm">{exp?.languages?.length ? exp.languages.join(', ') : 'English'}</span></div>
              </div>

              {/* What you'll do */}
              <div className="py-8 border-b border-gray-200">
                <h2 className="text-xl font-semibold text-gray-900 mb-4">What you'll do</h2>
                <p className="text-gray-600 leading-relaxed text-[15px] whitespace-pre-line">{exp?.description}</p>
                {exp?.highlights && exp.highlights.length > 0 && (
                  <ul className="mt-5 space-y-3">
                    {exp.highlights.map((h, i) => (
                      <li key={i} className="flex items-start gap-3">
                        <div className="w-5 h-5 rounded-full bg-gray-900 flex items-center justify-center flex-shrink-0 mt-0.5"><span className="text-white text-[10px] font-bold">{i+1}</span></div>
                        <span className="text-gray-700 text-[15px] leading-snug">{h}</span>
                      </li>
                    ))}
                  </ul>
                )}
              </div>

              {/* What's included */}
              <div className="py-8 border-b border-gray-200">
                <h2 className="text-xl font-semibold text-gray-900 mb-5">What's included</h2>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  {(exp?.whats_included?.length ? exp.whats_included : ['Professional local guide','Small group experience','All tastings & samples','Hotel pickup coordination']).map((item, i) => (
                    <div key={i} className="flex items-start gap-3">
                      <div className="w-5 h-5 rounded-full bg-green-100 flex items-center justify-center flex-shrink-0 mt-0.5"><Chk /></div>
                      <span className="text-[15px] text-gray-700 leading-snug">{item}</span>
                    </div>
                  ))}
                </div>
              </div>

              {/* What to bring */}
              <div className="py-8 border-b border-gray-200">
                <h2 className="text-xl font-semibold text-gray-900 mb-5">What to bring</h2>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  {(exp?.value_to_bring?.length ? exp.value_to_bring : ['Comfortable walking shoes','Weather-appropriate clothing','Camera or smartphone','Water bottle']).map((item, i) => (
                    <div key={i} className="flex items-start gap-3">
                      <div className="w-5 h-5 rounded-full bg-blue-50 flex items-center justify-center flex-shrink-0 mt-0.5"><span className="text-blue-500">{I.info}</span></div>
                      <span className="text-[15px] text-gray-700 leading-snug">{item}</span>
                    </div>
                  ))}
                </div>
              </div>

              {/* Languages */}
              <div className="py-8 border-b border-gray-200">
                <h2 className="text-xl font-semibold text-gray-900 mb-5">Languages</h2>
                <div className="flex flex-wrap gap-2">
                  {(exp?.languages?.length ? exp.languages : ['English']).map((lang, i) => (
                    <div key={i} className="flex items-center gap-2 px-4 py-2.5 bg-gray-50 rounded-xl border border-gray-100">
                      <span className="text-gray-500">{I.globe}</span>
                      <span className="text-sm font-medium text-gray-700">{lang}</span>
                    </div>
                  ))}
                </div>
                <p className="text-[13px] text-gray-500 mt-3">This experience is offered in the languages listed above. The guide speaks the primary language and may accommodate other languages on request.</p>
              </div>

              {/* Where we'll meet */}
              {exp?.address && (
                <div className="py-8 border-b border-gray-200">
                  <h2 className="text-xl font-semibold text-gray-900 mb-4">Where we'll meet</h2>
                  <div className="flex items-start gap-3 mb-4">{I.mapPin}<span className="text-[15px] text-gray-700">{exp.address}</span></div>
                  <div className="rounded-2xl overflow-hidden h-[220px] border border-gray-200">
                    <iframe title="Meeting point" width="100%" height="100%" style={{ border: 0 }}
                      srcDoc={exp.latitude && exp.longitude
                        ? `<!DOCTYPE html><html><head><meta charset="utf-8"/><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/><style>*{margin:0;padding:0}html,body{width:100%;height:100%}#map{width:100%;height:100%}</style></head><body><div id="map"></div><script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"><\/script><script>var map=L.map('map',{zoomControl:false,attributionControl:false,scrollWheelZoom:false,dragging:false}).setView([${exp.latitude},${exp.longitude}],15);L.tileLayer('https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',{maxZoom:19}).addTo(map);var icon=L.divIcon({className:'',html:'<div style="width:14px;height:14px;background:#e11d48;border:2.5px solid #fff;border-radius:50%;box-shadow:0 2px 6px rgba(0,0,0,.35)"></div>',iconSize:[14,14],iconAnchor:[7,7]});L.marker([${exp.latitude},${exp.longitude}],{icon:icon}).addTo(map);<\/script></body></html>`
                        : `<!DOCTYPE html><html><head><meta charset="utf-8"/><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/><style>*{margin:0;padding:0}html,body{width:100%;height:100%}#map{width:100%;height:100%}</style></head><body><div id="map"></div><script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"><\/script><script>fetch('https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(exp.address)}&limit=1').then(r=>r.json()).then(d=>{if(d&&d[0]){var lat=+d[0].lat,lng=+d[0].lon;var map=L.map('map',{zoomControl:false,attributionControl:false,scrollWheelZoom:false,dragging:false}).setView([lat,lng],15);L.tileLayer('https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',{maxZoom:19}).addTo(map);var icon=L.divIcon({className:'',html:'<div style="width:14px;height:14px;background:#e11d48;border:2.5px solid #fff;border-radius:50%;box-shadow:0 2px 6px rgba(0,0,0,.35)"></div>',iconSize:[14,14],iconAnchor:[7,7]});L.marker([lat,lng],{icon:icon}).addTo(map);}});<\/script></body></html>`
                      }
                    />
                  </div>
                  <a href={`https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(exp.address)}`} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1.5 mt-3 text-[13px] font-medium text-gray-600 hover:text-gray-900 underline transition-colors">
                    <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/><circle cx="12" cy="10" r="3"/></svg>
                    Open in Google Maps
                  </a>
                </div>
              )}

              {/* Getting there */}
              {hotel && (
                <div className="py-8 border-b border-gray-200">
                  <h2 className="text-xl font-semibold text-gray-900 mb-1">Getting there</h2>
                  <p className="text-[13px] text-gray-500 mb-5">From {hotel.name}</p>
                  {dist !== null && (
                    <div className="grid grid-cols-3 gap-3 mb-5">
                      {[
                        { icon: I.nav, label: 'Walking', time: Math.round(dist / 5 * 60) },
                        { icon: I.car, label: 'By car', time: Math.max(4, Math.round(dist / 22 * 60)) },
                        { icon: I.train, label: 'Public transit', time: Math.round(dist / 14 * 60) + 8 },
                      ].map(({ icon, label, time }) => (
                        <div key={label} className="flex flex-col items-center gap-2 p-4 bg-gray-50 rounded-2xl text-center">
                          <span className="text-gray-500">{icon}</span>
                          <div>
                            <p className="text-sm font-semibold text-gray-900">{time >= 60 ? `${(time/60).toFixed(1).replace('.0','')}h` : `${time} min`}</p>
                            <p className="text-xs text-gray-500">{label}</p>
                          </div>
                        </div>
                      ))}
                    </div>
                  )}
                  <button onClick={() => setAddTransport(t => !t)} className={`w-full flex items-center justify-between p-4 rounded-2xl border-2 transition-all text-left ${addTransport ? 'border-gray-900 bg-gray-50' : 'border-gray-200 hover:border-gray-300'}`}>
                    <div className="flex items-center gap-3">
                      <div className={`w-10 h-10 rounded-full flex items-center justify-center flex-shrink-0 ${addTransport ? 'bg-gray-900' : 'bg-gray-100'}`}>
                        <span className={addTransport ? 'text-white' : 'text-gray-600'}>{I.car}</span>
                      </div>
                      <div>
                        <p className="text-sm font-semibold text-gray-900">Add hotel transfer</p>
                        <p className="text-xs text-gray-500">Private driver from {hotel.name} and back</p>
                      </div>
                    </div>
                    <div className="flex items-center gap-2 ml-3 flex-shrink-0">
                      <span className="text-sm font-semibold text-gray-700">+€{tPrice}/person</span>
                      <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center flex-shrink-0 ${addTransport ? 'border-gray-900 bg-gray-900' : 'border-gray-300'}`}>
                        {addTransport && <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="white" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"/></svg>}
                      </div>
                    </div>
                  </button>
                </div>
              )}

              {/* Important info */}
              {exp?.important_info && (
                <div className="py-8 border-b border-gray-200">
                  <div className="flex items-start gap-3 p-5 bg-amber-50 border border-amber-200/60 rounded-2xl">
                    <span className="text-amber-600 flex-shrink-0 mt-0.5">{I.alert}</span>
                    <div>
                      <h3 className="text-sm font-semibold text-amber-900 mb-1.5 uppercase tracking-wide">Important information</h3>
                      <p className="text-sm text-amber-800 leading-relaxed">{exp.important_info}</p>
                    </div>
                  </div>
                </div>
              )}

              {/* Things to know */}
              <div className="py-8">
                <h2 className="text-xl font-semibold text-gray-900 mb-6">Things to know</h2>
                <div className="grid grid-cols-1 sm:grid-cols-3 gap-8">
                  <div>
                    <h3 className="font-semibold text-gray-900 mb-3 flex items-center gap-2"><span className="text-gray-500">{I.users}</span>Guest requirements</h3>
                    <ul className="space-y-1.5 text-sm text-gray-600">
                      {exp?.max_group_size && <li>Up to {exp.max_group_size} guests</li>}
                      <li>Ages 8 and up can attend</li>
                    </ul>
                  </div>
                  {exp?.value_to_bring && exp.value_to_bring.length > 0 && (
                    <div>
                      <h3 className="font-semibold text-gray-900 mb-3 flex items-center gap-2"><span className="text-gray-500">{I.info}</span>What to bring</h3>
                      <ul className="space-y-1.5 text-sm text-gray-600">{exp.value_to_bring.map((item, i) => <li key={i}>{item}</li>)}</ul>
                    </div>
                  )}
                  <div>
                    <h3 className="font-semibold text-gray-900 mb-3 flex items-center gap-2"><span className="text-gray-500">{I.shield}</span>Cancellation policy</h3>
                    <p className="text-sm text-gray-600 leading-relaxed">{exp?.cancellation_policy || 'Free cancellation up to 24 hours in advance for a full refund.'}</p>
                  </div>
                </div>
              </div>
            </div>

            {/* ══ RIGHT — Sticky Booking ══ */}
            <div className="hidden lg:block">
              <div className="sticky top-[60px]">
                <div className="mb-4">
                  <p className="text-[13px] text-gray-500 mb-0.5">From</p>
                  <div className="flex items-baseline gap-1">
                    <span className="text-3xl font-semibold text-gray-900">{exp?.currency}{exp?.price}</span>
                    <span className="text-gray-500 text-sm">/ guest</span>
                  </div>
                  <p className="text-[13px] text-green-600 font-medium mt-1">Free cancellation</p>
                </div>

                {addTransport && (
                  <div className="flex items-center gap-2 mb-3 text-sm bg-gray-50 rounded-xl px-3 py-2.5">
                    <span className="text-gray-500 flex-shrink-0">{I.car}</span>
                    <span className="text-[13px] text-gray-600">Hotel transfer</span>
                    <span className="ml-auto text-[13px] font-semibold text-gray-900">+€{tPrice}/person</span>
                  </div>
                )}

                <div className="border border-gray-200 rounded-2xl px-5 py-4 mb-3 flex items-center justify-between">
                  <div>
                    <p className="text-[13px] font-semibold text-gray-900">{guests} adult{guests !== 1 ? 's' : ''}</p>
                    <p className="text-[11px] text-gray-400 mt-0.5">Number of guests</p>
                  </div>
                  <div className="flex items-center gap-2">
                    <button onClick={() => setGuests(g => Math.max(1, g-1))} className="w-7 h-7 rounded-full border border-gray-300 flex items-center justify-center text-gray-600 hover:border-gray-500 transition-colors text-base leading-none">−</button>
                    <span className="text-sm font-medium w-4 text-center">{guests}</span>
                    <button onClick={() => setGuests(g => Math.min(exp?.max_group_size || 20, g+1))} className="w-7 h-7 rounded-full border border-gray-300 flex items-center justify-center text-gray-600 hover:border-gray-500 transition-colors text-base leading-none">+</button>
                  </div>
                </div>

                <div className="border border-gray-200 rounded-2xl overflow-hidden">
                  {slotsLoading ? (
                    <div className="flex items-center justify-center gap-2 py-6 text-gray-400 text-sm">{I.spin} Loading availability…</div>
                  ) : preview.length === 0 ? (
                    <div className="py-6 text-center text-gray-400 text-sm px-4">No upcoming slots available.</div>
                  ) : preview.map(slot => {
                    const spots = slot.max_participants - slot.booked_participants;
                    return (
                      <button key={slot.id} onClick={() => { setSelectedSlot(slot); setStep('booking'); }} className="w-full flex items-center justify-between px-5 py-4 hover:bg-gray-50 transition-colors border-b border-gray-100 last:border-0 text-left">
                        <div>
                          <p className="text-[13px] font-semibold text-gray-900">{slot.dateLabel}</p>
                          <p className="text-[13px] text-gray-500 mt-0.5">{fmtTime(slot.start_time)} – {fmtTime(slot.end_time)}</p>
                        </div>
                        <span className="text-[13px] text-gray-500 flex-shrink-0 ml-4">{spots} spot{spots !== 1 ? 's' : ''} available</span>
                      </button>
                    );
                  })}
                  <button onClick={() => { setStep('time'); scrollRef.current?.scrollTo({ top: 0, behavior: 'smooth' }); }} className="w-full py-4 text-[13px] font-medium text-gray-700 hover:bg-gray-50 transition-colors underline">Show all dates</button>
                </div>

                <div className="mt-4 flex items-center gap-3 p-4 bg-gray-50 rounded-xl border border-gray-100">
                  <span className="text-gray-700 flex-shrink-0">{I.award}</span>
                  <p className="text-xs text-gray-600 leading-snug"><span className="font-semibold text-gray-900">Experiences are vetted for quality.</span> Every experience meets our standards for unique, engaging activities.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* ── Mobile Sticky Bottom Bar ─── */}
      <div className="lg:hidden flex-shrink-0 bg-white border-t border-gray-200 px-5 py-3.5">
        <div className="flex items-center justify-between gap-4">
          <div>
            <p className="text-[11px] text-gray-500">From</p>
            <div className="flex items-baseline gap-1"><span className="text-xl font-semibold text-gray-900">{exp?.currency}{exp?.price}</span><span className="text-gray-500 text-xs">/ guest</span></div>
            <p className="text-[11px] text-green-600 font-medium">Free cancellation</p>
          </div>
          <div className="flex items-center gap-2">
            <button onClick={() => setGuests(g => Math.max(1, g-1))} className="w-7 h-7 rounded-full border border-gray-300 flex items-center justify-center text-gray-600 hover:border-gray-500 text-base leading-none">−</button>
            <span className="text-sm font-medium w-5 text-center">{guests}</span>
            <button onClick={() => setGuests(g => Math.min(exp?.max_group_size||20, g+1))} className="w-7 h-7 rounded-full border border-gray-300 flex items-center justify-center text-gray-600 hover:border-gray-500 text-base leading-none">+</button>
          </div>
          <button onClick={() => { setStep('time'); scrollRef.current?.scrollTo({ top: 0, behavior: 'smooth' }); }} className="px-5 py-2.5 text-white font-semibold text-sm rounded-full flex-shrink-0" style={{ backgroundColor: primary }}>Book</button>
        </div>
      </div>

      {/* ── Time Selection Modal ─── */}
      {step === 'time' && (
        <div className="fixed inset-0 z-[200] flex items-end sm:items-center justify-center">
          <div className="absolute inset-0 bg-black/50" onClick={() => setStep('detail')} />
          <div className="relative bg-white w-full sm:max-w-lg sm:rounded-2xl rounded-t-2xl max-h-[92vh] flex flex-col shadow-2xl">
            <div className="flex items-center justify-between px-6 py-5 border-b border-gray-100 flex-shrink-0">
              <h2 className="text-xl font-bold text-gray-900" style={{ fontFamily: 'var(--wb-font-heading)' }}>Select a time</h2>
              <button onClick={() => setStep('detail')} className="w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-100 transition text-gray-600">{I.x}</button>
            </div>
            <div className="px-6 pt-5 pb-0">
              <div className="flex items-center justify-between pb-5 border-b border-gray-100">
                <p className="text-[15px] font-medium text-gray-900">{guests} adult{guests !== 1 ? 's' : ''}</p>
                <div className="flex items-center gap-3">
                  <button onClick={() => setGuests(g => Math.max(1, g-1))} className="w-8 h-8 rounded-full border border-gray-300 flex items-center justify-center text-gray-600 hover:border-gray-500 transition">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><line x1="5" y1="12" x2="19" y2="12"/></svg>
                  </button>
                  <span className="text-[15px] font-medium w-4 text-center">{guests}</span>
                  <button onClick={() => setGuests(g => Math.min(exp?.max_group_size||20, g+1))} className="w-8 h-8 rounded-full border border-gray-300 flex items-center justify-center text-gray-600 hover:border-gray-500 transition">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
                  </button>
                </div>
              </div>
            </div>
            <div className="flex-1 overflow-y-auto px-6 pb-8">
              {slotsLoading ? (
                <div className="py-16 flex flex-col items-center gap-3 text-gray-400">{I.spin}<span className="text-sm">Loading availability…</span></div>
              ) : slotGroups.length === 0 ? (
                <div className="py-16 text-center text-gray-400 text-sm">No upcoming slots available.</div>
              ) : slotGroups.map(group => (
                <div key={group.date} className="mt-6">
                  <h3 className="text-[15px] font-bold text-gray-900 mb-3">{group.label}</h3>
                  <div className="space-y-2">
                    {group.slots.map((slot: Slot) => {
                      const spots = slot.max_participants - slot.booked_participants;
                      return (
                        <button key={slot.id} onClick={() => { setSelectedSlot(slot); setStep('booking'); }} className="w-full flex items-center justify-between p-4 border border-gray-200 rounded-xl hover:border-gray-400 transition text-left">
                          <div>
                            <p className="text-[15px] font-semibold text-gray-900">{fmtTime(slot.start_time)} – {fmtTime(slot.end_time)}</p>
                            <p className="text-xs text-gray-500 mt-0.5">{spots} spot{spots !== 1 ? 's' : ''} left</p>
                          </div>
                          <div className="text-right">
                            <p className="text-[15px] font-bold text-gray-900">{exp?.currency}{((exp?.price || 0) * guests).toFixed(0)}</p>
                            <p className="text-xs text-gray-500">{guests > 1 ? `${guests} guests` : '1 guest'}</p>
                          </div>
                        </button>
                      );
                    })}
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      )}

      {/* ── All Photos Lightbox ─── */}
      {showAllPhotos && (
        <div className="fixed inset-0 z-[200] bg-black/95 flex flex-col">
          <div className="flex items-center justify-between px-6 py-4">
            <button onClick={() => setShowAllPhotos(false)} className="flex items-center gap-2 text-white/80 hover:text-white text-sm font-medium">{I.back} Back to experience</button>
            <span className="text-white/60 text-sm">{photos.length} photos</span>
          </div>
          <div className="flex-1 overflow-y-auto px-6 pb-6">
            <div className="max-w-3xl mx-auto space-y-3">
              {photos.map((p, i) => <img key={i} src={p} alt={`${exp?.title} ${i+1}`} className="w-full rounded-xl" />)}
            </div>
          </div>
        </div>
      )}

      {/* ── Video Modal ─── */}
      {showVideoModal && exp?.video_url && (
        <div className="fixed inset-0 z-[200] bg-black/95 flex items-center justify-center p-4 sm:p-10" onClick={() => setShowVideoModal(false)}>
          <button onClick={() => setShowVideoModal(false)} className="absolute top-4 right-4 w-10 h-10 flex items-center justify-center rounded-full bg-white/10 hover:bg-white/20 text-white transition-colors">{I.x}</button>
          <video src={exp.video_url} className="w-full max-w-4xl max-h-[88vh] rounded-xl" autoPlay muted loop playsInline controls onClick={e => e.stopPropagation()} />
        </div>
      )}

      {/* ── Footer ─── */}
      <footer className="border-t border-gray-100">
        <div className="max-w-6xl mx-auto px-4 sm:px-6 py-6 flex items-center justify-between text-xs text-gray-400">
          <span>© {new Date().getFullYear()} {hotel?.name}</span>
          <div className="flex items-center gap-1.5">Powered by <a href="https://boredtourist.com" target="_blank" rel="noopener noreferrer" className="font-semibold text-gray-500 hover:text-gray-700 transition-colors">Bored Tourist</a></div>
        </div>
      </footer>
    </div>
  );
}

/* ━━━━ Sub-components ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ */
function FloatInput({ label, value, onChange, type = 'text' }: { label: string; value: string; onChange: (v: string) => void; type?: string }) {
  return (
    <div className="relative">
      <label className="absolute top-2 left-3 text-[10px] font-semibold text-gray-500 uppercase tracking-wide">{label}</label>
      <input type={type} value={value} onChange={e => onChange(e.target.value)} className="w-full pt-6 pb-2 px-3 border border-gray-300 rounded-lg text-sm text-gray-900 focus:outline-none focus:border-gray-900 transition-colors" />
    </div>
  );
}

function InfoRow({ label, value }: { label: string; value: string }) {
  return (
    <div className="flex items-center justify-between py-3 border border-gray-200 rounded-lg px-4">
      <span className="text-sm text-gray-600">{label}</span>
      <span className="text-sm font-medium text-gray-900">{value}</span>
    </div>
  );
}
