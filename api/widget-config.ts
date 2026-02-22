import type { VercelRequest, VercelResponse } from '@vercel/node';
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://hnivuisqktlrusyqywaz.supabase.co',
  process.env.SUPABASE_SERVICE_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhuaXZ1aXNxa3RscnVzeXF5d2F6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MzE3MTY3OCwiZXhwIjoyMDc4NzQ3Njc4fQ.gGLIYOJgNvm_LnsOm87LMCMAd0qgoJt1owpDY-DrjNw',
);

export default async function handler(req: VercelRequest, res: VercelResponse) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  if (req.method === 'OPTIONS') return res.status(200).end();

  const { hotel } = req.query;

  if (!hotel || typeof hotel !== 'string') {
    return res.status(400).json({ error: 'hotel query parameter is required' });
  }

  try {
    const { data, error } = await supabase
      .from('hotel_config')
      .select('*')
      .eq('id', hotel)
      .single();

    if (error || !data) {
      return res.status(404).json({ error: 'Hotel not found' });
    }

    return res.status(200).json({
      id: data.id,
      name: data.name,
      logoUrl: data.logo_url,
      tagline: data.tagline,
      location: data.location,
      latitude: data.latitude,
      longitude: data.longitude,
      theme: data.theme,
      features: data.features,
      welcomeTitle: data.welcome_title,
    });
  } catch (err) {
    console.error('[widget-config]', err);
    return res.status(500).json({ error: 'Internal server error' });
  }
}
