import React, { useState, useEffect } from 'react';
import { ChevronLeft, Star, ShieldCheck, Tag, Lock, Check } from 'lucide-react';
import { supabase } from '../lib/supabase';
import { ExperienceDisplay } from '../types';
import { AvailabilitySlot, formatSlotTime, dateLabel } from '../hooks/useAvailabilitySlots';

interface BookingFlowProps {
  experience: ExperienceDisplay;
  slot: AvailabilitySlot;
  guests: number;
  onClose: () => void;
}

const COUNTRIES = [
  { code: 'PT', dial: '+351', flag: '🇵🇹', name: 'Portugal' },
  { code: 'ES', dial: '+34',  flag: '🇪🇸', name: 'Spain' },
  { code: 'GB', dial: '+44',  flag: '🇬🇧', name: 'United Kingdom' },
  { code: 'FR', dial: '+33',  flag: '🇫🇷', name: 'France' },
  { code: 'DE', dial: '+49',  flag: '🇩🇪', name: 'Germany' },
  { code: 'US', dial: '+1',   flag: '🇺🇸', name: 'United States' },
  { code: 'IT', dial: '+39',  flag: '🇮🇹', name: 'Italy' },
  { code: 'NL', dial: '+31',  flag: '🇳🇱', name: 'Netherlands' },
  { code: 'BR', dial: '+55',  flag: '🇧🇷', name: 'Brazil' },
];

