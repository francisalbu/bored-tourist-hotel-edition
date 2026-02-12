const GOOGLE_PLACES_API_KEY = 'AIzaSyBV_G5pAMs5luD4JADlUEq91nN1W6ka7OA';

export interface PlaceDetails {
  name: string;
  formatted_address: string;
  rating: number;
  user_ratings_total: number;
  photos: Array<{
    photo_reference: string;
    height: number;
    width: number;
  }>;
  geometry: {
    location: {
      lat: number;
      lng: number;
    };
  };
  opening_hours?: {
    open_now: boolean;
    weekday_text: string[];
  };
  formatted_phone_number?: string;
  website?: string;
}

export async function getPlaceDetails(placeId: string): Promise<PlaceDetails | null> {
  try {
    // Use our API proxy to avoid CORS issues
    const response = await fetch(`/api/places?placeId=${placeId}`);
    
    if (!response.ok) {
      console.error('API error:', response.status);
      return null;
    }
    
    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Failed to fetch place details:', error);
    return null;
  }
}

export async function searchPlaceByName(name: string, location: string = 'Lisbon'): Promise<PlaceDetails | null> {
  try {
    const query = `${name}, ${location}`;
    const response = await fetch(`/api/places-search?query=${encodeURIComponent(query)}`);
    
    if (!response.ok) {
      return null;
    }
    
    const result = await response.json();
    
    if (result.place_id) {
      // Now fetch full details
      return await getPlaceDetails(result.place_id);
    }
    
    return null;
  } catch (error) {
    console.error('Failed to search place:', error);
    return null;
  }
}

export function getPhotoUrl(photoReference: string, maxWidth: number = 800): string {
  return `https://maps.googleapis.com/maps/api/place/photo?maxwidth=${maxWidth}&photo_reference=${photoReference}&key=${GOOGLE_PLACES_API_KEY}`;
}

export function getGoogleMapsUrl(lat: number, lng: number, placeName: string): string {
  return `https://www.google.com/maps/search/?api=1&query=${lat},${lng}&query_place_id=${encodeURIComponent(placeName)}`;
}

// Cache for place details to avoid excessive API calls
const placeCache = new Map<string, PlaceDetails>();

export async function getCachedPlaceDetails(placeId: string): Promise<PlaceDetails | null> {
  if (placeCache.has(placeId)) {
    return placeCache.get(placeId)!;
  }
  
  const details = await getPlaceDetails(placeId);
  if (details) {
    placeCache.set(placeId, details);
  }
  
  return details;
}
