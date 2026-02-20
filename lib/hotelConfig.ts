// ─────────────────────────────────────────────────────────────────────────────
// White-label Hotel Configuration
// Now reads from Supabase (managed via Dashboard) with local fallback
// ─────────────────────────────────────────────────────────────────────────────

import { supabase } from './supabase';

export interface HotelTheme {
  /** Main brand colour — used for primary buttons, active states, accents */
  primaryColor: string;
  /** Text colour when rendered on primaryColor background */
  primaryTextColor: string;
  /** Secondary accent — used for highlights, stars, badges */
  accentColor: string;
  /** Page background colour */
  backgroundColor: string;
  /** Card / panel surface colour */
  surfaceColor: string;
  /** Google Font name for headings (e.g. 'Playfair Display') */
  fontHeading: string;
  /** Google Font name for body text (e.g. 'Lato') */
  fontBody: string;
}

export interface StaffMember {
  name: string;
  role: string;
  avatar: string;
  bio: string;
  preferredCategories: string[];
}

export interface ActivityPreferences {
  /** Categories to surface first / prioritise */
  preferredCategories?: string[];
  /** Price range filter for curated views */
  priceRange?: { min?: number; max?: number };
  /** Overall vibe — used to tailor AI recommendations */
  style: 'adventure' | 'cultural' | 'luxury' | 'family' | 'mixed';
}

export interface SiteFeatures {
  showActivities: boolean;
  showSpa: boolean;
  showDining: boolean;
  showTransfers: boolean;
  showRentals: boolean;
  showReviews: boolean;
  showHotelPicks: boolean;
  showPreArrival: boolean;
  enableInstantBooking: boolean;
}

// AI Bot configuration (managed from Dashboard)
export interface BotConfig {
  botName: string;
  personality: 'premium' | 'casual' | 'friendly' | 'professional' | 'adventurous';
  language: 'auto' | 'pt' | 'en' | 'es' | 'fr' | 'de' | 'it';
  toneDescription: string;
  customInstructions: string;
  restrictions: string[];
  knowledgeEntries: { id: string; title: string; type: string; content: string }[];
  salesAggressiveness: 'soft' | 'balanced' | 'aggressive';
  maxResponseLength: 'short' | 'medium' | 'long';
}

export interface HotelConfig {
  id: string;
  name: string;
  /** Full URL to hotel logo (SVG or PNG, displayed in header) */
  logoUrl?: string;
  tagline: string;
  location: string;
  /** Avatar shown on the mobile chat FAB and concierge section */
  conciergeAvatarUrl?: string;
  /** Hotel GPS coordinates — used to calculate distance to each activity */
  latitude?: number;
  longitude?: number;
  /** Price in EUR for the hotel transfer add-on (default 20) */
  transportationPrice?: number;
  theme: HotelTheme;
  staffMembers: StaffMember[];
  activityPreferences: ActivityPreferences;
  features: SiteFeatures;
  // Welcome / concierge content (managed from Dashboard)
  welcomeTitle?: string;
  welcomeSubtitle?: string;
  welcomeDescription?: string;
  quickSuggestions?: { emoji: string; label: string; prompt: string }[];
  botConfig?: BotConfig;
}

// ─────────────────────────────────────────────────────────────────────────────
// LOCAL FALLBACK Configs (kept as safety net)
// ─────────────────────────────────────────────────────────────────────────────

const DEFAULT_FEATURES: SiteFeatures = {
  showActivities: true,
  showSpa: true,
  showDining: true,
  showTransfers: true,
  showRentals: true,
  showReviews: true,
  showHotelPicks: true,
  showPreArrival: true,
  enableInstantBooking: true,
};

const VILA_GALE: HotelConfig = {
  id: 'vila-gale',
  name: 'Vila Galé',
  tagline: 'DISCOVER',
  location: 'Lisbon & Surroundings',
  latitude: 38.7170,
  longitude: -9.1383,
  transportationPrice: 20,
  conciergeAvatarUrl:
    'https://storage.googleapis.com/bored_tourist_media/images/473801429_1013077440848496_8087265659102202312_n.jpg',
  theme: {
    primaryColor: '#0f172a',
    primaryTextColor: '#ffffff',
    accentColor: '#10b981',
    backgroundColor: '#FAFAF8',
    surfaceColor: '#ffffff',
    fontHeading: 'Inter',
    fontBody: 'Inter',
  },
  staffMembers: [
    {
      name: 'Clara',
      role: 'Concierge',
      avatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&h=200&fit=crop',
      bio: "Lisbon local for 15 years. I love showing guests the city's hidden gems!",
      preferredCategories: ['Outdoors', 'Sports'],
    },
    {
      name: 'Joel',
      role: 'Front Desk Manager',
      avatar: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=200&h=200&fit=crop',
      bio: 'Born and raised in Lisbon. I know every corner of this beautiful city!',
      preferredCategories: ['Culture Dive', 'Time Stories'],
    },
    {
      name: 'Gale',
      role: 'Guest Relations',
      avatar: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&h=200&fit=crop',
      bio: 'Passionate about Portuguese culture and helping guests create unforgettable memories!',
      preferredCategories: ['Night Explorer', 'Mind & Body'],
    },
  ],
  activityPreferences: {
    style: 'mixed',
  },
  features: DEFAULT_FEATURES,
};

