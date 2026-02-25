import React, { useRef, useState, useCallback } from 'react';
import { ExperienceDisplay } from '../types';
import { Star, Clock, Play, X } from 'lucide-react';

interface VideoCardProps {
  experience: ExperienceDisplay;
  onClick: (experience: ExperienceDisplay) => void;
}

export const VideoCard: React.FC<VideoCardProps> = ({ experience, onClick }) => {
  const videoRef = useRef<HTMLVideoElement>(null);
  const [isPlaying, setIsPlaying] = useState(false);
  const [showVideoLightbox, setShowVideoLightbox] = useState(false);

  // Detect touch device (no hover)
  const isTouchDevice = typeof window !== 'undefined' && !window.matchMedia('(hover: hover)').matches;

  const handleMouseEnter = () => {
    if (isTouchDevice) return; // skip hover logic on touch
    if (videoRef.current) {
      const playPromise = videoRef.current.play();
      if (playPromise !== undefined) {
        playPromise.then(() => {
          setIsPlaying(true);
        }).catch(() => {
          setIsPlaying(false);
        });
      }
    }
  };

  const handleMouseLeave = () => {
    if (isTouchDevice) return;
    if (videoRef.current) {
      videoRef.current.pause();
      videoRef.current.currentTime = 0;
      setIsPlaying(false);
    }
  };

  const handleCardClick = useCallback(() => {
    if (isTouchDevice && experience.videoUrl) {
      // Mobile: open video lightbox
      setShowVideoLightbox(true);
    } else {
      // Desktop: go to experience detail
      onClick(experience);
    }
  }, [isTouchDevice, experience, onClick]);

  const handleBookClick = (e: React.MouseEvent) => {
    e.stopPropagation();
    onClick(experience);
  };

  return (
    <>
      <div 
        onClick={handleCardClick}
        className="group cursor-pointer flex flex-col gap-3"
        onMouseEnter={handleMouseEnter}
        onMouseLeave={handleMouseLeave}
      >
        {/* Video/Image Container */}
        <div className="relative aspect-[4/5] sm:aspect-[3/4] md:aspect-[9/16] overflow-hidden bg-slate-900 rounded-xl shadow-md transition-all duration-300 group-hover:shadow-[8px_8px_0px_0px_rgba(0,0,0,1)] group-hover:-translate-y-1 border-0 ring-1 ring-black/5">
          
          {/* Video Player */}
          {experience.videoUrl && (
            <video
              ref={videoRef}
              src={experience.videoUrl}
              className={`absolute inset-0 w-full h-full object-cover transition-opacity duration-300 ${isPlaying ? 'opacity-100' : 'opacity-0'}`}
              muted
              loop
              playsInline
            />
          )}

          {/* Poster Image */}
          <img 
            src={experience.imageUrl} 
            alt={experience.title}
            className={`absolute inset-0 w-full h-full object-cover transition-transform duration-700 group-hover:scale-105 ${isPlaying ? 'opacity-0' : 'opacity-100'}`}
          />

          {/* Gradient Overlay */}
          <div className="absolute inset-0 bg-gradient-to-t from-black via-black/40 to-transparent opacity-90" />
          
          {/* Play Icon (Center) */}
          {experience.videoUrl && (
            <div className={`absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-12 h-12 md:w-12 md:h-12 rounded-full bg-white/20 backdrop-blur-md flex items-center justify-center text-white transition-all duration-300 ${isPlaying ? 'scale-150 opacity-0' : 'scale-100 opacity-100'}`}>
              <Play size={20} fill="currentColor" className="ml-1" />
            </div>
          )}
          
          {/* Category Tag */}
          <div className="absolute top-3 left-3">
            <span className="bg-white/90 backdrop-blur-md text-black text-[10px] font-black uppercase tracking-widest px-2 py-1 rounded shadow-sm">
               {experience.category}
            </span>
          </div>

          {/* Info Overlay (Bottom) */}
          <div className="absolute bottom-0 left-0 right-0 p-4 pt-12 transform transition-transform duration-300">
             <h3 className="text-white font-black text-xl leading-none uppercase tracking-tight mb-3 drop-shadow-md line-clamp-2">
               {experience.title}
             </h3>
             
             <div className="flex items-end justify-between gap-2">
                <div className="space-y-1">
                   <div className="flex items-center gap-2 text-white/80 text-xs font-bold uppercase tracking-wide">
                     <div className="flex items-center gap-1">
                       <Clock size={12} strokeWidth={3} />
                       {experience.duration}
                     </div>
                     <span>•</span>
                     <div className="flex items-center gap-1">
                       <Star size={12} className="text-yellow-400" fill="currentColor" />
                       {experience.rating}
                     </div>
                   </div>
                   <div className="text-white font-black text-2xl shadow-black drop-shadow-sm">
                     {experience.currency}{experience.price}
                   </div>
                </div>

                <button 
                  onClick={handleBookClick}
                  className="relative bg-white/10 hover:bg-white/20 active:bg-white/30 backdrop-blur-md text-white font-semibold uppercase tracking-widest text-[11px] md:text-[11px] px-5 md:px-5 py-3 md:py-2.5 rounded-full border border-white/30 hover:border-white/60 transition-all duration-200 shadow-lg hover:shadow-white/10 hover:-translate-y-0.5 active:translate-y-0 min-w-[80px] text-center"
                >
                  Book
                </button>
             </div>
          </div>
        </div>
      </div>

      {/* Mobile Video Lightbox */}
      {showVideoLightbox && experience.videoUrl && (
        <div 
          className="fixed inset-0 z-[200] flex flex-col items-center justify-center"
          onClick={() => setShowVideoLightbox(false)}
        >
          {/* Blur backdrop */}
          <div className="absolute inset-0 bg-black/70 backdrop-blur-xl" />

          {/* Close button */}
          <button 
            onClick={() => setShowVideoLightbox(false)}
            className="absolute top-4 right-4 z-10 w-10 h-10 flex items-center justify-center rounded-full bg-white/15 backdrop-blur-md text-white hover:bg-white/25 transition-colors"
          >
            <X size={20} />
          </button>

          {/* Video container */}
          <div 
            className="relative w-full max-w-lg mx-4 rounded-2xl overflow-hidden shadow-2xl"
            onClick={(e) => e.stopPropagation()}
          >
            <video
              src={experience.videoUrl}
              className="w-full aspect-[9/16] object-cover"
              autoPlay
              loop
              playsInline
              controls
              muted
            />

            {/* Info overlay on video */}
            <div className="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/90 via-black/50 to-transparent p-5 pt-16">
              <span className="text-white/60 text-[10px] font-bold uppercase tracking-widest">{experience.category}</span>
              <h3 className="text-white font-black text-xl leading-tight uppercase tracking-tight mt-1 mb-2">
                {experience.title}
              </h3>
              <div className="flex items-center gap-3 text-white/70 text-xs font-bold mb-4">
                <span className="flex items-center gap-1"><Clock size={11} strokeWidth={3} /> {experience.duration}</span>
                <span>•</span>
                <span className="flex items-center gap-1"><Star size={11} fill="currentColor" className="text-yellow-400" /> {experience.rating}</span>
              </div>
              <div className="flex items-center justify-between">
                <span className="text-white font-black text-2xl">{experience.currency}{experience.price}</span>
                <button 
                  onClick={(e) => { e.stopPropagation(); setShowVideoLightbox(false); onClick(experience); }}
                  className="px-6 py-3 bg-white text-black font-bold text-sm uppercase tracking-wider rounded-full transition-all active:scale-95"
                >
                  Book Now
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </>
  );
};
