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
  /** SmartSeer personalization engine — enabled only for specific hotels */
  smartseerEnabled?: boolean;
  /**
   * Viator campaign ID (mcid) for this hotel — used to track which hotel
   * originated each booking in the Viator affiliate dashboard.
   * Create one per hotel at: https://suppliers.viator.com → Partner tools → Campaigns
   */
  viatorMcid?: string;
}

// ─────────────────────────────────────────────────────────────────────────────
// LOCAL FALLBACK Configs (kept as safety net)
// ─────────────────────────────────────────────────────────────────────────────

const DEFAULT_FEATURES: SiteFeatures = {
  showActivities: true,
  showSpa: true,
  showRentals: true,
  showReviews: true,
  showHotelPicks: true,
  showPreArrival: true,
  enableInstantBooking: true,
};

const VILA_GALE: HotelConfig = {
  id: 'vila-gale',
  name: 'Lisbon Hotel',
  logoUrl: 'https://cdn2.paraty.es/lisbon-hostel/images/c9cfe02d730577d=s300',
  tagline: 'DISCOVER',
  location: 'Lisbon & Surroundings',
  latitude: 38.7170,
  longitude: -9.1383,
  conciergeAvatarUrl:
    'https://cdn2.paraty.es/lisbon-hostel/images/c9cfe02d730577d=s300',
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

const HOMING: HotelConfig = {
  id: 'homing',
  name: 'Homing',
  logoUrl: 'https://pq-media.imgix.net/l/c9bd023aa08d3eb35b1150ce1723a98d.jpg?w=360&h=360&q=80&auto=compress&fit=fill&fill=solid&fill-color=ffffff',
  tagline: 'DISCOVER LISBON',
  location: 'Lisbon & Surroundings',
  latitude: 38.7170,
  longitude: -9.1383,
  conciergeAvatarUrl: 'https://pq-media.imgix.net/l/c9bd023aa08d3eb35b1150ce1723a98d.jpg?w=360&h=360&q=80&auto=compress&fit=fill&fill=solid&fill-color=ffffff',
  theme: {
    primaryColor: '#1a1a1a',
    primaryTextColor: '#ffffff',
    accentColor: '#e8b84b',
    backgroundColor: '#FAFAF8',
    surfaceColor: '#ffffff',
    fontHeading: 'Inter',
    fontBody: 'Inter',
  },
  staffMembers: [
    {
      name: 'Sofia',
      role: 'Concierge',
      avatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&h=200&fit=crop',
      bio: 'Lisbon born and raised. I know the perfect spot for every mood — from hidden tascas to sunrise viewpoints.',
      preferredCategories: ['Local Cooking', 'Culture Dive'],
    },
    {
      name: 'André',
      role: 'Guest Experience',
      avatar: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=200&h=200&fit=crop',
      bio: 'Former surf instructor turned city guide. I will find you the best adventure for your energy level.',
      preferredCategories: ['Micro Adventures', 'Outdoors'],
    },
    {
      name: 'Beatriz',
      role: 'Front Desk',
      avatar: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&h=200&fit=crop',
      bio: 'Culture lover and fado devotee. Ask me anything about Lisbon history, music or where locals actually eat.',
      preferredCategories: ['Night Explorer', 'Time Stories'],
    },
  ],
  activityPreferences: {
    preferredCategories: ['Local Cooking', 'Culture Dive', 'Micro Adventures'],
    style: 'mixed',
  },
  features: { ...DEFAULT_FEATURES, showSpa: false, showRentals: false },
  viatorMcid: 'homing',
};

// ─────────────────────────────────────────────────────────────────────────────
// WOT Hotels Group
// ─────────────────────────────────────────────────────────────────────────────

const WOT_LOGO = 'https://www.portugalventures.pt/wp-content/uploads/2021/01/Portfolio_Wotels_300x300px.png';
const WOT_SIGNATURE_LOGO = WOT_LOGO;

const WOT_SOUL_CAPARICA: HotelConfig = {
  id: 'wot-soul-costa-da-caparica',
  name: 'WOT Soul Costa da Caparica',
  logoUrl: WOT_LOGO,
  conciergeAvatarUrl: WOT_LOGO,
  tagline: 'SURF & SOUL',
  location: 'Costa da Caparica',
  latitude: 38.6411,
  longitude: -9.2353,
  theme: {
    primaryColor: '#1a1a1a',
    primaryTextColor: '#ffffff',
    accentColor: '#c8873a',
    backgroundColor: '#FAFAF8',
    surfaceColor: '#ffffff',
    fontHeading: 'Inter',
    fontBody: 'Inter',
  },
  staffMembers: [
    {
      name: 'João',
      role: 'Surf Concierge',
      avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop',
      bio: 'Grew up on these waves. I know every break, trail and hidden beach along the Caparica coast.',
      preferredCategories: ['Outdoors', 'Sports', 'Micro Adventures'],
    },
    {
      name: 'Rita',
      role: 'Guest Experience',
      avatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200&h=200&fit=crop',
      bio: 'Local food lover and night owl. Ask me where the locals actually eat — and where the night goes.',
      preferredCategories: ['Local Cooking', 'Night Explorer'],
    },
  ],
  activityPreferences: {
    preferredCategories: ['Outdoors', 'Sports', 'Micro Adventures'],
    style: 'adventure',
  },
  features: { ...DEFAULT_FEATURES, showSpa: false },
  viatorMcid: 'wot-caparica',
};

const WOT_SOUL_LAGOS: HotelConfig = {
  id: 'wot-soul-lagos-montemar',
  name: 'WOT Soul Lagos Montemar',
  logoUrl: WOT_LOGO,
  conciergeAvatarUrl: WOT_LOGO,
  tagline: 'ALGARVE YOUR WAY',
  location: 'Lagos, Algarve',
  latitude: 37.1090,
  longitude: -8.6598,
  theme: {
    primaryColor: '#1a1a1a',
    primaryTextColor: '#ffffff',
    accentColor: '#c8873a',
    backgroundColor: '#FAFAF8',
    surfaceColor: '#ffffff',
    fontHeading: 'Inter',
    fontBody: 'Inter',
  },
  staffMembers: [
    {
      name: 'Filipa',
      role: 'Concierge',
      avatar: 'https://images.unsplash.com/photo-1580489944761-15a19d654956?w=200&h=200&fit=crop',
      bio: 'Lagos born, Algarve proud. From hidden grottos to the best seafood spots — I have you covered.',
      preferredCategories: ['Outdoors', 'Sports'],
    },
    {
      name: 'Nuno',
      role: 'Activities Manager',
      avatar: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200&h=200&fit=crop',
      bio: 'Kayaking, coasteering, cooking classes — I will find the perfect adventure for your pace.',
      preferredCategories: ['Micro Adventures', 'Local Cooking'],
    },
  ],
  activityPreferences: {
    preferredCategories: ['Outdoors', 'Sports', 'Local Cooking'],
    style: 'adventure',
  },
  features: { ...DEFAULT_FEATURES, showSpa: false },
  viatorMcid: 'wot-lagos',
};

const WOT_SOUL_PORTO: HotelConfig = {
  id: 'wot-soul-porto',
  name: 'WOT Soul Porto',
  logoUrl: WOT_LOGO,
  conciergeAvatarUrl: WOT_LOGO,
  tagline: 'SOUL OF THE CITY',
  location: 'Porto',
  latitude: 41.1579,
  longitude: -8.6291,
  theme: {
    primaryColor: '#1a1a1a',
    primaryTextColor: '#ffffff',
    accentColor: '#c8873a',
    backgroundColor: '#FAFAF8',
    surfaceColor: '#ffffff',
    fontHeading: 'Inter',
    fontBody: 'Inter',
  },
  staffMembers: [
    {
      name: 'Beatriz',
      role: 'Concierge',
      avatar: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&h=200&fit=crop',
      bio: 'Porto is my city. I will take you from the best wine cellars to rooftop bars and secret viewpoints.',
      preferredCategories: ['Culture Dive', 'Night Explorer'],
    },
    {
      name: 'Diogo',
      role: 'Guest Relations',
      avatar: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=200&h=200&fit=crop',
      bio: 'History buff and foodie. From traditional tascas to contemporary kitchens — Porto has it all.',
      preferredCategories: ['Local Cooking', 'Time Stories'],
    },
  ],
  activityPreferences: {
    preferredCategories: ['Culture Dive', 'Local Cooking', 'Night Explorer'],
    style: 'cultural',
  },
  features: DEFAULT_FEATURES,
  viatorMcid: 'wot-porto',
};

const ALDEIA_DA_PEDRALVA: HotelConfig = {
  id: 'aldeiadapedralva',
  name: 'Aldeia da Pedralva',
  logoUrl: WOT_SIGNATURE_LOGO,
  conciergeAvatarUrl: WOT_SIGNATURE_LOGO,
  tagline: 'THE OTHER ALGARVE',
  location: 'Vila do Bispo, Algarve',
  latitude: 37.0583,
  longitude: -8.8097,
  theme: {
    primaryColor: '#2d2417',
    primaryTextColor: '#ffffff',
    accentColor: '#a0784a',
    backgroundColor: '#FAF8F5',
    surfaceColor: '#ffffff',
    fontHeading: 'Inter',
    fontBody: 'Inter',
  },
  staffMembers: [
    {
      name: 'Miguel',
      role: 'Nature Guide',
      avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop',
      bio: 'I know every trail in Costa Vicentina. MTB, hiking, surfing — the wild coast is my playground.',
      preferredCategories: ['Micro Adventures', 'Outdoors'],
    },
    {
      name: 'Catarina',
      role: 'Concierge',
      avatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&h=200&fit=crop',
      bio: 'Village life is the best life. Local recipes, farmers markets and hidden beaches — ask me anything.',
      preferredCategories: ['Local Cooking', 'Time Stories'],
    },
  ],
  activityPreferences: {
    preferredCategories: ['Micro Adventures', 'Outdoors', 'Local Cooking'],
    style: 'adventure',
  },
  features: { ...DEFAULT_FEATURES, showSpa: false, showRentals: false },
  viatorMcid: 'pedralva',
};

const HORTA_DA_MOURA: HotelConfig = {
  id: 'hortadamoura',
  name: 'Horta da Moura',
  logoUrl: WOT_SIGNATURE_LOGO,
  conciergeAvatarUrl: WOT_SIGNATURE_LOGO,
  tagline: 'SILENCE & SOUL',
  location: 'Monsaraz, Alentejo',
  latitude: 38.4422,
  longitude: -7.3758,
  theme: {
    primaryColor: '#2d2417',
    primaryTextColor: '#ffffff',
    accentColor: '#a0784a',
    backgroundColor: '#FAF8F5',
    surfaceColor: '#ffffff',
    fontHeading: 'Inter',
    fontBody: 'Inter',
  },
  staffMembers: [
    {
      name: 'Rui',
      role: 'Hotel Manager',
      avatar: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200&h=200&fit=crop',
      bio: 'Alentejo is a state of mind. Boat trips on Alqueva, olive grove walks, stargazing — I will plan it all.',
      preferredCategories: ['Micro Adventures', 'Outdoors'],
    },
    {
      name: 'Inês',
      role: 'Concierge',
      avatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200&h=200&fit=crop',
      bio: 'Food and history are my passions. Monsaraz, Évora, local wineries — there is so much to discover here.',
      preferredCategories: ['Local Cooking', 'Time Stories'],
    },
  ],
  activityPreferences: {
    preferredCategories: ['Micro Adventures', 'Local Cooking', 'Time Stories'],
    style: 'cultural',
  },
  features: { ...DEFAULT_FEATURES, showSpa: false, showRentals: false },
  viatorMcid: 'horta-moura',
};

// ─────────────────────────────────────────────────────────────────────────────

const HOTEL_CONFIGS: Record<string, HotelConfig> = {
  'vila-gale': VILA_GALE,
  pestana: PESTANA,
  'bairro-alto': BAIRRO_ALTO,
  homing: HOMING,
  // WOT Hotels group
  'wot-soul-costa-da-caparica': WOT_SOUL_CAPARICA,
  'wot-soul-lagos-montemar': WOT_SOUL_LAGOS,
  'wot-soul-porto': WOT_SOUL_PORTO,
  aldeiadapedralva: ALDEIA_DA_PEDRALVA,
  hortadamoura: HORTA_DA_MOURA,
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
  try {
    let id = hotelId ||
      (typeof import.meta !== 'undefined' ? (import.meta as any).env?.VITE_HOTEL_ID : undefined);

    // If no explicit ID, resolve via subdomain → look up hotel_config.subdomain
    if (!id || id === 'vila-gale') {
      if (typeof window !== 'undefined') {
        const parts = window.location.hostname.split('.');
        if (parts.length >= 3 && parts[0] !== 'www' && parts[0] !== 'app') {
          const subdomain = parts[0];
          const { data: hRow } = await supabase
            .from('hotel_config')
            .select('id')
            .eq('subdomain', subdomain)
            .single();
          if (hRow?.id) id = hRow.id as string;
        }
      }
    }

    if (!id) id = 'vila-gale';

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
      theme: data.theme ?? getHotelConfig().theme,
      staffMembers: (data.staff_members && data.staff_members.length > 0) ? data.staff_members : getHotelConfig().staffMembers,
      activityPreferences: data.activity_preferences ?? { style: 'mixed' },
      features: data.features ?? DEFAULT_FEATURES,
      welcomeTitle: data.welcome_title || undefined,
      welcomeSubtitle: data.welcome_subtitle || undefined,
      welcomeDescription: data.welcome_description || undefined,
      quickSuggestions: data.quick_suggestions || undefined,
      botConfig: data.bot_config || undefined,
      smartseerEnabled: data.smartseer_enabled ?? false,
    };
  } catch (err) {
    console.warn('[hotelConfig] Unexpected error fetching from Supabase:', err);
    return null;
  }
}
