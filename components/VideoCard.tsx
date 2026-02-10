import React, { useRef, useState } from 'react';
import { ExperienceDisplay } from '../types';
import { Star, Clock, Play } from 'lucide-react';

interface VideoCardProps {
  experience: ExperienceDisplay;
  onClick: (experience: ExperienceDisplay) => void;
}

export const VideoCard: React.FC<VideoCardProps> = ({ experience, onClick }) => {
  const videoRef = useRef<HTMLVideoElement>(null);
  const [isPlaying, setIsPlaying] = useState(false);

  const handleMouseEnter = () => {
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
    if (videoRef.current) {
      videoRef.current.pause();
      videoRef.current.currentTime = 0;
      setIsPlaying(false);
    }
  };

  const handleBookClick = (e: React.MouseEvent) => {
    e.stopPropagation();
    onClick(experience);
  };

  return (
    <div 
      onClick={() => onClick(experience)}
      className="group cursor-pointer flex flex-col gap-3"
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
    >
      {/* Video/Image Container - Vertical 9:16 Aspect Ratio */}
      <div className="relative aspect-[9/16] overflow-hidden bg-slate-900 rounded-xl shadow-md transition-all duration-300 group-hover:shadow-[8px_8px_0px_0px_rgba(0,0,0,1)] group-hover:-translate-y-1 border-0 ring-1 ring-black/5">
        
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

        {/* Poster Image (shown when not playing) */}
        <img 
          src={experience.imageUrl} 
          alt={experience.title}
          className={`absolute inset-0 w-full h-full object-cover transition-transform duration-700 group-hover:scale-105 ${isPlaying ? 'opacity-0' : 'opacity-100'}`}
        />

        {/* Gradient Overlay */}
        <div className="absolute inset-0 bg-gradient-to-t from-black via-black/40 to-transparent opacity-90" />
        
        {/* Play Icon (Center) */}
        <div className={`absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-12 h-12 rounded-full bg-white/20 backdrop-blur-md flex items-center justify-center text-white transition-all duration-300 ${isPlaying ? 'scale-150 opacity-0' : 'scale-100 opacity-100'}`}>
          <Play size={20} fill="currentColor" className="ml-1" />
        </div>
        
        {/* Category Tag (Top Left) */}
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
                className="bg-emerald-400 hover:bg-emerald-300 text-black font-black uppercase tracking-widest text-xs px-5 py-3 rounded-lg transition-all shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] active:translate-x-[2px] active:translate-y-[2px] active:shadow-none hover:-translate-y-0.5"
              >
                Book
              </button>
           </div>
        </div>
      </div>
    </div>
  );
};
