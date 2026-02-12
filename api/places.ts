import type { VercelRequest, VercelResponse } from '@vercel/node';

const GOOGLE_PLACES_API_KEY = 'AIzaSyBV_G5pAMs5luD4JADlUEq91nN1W6ka7OA';

export default async function handler(
  req: VercelRequest,
  res: VercelResponse,
) {
  // Enable CORS
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  const { placeId } = req.query;

  if (!placeId || typeof placeId !== 'string') {
    return res.status(400).json({ error: 'Place ID is required' });
  }

  try {
    const response = await fetch(
      `https://maps.googleapis.com/maps/api/place/details/json?place_id=${placeId}&fields=name,formatted_address,rating,user_ratings_total,photos,geometry,opening_hours,formatted_phone_number,website&key=${GOOGLE_PLACES_API_KEY}`
    );

    const data = await response.json();

    if (data.status === 'OK' && data.result) {
      return res.status(200).json(data.result);
    }

    return res.status(404).json({ error: 'Place not found', status: data.status });
  } catch (error) {
    console.error('Places API error:', error);
    return res.status(500).json({ error: 'Failed to fetch place details' });
  }
}
