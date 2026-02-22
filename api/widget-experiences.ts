import type { VercelRequest, VercelResponse } from '@vercel/node';
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://hnivuisqktlrusyqywaz.supabase.co',
  process.env.SUPABASE_SERVICE_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhuaXZ1aXNxa3RscnVzeXF5d2F6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MzE3MTY3OCwiZXhwIjoyMDc4NzQ3Njc4fQ.gGLIYOJgNvm_LnsOm87LMCMAd0qgoJt1owpDY-DrjNw',
);

export default async function handler(req: VercelRequest, res: VercelResponse) {
  // ── CORS ──
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  if (req.method === 'OPTIONS') return res.status(200).end();

  const { hotel, category, limit } = req.query;

  if (!hotel || typeof hotel !== 'string') {
    return res.status(400).json({ error: 'hotel query parameter is required' });
  }

  try {
    // 1. Hotel config (for branding in the widget)
    const { data: hotelRow } = await supabase
      .from('hotel_config')
      .select('id, name, logo_url, tagline, location, theme, features')
      .eq('id', hotel)
      .single();

    // 2. Experiences
    let query = supabase
      .from('experiences')
      .select('id, title, short_description, description, category, price, currency, rating, location, image_url, images, video_url, duration, highlights, whats_included, languages, cancellation_policy, max_group_size, important_info, value_to_bring, latitude, longitude')
      .eq('is_active', true)
      .not('video_url', 'is', null)
      .order('display_order', { ascending: true, nullsFirst: false });

    if (category && category !== 'all' && typeof category === 'string') {
      query = query.eq('category', category);
    }

    const numLimit = limit ? parseInt(String(limit), 10) : 12;
    query = query.limit(numLimit);

    const { data: experiences } = await query;

    return res.status(200).json({
      hotel: hotelRow
        ? {
            id: hotelRow.id,
            name: hotelRow.name,
            logoUrl: hotelRow.logo_url,
            tagline: hotelRow.tagline,
            location: hotelRow.location,
            theme: hotelRow.theme,
          }
        : null,
      experiences: experiences || [],
    });
  } catch (err) {
    console.error('[widget-experiences]', err);
    return res.status(500).json({ error: 'Internal server error' });
  }
}
