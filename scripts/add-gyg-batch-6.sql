-- ============================================
-- Batch GYG-6: BORK Guided Kayak Tour on Lisbon Coast
-- Partner ID: BONZK5E
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Lisbon: Guided Coast Kayak Tour (t64235)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Guided Coast Kayak Tour',
  'Explore the beautiful Lisbon coastline by kayak! Paddle from Oeiras Marina past stunning beaches like Carcavelos, marvel at the historic Fort of São Julião and the castles of Santo Amaro and São João das Maias from the water. Discover the sheltered Fontainhas beach and cool off with a swim in crystal-clear waters. No experience needed — certified guides from the Portuguese Canoeing & Kayak Federation will teach you the basics and keep you safe.',
  'Explore the Lisbon coast by kayak — paddle past beaches, historic forts and castles with a certified guide. No experience needed.',
  'Lisbon',
  'Marina de Oeiras, Estrada Marginal, Praia da Torre, 2780-267 Oeiras, Portugal',
  38.6773439,
  -9.3176727,
  32.0,
  'EUR',
  '2h',
  NULL,
  'Outdoors',
  'https://cdn.getyourguide.com/img/tour/64bfb32b796ea.png/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/64bfb32b796ea.png/145.jpg", "https://cdn.getyourguide.com/img/tour/64bfb36022657.png/145.jpg", "https://cdn.getyourguide.com/img/tour/64bfb487f3223.png/145.jpg", "https://cdn.getyourguide.com/img/tour/64bfb417b3057.png/145.jpg", "https://cdn.getyourguide.com/img/tour/64bfb07675966.jpeg/145.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Bork%20You/borkvideo.mp4',
  '["Explore the Lisbon coast by kayak", "Discover beautiful beaches and swim in crystal-clear waters", "Marvel at historic castles and the Fort of São Julião from the water", "Fun guided tour suitable for families and friends", "No experience needed — certified guides teach you the basics"]'::jsonb,
  '["Kayak, paddle, life jacket and wetsuit", "Snack", "Certified guide"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  133,
  'Lisbon',
  true,
  89,
  'https://www.getyourguide.com/en-gb/lisbon-l42/lisbon-coast-kayak-tour-t64235/?partner_id=BONZK5E',
  'GetYourGuide'
);
