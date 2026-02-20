import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { Experience, ExperienceDisplay } from '../types';

// Map database experience to display format
export function mapExperienceToDisplay(exp: Experience): ExperienceDisplay {
  // Use first image from images array if available, fallback to image_url
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
    reviews: 0, // You might want to fetch this from reviews table
    address: exp.address,
    highlights: exp.highlights,
    included: exp.included,
    whatsIncluded: exp.whats_included,
    maxGroupSize: exp.max_group_size,
    cancellationPolicy: exp.cancellation_policy,
    importantInfo: exp.important_info,
    languages: exp.languages,
    valueToBring: exp.value_to_bring,
    latitude: exp.latitude,
    longitude: exp.longitude,
  };
}

export function useExperiences() {
  const [experiences, setExperiences] = useState<ExperienceDisplay[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    async function fetchExperiences() {
      try {
        setLoading(true);
        const { data, error } = await supabase
          .from('experiences')
          .select('*')
          .eq('is_active', true)
          .order('display_order', { ascending: true, nullsFirst: false });

        if (error) throw error;

        const mappedData = (data || []).map(mapExperienceToDisplay);
        setExperiences(mappedData);
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
  // Official Bored Tourist categories
  const categories = [
    { id: 'all', label: 'All', icon: '🔥' },
    { id: 'Outdoors', label: 'Outdoors', icon: '🏞️' },
    { id: 'Sports', label: 'Sports', icon: '⚽' },
    { id: 'Culture Dive', label: 'Culture Dive', icon: '🎭' },
    { id: 'Local Cooking', label: 'Local Cooking', icon: '🍳' },
    { id: 'Time Stories', label: 'Time Stories', icon: '⏳' },
    { id: 'Micro Adventures', label: 'Micro Adventures', icon: '🎒' },
  ];

  return categories;
}
