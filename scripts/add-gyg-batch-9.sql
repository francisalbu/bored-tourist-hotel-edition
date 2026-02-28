-- ============================================
-- Batch GYG-9: Rodas ao Vento — Lisbon Guided Buggy Ride
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Lisbon: Guided Buggy Ride (t1069706)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Guided Off-Road Buggy Ride',
  'Feel the thrill of off-roading and get an exclusive view of the Tagus River from one of the highest points in the region. Hop aboard a rugged buggy and explore scenic trails through the hills surrounding Lisbon with an experienced local guide. Discover hidden viewpoints, enjoy the fresh air, and take in breathtaking panoramic views of the river and coastline. A ride you''ll want to repeat!',
  'Off-road buggy adventure with stunning Tagus River views from the highest points near Lisbon.',
  'Lisbon',
  'Lisbon Region',
  38.9274,
  -9.0091,
  150.0,
  'EUR',
  '2h',
  NULL,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/8c7a76af240a87b62538194e21f394e29687e4287c01e538520468ddb7dff9d5.jpeg/97.jpg',
  '["https://cdn.getyourguide.com/img/tour/8c7a76af240a87b62538194e21f394e29687e4287c01e538520468ddb7dff9d5.jpeg/97.jpg", "https://cdn.getyourguide.com/img/tour/8c7a76af240a87b62538194e21f394e29687e4287c01e538520468ddb7dff9d5.jpeg/98.jpg", "https://cdn.getyourguide.com/img/tour/8c7a76af240a87b62538194e21f394e29687e4287c01e538520468ddb7dff9d5.jpeg/99.jpg", "https://cdn.getyourguide.com/img/tour/8c7a76af240a87b62538194e21f394e29687e4287c01e538520468ddb7dff9d5.jpeg/145.jpg", "https://cdn.getyourguide.com/img/tour/8c7a76af240a87b62538194e21f394e29687e4287c01e538520468ddb7dff9d5.jpeg/155.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Rodas%20ao%20Vento/rodaventovideo.mp4',
  '["Thrilling off-road buggy adventure through scenic trails", "Panoramic views of the Tagus River from the highest points", "Experienced local guide with insider knowledge", "Discover hidden viewpoints and beautiful landscapes", "A unique and unforgettable way to explore the Lisbon region"]'::jsonb,
  '["Buggy ride with experienced guide", "Safety equipment"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  5,
  'Lisbon',
  true,
  94,
  'https://www.getyourguide.com/lisbon-l42/lisbon-guided-buggy-ride-t1069706/?partner_id=BONZK5E',
  'GetYourGuide'
);
