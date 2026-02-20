import React, { useState, useEffect } from 'react';
import { X, CalendarDays, Minus, Plus, Loader2 } from 'lucide-react';
import { ExperienceDisplay } from '../types';
import { useAvailabilitySlots, AvailabilitySlot, formatSlotTime } from '../hooks/useAvailabilitySlots';

interface SelectTimeModalProps {
  experience: ExperienceDisplay;
  initialGuests?: number;
  onClose: () => void;
  onSlotSelected: (slot: AvailabilitySlot, guests: number) => void;
}

// Re-export so DetailModal can import the type from here
export type { AvailabilitySlot as SlotItem };

export const SelectTimeModal: React.FC<SelectTimeModalProps> = ({
  experience,
  initialGuests = 1,
  onClose,
  onSlotSelected,
}) => {
  const [adults, setAdults] = useState(initialGuests);
  const { slotGroups, loading, error } = useAvailabilitySlots(experience.id);

  const monthLabel = new Date().toLocaleDateString('en-US', { month: 'long', year: 'numeric' });

  useEffect(() => {
    document.body.style.overflow = 'hidden';
    return () => { document.body.style.overflow = 'auto'; };
  }, []);

  return (
    <div className="fixed inset-0 z-[200] flex items-end sm:items-center justify-center">
      {/* Backdrop */}
      <div className="absolute inset-0 bg-black/50" onClick={onClose} />

      {/* Sheet */}
      <div className="relative bg-white w-full sm:max-w-lg sm:rounded-2xl rounded-t-2xl max-h-[92vh] flex flex-col shadow-2xl">

        {/* Header */}
        <div className="flex items-center justify-between px-6 py-5 border-b border-gray-100 flex-shrink-0">
          <h2 className="text-xl font-bold text-gray-900">Select a time</h2>
          <button
            onClick={onClose}
            className="w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-100 transition-colors text-gray-600"
          >
            <X size={18} strokeWidth={2} />
          </button>
        </div>

        {/* Scrollable body */}
        <div className="flex-1 overflow-y-auto">
          <div className="px-6 pt-5">

            {/* Adults + children */}
            <div className="flex items-start justify-between pb-5 border-b border-gray-100">
              <div>
                <p className="text-[15px] font-medium text-gray-900">{adults} adult{adults !== 1 ? 's' : ''}</p>
                <button className="text-[13px] text-gray-500 underline mt-0.5">Add children</button>
              </div>
              <div className="flex items-center gap-3">
                <button
                  onClick={() => setAdults(a => Math.max(1, a - 1))}
                  className="w-8 h-8 rounded-full border border-gray-300 flex items-center justify-center text-gray-600 hover:border-gray-500 transition-colors"
                >
                  <Minus size={14} />
                </button>
                <span className="text-[15px] font-medium w-4 text-center">{adults}</span>
                <button
                  onClick={() => setAdults(a => Math.min(experience.maxGroupSize || 20, a + 1))}
                  className="w-8 h-8 rounded-full border border-gray-300 flex items-center justify-center text-gray-600 hover:border-gray-500 transition-colors"
                >
                  <Plus size={14} />
                </button>
              </div>
            </div>

            {/* Month header */}
            <div className="flex items-center justify-between py-4 border-b border-gray-100">
              <span className="text-[15px] font-bold text-gray-900">{monthLabel}</span>
              <CalendarDays size={18} strokeWidth={1.5} className="text-gray-500" />
            </div>

          </div>

          {/* Slot groups */}
          <div className="px-6 pb-8">
            {loading ? (
              <div className="py-16 flex flex-col items-center gap-3 text-gray-400">
                <Loader2 size={22} className="animate-spin" />
                <span className="text-sm">Loading availability…</span>
              </div>
            ) : error ? (
              <div className="py-16 text-center text-red-400 text-sm">{error}</div>
            ) : slotGroups.length === 0 ? (
              <div className="py-16 text-center text-gray-400 text-sm">No upcoming slots available for this experience.</div>
            ) : (
              slotGroups.map(group => (
                <div key={group.date} className="mt-6">
                  <h3 className="text-[15px] font-bold text-gray-900 mb-3">{group.label}</h3>
                  <div className="space-y-3">
                    {group.slots.map(slot => {
                      const spots = slot.max_participants - slot.booked_participants;
                      const timeRange = `${formatSlotTime(slot.start_time)} – ${formatSlotTime(slot.end_time)}`;
                      return (
                        <button
                          key={slot.id}
                          onClick={() => onSlotSelected(slot, adults)}
                          className="w-full border border-gray-200 rounded-xl px-4 py-4 text-left hover:border-gray-400 hover:shadow-sm transition-all"
                        >
                          <div className="flex items-start justify-between">
                            <div>
                              <p className="text-[15px] font-semibold text-gray-900">{timeRange}</p>
                              <p className="text-[13px] text-gray-600 mt-0.5">
                                {experience.currency}{experience.price} / guest
                              </p>
                              <p className="text-[13px] text-gray-400 mt-0.5">Private pricing available</p>
                            </div>
                            <span className="text-[13px] text-gray-500 flex-shrink-0 mt-0.5">
                              {spots} spot{spots !== 1 ? 's' : ''} available
                            </span>
                          </div>
                        </button>
                      );
                    })}
                  </div>
                </div>
              ))
            )}
          </div>
        </div>
      </div>
    </div>
  );
};
