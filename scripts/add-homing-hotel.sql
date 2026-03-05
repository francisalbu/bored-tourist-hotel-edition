-- ============================================
-- Add Homing hotel config
-- Domain: homing.boredtourist.com
-- Run in: Supabase Dashboard → SQL Editor
-- ============================================

INSERT INTO hotel_config (
  id,
  name,
  subdomain,
  tagline,
  location,
  logo_url,
  concierge_avatar_url,
  latitude,
  longitude,
  theme,
  staff_members,
  activity_preferences,
  features,
  welcome_title,
  welcome_subtitle,
  welcome_description,
  quick_suggestions
) VALUES (
  'homing',
  'Homing',
  'homing',
  'DISCOVER LISBON',
  'Lisbon & Surroundings',
  'https://pq-media.imgix.net/l/c9bd023aa08d3eb35b1150ce1723a98d.jpg?w=360&h=360&q=80&auto=compress&fit=fill&fill=solid&fill-color=ffffff',
  'https://pq-media.imgix.net/l/c9bd023aa08d3eb35b1150ce1723a98d.jpg?w=360&h=360&q=80&auto=compress&fit=fill&fill=solid&fill-color=ffffff',
  38.7170,
  -9.1383,
  '{
    "primaryColor": "#1a1a1a",
    "primaryTextColor": "#ffffff",
    "accentColor": "#e8b84b",
    "backgroundColor": "#FAFAF8",
    "surfaceColor": "#ffffff",
    "fontHeading": "Inter",
    "fontBody": "Inter"
  }'::jsonb,
  '[
    {
      "name": "Sofia",
      "role": "Concierge",
      "avatar": "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&h=200&fit=crop",
      "bio": "Lisbon born and raised. I know the perfect spot for every mood — from hidden tascas to sunrise viewpoints.",
      "preferredCategories": ["Local Cooking", "Culture Dive"]
    },
    {
      "name": "André",
      "role": "Guest Experience",
      "avatar": "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=200&h=200&fit=crop",
      "bio": "Former surf instructor turned city guide. I will find you the best adventure for your energy level.",
      "preferredCategories": ["Micro Adventures", "Outdoors"]
    },
    {
      "name": "Beatriz",
      "role": "Front Desk",
      "avatar": "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&h=200&fit=crop",
      "bio": "Culture lover and fado devotee. Ask me anything about Lisbon history, music or where locals actually eat.",
      "preferredCategories": ["Night Explorer", "Time Stories"]
    }
  ]'::jsonb,
  '{
    "style": "mixed",
    "preferredCategories": ["Local Cooking", "Culture Dive", "Micro Adventures"]
  }'::jsonb,
  '{
    "showActivities": true,
    "showSpa": false,
    "showRentals": false,
    "showReviews": true,
    "showHotelPicks": true,
    "showPreArrival": true,
    "enableInstantBooking": true
  }'::jsonb,
  'Welcome to Homing',
  'Your Lisbon base camp',
  'We are here to make sure you experience the best of Lisbon — from hidden neighbourhood gems to iconic landmarks. Ask us anything.',
  '[
    {"emoji": "🍽️", "label": "Where to eat", "prompt": "Where should we eat tonight?"},
    {"emoji": "🌊", "label": "Beach & water", "prompt": "What are the best beach or water activities near Lisbon?"},
    {"emoji": "🏛️", "label": "Culture & history", "prompt": "What are the best cultural experiences in Lisbon?"},
    {"emoji": "🌙", "label": "Nightlife", "prompt": "What is there to do at night in Lisbon?"}
  ]'::jsonb
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  subdomain = EXCLUDED.subdomain,
  tagline = EXCLUDED.tagline,
  location = EXCLUDED.location,
  logo_url = EXCLUDED.logo_url,
  concierge_avatar_url = EXCLUDED.concierge_avatar_url,
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  theme = EXCLUDED.theme,
  staff_members = EXCLUDED.staff_members,
  activity_preferences = EXCLUDED.activity_preferences,
  features = EXCLUDED.features,
  welcome_title = EXCLUDED.welcome_title,
  welcome_subtitle = EXCLUDED.welcome_subtitle,
  welcome_description = EXCLUDED.welcome_description,
  quick_suggestions = EXCLUDED.quick_suggestions;