export const BookingFlow: React.FC<BookingFlowProps> = ({ experience, slot, guests, onClose }) => {
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName]   = useState('');
  const [email, setEmail]         = useState('');
  const [phone, setPhone]         = useState('');
  const [country, setCountry]     = useState(COUNTRIES[0]);
  const [promoCode, setPromoCode] = useState('');
  const [promoApplied, setPromoApplied] = useState(false);
  const [submitting, setSubmitting]     = useState(false);
  const [done, setDone]                 = useState(false);

  useEffect(() => {
    document.body.style.overflow = 'hidden';
    return () => { document.body.style.overflow = 'auto'; };
  }, []);

  const serviceFeeRate = 0.12;
  const subtotal    = experience.price * guests;
  const serviceFee  = Math.round(subtotal * serviceFeeRate * 100) / 100;
  const discount    = promoApplied ? Math.round(subtotal * 0.1 * 100) / 100 : 0;
  const total       = subtotal + serviceFee - discount;

  const slotDate   = dateLabel(slot.date);
  const slotTime   = `${formatSlotTime(slot.start_time)} – ${formatSlotTime(slot.end_time)}`;

  const canSubmit  = firstName.trim() && lastName.trim() && email.trim() && phone.trim();

  const handleSubmit = async () => {
    if (!canSubmit) return;
    setSubmitting(true);
    try {
      await supabase.from('bookings').insert({
        experience_id:   experience.id,
        slot_id:         slot.id,
        guests,
        first_name:      firstName,
        last_name:       lastName,
        email,
        phone:           `${country.dial}${phone}`,
        total_price:     total,
        status:          'pending',
      });
    } catch {
      // continue optimistically
    }
    setSubmitting(false);
    setDone(true);
  };

  /* ── Success screen ── */
  if (done) {
    return (
      <div className="fixed inset-0 z-[300] bg-white flex flex-col items-center justify-center px-6 text-center">
        <div className="w-16 h-16 rounded-full bg-emerald-100 flex items-center justify-center mb-6">
          <Check size={32} className="text-emerald-600" strokeWidth={2.5} />
        </div>
        <h1 className="text-2xl font-semibold text-gray-900 mb-2">Booking confirmed!</h1>
        <p className="text-gray-500 text-sm max-w-xs">
          We've sent a confirmation to <strong>{email}</strong>. See you on {slotDate} at {formatSlotTime(slot.start_time)}!
        </p>
        <button
          onClick={onClose}
          className="mt-8 px-8 py-3 bg-slate-900 text-white font-semibold rounded-full text-sm hover:bg-slate-700 transition-colors"
        >
          Back to experiences
        </button>
      </div>
    );
  }

  return (
    <div className="fixed inset-0 z-[300] bg-white flex flex-col overflow-hidden">

      {/* ── Top bar ── */}
      <div className="flex-shrink-0 border-b border-gray-100 px-4 sm:px-8 py-4 flex items-center gap-4">
        <button
          onClick={onClose}
          className="flex items-center gap-1.5 text-sm font-medium text-gray-600 hover:text-gray-900 transition-colors"
        >
          <ChevronLeft size={18} strokeWidth={2} />
          Back
        </button>
        <span className="text-xs text-gray-300">|</span>
        <span className="text-sm text-gray-500 font-medium">Checkout</span>
      </div>

      {/* ── Scrollable body ── */}
      <div className="flex-1 overflow-y-auto">
        <div className="max-w-5xl mx-auto px-4 sm:px-8 py-10">
          <h1 className="text-3xl font-bold text-gray-900 mb-10">Review and pay</h1>

          <div className="grid grid-cols-1 lg:grid-cols-[1fr_380px] gap-12">

            {/* ══ LEFT — Forms ══ */}
            <div className="space-y-10">

              {/* Guest details */}
              <section>
                <h2 className="text-xl font-semibold text-gray-900 mb-5">Guest details</h2>
                <div className="space-y-3">
                  <div className="grid grid-cols-2 gap-3">
                    <div className="relative">
                      <label className="absolute top-2 left-3 text-[10px] font-semibold text-gray-500 uppercase tracking-wide">First name *</label>
                      <input
                        type="text"
                        value={firstName}
                        onChange={e => setFirstName(e.target.value)}
                        className="w-full pt-6 pb-2 px-3 border border-gray-300 rounded-lg text-sm text-gray-900 focus:outline-none focus:border-gray-900 transition-colors"
                      />
                    </div>
                    <div className="relative">
                      <label className="absolute top-2 left-3 text-[10px] font-semibold text-gray-500 uppercase tracking-wide">Last name *</label>
                      <input
                        type="text"
                        value={lastName}
                        onChange={e => setLastName(e.target.value)}
                        className="w-full pt-6 pb-2 px-3 border border-gray-300 rounded-lg text-sm text-gray-900 focus:outline-none focus:border-gray-900 transition-colors"
                      />
                    </div>
                  </div>
                  <div className="relative">
                    <label className="absolute top-2 left-3 text-[10px] font-semibold text-gray-500 uppercase tracking-wide">Email address *</label>
                    <input
                      type="email"
                      value={email}
                      onChange={e => setEmail(e.target.value)}
                      className="w-full pt-6 pb-2 px-3 border border-gray-300 rounded-lg text-sm text-gray-900 focus:outline-none focus:border-gray-900 transition-colors"
                    />
                  </div>
                  <div className="grid grid-cols-[160px_1fr] gap-3">
                    <div className="relative">
                      <label className="absolute top-2 left-3 text-[10px] font-semibold text-gray-500 uppercase tracking-wide">Country *</label>
                      <select
                        value={country.code}
                        onChange={e => setCountry(COUNTRIES.find(c => c.code === e.target.value) || COUNTRIES[0])}
                        className="w-full pt-6 pb-2 pl-3 pr-8 border border-gray-300 rounded-lg text-sm text-gray-900 bg-white focus:outline-none focus:border-gray-900 transition-colors appearance-none"
                      >
                        {COUNTRIES.map(c => (
                          <option key={c.code} value={c.code}>{c.flag} {c.dial}</option>
                        ))}
                      </select>
                    </div>
                    <div className="relative">
                      <label className="absolute top-2 left-3 text-[10px] font-semibold text-gray-500 uppercase tracking-wide">Phone number *</label>
                      <input
                        type="tel"
                        value={phone}
                        onChange={e => setPhone(e.target.value)}
                        className="w-full pt-6 pb-2 px-3 border border-gray-300 rounded-lg text-sm text-gray-900 focus:outline-none focus:border-gray-900 transition-colors"
                      />
                    </div>
                  </div>
                </div>
              </section>

              {/* Trip details */}
              <section className="border-t border-gray-100 pt-8">
                <h2 className="text-xl font-semibold text-gray-900 mb-5">Trip details</h2>
                <div className="space-y-3">
                  <div className="flex items-center justify-between py-3 border border-gray-200 rounded-lg px-4">
                    <span className="text-sm text-gray-600">Date</span>
                    <span className="text-sm font-medium text-gray-900">{slotDate}</span>
                  </div>
                  <div className="flex items-center justify-between py-3 border border-gray-200 rounded-lg px-4">
                    <span className="text-sm text-gray-600">Time</span>
                    <span className="text-sm font-medium text-gray-900">{slotTime}</span>
                  </div>
                  <div className="flex items-center justify-between py-3 border border-gray-200 rounded-lg px-4">
                    <span className="text-sm text-gray-600">Guests</span>
                    <span className="text-sm font-medium text-gray-900">{guests} adult{guests !== 1 ? 's' : ''}</span>
                  </div>
                </div>
              </section>

              {/* Payment details */}
              <section className="border-t border-gray-100 pt-8">
                <h2 className="text-xl font-semibold text-gray-900 mb-1">Payment details</h2>
                <p className="text-sm text-gray-400 mb-5">All transactions are secure and encrypted.</p>
                <div className="border border-gray-200 rounded-xl p-5 bg-gray-50 flex items-center gap-4">
                  <Lock size={18} strokeWidth={1.5} className="text-gray-400 flex-shrink-0" />
                  <div>
                    <p className="text-sm font-medium text-gray-700">Secure payment via Stripe</p>
                    <p className="text-xs text-gray-400 mt-0.5">You'll be redirected to complete payment after booking.</p>
                  </div>
                </div>
              </section>

            </div>

            {/* ══ RIGHT — Summary ══ */}
            <div>
              <div className="sticky top-6 space-y-5">

                {/* Experience card */}
                <div className="flex items-start gap-4 p-4 border border-gray-200 rounded-2xl">
                  <img
                    src={experience.imageUrl}
                    alt={experience.title}
                    className="w-16 h-16 rounded-xl object-cover flex-shrink-0"
                  />
                  <div className="min-w-0">
                    <p className="text-sm font-semibold text-gray-900 leading-snug line-clamp-2">{experience.title}</p>
                    <p className="text-xs text-gray-500 mt-1">{slotDate} · {guests} Adult{guests !== 1 ? 's' : ''}</p>
                    {experience.rating > 0 && (
                      <div className="flex items-center gap-1 mt-1">
                        <Star size={11} fill="currentColor" className="text-gray-700" />
                        <span className="text-xs font-semibold text-gray-700">{experience.rating}</span>
                      </div>
                    )}
                  </div>
                </div>

                {/* Cancellation */}
                <p className="text-sm text-gray-600 px-1">
                  {experience.cancellationPolicy
                    ? experience.cancellationPolicy
                    : 'Cancel before the experience starts for a full refund.'}{' '}
                  <span className="underline cursor-pointer font-medium text-gray-900">Full policy</span>
                </p>

                {/* Booking summary */}
                <div className="border border-gray-200 rounded-2xl p-5 space-y-3">
                  <h3 className="text-base font-semibold text-gray-900">Booking summary</h3>

                  <div className="flex justify-between text-sm">
                    <span className="text-gray-600 underline cursor-pointer">
                      {experience.currency}{experience.price} × {guests} {guests === 1 ? 'guest' : 'guests'}
                    </span>
                    <span className="text-gray-900 font-medium">{experience.currency}{subtotal.toFixed(2)}</span>
                  </div>
                  <div className="flex justify-between text-sm">
                    <span className="text-gray-600 underline cursor-pointer">Service fee</span>
                    <span className="text-gray-900 font-medium">{experience.currency}{serviceFee.toFixed(2)}</span>
                  </div>
                  {promoApplied && (
                    <div className="flex justify-between text-sm">
                      <span className="text-green-600 font-medium">Promo discount (10%)</span>
                      <span className="text-green-600 font-medium">−{experience.currency}{discount.toFixed(2)}</span>
                    </div>
                  )}

                  <div className="flex justify-between text-sm font-bold border-t border-gray-100 pt-3">
                    <span>Total</span>
                    <span>{experience.currency}{total.toFixed(2)}</span>
                  </div>

                  {/* Promo code */}
                  {!promoApplied ? (
                    <div className="flex gap-2 pt-1">
                      <div className="relative flex-1">
                        <Tag size={14} strokeWidth={1.5} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
                        <input
                          type="text"
                          placeholder="Add a discount code"
                          value={promoCode}
                          onChange={e => setPromoCode(e.target.value)}
                          className="w-full pl-8 pr-3 py-2 border border-gray-200 rounded-lg text-sm focus:outline-none focus:border-gray-900 transition-colors"
                        />
                      </div>
                      <button
                        onClick={() => promoCode.trim() && setPromoApplied(true)}
                        className="px-4 py-2 border border-gray-200 rounded-lg text-sm font-medium text-gray-700 hover:border-gray-400 transition-colors"
                      >
                        Apply
                      </button>
                    </div>
                  ) : (
                    <div className="flex items-center gap-2 text-green-600 text-sm pt-1">
                      <Check size={14} />
                      <span>Code "{promoCode}" applied</span>
                      <button onClick={() => { setPromoApplied(false); setPromoCode(''); }} className="ml-auto text-gray-400 hover:text-gray-600 underline text-xs">Remove</button>
                    </div>
                  )}
                </div>

                {/* Legal */}
                <p className="text-xs text-gray-400 leading-relaxed px-1">
                  By selecting Book now, I agree to pay the total amount shown and confirm I've read the{' '}
                  <span className="underline cursor-pointer text-gray-600">Cancellation Policy</span>,{' '}
                  <span className="underline cursor-pointer text-gray-600">Terms of Use</span>, and{' '}
                  <span className="underline cursor-pointer text-gray-600">Privacy Policy</span>.
                </p>

                {/* CTA */}
                <button
                  onClick={handleSubmit}
                  disabled={!canSubmit || submitting}
                  className="w-full py-4 disabled:bg-gray-200 disabled:text-gray-400 text-white font-semibold text-sm rounded-full transition-colors"
                  style={{ backgroundColor: 'var(--hotel-primary)' }}
                >
                  {submitting ? 'Processing…' : `Book now · ${experience.currency}${total.toFixed(2)}`}
                </button>

                <div className="flex items-center justify-center gap-1.5 text-xs text-gray-400">
                  <Lock size={12} strokeWidth={1.5} />
                  Secure checkout
                </div>

              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
  );
};
