-- ============================================
-- Batch GYG-7: Lx4 Tours Guided Quad Tour on Atlantic Coast
-- Partner ID: BONZK5E
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) From Lisbon: Guided Quad Tour Along the Atlantic Coast (t649046)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'From Lisbon: Guided Quad Tour Along the Atlantic Coast',
  'Explore the wild side of Lisbon on a guided quad bike adventure along the Atlantic coast! Ride through the protected Arriba Fóssil landscape in Costa da Caparica, discover an abandoned WW1 military complex, the Portuguese Grand Canyon, and a hidden 80s waterpark. Navigate off-road trails through native forests, visit a 16th-century monastery, and stop at stunning viewpoints with panoramic ocean, river and Sintra mountain views. Small groups, max 10 participants.',
  'Explore Lisbon''s wild side on a guided quad tour — off-road trails, hidden ruins, canyons and stunning Atlantic coast views.',
  'Lisbon',
  'Lx4 Tours, Costa da Caparica',
  38.6377534,
  -9.2315210,
  99.0,
  'EUR',
  '2h',
  10,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/24088b4c74e4b9b7bd93a1fa05dce8183a5963e5e4ce843ef7864ae1550ff0fb.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/24088b4c74e4b9b7bd93a1fa05dce8183a5963e5e4ce843ef7864ae1550ff0fb.jpg/145.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/videos/1762947001001-lx4tours.mp4',
  '["Explore the wild side of Lisbon by quad bike", "Discover hidden places inaccessible by any other means", "Visit an abandoned WW1 military complex and the Portuguese Grand Canyon", "Stunning viewpoints with ocean, river and Sintra mountain views", "Learn about Portugal''s history, myths and legends from your guide"]'::jsonb,
  '["Quad bike ride (2 hours)", "Guide", "Safety instructions and equipment", "Health insurance"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  869,
  'Lisbon',
  true,
  90,
  'https://www.getyourguide.com/en-gb/lisbon-l42/from-lisbon-guided-quad-tour-along-the-atlantic-coast-t649046/?partner_id=BONZK5E',
  'GetYourGuide'
);
