import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';

export interface AvailabilitySlot {
  id: number;
  experience_id: string;
  date: string;          // YYYY-MM-DD
  start_time: string;    // HH:MM:SS
  end_time: string;
  max_participants: number;
  booked_participants: number;
  is_available: boolean;
}

export interface SlotGroup {
  label: string;   // e.g. "Thursday, February 19"
  date: string;    // YYYY-MM-DD
  slots: AvailabilitySlot[];
}

export function formatSlotTime(t: string): string {
  const [h, m] = t.split(':').map(Number);
  const ampm = h >= 12 ? 'PM' : 'AM';
  const hour = h % 12 === 0 ? 12 : h % 12;
  return `${hour}:${m.toString().padStart(2, '0')} ${ampm}`;
}

export function dateLabel(dateStr: string): string {
  // Parse without timezone shift
  const [y, mo, d] = dateStr.split('-').map(Number);
  const date = new Date(y, mo - 1, d);

  const today = new Date();
  today.setHours(0, 0, 0, 0);
  const tomorrow = new Date(today);
  tomorrow.setDate(today.getDate() + 1);

  const fmt = (dt: Date) =>
    dt.toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric' });

  if (date.toDateString() === today.toDateString()) return fmt(date);
  if (date.toDateString() === tomorrow.toDateString()) return `Tomorrow, ${date.toLocaleDateString('en-US', { month: 'long', day: 'numeric' })}`;
  return fmt(date);
}

export function useAvailabilitySlots(experienceId: string, daysAhead = 30) {
  const [slotGroups, setSlotGroups] = useState<SlotGroup[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (!experienceId) return;
    fetchSlots();
  }, [experienceId]);

  const fetchSlots = async () => {
    setLoading(true);
    setError(null);
    try {
      const today = new Date();
      today.setHours(0, 0, 0, 0);

      const from = today.toISOString().split('T')[0];
      const toDate = new Date(today);
      toDate.setDate(today.getDate() + daysAhead);
      const to = toDate.toISOString().split('T')[0];

      const { data, error: dbError } = await supabase
        .from('availability_slots')
        .select('*')
        .eq('experience_id', experienceId)
        .gte('date', from)
        .lte('date', to)
        .eq('is_available', true)
        .order('date', { ascending: true })
        .order('start_time', { ascending: true });

      if (dbError) throw dbError;

      const now = new Date();

      // Filter: only slots with available spots and not in the past
      const validSlots: AvailabilitySlot[] = (data || []).filter((slot: AvailabilitySlot) => {
        const spotsLeft = slot.max_participants - slot.booked_participants;
        if (spotsLeft <= 0) return false;

        // Check the slot hasn't already started
        const [y, mo, d] = slot.date.split('-').map(Number);
        const [h, m] = slot.start_time.split(':').map(Number);
        const slotStart = new Date(y, mo - 1, d, h, m, 0);
        return slotStart > now;
      });

      // Group by date
      const map = new Map<string, AvailabilitySlot[]>();
      for (const slot of validSlots) {
        if (!map.has(slot.date)) map.set(slot.date, []);
        map.get(slot.date)!.push(slot);
      }

      const groups: SlotGroup[] = Array.from(map.entries()).map(([date, slots]) => ({
        label: dateLabel(date),
        date,
        slots,
      }));

      setSlotGroups(groups);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load availability');
      setSlotGroups([]);
    }
    setLoading(false);
  };

  const refresh = () => fetchSlots();

  return { slotGroups, loading, error, refresh };
}
