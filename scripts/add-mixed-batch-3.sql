-- ============================================
-- Batch Mixed-3: E-Bike Lisbon Hills + Rock Climbing Cascais + Scuba Sesimbra
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Lisbon E-Bike Tour — Commerce Square, Mouraria & Alfama (Viator 5509LSB7EBIKETOUR)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Hills E-Bike Tour — Alfama, Mouraria & Baixa',
  'Legend has it that Lisbon rises upon its famous hills, and with this electric bike small-group tour (max 8 per guide) you can conquer those slopes while uncovering the city''s finest highlights and breathtaking scenic vistas. Visit the beautiful Alfama, Chiado, and Baixa districts, cycle past landmarks like the Sé de Lisboa Cathedral, and ride up to the highest spots including the National Pantheon. Undoubtedly the ultimate way to immerse yourself in Lisbon''s history, culture, and its welcoming people.',
  'Conquer Lisbon''s famous hills on an e-bike — Alfama, Mouraria, Baixa and the best viewpoints. Max 8.',
  'Lisbon',
  'Rua dos Douradores 16, 1100-026 Lisbon (Boost Portugal)',
  38.7103,
  -9.1365,
  22.0,
  'EUR',
  '3h',
  8,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/52/37/91.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/52/37/91.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/71/fd/26.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/52/37/8d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/71/fd/2a.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/52/37/95.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Bikes%26Company/bikes%26company.mp4',
  '["Conquer Lisbon''s seven hills effortlessly on an e-bike", "Small group tour — max 8 participants per guide", "Cycle through Alfama, Mouraria, Chiado & Baixa", "Visit top landmarks including Sé Cathedral and National Pantheon", "Breathtaking panoramic views from the highest viewpoints"]'::jsonb,
  '["Electric bike rental & equipment lesson", "Experienced local guide", "Safety helmet", "Liability and personal accident insurance"]'::jsonb,
  '["English", "French", "Spanish", "Dutch", "German"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  1691,
  'Lisbon',
  true,
  101,
  'https://www.viator.com/tours/Lisbon/Lisbon-Hills-Electric-Bike-Tour/d538-5509LSB7EBIKETOUR?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 2) Cascais 3.5-Hour Rock Climbing Experience (GYG t50742)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Cascais: 3.5-Hour Rock Climbing Experience',
  'Discover one of Portugal''s most beautiful climbing cliffs with this 3.5-hour rock climbing experience in Cascais. Ideal for all abilities — from complete beginners to experienced climbers. Familiarise yourself with the basic equipment and safety practices before taking to the rockface. Enjoy stunning coastal views as you climb, with professional instructors guiding you every step of the way.',
  'Rock climbing on Cascais'' stunning coastal cliffs — 3.5 hours, all levels welcome, pro instructors.',
  'Cascais',
  'Cascais Coastal Cliffs, Cascais',
  38.6913,
  -9.4216,
  95.0,
  'EUR',
  '3h 30min',
  NULL,
  'Sports',
  'https://cdn.getyourguide.com/img/tour/5523987058eb9.jpeg/97.jpg',
  '["https://cdn.getyourguide.com/img/tour/5523987058eb9.jpeg/97.jpg", "https://cdn.getyourguide.com/img/tour/5523987058eb9.jpeg/98.jpg", "https://cdn.getyourguide.com/img/tour/5523987058eb9.jpeg/99.jpg", "https://cdn.getyourguide.com/img/tour/5523987058eb9.jpeg/145.jpg", "https://cdn.getyourguide.com/img/tour/5523987058eb9.jpeg/155.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Cascais%20Routes/cascaisroutes.mp4',
  '["Climb one of Portugal''s most beautiful coastal cliffs", "Suitable for all abilities — beginners to advanced", "Professional instructor and safety briefing included", "Stunning views of the Cascais coastline while climbing", "3.5 hours of hands-on climbing adventure"]'::jsonb,
  '["Professional climbing instructor", "All climbing equipment", "Safety briefing and instruction"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  11,
  'Lisbon',
  true,
  102,
  'https://www.getyourguide.com/cascais-l100/cascais-35-hour-rock-climbing-experience-t50742/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 3) Sesimbra: First Scuba Diving Experience in the Ocean (GYG t440298)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Sesimbra: First Scuba Diving Experience in the Ocean',
  'Your first dive awaits! Dive into Sesimbra''s crystal-clear underwater world and meet vibrant marine life guided by experts. This beginner-friendly scuba diving experience takes place in the sheltered waters of Sesimbra bay, one of the best spots in Portugal for a first dive. No prior experience needed — your certified instructor will guide you through every step, from equipment setup to breathing techniques, before taking you beneath the surface.',
  'Your first ocean dive in Sesimbra — crystal-clear waters, vibrant marine life, expert instructors.',
  'Sesimbra',
  'Sesimbra Bay, Sesimbra',
  38.4438,
  -9.1010,
  100.0,
  'EUR',
  '3h',
  NULL,
  'Sports',
  'https://cdn.getyourguide.com/img/tour/63c15d88409d3.jpeg/97.jpg',
  '["https://cdn.getyourguide.com/img/tour/63c15d88409d3.jpeg/97.jpg", "https://cdn.getyourguide.com/img/tour/63c15d88409d3.jpeg/98.jpg", "https://cdn.getyourguide.com/img/tour/63c15d88409d3.jpeg/99.jpg", "https://cdn.getyourguide.com/img/tour/63c15d88409d3.jpeg/145.jpg", "https://cdn.getyourguide.com/img/tour/63c15d88409d3.jpeg/155.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Mega%20Dive/megadivevideo.mp4',
  '["First scuba diving experience — no prior experience needed", "Crystal-clear waters of Sesimbra bay", "Meet vibrant marine life guided by certified experts", "Full equipment and safety briefing included", "One of the best spots in Portugal for a first dive"]'::jsonb,
  '["Full scuba diving equipment", "Certified diving instructor", "Safety briefing and training"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  14,
  'Lisbon',
  true,
  103,
  'https://www.getyourguide.com/sesimbra-l4957/sesimbra-first-scuba-diving-experience-in-the-ocean-t440298/?partner_id=BONZK5E',
  'GetYourGuide'
);
