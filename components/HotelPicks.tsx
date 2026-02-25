import React, { useState, useMemo } from 'react';
import { Clock, Star } from 'lucide-react';
import { ExperienceDisplay } from '../types';
import { useExperiences } from '../hooks/useExperiences';
import { useHotel } from '../contexts/HotelContext';

interface HotelPicksProps {
  onExperienceClick: (experience: ExperienceDisplay) => void;
}

export const HotelPicks: React.FC<HotelPicksProps> = ({ onExperienceClick }) => {
  const [selectedStaff, setSelectedStaff] = useState<number>(0);
  const { experiences } = useExperiences();
  const hotel = useHotel();
  const STAFF_MEMBERS = hotel.staffMembers;

  const staffRecommendations = useMemo(() => {
    const staff = STAFF_MEMBERS[selectedStaff];
    const filtered = experiences.filter(exp =>
      staff.preferredCategories.some(cat =>
        exp.category.toLowerCase().includes(cat.toLowerCase())
      )
    );
    const pool = filtered.length >= 3 ? filtered : experiences;
    return [...pool].sort(() => Math.random() - 0.5).slice(0, 3);
  }, [selectedStaff, experiences]);

  const staff = STAFF_MEMBERS[selectedStaff];

  return (
    <div className="bg-white px-4 py-8 md:px-10 md:py-10">
      {/* Header */}
      <div className="mb-6 md:mb-8">
        <p className="text-[11px] font-semibold uppercase tracking-[0.15em] text-gray-400 mb-1">Staff Picks</p>
        <h2 className="text-xl md:text-2xl font-semibold text-gray-900 tracking-tight">Hotel Picks</h2>
      </div>

      {/* Staff Selector */}
      <div className="flex gap-3 md:gap-4 mb-6 md:mb-8 border-b border-gray-100 pb-6 md:pb-8 overflow-x-auto -mx-4 px-4 md:mx-0 md:px-0 scrollbar-hide">
        {STAFF_MEMBERS.map((s, index) => (
          <button
            key={s.name}
            onClick={() => setSelectedStaff(index)}
            className={`flex flex-col items-center gap-2.5 transition-all duration-200 ${
              selectedStaff === index ? 'opacity-100' : 'opacity-40 hover:opacity-70'
            }`}
          >
            <img
              src={s.avatar}
              alt={s.name}
              className={`w-11 h-11 md:w-14 md:h-14 rounded-full object-cover transition-all duration-200 ${
                selectedStaff === index ? 'ring-2 ring-offset-2 ring-gray-900' : ''
              }`}
            />
            <div className="text-center whitespace-nowrap">
              <div className={`text-xs md:text-sm font-medium ${selectedStaff === index ? 'text-gray-900' : 'text-gray-500'}`}>{s.name}</div>
              <div className="text-[10px] md:text-[11px] text-gray-400">{s.role}</div>
            </div>
          </button>
        ))}
      </div>

      {/* Bio */}
      <div className="mb-8">
        <p className="text-gray-600 text-[15px] leading-relaxed italic">
          "{staff.bio}"
        </p>
        <p className="text-gray-400 text-sm mt-2">— {staff.name}</p>
      </div>

      {/* Cards */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-5">
        {staffRecommendations.map((experience) => (
          <div
            key={experience.id}
            onClick={() => onExperienceClick(experience)}
            className="group cursor-pointer"
          >
            {/* Image */}
            <div className="relative aspect-[4/3] overflow-hidden rounded-xl mb-3">
              <img
                src={experience.imageUrl}
                alt={experience.title}
                className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
              />
              <div className="absolute top-3 left-3">
                <span className="bg-white/90 backdrop-blur-sm text-gray-700 text-[10px] font-semibold uppercase tracking-widest px-2.5 py-1 rounded-full">
                  {experience.category}
                </span>
              </div>
            </div>

            {/* Content */}
            <div className="flex items-start justify-between gap-3">
              <div className="min-w-0">
                <h3 className="font-medium text-gray-900 text-[15px] leading-snug group-hover:text-gray-600 transition-colors truncate">
                  {experience.title}
                </h3>
                <div className="flex items-center gap-3 mt-1 text-[12px] text-gray-400">
                  <span className="flex items-center gap-1"><Clock size={11} />{experience.duration}</span>
                  <span className="flex items-center gap-1"><Star size={11} className="text-amber-400" fill="currentColor" />{experience.rating}</span>
                </div>
              </div>
              <div className="flex-shrink-0 text-right">
                <div className="text-[13px] font-semibold text-gray-900">€{experience.price}</div>
                <div className="text-[11px] text-gray-400">/guest</div>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
