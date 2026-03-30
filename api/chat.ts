import type { VercelRequest, VercelResponse } from '@vercel/node';
import { createClient } from '@supabase/supabase-js';

const SUPABASE_URL = 'https://hnivuisqktlrusyqywaz.supabase.co';
const SUPABASE_KEY =
  process.env.SUPABASE_SERVICE_ROLE_KEY ||
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhuaXZ1aXNxa3RscnVzeXF5d2F6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MzE3MTY3OCwiZXhwIjoyMDc4NzQ3Njc4fQ.gGLIYOJgNvm_LnsOm87LMCMAd0qgoJt1owpDY-DrjNw';

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

/**
 * Resolves the OpenAI API key with a 3-tier fallback:
 *   1. Vercel environment variable (OPENAI_API_KEY / VITE_OPENAI_API_KEY)
 *   2. Supabase hotel_config.openai_api_key for the requesting hotel
 *   3. First hotel_config row that has a key set
 *
 * This means the key can be managed entirely from the Supabase Dashboard
 * (Table editor → hotel_config → openai_api_key column) without ever
 * touching Vercel env vars.
 */
async function resolveOpenAIKey(hotelId?: string): Promise<string | null> {
  // Tier 1 — fast path: env var set in Vercel dashboard
  const envKey = process.env.OPENAI_API_KEY || process.env.VITE_OPENAI_API_KEY;
  if (envKey) return envKey;

  // Tier 2 — Supabase: key stored on this hotel's config row
  if (hotelId) {
    const { data } = await supabase
      .from('hotel_config')
      .select('openai_api_key')
      .eq('id', hotelId)
      .maybeSingle();
    if (data?.openai_api_key) return data.openai_api_key;
  }

  // Tier 3 — Supabase: any hotel_config row that has a key (shared key)
  const { data: fallback } = await supabase
    .from('hotel_config')
    .select('openai_api_key')
    .not('openai_api_key', 'is', null)
    .limit(1)
    .maybeSingle();
  return fallback?.openai_api_key || null;
}

export default async function handler(req: VercelRequest, res: VercelResponse) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const { model, messages, temperature, max_tokens, hotelId } = req.body;
  if (!model || !messages) return res.status(400).json({ error: 'model and messages are required' });

  const apiKey = await resolveOpenAIKey(hotelId);
  if (!apiKey) {
    console.error('[chat] OpenAI key not found in env or Supabase hotel_config');
    return res.status(500).json({ error: 'AI service not configured' });
  }

  try {
    const response = await fetch('https://api.openai.com/v1/chat/completions', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${apiKey}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ model, messages, temperature, max_tokens }),
    });

    const data = await response.json();

    if (!response.ok) {
      console.error('[chat] OpenAI error:', response.status, data?.error?.message);
      return res.status(response.status).json({ error: data.error?.message || 'OpenAI request failed' });
    }

    return res.status(200).json(data);
  } catch (error) {
    console.error('[chat] Unexpected error:', error);
    return res.status(500).json({ error: 'Internal server error' });
  }
}