const PESTANA: HotelConfig = {
  id: 'pestana',
  name: 'Pestana Palace',
  tagline: 'EXPLORE',
  location: 'Lisboa',
  latitude: 38.7072,
  longitude: -9.1858,
  transportationPrice: 25,
  theme: {
    primaryColor: '#1a1a2e',
    primaryTextColor: '#ffffff',
    accentColor: '#c9a84c',
    backgroundColor: '#F9F7F4',
    surfaceColor: '#ffffff',
    fontHeading: 'Playfair Display',
    fontBody: 'Lato',
  },
  staffMembers: [
    {
      name: 'Ana',
      role: 'Head Concierge',
      avatar: 'https://images.unsplash.com/photo-1580489944761-15a19d654956?w=200&h=200&fit=crop',
      bio: 'With 20 years in luxury hospitality, I know exactly what makes a visit unforgettable.',
      preferredCategories: ['Culture Dive', 'Time Stories'],
    },
    {
      name: 'Ricardo',
      role: 'Guest Experience',
      avatar: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200&h=200&fit=crop',
      bio: 'A foodie and history buff — I will take you well off the beaten path.',
      preferredCategories: ['Local Cooking', 'Culture Dive'],
    },
  ],
  activityPreferences: {
    preferredCategories: ['Culture Dive', 'Time Stories', 'Local Cooking'],
    priceRange: { min: 50 },
    style: 'luxury',
  },
  features: DEFAULT_FEATURES,
};

const BAIRRO_ALTO: HotelConfig = {
  id: 'bairro-alto',
  name: 'Bairro Alto Hotel',
  tagline: 'EXPERIENCE',
  location: 'Lisboa',
  latitude: 38.7112,
  longitude: -9.1440,
  transportationPrice: 18,
  theme: {
    primaryColor: '#18181b',
    primaryTextColor: '#ffffff',
    accentColor: '#6366f1',
    backgroundColor: '#f4f4f5',
    surfaceColor: '#ffffff',
    fontHeading: 'DM Serif Display',
    fontBody: 'DM Sans',
  },
  staffMembers: [
    {
      name: 'Mariana',
      role: 'Concierge',
      avatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200&h=200&fit=crop',
      bio: 'Bairro Alto is my backyard. Let me show you its secret doors and best tables.',
      preferredCategories: ['Culture Dive', 'Night Explorer'],
    },
    {
      name: 'Tiago',
      role: 'Front of House',
      avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop',
      bio: 'From hidden restaurants to private art studios — I connect guests with the real Lisbon.',
      preferredCategories: ['Local Cooking', 'Micro Adventures'],
    },
  ],
  activityPreferences: {
    preferredCategories: ['Culture Dive', 'Night Explorer', 'Local Cooking'],
    style: 'cultural',
  },
  features: DEFAULT_FEATURES,
};

// ─────────────────────────────────────────────────────────────────────────────

const HOTEL_CONFIGS: Record<string, HotelConfig> = {
  'vila-gale': VILA_GALE,
  pestana: PESTANA,
  'bairro-alto': BAIRRO_ALTO,
};

/**
 * Returns the local (fallback) hotel config.
 * Used when Supabase is unreachable or during initial render.
 */
export function getHotelConfig(): HotelConfig {
  const hotelId =
    (typeof import.meta !== 'undefined' && (import.meta as any).env?.VITE_HOTEL_ID) ||
    'vila-gale';
  return HOTEL_CONFIGS[hotelId] ?? VILA_GALE;
}

/**
 * Fetches the hotel config from Supabase (managed via Dashboard).
 * Returns null if the fetch fails — caller should fall back to getHotelConfig().
 */
export async function fetchHotelConfigFromDB(hotelId?: string): Promise<HotelConfig | null> {
  const id = hotelId ||
    (typeof import.meta !== 'undefined' && (import.meta as any).env?.VITE_HOTEL_ID) ||
    'vila-gale';

  try {
    const { data, error } = await supabase
      .from('hotel_config')
      .select('*')
      .eq('id', id)
      .single();

    if (error || !data) {
      console.warn('[hotelConfig] Supabase fetch failed, using local fallback:', error?.message);
      return null;
    }

    // Map snake_case DB row → camelCase HotelConfig
    return {
      id: data.id,
      name: data.name,
      tagline: data.tagline || '',
      location: data.location || '',
      logoUrl: data.logo_url || undefined,
      conciergeAvatarUrl: data.concierge_avatar_url || undefined,
      latitude: data.latitude ?? undefined,
      longitude: data.longitude ?? undefined,
      transportationPrice: data.transportation_price ?? 20,
      theme: data.theme ?? getHotelConfig().theme,
      staffMembers: data.staff_members ?? [],
      activityPreferences: data.activity_preferences ?? { style: 'mixed' },
      features: data.features ?? DEFAULT_FEATURES,
      welcomeTitle: data.welcome_title || undefined,
      welcomeSubtitle: data.welcome_subtitle || undefined,
      welcomeDescription: data.welcome_description || undefined,
      quickSuggestions: data.quick_suggestions || undefined,
      botConfig: data.bot_config || undefined,
    };
  } catch (err) {
    console.warn('[hotelConfig] Unexpected error fetching from Supabase:', err);
    return null;
  }
}
