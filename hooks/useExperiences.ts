import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { Experience, ExperienceDisplay } from '../types';

// Map database experience to display format
export function mapExperienceToDisplay(exp: Experience): ExperienceDisplay {
  const imageUrl = exp.images && exp.images.length > 0 ? exp.images[0] : exp.image_url;

  return {
    id: exp.id,
    title: exp.title,
    description: exp.short_description || exp.description,
    fullDescription: exp.description,
    category: exp.category,
    price: exp.price,
    currency: exp.currency,
    rating: exp.rating,
    location: exp.location,
    imageUrl: imageUrl,
    images: exp.images && exp.images.length > 0 ? exp.images : undefined,
    videoUrl: exp.video_url,
    duration: exp.duration,
    reviews: exp.review_count || 0,
    address: exp.address,
    highlights: exp.highlights,
    included: exp.included,
    whatsIncluded: exp.included,
    maxGroupSize: exp.max_group_size,
    cancellationPolicy: exp.cancellation_policy,
    importantInfo: exp.important_info,
    languages: exp.languages,
    valueToBring: exp.what_to_bring,
    latitude: exp.latitude,
    longitude: exp.longitude,
    affiliateUrl: exp.affiliate_url,
    affiliateProvider: exp.affiliate_provider,
    userReviews: exp.user_reviews || [],
  };
}

/**
 * Resolve which hotel to show experiences for.
 * Priority:
 *  1. VITE_HOTEL_ID env var (set at build time per Vercel deployment)
 *  2. Subdomain of the current page (e.g. lisb-onhostel.boredtourist.com)
 *  3. null → fall back to global experiences table
 */
function resolveHotelId(): string | null {
  // 1. Build-time env var
  const envId =
    typeof import.meta !== 'undefined'
      ? (import.meta as any).env?.VITE_HOTEL_ID
      : undefined;
  if (envId && envId !== 'vila-gale') return envId as string;

  // 2. Subdomain detection (works for any *.boredtourist.com URL)
  if (typeof window !== 'undefined') {
    const hostname = window.location.hostname; // e.g. "lisb-onhostel.boredtourist.com"
    const parts = hostname.split('.');
    // If there are 3+ parts and the subdomain is not "www" or "app"
    if (parts.length >= 3 && parts[0] !== 'www' && parts[0] !== 'app') {
      return parts[0]; // e.g. "lisb-onhostel"
    }
  }

  return null;
}

export function useExperiences() {
  const [experiences, setExperiences] = useState<ExperienceDisplay[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    async function fetchExperiences() {
      try {
        setLoading(true);

        const hotelId = resolveHotelId();

        if (hotelId) {
          // ── Hotel-scoped fetch ──────────────────────────────────────
          // Read hotel_experiences to get per-hotel is_active + display_order
          // then join with the full experiences data
          const { data: hotelRows, error: heError } = await supabase
            .from('hotel_experiences')
            .select('experience_id, display_order, is_active, experiences(*)')
            .eq('hotel_id', hotelId)
            .eq('is_active', true)
            .order('display_order', { ascending: true, nullsFirst: false });

          if (heError) throw heError;

          if (hotelRows && hotelRows.length > 0) {
            const mapped = (hotelRows as any[])
              .filter((row) => row.experiences)
              .map((row) => mapExperienceToDisplay(row.experiences as Experience));
            setExperiences(mapped);
            return;
          }

          // Hotel has no catalog rows yet — fall through to global fetch
          console.info(`[useExperiences] No hotel_experiences rows for "${hotelId}", falling back to global list`);
        }

        // ── Global fallback ─────────────────────────────────────────
        const { data, error: expError } = await supabase
          .from('experiences')
          .select('*')
          .eq('is_active', true)
          .order('display_order', { ascending: true, nullsFirst: false });

        if (expError) throw expError;

        setExperiences((data || []).map(mapExperienceToDisplay));
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Failed to fetch experiences');
        console.error('Error fetching experiences:', err);
      } finally {
        setLoading(false);
      }
    }

    fetchExperiences();
  }, []);

  return { experiences, loading, error };
}

export function useCategories() {
  const categories = [
    { id: 'all', label: 'All', icon: '��' },
    { id: 'Outdoors', label: 'Outdoors', icon: '🏞️' },
    { id: 'Sports', label: 'Sports', icon: '⚽' },
    { id: 'Culture Dive', label: 'Culture Dive', icon: '🎭' },
    { id: 'Local Cooking', label: 'Local Cooking', icon: '🍳' },
    { id: 'Time Stories', label: 'Time Stories', icon: '⏳' },
    { id: 'Micro Adventures', label: 'Micro Adventures', icon: '🎒' },
    { id: '_divider', label: '', icon: '' },
    { id: 'Spa & Wellness', label: 'Spa', icon: '🧖' },
    { id: 'Rentals', label: 'Rentals', icon: '🚲' },
    { id: 'Packages', label: 'Packages', icon: '🎁' },
  ];

  return categories;
}
