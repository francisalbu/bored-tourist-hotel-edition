import React, { useEffect, useRef, useState } from 'react';
import { ExperienceDisplay } from '../types';
import {
  X, Heart, MapPin, Clock, Star, ShieldCheck, Zap, Users, Info,
  Share2, Globe, CheckCircle, ChevronLeft, Camera, Play, Award,
  Languages, AlertCircle, Calendar, ChevronDown, Loader2,
  Car, Train, Navigation, Check
} from 'lucide-react';
import { BookingFlow } from './BookingFlow';
import { SelectTimeModal, SlotItem } from './SelectTimeModal';
import { useAvailabilitySlots, AvailabilitySlot, formatSlotTime } from '../hooks/useAvailabilitySlots';
import { useHotel } from '../contexts/HotelContext';

function haversineKm(lat1: number, lon1: number, lat2: number, lon2: number): number {
  const R = 6371;
  const toRad = (d: number) => d * Math.PI / 180;
  const dLat = toRad(lat2 - lat1);
  const dLon = toRad(lon2 - lon1);
  const a =
    Math.sin(dLat / 2) ** 2 +
    Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * Math.sin(dLon / 2) ** 2;
  return R * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
}

interface DetailModalProps {
  experience: ExperienceDisplay;
  onClose: () => void;
}

