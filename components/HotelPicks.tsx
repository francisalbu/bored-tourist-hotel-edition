import React, { useState, useMemo } from 'react';
import { Heart, MapPin, Sparkles, ChevronRight } from 'lucide-react';
import { ExperienceDisplay } from '../types';
import { useExperiences } from '../hooks/useExperiences';

interface HotelPicksProps {
  onExperienceClick: (experience: ExperienceDisplay) => void;
}

interface StaffMember {
  name: string;
  role: string;
  avatar: string;
  bio: string;
  preferredCategories: string[];
}

const STAFF_MEMBERS: StaffMember[] = [
  {
    name: "Clara",
    role: "Concierge",
    avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&h=200&fit=crop",
    bio: "Lisbon local for 15 years. I love showing guests the city's hidden gems!",
    preferredCategories: ['Outdoors', 'Sports']
  },
  {
    name: "Joel",
    role: "Front Desk Manager",
    avatar: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=200&h=200&fit=crop",
    bio: "Born and raised in Lisbon. I know every corner of this beautiful city!",
    preferredCategories: ['Culture Dive', 'Time Stories']
  },
  {
    name: "Gale",
    role: "Guest Relations",
    avatar: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&h=200&fit=crop",
    bio: "Passionate about Portuguese culture and helping guests create unforgettable memories!",
    preferredCategories: ['Night Explorer', 'Mind & Body']
  }
];

const getTypeIcon = (category: string) => {
  if (category.toLowerCase().includes('outdoor') || category.toLowerCase().includes('sport')) {
    return <Sparkles className="w-4 h-4" />;
  }
  if (category.toLowerCase().includes('culture') || category.toLowerCase().includes('time')) {
    return <Heart className="w-4 h-4" />;
  }
  return <MapPin className="w-4 h-4" />;
};

export const HotelPicks: React.FC<HotelPicksProps> = ({ onExperienceClick }) => {
  const [selectedStaff, setSelectedStaff] = useState<number>(0);
  const { experiences } = useExperiences();
  
  const staffRecommendations = useMemo(() => {
    const staff = STAFF_MEMBERS[selectedStaff];
    
    const filteredExperiences = experiences.filter(exp => 
      staff.preferredCategories.some(cat => 
        exp.category.toLowerCase().includes(cat.toLowerCase())
      )
    );
    
    const pool = filteredExperiences.length >= 3 ? filteredExperiences : experiences;
    const shuffled = [...pool].sort(() => Math.random() - 0.5);
    return shuffled.slice(0, 3);
  }, [selectedStaff, experiences]);

  return (
    <div className="bg-gradient-to-br from-emerald-50 to-teal-50 p-8">
      {/* Header */}
      <div className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <Heart className="w-6 h-6 text-emerald-600" fill="currentColor" />
          <h2 className="text-3xl font-black text-gray-900">Hotel Picks</h2>
        </div>
        <p className="text-gray-600">Personal recommendations from our team</p>
      </div>

      {/* Staff Selector */}
      <div className="flex justify-center gap-6 mb-8">
        {STAFF_MEMBERS.map((staff, index) => (
          <button
            key={staff.name}
            onClick={() => setSelectedStaff(index)}
            className={`flex flex-col items-center gap-3 p-4 rounded-2xl transition-all ${
              selectedStaff === index
                ? 'bg-white shadow-lg scale-105'
                : 'bg-transparent hover:bg-white/50'
            }`}
          >
            <div className={`relative ${selectedStaff === index ? 'ring-4 ring-emerald-500 rounded-full' : ''}`}>
              <img
                src={staff.avatar}
                alt={staff.name}
                className="w-24 h-24 rounded-full object-cover"
              />
            </div>
            <div className="text-center">
              <div className="font-bold text-gray-900">{staff.name}</div>
              <div className="text-xs text-gray-500">{staff.role}</div>
            </div>
          </button>
        ))}
      </div>

      {/* Selected Staff's Bio */}
      <div className="bg-white rounded-2xl p-6 mb-8 shadow-sm max-w-4xl mx-auto">
        <p className="text-gray-700 italic text-lg">
          "{STAFF_MEMBERS[selectedStaff].bio}"
        </p>
        <p className="text-emerald-600 font-bold mt-2">
          — {STAFF_MEMBERS[selectedStaff].name}
        </p>
      </div>

      {/* Recommendations Grid */}
      <div>
        <h3 className="text-lg font-bold text-gray-900 mb-4 flex items-center gap-2">
          <Sparkles className="w-5 h-5 text-emerald-600" />
          Curated Experiences
        </h3>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {staffRecommendations.map((experience) => (
            <div
              key={experience.id}
              onClick={() => onExperienceClick(experience)}
              className="bg-white rounded-xl overflow-hidden shadow-md hover:shadow-xl transition-shadow group cursor-pointer"
            >
              {/* Image */}
              <div className="relative h-48 overflow-hidden">
                <img
                  src={experience.imageUrl}
                  alt={experience.title}
                  className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                />
                <div className="absolute top-3 right-3 bg-white/95 backdrop-blur-sm rounded-full px-3 py-1.5 flex items-center gap-1.5 shadow-lg">
                  {getTypeIcon(experience.category)}
                  <span className="text-xs font-medium text-gray-700">{experience.category}</span>
                </div>
              </div>

              {/* Content */}
              <div className="p-4">
                <h3 className="font-bold text-lg text-gray-900 mb-1 group-hover:text-emerald-600 transition-colors">
                  {experience.title}
                </h3>
                
                <div className="flex items-center gap-1.5 text-sm text-gray-500 mb-3">
                  <MapPin className="w-3.5 h-3.5" />
                  <span>{experience.location}</span>
                </div>

                <p className="text-sm text-gray-600 line-clamp-3 mb-4">
                  {experience.description}
                </p>

                {/* Action Button */}
                <button className="w-full bg-emerald-500 hover:bg-emerald-600 text-white font-medium py-2.5 px-4 rounded-lg transition-colors flex items-center justify-center gap-2 group">
                  <span>€{experience.price} · Book Now</span>
                  <ChevronRight className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
                </button>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Footer Note */}
      <div className="mt-6 text-center">
        <p className="text-sm text-gray-500">
          Have questions? Ask our team at the front desk — we'd love to help plan your perfect day! 💚
        </p>
      </div>
    </div>
  );
}
