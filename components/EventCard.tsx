import React from 'react';
import { Calendar, MapPin, ExternalLink } from 'lucide-react';
import { EventDisplay } from '../types';

interface EventCardProps {
  event: EventDisplay;
}

export function EventCard({ event }: EventCardProps) {
  const handleClick = () => {
    window.open(event.link, '_blank', 'noopener,noreferrer');
  };

  return (
    <div
      onClick={handleClick}
      className="group relative bg-white dark:bg-gray-800 rounded-xl overflow-hidden shadow-md hover:shadow-xl transition-all duration-300 cursor-pointer transform hover:-translate-y-1"
    >
      {/* Event Image */}
      <div className="relative h-48 overflow-hidden">
        <img
          src={event.imageUrl}
          alt={event.name}
          className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300"
          onError={(e) => {
            // Fallback to placeholder if image fails to load
            e.currentTarget.src = 'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?w=800';
          }}
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-black/20 to-transparent" />
        
        {/* Category Badge */}
        <div className="absolute top-3 left-3">
          <span className="px-3 py-1 bg-white/90 dark:bg-gray-900/90 backdrop-blur-sm text-xs font-medium text-gray-900 dark:text-white rounded-full">
            {event.category}
          </span>
        </div>

        {/* External Link Icon */}
        <div className="absolute top-3 right-3 opacity-0 group-hover:opacity-100 transition-opacity">
          <div className="bg-white/90 dark:bg-gray-900/90 backdrop-blur-sm p-2 rounded-full">
            <ExternalLink className="w-4 h-4 text-gray-900 dark:text-white" />
          </div>
        </div>
      </div>

      {/* Event Details */}
      <div className="p-4">
        {/* Event Name */}
        <h3 className="text-lg font-bold text-gray-900 dark:text-white mb-2 line-clamp-2 group-hover:text-orange-500 dark:group-hover:text-orange-400 transition-colors">
          {event.name}
        </h3>

        {/* Date */}
        <div className="flex items-center gap-2 text-sm text-gray-600 dark:text-gray-400 mb-2">
          <Calendar className="w-4 h-4 flex-shrink-0" />
          <span className="line-clamp-1">{event.date}</span>
        </div>

        {/* Venue */}
        <div className="flex items-center gap-2 text-sm text-gray-600 dark:text-gray-400">
          <MapPin className="w-4 h-4 flex-shrink-0" />
          <span className="line-clamp-1">{event.venue}</span>
        </div>

        {/* Description (if available) */}
        {event.description && (
          <p className="mt-3 text-sm text-gray-600 dark:text-gray-400 line-clamp-2">
            {event.description}
          </p>
        )}
      </div>

      {/* Hover overlay */}
      <div className="absolute inset-0 border-2 border-orange-500 dark:border-orange-400 rounded-xl opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none" />
    </div>
  );
}
