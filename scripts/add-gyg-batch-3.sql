-- ============================================
-- Batch GYG-3: Add Horseback Riding Comporta to Supabase
-- Partner ID: BONZK5E
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) From Lisbon: Horseback Riding on Comporta Beach (t640361)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'From Lisbon: Horseback Riding on Comporta Beach',
  'Journey to the Comporta Nature Reserve and enjoy a horseback ride on Comporta Beach, the largest beach in Europe. Ride across the dunes, discover the Atlantic Forest, and soak in the stunning views. Choose from a variety of horses including the Lusitano — all trained for any experience level, even complete beginners.',
  'Journey to the Comporta Nature Reserve and enjoy a horseback ride on Comporta Beach, the largest beach in Europe. Ride across the dunes and soak in the stunning views.',
  'Lisbon',
  'Praça Marquês de Pombal 8, 1269-133 Lisboa, Portugal',
  38.7249957,
  -9.1511538,
  140.0,
  'EUR',
  '4h',
  10,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/b1a59bb29cedfa8edd889ab9ddab069a1dbd88a56d6b6bb8278327bb8cb5face.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/b1a59bb29cedfa8edd889ab9ddab069a1dbd88a56d6b6bb8278327bb8cb5face.jpg/145.jpg", "https://cdn.getyourguide.com/img/tour/745a4ea81b90bd6f0e4e3f32411a4e0c1efa08cc176b868cf1cfd10915959a85.png/145.jpg", "https://cdn.getyourguide.com/img/tour/891b3caa7e1c5453674af7aacaff0de21edc6f91cb639664a31ecd6a0888b9e3.png/145.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Spinach%20Tours/spinachtours.mp4',
  '["Ride a horse on Comporta Beach, the largest beach in Europe", "Explore the Atlantic Forest and dunes with stunning ocean views", "Suitable for all levels — horses trained for complete beginners", "Choose from different breeds starting with the Lusitano", "Small group experience with max 10 participants"]'::jsonb,
  '["Transfer from Lisbon to Comporta and back", "Horseback riding (2 hours)", "All riding equipment", "Food and drinks"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  167,
  'Lisbon',
  true,
  84,
  'https://www.getyourguide.com/en-gb/lisbon-l42/from-lisbon-horseback-riding-on-comporta-beach-t640361/?partner_id=BONZK5E',
  'GetYourGuide'
);
