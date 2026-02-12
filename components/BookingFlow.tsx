import React, { useState, useEffect } from 'react';
import { X, Calendar as CalendarIcon, Clock, Users, ChevronLeft, ChevronRight } from 'lucide-react';
import { supabase } from '../lib/supabase';
import { ExperienceDisplay } from '../types';

interface BookingFlowProps {
  experience: ExperienceDisplay;
  onClose: () => void;
}

interface AvailabilitySlot {
  id: number;
  experience_id: number;
  date: string;
  start_time: string;
  end_time: string;
  max_participants: number;
  booked_participants: number;
  is_available: boolean;
  created_at: string;
}

type BookingStep = 'calendar' | 'time' | 'confirm';

export const BookingFlow: React.FC<BookingFlowProps> = ({ experience, onClose }) => {
  const [step, setStep] = useState<BookingStep>('calendar');
  const [selectedDate, setSelectedDate] = useState<Date | null>(null);
  const [selectedSlot, setSelectedSlot] = useState<AvailabilitySlot | null>(null);
  const [availableSlots, setAvailableSlots] = useState<AvailabilitySlot[]>([]);
  const [numberOfPeople, setNumberOfPeople] = useState(1);
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [phone, setPhone] = useState('');
  const [currentMonth, setCurrentMonth] = useState(new Date());
  const [loading, setLoading] = useState(false);

  // Fetch available slots for selected date
  useEffect(() => {
    if (selectedDate && step === 'time') {
      fetchAvailableSlots();
    }
  }, [selectedDate, step]);

  const fetchAvailableSlots = async () => {
    if (!selectedDate) return;
    
    setLoading(true);
    const dateStr = selectedDate.toISOString().split('T')[0];
    const now = new Date();
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const isToday = selectedDate.toDateString() === today.toDateString();
    
    const { data, error } = await supabase
      .from('availability_slots')
      .select('*')
      .eq('experience_id', experience.id)
      .eq('date', dateStr)
      .eq('is_available', true)
      .order('start_time');
    
    if (error) {
      console.error('Error fetching slots:', error);
    } else {
      // Filter slots with available spots and time restrictions
      const slotsWithSpace = (data || []).filter(slot => {
        // Check if there are available spots
        if (slot.max_participants <= slot.booked_participants) return false;
        
        // Parse slot time
        const [hours, minutes] = slot.start_time.split(':').map(Number);
        const slotDateTime = new Date(selectedDate);
        slotDateTime.setHours(hours, minutes, 0, 0);
        
        // If it's today, slot must start at least 2 hours from now
        if (isToday) {
          const twoHoursFromNow = new Date(now.getTime() + 2 * 60 * 60 * 1000);
          return slotDateTime >= twoHoursFromNow;
        }
        
        // For future dates, just check it's not in the past
        return slotDateTime > now;
      });
      
      setAvailableSlots(slotsWithSpace);
    }
    setLoading(false);
  };

  const getDaysInMonth = (date: Date) => {
    const year = date.getFullYear();
    const month = date.getMonth();
    const firstDay = new Date(year, month, 1);
    const lastDay = new Date(year, month + 1, 0);
    const daysInMonth = lastDay.getDate();
    const startingDayOfWeek = firstDay.getDay();
    
    return { daysInMonth, startingDayOfWeek, year, month };
  };

  const handleDateSelect = (day: number) => {
    const date = new Date(currentMonth.getFullYear(), currentMonth.getMonth(), day);
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    
    if (date >= today) {
      setSelectedDate(date);
      setStep('time');
    }
  };

  const handleSlotSelect = (slot: AvailabilitySlot) => {
    setSelectedSlot(slot);
    setStep('confirm');
  };

  const handleConfirmBooking = async () => {
    // TODO: Implement actual booking logic with payment
    alert('Booking confirmed! (Payment integration pending)');
    onClose();
  };

  const formatDate = (date: Date) => {
    return date.toLocaleDateString('en-US', { 
      weekday: 'long', 
      month: 'long', 
      day: 'numeric',
      year: 'numeric'
    });
  };

  const totalPrice = selectedSlot 
    ? (experience.price || 45) * numberOfPeople 
    : (experience.price || 45) * numberOfPeople;

  const { daysInMonth, startingDayOfWeek, year, month } = getDaysInMonth(currentMonth);
  const monthName = currentMonth.toLocaleDateString('en-US', { month: 'long', year: 'numeric' });
  const weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/80 backdrop-blur-sm p-4">
      <div className="bg-black text-white rounded-3xl w-full max-w-lg max-h-[90vh] overflow-hidden flex flex-col">
        
        {/* Header */}
        <div className="flex items-center justify-between p-6 border-b border-slate-800">
          {step !== 'calendar' && (
            <button 
              onClick={() => setStep(step === 'confirm' ? 'time' : 'calendar')}
              className="p-2 hover:bg-slate-800 rounded-full transition-colors"
            >
              <ChevronLeft size={24} />
            </button>
          )}
          <h2 className="text-xl font-bold flex-1 text-center">
            {step === 'calendar' && 'Select a time'}
            {step === 'time' && 'Select a time'}
            {step === 'confirm' && 'Confirm and pay'}
          </h2>
          <button 
            onClick={onClose}
            className="p-2 hover:bg-slate-800 rounded-full transition-colors"
          >
            <X size={24} />
          </button>
        </div>

        {/* Content */}
        <div className="flex-1 overflow-y-auto p-6">
          
          {/* STEP 1: Calendar */}
          {step === 'calendar' && (
            <div className="space-y-6">
              {/* People selector */}
              <div className="bg-slate-900 rounded-2xl p-4 flex items-center justify-between">
                <span className="font-medium">{numberOfPeople} adult{numberOfPeople > 1 ? 's' : ''}</span>
                <div className="flex items-center gap-4">
                  <button
                    onClick={() => setNumberOfPeople(Math.max(1, numberOfPeople - 1))}
                    className="w-10 h-10 rounded-full bg-slate-800 hover:bg-slate-700 flex items-center justify-center transition-colors"
                  >
                    −
                  </button>
                  <span className="text-xl font-bold w-8 text-center">{numberOfPeople}</span>
                  <button
                    onClick={() => setNumberOfPeople(Math.min(experience.maxGroupSize || 10, numberOfPeople + 1))}
                    className="w-10 h-10 rounded-full bg-slate-800 hover:bg-slate-700 flex items-center justify-center transition-colors"
                  >
                    +
                  </button>
                </div>
              </div>

              {/* Month selector */}
              <div className="bg-slate-900 rounded-2xl p-4 flex items-center justify-between">
                <span className="font-bold">{monthName}</span>
                <button className="p-2 hover:bg-slate-800 rounded-lg transition-colors">
                  <CalendarIcon size={20} />
                </button>
              </div>

              {/* Calendar */}
              <div className="bg-slate-900 rounded-2xl p-6">
                <div className="flex items-center justify-between mb-6">
                  <button
                    onClick={() => setCurrentMonth(new Date(currentMonth.getFullYear(), currentMonth.getMonth() - 1))}
                    className="p-2 hover:bg-slate-800 rounded-lg transition-colors"
                  >
                    <ChevronLeft size={20} />
                  </button>
                  <span className="font-bold">{monthName}</span>
                  <button
                    onClick={() => setCurrentMonth(new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1))}
                    className="p-2 hover:bg-slate-800 rounded-lg transition-colors"
                  >
                    <ChevronRight size={20} />
                  </button>
                </div>

                <div className="grid grid-cols-7 gap-2 mb-4">
                  {weekDays.map(day => (
                    <div key={day} className="text-center text-sm text-slate-500 font-medium">
                      {day}
                    </div>
                  ))}
                </div>

                <div className="grid grid-cols-7 gap-2">
                  {Array.from({ length: startingDayOfWeek }).map((_, i) => (
                    <div key={`empty-${i}`} />
                  ))}
                  {Array.from({ length: daysInMonth }).map((_, i) => {
                    const day = i + 1;
                    const date = new Date(year, month, day);
                    const today = new Date();
                    today.setHours(0, 0, 0, 0);
                    const isPast = date < today;
                    const isSelected = selectedDate?.getDate() === day && 
                                      selectedDate?.getMonth() === month &&
                                      selectedDate?.getFullYear() === year;
                    const isToday = date.toDateString() === today.toDateString();

                    return (
                      <button
                        key={day}
                        onClick={() => !isPast && handleDateSelect(day)}
                        disabled={isPast}
                        className={`
                          aspect-square rounded-full flex items-center justify-center text-sm font-medium transition-colors
                          ${isPast ? 'text-slate-600 cursor-not-allowed' : 'hover:bg-slate-800'}
                          ${isSelected ? 'bg-emerald-400 text-black font-bold' : ''}
                          ${isToday && !isSelected ? 'border-2 border-emerald-400' : ''}
                        `}
                      >
                        {day}
                      </button>
                    );
                  })}
                </div>
              </div>
            </div>
          )}

          {/* STEP 2: Time Selection */}
          {step === 'time' && (
            <div className="space-y-4">
              <div className="text-sm text-slate-400 mb-4">
                {numberOfPeople} adult{numberOfPeople > 1 ? 's' : ''}
              </div>

              {selectedDate && (
                <>
                  <h3 className="text-xl font-bold mb-4">{formatDate(selectedDate).split(',')[0]}, {formatDate(selectedDate).split(',')[1]}</h3>

                  {loading ? (
                    <div className="text-center py-8 text-slate-400">Loading available times...</div>
                  ) : availableSlots.length === 0 ? (
                    <div className="text-center py-8 text-slate-400">No available slots for this date</div>
                  ) : (
                    <div className="space-y-3">
                      {availableSlots.map(slot => {
                        const spotsAvailable = slot.max_participants - slot.booked_participants;
                        return (
                          <button
                            key={slot.id}
                            onClick={() => handleSlotSelect(slot)}
                            className="w-full bg-slate-900 hover:bg-slate-800 rounded-2xl p-4 transition-colors text-left"
                          >
                            <div className="flex items-center justify-between">
                              <div>
                                <div className="font-bold text-lg">
                                  {slot.start_time.slice(0, 5)} — {slot.end_time.slice(0, 5)}
                                </div>
                                <div className="text-sm text-slate-400 mt-1">
                                  {spotsAvailable} spot{spotsAvailable !== 1 ? 's' : ''} available
                                </div>
                              </div>
                            <div className="text-emerald-400 font-bold">
                                €{experience.price || 45} / person
                              </div>
                            </div>
                          </button>
                        );
                      })}
                    </div>
                  )}
                </>
              )}
            </div>
          )}

          {/* STEP 3: Confirm & Pay */}
          {step === 'confirm' && selectedSlot && selectedDate && (
            <div className="space-y-6">
              {/* Experience Card */}
              <div className="bg-slate-900 rounded-2xl overflow-hidden">
                {experience.imageUrl && (
                  <img src={experience.imageUrl} alt={experience.title} className="w-full h-32 object-cover" />
                )}
                <div className="p-4">
                  <h3 className="font-bold text-lg mb-1">{experience.title}</h3>
                  <div className="flex items-center gap-2 text-sm text-slate-400">
                    <span>⭐ {experience.rating || '4.7'}</span>
                    <span>(0)</span>
                  </div>
                </div>
              </div>

              {/* Booking Summary */}
              <div>
                <h3 className="font-bold text-xl mb-4">Booking summary</h3>
                <div className="space-y-3 text-sm">
                  <div className="flex justify-between">
                    <span className="text-slate-400">Date</span>
                    <span className="font-medium">{formatDate(selectedDate)}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-slate-400">Time</span>
                    <span className="font-medium">{selectedSlot.start_time.slice(0, 5)} — {selectedSlot.end_time.slice(0, 5)}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-slate-400">People</span>
                    <span className="font-medium">{numberOfPeople} person{numberOfPeople > 1 ? 's' : ''}</span>
                  </div>
                </div>
              </div>

              {/* Contact Information */}
              <div>
                <h3 className="font-bold text-xl mb-4">Contact information</h3>
                <div className="space-y-3">
                  <input
                    type="text"
                    placeholder="Full name"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    className="w-full bg-slate-900 rounded-xl px-4 py-3 outline-none placeholder-slate-500 focus:ring-2 focus:ring-emerald-500"
                    required
                  />
                  <input
                    type="email"
                    placeholder="Email address"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    className="w-full bg-slate-900 rounded-xl px-4 py-3 outline-none placeholder-slate-500 focus:ring-2 focus:ring-emerald-500"
                    required
                  />
                  <input
                    type="tel"
                    placeholder="Phone number"
                    value={phone}
                    onChange={(e) => setPhone(e.target.value)}
                    className="w-full bg-slate-900 rounded-xl px-4 py-3 outline-none placeholder-slate-500 focus:ring-2 focus:ring-emerald-500"
                    required
                  />
                </div>
              </div>

              {/* Price Details */}
              <div>
                <h3 className="font-bold text-xl mb-4">Price details</h3>
                <div className="flex justify-between text-sm mb-6">
                  <span className="text-slate-400">€{experience.price || 45} x {numberOfPeople} person{numberOfPeople > 1 ? 's' : ''}</span>
                  <span className="font-bold">€{totalPrice.toFixed(2)}</span>
                </div>

                {/* Promo Code */}
                <div className="flex gap-3">
                  <input
                    type="text"
                    placeholder="Enter a promo code"
                    className="flex-1 bg-slate-900 rounded-xl px-4 py-3 outline-none placeholder-slate-500"
                  />
                  <button className="px-6 py-3 bg-slate-900 hover:bg-slate-800 rounded-xl font-bold transition-colors">
                    Apply
                  </button>
                </div>
              </div>
            </div>
          )}
        </div>

        {/* Footer */}
        {step === 'confirm' && (
          <div className="p-6 border-t border-slate-800">
            <button
              onClick={handleConfirmBooking}
              disabled={!name || !email || !phone}
              className="w-full py-4 bg-emerald-400 hover:bg-emerald-500 text-black font-bold rounded-2xl text-lg transition-colors disabled:opacity-50 disabled:cursor-not-allowed disabled:hover:bg-emerald-400"
            >
              Pay €{totalPrice.toFixed(2)}
            </button>
          </div>
        )}
      </div>
    </div>
  );
};
