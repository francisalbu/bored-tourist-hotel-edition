// Database types matching Supabase schema
export interface Experience {
  id: string;
  title: string;
  description: string;
  short_description?: string;
  category: string;
  price: number;
  currency: string;
  rating: number;
  location: string;
  address: string;
  image_url: string;
  images?: string[]; // Array of image URLs from Google Cloud Storage
  video_url?: string;
  duration: string;
  latitude?: number;
  longitude?: number;
  distance?: number;
  max_group_size?: number;
  provider_logo?: string;
  highlights?: string[];
  included?: boolean;
  whats_included?: string[];
  value_to_bring?: string[];
  languages?: string[];
  cancellation_policy?: string;
  important_info?: string;
  available_today?: boolean;
  is_active?: boolean;
  created_at?: string;
  updated_at?: string;
  time_points?: string;
  city?: string;
}

// User Memory types
export interface UserMemory {
  id: string;
  user_id: string;
  name?: string;
  relationship_status?: string;
  interests?: string[];
  summary?: string;
  memories: string[];
  conversation_count: number;
  last_interaction?: string;
  created_at: string;
  updated_at: string;
}

// Event Card Display type
export interface EventDisplay {
  id: string;
  name: string;
  date: string;
  venue: string;
  category: string;
  imageUrl: string;
  link: string;
  description?: string;
}

export interface UserMemoryDisplay {
  id: string;
  name?: string;
  relationshipStatus?: string;
  interests?: string[];
  summary?: string;
  memories: string[];
  conversationCount: number;
  lastInteraction?: string;
}

// For frontend display (mapped from DB)
export interface ExperienceDisplay {
  id: string;
  title: string;
  description: string;
  fullDescription?: string;
  category: string;
  price: number;
  currency: string;
  rating: number;
  location: string;
  imageUrl: string;
  images?: string[];
  videoUrl?: string;
  duration: string;
  reviews: number;
  address?: string;
  highlights?: string[];
  included?: boolean;
  whatsIncluded?: string[];
  maxGroupSize?: number;
  cancellationPolicy?: string;
  importantInfo?: string;
  languages?: string[];
  valueToBring?: string[];
  latitude?: number;
  longitude?: number;
}

export interface Category {
  id: string;
  label: string;
  icon: string;
}
