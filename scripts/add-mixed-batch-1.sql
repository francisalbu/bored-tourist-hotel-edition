-- ============================================
-- Batch GYG-5 + Viator-16: Deep Sea Fishing + Amália Exhibition
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Cascais: Deep Sea Fishing Trip (GYG t130923) — display_order 87
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Cascais: Deep Sea Fishing Trip',
  'A deep sea fishing experience departing from Cascais Marina — an unforgettable adventure on the Atlantic. You''ll be welcomed with a drink and snack, then head out to fish for sea bream, red snapper, mackerel, horse mackerel and more. Our experienced crew takes care of everything: top-notch fishing equipment, bait, licenses, fuel and insurance. Whether you''re a seasoned angler or a complete beginner, the crew will guide you throughout.',
  'Experience deep sea fishing from Cascais Marina with an expert crew — catch bream, snapper, mackerel and more on the Atlantic.',
  'Lisbon',
  'Marina de Cascais 46, 2750-642 Cascais, Portugal',
  38.6914537,
  -9.4191094,
  89.0,
  'EUR',
  '4h',
  NULL,
  'Outdoors',
  'https://cdn.getyourguide.com/img/tour/5ee0be366fc6f.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/5ee0be366fc6f.jpeg/145.jpg", "https://cdn.getyourguide.com/img/tour/642410a99bb74.jpeg/145.jpg", "https://cdn.getyourguide.com/img/tour/642410f1bc802.jpeg/145.jpg", "https://cdn.getyourguide.com/img/tour/5d80d496dee57.jpeg/145.jpg", "https://cdn.getyourguide.com/img/tour/5a1839a693a16.jpeg/145.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Lisbon%20Fish/lisbonfish3.mp4',
  '["Discover the beauty of the Cascais bay from the sea", "Fish for multiple species: bream, snapper, mackerel and more", "Expert crew provides all equipment, bait and guidance", "Welcome drink and snacks included", "Keep your catch to cook later!"]'::jsonb,
  '["Boat with experienced crew", "Fishing equipment", "Fishing bait", "Fishing license", "Drinks", "Lunch (full day option)"]'::jsonb,
  '["English", "Portuguese", "French", "German"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  94,
  'Lisbon',
  true,
  87,
  'https://www.getyourguide.com/en-gb/cascais-l100/cascais-deep-sea-fishing-trip-t130923/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 2) Ah Amália Living Experience — Immersive Fado Exhibition (Viator 474880P1) — display_order 88
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Ah Amália Living Experience — Immersive Fado Exhibition',
  'Discover Amália Rodrigues, the Queen of Fado, in a way never seen, heard, or felt before. Spanning 700m² and eight rooms, this immersive biography takes you on a unique sensory journey through her legacy — featuring virtual reality, a life-sized hologram, 360° projection, physical and luminous installations, and stunning sound and visual elements. A surprising dive into time, her work, history, the country, and the city.',
  'An immersive 700m² sensory experience celebrating Amália Rodrigues, the Queen of Fado — VR, holograms, 360° projection and more.',
  'Lisbon',
  'Rua de São Paulo 108, 1200-427 Lisboa, Portugal',
  38.7079,
  -9.1458,
  17.0,
  'EUR',
  '1h',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/30/b1/34.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/30/b1/34.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/30/b1/35.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/30/b1/31.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/30/b1/24.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/30/b1/33.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Ah%20Amalia/ahamaliaexperience.mp4',
  '["Immersive biography of Amália Rodrigues across 8 rooms and 700m²", "Life-sized hologram and virtual reality experience", "360° projection and stunning sound installations", "Cutting-edge technology blending physical and digital storytelling", "Discover the Queen of Fado in her many dimensions"]'::jsonb,
  '["Entrance ticket", "All fees and taxes", "1 hour visit across 8 rooms"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  171,
  'Lisbon',
  true,
  88,
  'https://www.viator.com/en-GB/tours/Lisbon/Entrance-to-the-Biographical-Exhibition-of-Amalia-Rodrigues/d538-474880P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);