export const DetailModal: React.FC<DetailModalProps> = ({ experience, onClose }) => {
  const hotel = useHotel();
  const videoRef = useRef<HTMLVideoElement>(null);
  const [showSelectTime, setShowSelectTime] = useState(false);
  const [showBookingFlow, setShowBookingFlow] = useState(false);
  const [selectedSlot, setSelectedSlot] = useState<SlotItem | null>(null);
  const [selectedGuests, setSelectedGuests] = useState(1);
  const [showAllPhotos, setShowAllPhotos] = useState(false);
  const [showVideoModal, setShowVideoModal] = useState(false);
  const [addTransport, setAddTransport] = useState(false);
  const scrollContainerRef = useRef<HTMLDivElement>(null);

  // Distance from hotel to this activity
  const transportDist =
    experience.latitude && experience.longitude && hotel.latitude && hotel.longitude
      ? haversineKm(hotel.latitude, hotel.longitude, experience.latitude, experience.longitude)
      : null;

  // Real availability slots from DB
  const { slotGroups, loading: slotsLoading } = useAvailabilitySlots(experience.id, 14);
  // Flatten to first 5 upcoming slots for the sidebar preview
  const previewSlots = slotGroups.flatMap(g => g.slots.map(s => ({ ...s, dateLabel: g.label }))).slice(0, 5);

  // Build photos array: images from DB, or fall back to single imageUrl
  const photos = experience.images && experience.images.length > 1
    ? experience.images
    : [experience.imageUrl];

  useEffect(() => {
    document.body.style.overflow = 'hidden';
    return () => {
      document.body.style.overflow = 'auto';
    };
  }, []);

  const handleVideoPlay = () => {
    setShowVideoModal(true);
  };

  const handleSlotSelected = (slot: SlotItem, guests: number) => {
    setSelectedSlot(slot);
    setSelectedGuests(guests);
    setShowSelectTime(false);
    setShowBookingFlow(true);
  };

  return (
    <div className="fixed inset-0 z-[100] bg-white flex flex-col">
      {/* ─── Sticky Top Bar ─── */}
      <div className="flex-shrink-0 sticky top-0 z-50 bg-white border-b border-gray-100 px-4 sm:px-6 py-3 flex items-center justify-between">
        <button
          onClick={onClose}
          className="flex items-center gap-1.5 text-sm font-medium text-gray-700 hover:text-gray-900 transition-colors"
        >
          <ChevronLeft size={18} strokeWidth={2} />
          <span className="hidden sm:inline">Back</span>
        </button>

        <div className="flex items-center gap-1">
          <button className="flex items-center gap-1.5 px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100 rounded-full transition-colors underline">
            <Share2 size={14} /> Share
          </button>
          <button className="flex items-center gap-1.5 px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100 rounded-full transition-colors underline">
            <Heart size={14} /> Save
          </button>
        </div>
      </div>

      {/* ─── Scrollable Content ─── */}
      <div ref={scrollContainerRef} className="flex-1 overflow-y-auto">
        <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">

          {/* ─── Title & Rating ─── */}
          <div className="pt-6 pb-4">
            <h1 className="text-2xl sm:text-3xl font-semibold text-gray-900 leading-tight">
              {experience.title}
            </h1>
            <div className="flex flex-wrap items-center gap-1.5 mt-2 text-sm">
              {experience.rating > 0 && (
                <>
                  <Star size={13} className="text-gray-900" fill="currentColor" />
                  <span className="font-semibold text-gray-900">{experience.rating}</span>
                  {experience.reviews > 0 && (
                    <span className="text-gray-500">· {experience.reviews.toLocaleString()} reviews</span>
                  )}
                  <span className="text-gray-300">·</span>
                </>
              )}
              <span className="font-medium text-gray-900 underline">{experience.location}</span>
            </div>
          </div>

          {/* ─── Photo Gallery ─── */}
          <div className="mb-8 -mx-4 sm:-mx-6 lg:-mx-8">
            {photos.length >= 2 ? (
              /* Airbnb-style grid: 1 big left + up to 4 right */
              <div className="relative grid grid-cols-2 sm:grid-cols-4 grid-rows-2 gap-1 sm:gap-2 h-[260px] sm:h-[400px] overflow-hidden sm:rounded-2xl">
                {/* Main photo / video */}
                <div className="col-span-1 sm:col-span-2 row-span-2 relative overflow-hidden bg-gray-100">
                  {experience.videoUrl ? (
                    <>
                      <video
                        ref={videoRef}
                        src={experience.videoUrl}
                        className="absolute inset-0 w-full h-full object-cover"
                        loop
                        playsInline
                        muted
                        poster={photos[0]}
                      />
                      <button
                        onClick={handleVideoPlay}
                        className="absolute inset-0 flex items-center justify-center group"
                      >
                        <div className="w-14 h-14 rounded-full bg-black/40 backdrop-blur-sm flex items-center justify-center transition-all group-hover:bg-black/60">
                          <Play size={22} fill="white" className="text-white ml-1" />
                        </div>
                      </button>
                    </>
                  ) : (
                    <img
                      src={photos[0]}
                      alt={experience.title}
                      className="absolute inset-0 w-full h-full object-cover hover:brightness-95 transition-all"
                    />
                  )}
                </div>

                {/* Right grid photos */}
                {photos.slice(1, 5).map((photo, i) => (
                  <div key={i} className="relative overflow-hidden bg-gray-100">
                    <img
                      src={photo}
                      alt={`${experience.title} ${i + 2}`}
                      className="absolute inset-0 w-full h-full object-cover hover:brightness-95 transition-all cursor-pointer"
                    />
                  </div>
                ))}

                {/* Show all photos button */}
                {photos.length > 1 && (
                  <button
                    onClick={() => setShowAllPhotos(true)}
                    className="absolute bottom-3 right-3 sm:bottom-4 sm:right-4 flex items-center gap-2 bg-white border border-gray-300 text-gray-900 text-xs sm:text-sm font-medium px-3 sm:px-4 py-1.5 sm:py-2 rounded-lg hover:bg-gray-50 transition-colors shadow-sm"
                  >
                    <Camera size={14} />
                    <span>Show all photos</span>
                  </button>
                )}
              </div>
            ) : (
              /* Single image — full width */
              <div className="relative h-[300px] sm:h-[460px] overflow-hidden sm:rounded-2xl bg-gray-100">
                {experience.videoUrl ? (
                  <>
                    <video
                      ref={videoRef}
                      src={experience.videoUrl}
                      className="absolute inset-0 w-full h-full object-cover"
                      loop
                      playsInline
                      muted
                      poster={photos[0]}
                    />
                    <button
                      onClick={handleVideoPlay}
                      className="absolute inset-0 flex items-center justify-center group"
                    >
                      <div className="w-16 h-16 rounded-full bg-black/40 backdrop-blur-sm flex items-center justify-center transition-all group-hover:bg-black/60">
                        <Play size={26} fill="white" className="text-white ml-1" />
                      </div>
                    </button>
                  </>
                ) : (
                  <img
                    src={photos[0]}
                    alt={experience.title}
                    className="absolute inset-0 w-full h-full object-cover"
                  />
                )}
              </div>
            )}
          </div>

          {/* ─── Main Two-Column Layout ─── */}
          <div className="grid grid-cols-1 lg:grid-cols-[1fr_340px] gap-12 pb-32 lg:pb-12">

            {/* ══ LEFT COLUMN ══ */}
            <div className="space-y-0 min-w-0">

              {/* Quick badges */}
              <div className="flex flex-wrap items-center gap-6 pb-7 border-b border-gray-200">
                <div className="flex items-center gap-2 text-gray-700">
                  <Clock size={18} strokeWidth={1.5} className="text-gray-500" />
                  <span className="text-sm">{experience.duration}</span>
                </div>
                {experience.maxGroupSize && (
                  <div className="flex items-center gap-2 text-gray-700">
                    <Users size={18} strokeWidth={1.5} className="text-gray-500" />
                    <span className="text-sm">Up to {experience.maxGroupSize} guests</span>
                  </div>
                )}
                <div className="flex items-center gap-2 text-gray-700">
                  <Languages size={18} strokeWidth={1.5} className="text-gray-500" />
                  <span className="text-sm">
                    {experience.languages && experience.languages.length > 0
                      ? experience.languages.join(', ')
                      : 'English'}
                  </span>
                </div>
              </div>

              {/* ─ What you'll do ─ */}
              <div className="py-8 border-b border-gray-200">
                <h2 className="text-xl font-semibold text-gray-900 mb-4">What you'll do</h2>
                <p className="text-gray-600 leading-relaxed text-[15px]">
                  {experience.fullDescription || experience.description}
                </p>

                {experience.highlights && experience.highlights.length > 0 && (
                  <ul className="mt-5 space-y-3">
                    {experience.highlights.map((h, i) => (
                      <li key={i} className="flex items-start gap-3">
                        <div className="w-5 h-5 rounded-full bg-gray-900 flex items-center justify-center flex-shrink-0 mt-0.5">
                          <span className="text-white text-[10px] font-bold">{i + 1}</span>
                        </div>
                        <span className="text-gray-700 text-[15px] leading-snug">{h}</span>
                      </li>
                    ))}
                  </ul>
                )}
              </div>

              {/* ─ Rating & Reviews ─ */}
              {experience.rating > 0 && (
                <div className="py-8 border-b border-gray-200">
                  <div className="flex items-center gap-3 mb-6">
                    <Star size={28} className="text-gray-900" fill="currentColor" />
                    <span className="text-2xl font-semibold text-gray-900">{experience.rating}</span>
                    {experience.reviews > 0 && (
                      <span className="text-lg text-gray-600">· {experience.reviews.toLocaleString()} reviews</span>
                    )}
                  </div>

                  {/* Badge row */}
                  <div className="grid grid-cols-2 sm:grid-cols-3 gap-4">
                    {[
                      { label: 'Overall', value: experience.rating },
                      { label: 'Communication', value: Math.min(5, experience.rating + 0.02) },
                      { label: 'Value', value: Math.max(4, experience.rating - 0.1) },
                    ].map(({ label, value }) => (
                      <div key={label} className="flex items-center justify-between p-4 bg-gray-50 rounded-xl">
                        <span className="text-sm text-gray-600">{label}</span>
                        <div className="flex items-center gap-1">
                          <div className="h-1.5 w-16 bg-gray-200 rounded-full overflow-hidden">
                            <div
                              className="h-full bg-gray-900 rounded-full"
                              style={{ width: `${(value / 5) * 100}%` }}
                            />
                          </div>
                          <span className="text-xs font-semibold text-gray-700 ml-1">{value.toFixed(2)}</span>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {/* ─ Where we'll meet ─ */}
              {experience.address && (
                <div className="py-8 border-b border-gray-200">
                  <h2 className="text-xl font-semibold text-gray-900 mb-4">Where we'll meet</h2>
                  <div className="flex items-start gap-3 mb-4">
                    <MapPin size={18} strokeWidth={1.5} className="text-gray-500 flex-shrink-0 mt-0.5" />
                    <span className="text-[15px] text-gray-700">{experience.address}</span>
                  </div>
                  <div className="rounded-2xl overflow-hidden h-[220px] border border-gray-200">
                    <iframe
                      title="Meeting point"
                      width="100%"
                      height="100%"
                      style={{ border: 0 }}
                      srcDoc={experience.latitude && experience.longitude
                        ? `<!DOCTYPE html><html><head><meta charset="utf-8"/><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/><style>*{margin:0;padding:0}html,body{width:100%;height:100%}#map{width:100%;height:100%}</style></head><body><div id="map"></div><script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"><\/script><script>var map=L.map('map',{zoomControl:false,attributionControl:false,scrollWheelZoom:false,dragging:false}).setView([${experience.latitude},${experience.longitude}],15);L.tileLayer('https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',{maxZoom:19}).addTo(map);var icon=L.divIcon({className:'',html:'<div style="width:14px;height:14px;background:#e11d48;border:2.5px solid #fff;border-radius:50%;box-shadow:0 2px 6px rgba(0,0,0,.35)"></div>',iconSize:[14,14],iconAnchor:[7,7]});L.marker([${experience.latitude},${experience.longitude}],{icon:icon}).addTo(map);<\/script></body></html>`
                        : `<!DOCTYPE html><html><head><meta charset="utf-8"/><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/><style>*{margin:0;padding:0}html,body{width:100%;height:100%}#map{width:100%;height:100%}</style></head><body><div id="map"></div><script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"><\/script><script>fetch('https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(experience.address ?? '')}&limit=1').then(function(r){return r.json()}).then(function(d){if(d&&d[0]){var lat=+d[0].lat,lng=+d[0].lon;var map=L.map('map',{zoomControl:false,attributionControl:false,scrollWheelZoom:false,dragging:false}).setView([lat,lng],15);L.tileLayer('https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',{maxZoom:19}).addTo(map);var icon=L.divIcon({className:'',html:'<div style="width:14px;height:14px;background:#e11d48;border:2.5px solid #fff;border-radius:50%;box-shadow:0 2px 6px rgba(0,0,0,.35)"></div>',iconSize:[14,14],iconAnchor:[7,7]});L.marker([lat,lng],{icon:icon}).addTo(map);}});<\/script></body></html>`
                      }
                    />
                  </div>
                  <a
                    href={`https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(experience.address)}`}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="inline-flex items-center gap-1.5 mt-3 text-[13px] font-medium text-gray-600 hover:text-gray-900 underline transition-colors"
                  >
                    <MapPin size={13} strokeWidth={1.5} />
                    Open in Google Maps
                  </a>
                </div>
              )}

              {/* ─ Getting there ─ */}
              <div className="py-8 border-b border-gray-200">
                <h2 className="text-xl font-semibold text-gray-900 mb-1">Getting there</h2>
                <p className="text-[13px] text-gray-500 mb-5">From {hotel.name}</p>

                {transportDist !== null && (
                  <div className="grid grid-cols-3 gap-3 mb-5">
                    {([
                      { icon: Navigation, label: 'Walking', time: Math.round(transportDist / 5 * 60) },
                      { icon: Car, label: 'By car', time: Math.max(4, Math.round(transportDist / 22 * 60)) },
                      { icon: Train, label: 'Public transit', time: Math.round(transportDist / 14 * 60) + 8 },
                    ] as { icon: React.ElementType; label: string; time: number }[]).map(({ icon: Icon, label, time }) => (
                      <div key={label} className="flex flex-col items-center gap-2 p-4 bg-gray-50 rounded-2xl text-center">
                        <Icon size={20} strokeWidth={1.5} className="text-gray-500" />
                        <div>
                          <p className="text-sm font-semibold text-gray-900">
                            {time >= 60 ? `${(time / 60).toFixed(1).replace('.0', '')}h` : `${time} min`}
                          </p>
                          <p className="text-xs text-gray-500">{label}</p>
                        </div>
                      </div>
                    ))}
                  </div>
                )}

                <button
                  onClick={() => setAddTransport(t => !t)}
                  className={`w-full flex items-center justify-between p-4 rounded-2xl border-2 transition-all text-left ${
                    addTransport ? 'border-gray-900 bg-gray-50' : 'border-gray-200 hover:border-gray-300'
                  }`}
                >
                  <div className="flex items-center gap-3">
                    <div className={`w-10 h-10 rounded-full flex items-center justify-center flex-shrink-0 ${
                      addTransport ? 'bg-gray-900' : 'bg-gray-100'
                    }`}>
                      <Car size={18} strokeWidth={1.5} className={addTransport ? 'text-white' : 'text-gray-600'} />
                    </div>
                    <div>
                      <p className="text-sm font-semibold text-gray-900">Add hotel transfer</p>
                      <p className="text-xs text-gray-500">Private driver from {hotel.name} and back</p>
                    </div>
                  </div>
                  <div className="flex items-center gap-2 ml-3 flex-shrink-0">
                    <span className="text-sm font-semibold text-gray-700">+€{hotel.transportationPrice ?? 20}/person</span>
                    <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center flex-shrink-0 ${
                      addTransport ? 'border-gray-900 bg-gray-900' : 'border-gray-300'
                    }`}>
                      {addTransport && <Check size={10} strokeWidth={3} className="text-white" />}
                    </div>
                  </div>
                </button>
              </div>

              {/* ─ Important information ─ */}
              {experience.importantInfo && (
                <div className="py-8 border-b border-gray-200">
                  <div className="flex items-start gap-3 p-5 bg-amber-50 border border-amber-200/60 rounded-2xl">
                    <AlertCircle size={20} strokeWidth={1.5} className="text-amber-600 flex-shrink-0 mt-0.5" />
                    <div>
                      <h3 className="text-sm font-semibold text-amber-900 mb-1.5 uppercase tracking-wide">
                        Important information
                      </h3>
                      <p className="text-sm text-amber-800 leading-relaxed">
                        {experience.importantInfo}
                      </p>
                    </div>
                  </div>
                </div>
              )}

              {/* ─ Things to know ─ */}
              <div className="py-8">
                <h2 className="text-xl font-semibold text-gray-900 mb-6">Things to know</h2>
                <div className="grid grid-cols-1 sm:grid-cols-3 gap-8">
                  {/* Guest requirements */}
                  <div>
                    <h3 className="font-semibold text-gray-900 mb-3 flex items-center gap-2">
                      <Users size={16} strokeWidth={1.5} className="text-gray-500" />
                      Guest requirements
                    </h3>
                    <ul className="space-y-1.5 text-sm text-gray-600">
                      {experience.maxGroupSize && (
                        <li>Up to {experience.maxGroupSize} guests</li>
                      )}
                      <li>Ages 8 and up can attend</li>
                    </ul>
                  </div>

                  {/* What to bring */}
                  {experience.valueToBring && experience.valueToBring.length > 0 && (
                    <div>
                      <h3 className="font-semibold text-gray-900 mb-3 flex items-center gap-2">
                        <Info size={16} strokeWidth={1.5} className="text-gray-500" />
                        What to bring
                      </h3>
                      <ul className="space-y-1.5 text-sm text-gray-600">
                        {experience.valueToBring.map((item, i) => (
                          <li key={i}>{item}</li>
                        ))}
                      </ul>
                    </div>
                  )}

                  {/* Cancellation */}
                  <div>
                    <h3 className="font-semibold text-gray-900 mb-3 flex items-center gap-2">
                      <ShieldCheck size={16} strokeWidth={1.5} className="text-gray-500" />
                      Cancellation policy
                    </h3>
                    <p className="text-sm text-gray-600 leading-relaxed">
                      {experience.cancellationPolicy || 'Cancel up to 7 days before the experience for a full refund.'}
                    </p>
                  </div>
                </div>
              </div>

            </div>

            {/* ══ RIGHT COLUMN — Sticky Booking Widget ══ */}
            <div className="hidden lg:block">
              <div className="sticky top-6">
                {/* Price header */}
                <div className="mb-4">
                  <p className="text-[13px] text-gray-500 mb-0.5">From</p>
                  <div className="flex items-baseline gap-1">
                    <span className="text-3xl font-semibold text-gray-900">
                      {experience.currency}{experience.price}
                    </span>
                    <span className="text-gray-500 text-sm">/ guest</span>
                  </div>
                  <p className="text-[13px] text-green-600 font-medium mt-1">Free cancellation</p>
                </div>

                {addTransport && (
                  <div className="flex items-center gap-2 mb-3 text-sm bg-gray-50 rounded-xl px-3 py-2.5">
                    <Car size={14} strokeWidth={1.5} className="text-gray-500 flex-shrink-0" />
                    <span className="text-[13px] text-gray-600">Hotel transfer</span>
                    <span className="ml-auto text-[13px] font-semibold text-gray-900">+€{hotel.transportationPrice ?? 20}/person</span>
                  </div>
                )}

                {/* Guest counter */}
                <div className="border border-gray-200 rounded-2xl px-5 py-4 mb-3 flex items-center justify-between">
                  <div>
                    <p className="text-[13px] font-semibold text-gray-900">{selectedGuests} adult{selectedGuests !== 1 ? 's' : ''}</p>
                    <p className="text-[11px] text-gray-400 mt-0.5">Number of guests</p>
                  </div>
                  <div className="flex items-center gap-2">
                    <button
                      onClick={() => setSelectedGuests(g => Math.max(1, g - 1))}
                      className="w-7 h-7 rounded-full border border-gray-300 flex items-center justify-center text-gray-600 hover:border-gray-500 transition-colors text-base leading-none"
                    >−</button>
                    <span className="text-sm font-medium w-4 text-center">{selectedGuests}</span>
                    <button
                      onClick={() => setSelectedGuests(g => Math.min(experience.maxGroupSize || 20, g + 1))}
                      className="w-7 h-7 rounded-full border border-gray-300 flex items-center justify-center text-gray-600 hover:border-gray-500 transition-colors text-base leading-none"
                    >+</button>
                  </div>
                </div>

                {/* Available slots */}
                <div className="border border-gray-200 rounded-2xl overflow-hidden">
                  {slotsLoading ? (
                    <div className="flex items-center justify-center gap-2 py-6 text-gray-400 text-sm">
                      <Loader2 size={16} className="animate-spin" />
                      Loading availability…
                    </div>
                  ) : previewSlots.length === 0 ? (
                    <div className="py-6 text-center text-gray-400 text-sm px-4">
                      No upcoming slots available.
                    </div>
                  ) : (
                    previewSlots.map((slot, i) => {
                      const spots = slot.max_participants - slot.booked_participants;
                      const timeRange = `${formatSlotTime(slot.start_time)} – ${formatSlotTime(slot.end_time)}`;
                      return (
                        <button
                          key={slot.id}
                          onClick={() => handleSlotSelected(slot, selectedGuests)}
                          className="w-full flex items-center justify-between px-5 py-4 hover:bg-gray-50 transition-colors border-b border-gray-100 last:border-0 text-left"
                        >
                          <div>
                            <p className="text-[13px] font-semibold text-gray-900">{slot.dateLabel}</p>
                            <p className="text-[13px] text-gray-500 mt-0.5">{timeRange}</p>
                          </div>
                          <span className="text-[13px] text-gray-500 flex-shrink-0 ml-4">
                            {spots} spot{spots !== 1 ? 's' : ''} available
                          </span>
                        </button>
                      );
                    })
                  )}

                  <button
                    onClick={() => setShowSelectTime(true)}
                    className="w-full py-4 text-[13px] font-medium text-gray-700 hover:bg-gray-50 transition-colors underline"
                  >
                    Show all dates
                  </button>
                </div>

                {/* Verified badge */}
                <div className="mt-4 flex items-center gap-3 p-4 bg-gray-50 rounded-xl border border-gray-100">
                  <Award size={22} strokeWidth={1.5} className="text-gray-700 flex-shrink-0" />
                  <p className="text-xs text-gray-600 leading-snug">
                    <span className="font-semibold text-gray-900">Experiences are vetted for quality.</span>
                    {' '}Every experience meets our standards for unique, engaging activities.
                  </p>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>

      {/* ─── Mobile Sticky Bottom Bar ─── */}
      <div className="lg:hidden flex-shrink-0 bg-white border-t border-gray-200 px-5 py-3.5">
        <div className="flex items-center justify-between gap-4">
          <div>
            <p className="text-[11px] text-gray-500">From</p>
            <div className="flex items-baseline gap-1">
              <span className="text-xl font-semibold text-gray-900">
                {experience.currency}{experience.price}
              </span>
              <span className="text-gray-500 text-xs">/ guest</span>
            </div>
            <p className="text-[11px] text-green-600 font-medium">Free cancellation</p>
          </div>

          {/* Mobile guests counter */}
          <div className="flex items-center gap-2">
            <button
              onClick={() => setSelectedGuests(g => Math.max(1, g - 1))}
              className="w-7 h-7 rounded-full border border-gray-300 flex items-center justify-center text-gray-600 hover:border-gray-500 transition-colors text-base leading-none"
            >−</button>
            <span className="text-sm font-medium w-5 text-center">{selectedGuests}</span>
            <button
              onClick={() => setSelectedGuests(g => Math.min(experience.maxGroupSize || 20, g + 1))}
              className="w-7 h-7 rounded-full border border-gray-300 flex items-center justify-center text-gray-600 hover:border-gray-500 transition-colors text-base leading-none"
            >+</button>
          </div>

          <button
            onClick={() => setShowSelectTime(true)}
            className="px-5 py-2.5 text-white font-semibold text-sm rounded-full transition-colors flex-shrink-0"
            style={{ backgroundColor: 'var(--hotel-primary)' }}
          >
            Book
          </button>
        </div>
      </div>

      {/* ─── All Photos Lightbox ─── */}
      {showAllPhotos && (
        <div className="fixed inset-0 z-[110] bg-black/95 flex flex-col">
          <div className="flex items-center justify-between px-6 py-4">
            <button
              onClick={() => setShowAllPhotos(false)}
              className="flex items-center gap-2 text-white/80 hover:text-white text-sm font-medium"
            >
              <ChevronLeft size={18} />
              Back to experience
            </button>
            <span className="text-white/60 text-sm">{photos.length} photos</span>
          </div>
          <div className="flex-1 overflow-y-auto px-6 pb-6">
            <div className="max-w-3xl mx-auto space-y-3">
              {photos.map((photo, i) => (
                <img
                  key={i}
                  src={photo}
                  alt={`${experience.title} ${i + 1}`}
                  className="w-full rounded-xl"
                />
              ))}
            </div>
          </div>
        </div>
      )}

      {/* ─── Select Time Modal ─── */}
      {showSelectTime && (
        <SelectTimeModal
          experience={experience}
          initialGuests={selectedGuests}
          onClose={() => setShowSelectTime(false)}
          onSlotSelected={handleSlotSelected}
        />
      )}

      {/* ─── Booking Flow Modal ─── */}
      {showBookingFlow && selectedSlot && (
        <BookingFlow
          experience={experience}
          slot={selectedSlot}
          guests={selectedGuests}
          onClose={() => setShowBookingFlow(false)}
        />
      )}

      {/* ─── Video Modal ─── */}
      {showVideoModal && experience.videoUrl && (
        <div
          className="fixed inset-0 z-[200] bg-black/95 flex items-center justify-center p-4 sm:p-10"
          onClick={() => setShowVideoModal(false)}
        >
          <button
            onClick={() => setShowVideoModal(false)}
            className="absolute top-4 right-4 w-10 h-10 flex items-center justify-center rounded-full bg-white/10 hover:bg-white/20 text-white transition-colors"
          >
            <X size={20} />
          </button>
          <video
            src={experience.videoUrl}
            className="w-full max-w-4xl max-h-[88vh] rounded-xl"
            autoPlay
            muted
            loop
            playsInline
            controls
            onClick={(e) => e.stopPropagation()}
          />
        </div>
      )}
    </div>
  );
};

