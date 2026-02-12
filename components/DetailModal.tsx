import React, { useEffect, useRef, useState } from 'react';
import { ExperienceDisplay } from '../types';
import { X, Heart, MapPin, Clock, Star, ShieldCheck, Zap, Users, Info } from 'lucide-react';
import { BookingFlow } from './BookingFlow';

interface DetailModalProps {
  experience: ExperienceDisplay;
  onClose: () => void;
}

export const DetailModal: React.FC<DetailModalProps> = ({ experience, onClose }) => {
  const videoRef = useRef<HTMLVideoElement>(null);
  const [showBookingFlow, setShowBookingFlow] = useState(false);

  useEffect(() => {
    document.body.style.overflow = 'hidden';
    
    // Auto-play video when modal opens
    if (videoRef.current && experience.videoUrl) {
      videoRef.current.play().catch(() => {
        // Ignore autoplay errors
      });
    }

    return () => {
      document.body.style.overflow = 'auto';
    };
  }, [experience.videoUrl]);

  return (
    <div className="fixed inset-0 z-[100] flex items-center justify-center p-0 sm:p-6">
      <div 
        className="absolute inset-0 bg-slate-900/80 backdrop-blur-sm transition-opacity" 
        onClick={onClose}
      />

      <div className="relative w-full h-full sm:h-auto sm:max-h-[90vh] sm:max-w-6xl bg-white sm:rounded-3xl shadow-2xl overflow-hidden flex flex-col sm:flex-row animate-in fade-in zoom-in-95 duration-200 border-0 sm:border-4 sm:border-black">
        
        {/* LEFT SIDE: Video Player */}
        <div className="relative w-full sm:w-1/2 h-[45vh] sm:h-auto bg-slate-900 flex-shrink-0">
          {experience.videoUrl ? (
            <video
              ref={videoRef}
              src={experience.videoUrl}
              className="absolute inset-0 w-full h-full object-cover"
              controls
              loop
              playsInline
              muted
              poster={experience.imageUrl}
            />
          ) : (
            <img 
              src={experience.imageUrl} 
              alt={experience.title}
              className="absolute inset-0 w-full h-full object-cover"
            />
          )}

          {/* Category Badge */}
          <div className="absolute top-4 left-4 z-10">
            <span className="bg-emerald-500 text-white text-[10px] font-black uppercase tracking-widest px-3 py-1.5 rounded-full shadow-lg">
              {experience.category}
            </span>
          </div>

          {/* Close Button (Mobile) */}
          <button 
            onClick={onClose}
            className="absolute top-4 right-4 z-10 w-10 h-10 rounded-full bg-black/80 text-white flex items-center justify-center sm:hidden hover:bg-black transition-colors"
          >
            <X size={20} />
          </button>
        </div>

        {/* RIGHT SIDE: Details */}
        <div className="flex-1 flex flex-col bg-white overflow-y-auto">
          
          {/* Close Button (Desktop) */}
          <button 
            onClick={onClose}
            className="hidden sm:flex absolute top-4 right-4 z-10 w-12 h-12 rounded-full bg-slate-900 text-white items-center justify-center hover:bg-black transition-colors"
          >
            <X size={24} />
          </button>

          {/* Content */}
          <div className="p-6 sm:p-8 space-y-6">
            
            {/* Header */}
            <div>
              <div className="flex items-start justify-between gap-4 mb-3">
                <div className="flex items-center gap-2 text-xs text-slate-500 font-bold uppercase tracking-widest">
                  <MapPin size={12} strokeWidth={3} />
                  <span>{experience.location}</span>
                </div>
                <div className="flex items-center gap-1 px-2 py-1 bg-emerald-50 rounded-full">
                  <Star size={14} className="text-yellow-500" fill="currentColor" />
                  <span className="text-sm font-black text-slate-900">{experience.rating}</span>
                </div>
              </div>

              <h1 className="text-3xl sm:text-4xl font-black text-slate-900 uppercase tracking-tight leading-none mb-4">
                {experience.title}
              </h1>

              <p className="text-slate-600 text-base leading-relaxed">
                {experience.description}
              </p>
            </div>

            {/* Quick Info Grid */}
            <div className="grid grid-cols-2 gap-4 py-6 border-y border-slate-200">
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 rounded-full bg-emerald-100 flex items-center justify-center">
                  <Clock size={18} className="text-emerald-600" strokeWidth={2.5} />
                </div>
                <div>
                  <p className="text-[10px] font-bold uppercase tracking-widest text-slate-400">Duration</p>
                  <p className="text-sm font-black text-slate-900">{experience.duration}</p>
                </div>
              </div>

              {experience.maxGroupSize && (
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 rounded-full bg-blue-100 flex items-center justify-center">
                    <Users size={18} className="text-blue-600" strokeWidth={2.5} />
                  </div>
                  <div>
                    <p className="text-[10px] font-bold uppercase tracking-widest text-slate-400">Max Group</p>
                    <p className="text-sm font-black text-slate-900">{experience.maxGroupSize} people</p>
                  </div>
                </div>
              )}

              <div className="flex items-center gap-3">
                <div className="w-10 h-10 rounded-full bg-purple-100 flex items-center justify-center">
                  <ShieldCheck size={18} className="text-purple-600" strokeWidth={2.5} />
                </div>
                <div>
                  <p className="text-[10px] font-bold uppercase tracking-widest text-slate-400">Refund Policy</p>
                  <p className="text-sm font-black text-slate-900">Full Refund</p>
                </div>
              </div>

              <div className="flex items-center gap-3">
                <div className="w-10 h-10 rounded-full bg-yellow-100 flex items-center justify-center">
                  <Zap size={18} className="text-yellow-600" strokeWidth={2.5} />
                </div>
                <div>
                  <p className="text-[10px] font-bold uppercase tracking-widest text-slate-400">Confirmation</p>
                  <p className="text-sm font-black text-slate-900">Instant</p>
                </div>
              </div>
            </div>

            {/* Highlights */}
            {experience.highlights && experience.highlights.length > 0 && (
              <div>
                <h3 className="text-xs font-black uppercase tracking-widest text-slate-900 mb-3">
                  ✨ Highlights
                </h3>
                <ul className="space-y-2">
                  {experience.highlights.map((highlight, idx) => (
                    <li key={idx} className="flex items-start gap-2 text-sm text-slate-700">
                      <span className="text-emerald-500 font-black mt-0.5">•</span>
                      <span>{highlight}</span>
                    </li>
                  ))}
                </ul>
              </div>
            )}

            {/* Important Info */}
            {experience.importantInfo && (
              <div className="bg-amber-50 border-2 border-amber-200 rounded-2xl p-4">
                <div className="flex items-start gap-3">
                  <Info size={20} className="text-amber-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <h3 className="text-xs font-black uppercase tracking-widest text-amber-900 mb-2">
                      Important Info
                    </h3>
                    <p className="text-sm text-amber-800 leading-relaxed">
                      {experience.importantInfo}
                    </p>
                  </div>
                </div>
              </div>
            )}

            {/* Cancellation Policy */}
            {experience.cancellationPolicy && (
              <div>
                <h3 className="text-xs font-black uppercase tracking-widest text-slate-900 mb-2">
                  📋 Cancellation Policy
                </h3>
                <p className="text-sm text-slate-600 leading-relaxed">
                  {experience.cancellationPolicy}
                </p>
              </div>
            )}

            {/* Address */}
            {experience.address && (
              <div>
                <h3 className="text-xs font-black uppercase tracking-widest text-slate-900 mb-2">
                  📍 Meeting Point
                </h3>
                <p className="text-sm text-slate-600">
                  {experience.address}
                </p>
              </div>
            )}

          </div>

          {/* Bottom CTA (Sticky) */}
          <div className="sticky bottom-0 mt-auto border-t-4 border-black bg-white p-6">
            <div className="flex items-center justify-between gap-4">
              <div>
                <p className="text-xs font-bold uppercase tracking-widest text-slate-400 mb-1">
                  From
                </p>
                <p className="text-3xl font-black text-slate-900">
                  {experience.currency}{experience.price}
                  <span className="text-sm text-slate-400 font-normal ml-1">/ person</span>
                </p>
              </div>
              <button 
                onClick={() => setShowBookingFlow(true)}
                className="px-8 py-4 bg-emerald-500 hover:bg-emerald-600 text-white font-black text-sm uppercase tracking-wider rounded-full transition-all hover:scale-105 hover:shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] border-2 border-black"
              >
                Book Now
              </button>
            </div>
          </div>

        </div>
      </div>

      {/* Booking Flow Modal */}
      {showBookingFlow && (
        <BookingFlow 
          experience={experience} 
          onClose={() => setShowBookingFlow(false)} 
        />
      )}
    </div>
  );
};
