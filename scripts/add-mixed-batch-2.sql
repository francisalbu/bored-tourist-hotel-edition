-- ============================================
-- Batch Mixed-2: Sintra E-Bike Tour (Viator) + Street Art Tour (GYG)
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Sintra & Cascais E-Bike Guided Tour (Viator 8232P8)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Sintra & Cascais E-Bike Guided Tour',
  'This half-day e-bike tour gives you the chance to discover the secret sights and magnificent views of Sintra and Cascais with minimum effort, in a safe, fun, and eco-friendly way. Make stops along the way and enjoy the option to taste traditional Portuguese pastries. Your guide shares historical and significant information through engaging stories and little-known facts about Sintra. Your questions are welcomed!',
  'Half-day e-bike tour through Sintra & Cascais — hidden sights, stunning views, and Portuguese pastries.',
  'Sintra',
  'Sintra Train Station (entrance)',
  38.7983,
  -9.3851,
  95.0,
  'EUR',
  '4h',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/0e/fe/2d.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/0e/fe/2d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/0e/fe/d0.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/0e/fd/47.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/0e/fe/95.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/0e/fd/13.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Cascais%20Routes/eridescascais.mp4',
  '["Explore Sintra & Cascais on an electric bike — effortless riding", "Discover hidden sights and magnificent viewpoints", "Taste traditional Portuguese pastries along the way", "Engaging guide with local stories and little-known facts", "Safe, fun, and eco-friendly way to explore"]'::jsonb,
  '["E-bike", "Helmet (by request)", "Water", "Professional guide"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  42,
  'Lisbon',
  true,
  99,
  'https://www.viator.com/tours/Sintra/Sintra-e-bike-Tour/d50861-8232P8?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 2) Lisbon Kickstart Street Art Walking Tour (GYG t247097)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Kickstart Street Art Walking Tour',
  'Explore Lisbon''s historical centre through the lens of street art on this 1.5-hour walking tour. Discover the city''s top murals, stencils, and installations hidden in the most improbable places — from narrow alleyways to grand facades. Get a kickstart introduction to Lisbon''s vibrant artistic life and learn about the stories and artists behind each piece. A perfect way to see a different side of the city.',
  'Discover Lisbon''s best street art hidden in the most unexpected places on this 1.5-hour walking tour.',
  'Lisbon',
  'Historical Centre, Lisbon',
  38.7223,
  -9.1393,
  20.0,
  'EUR',
  '1h 30min',
  NULL,
  'Culture Dive',
  'https://cdn.getyourguide.com/img/tour/0ac2f8f2d99a32235d3f8d2bb3c8d32c623dc69d89f213c356e7a402e1f84573.jpeg/97.jpg',
  '["https://cdn.getyourguide.com/img/tour/0ac2f8f2d99a32235d3f8d2bb3c8d32c623dc69d89f213c356e7a402e1f84573.jpeg/97.jpg", "https://cdn.getyourguide.com/img/tour/0ac2f8f2d99a32235d3f8d2bb3c8d32c623dc69d89f213c356e7a402e1f84573.jpeg/98.jpg", "https://cdn.getyourguide.com/img/tour/0ac2f8f2d99a32235d3f8d2bb3c8d32c623dc69d89f213c356e7a402e1f84573.jpeg/99.jpg", "https://cdn.getyourguide.com/img/tour/0ac2f8f2d99a32235d3f8d2bb3c8d32c623dc69d89f213c356e7a402e1f84573.jpeg/145.jpg", "https://cdn.getyourguide.com/img/tour/0ac2f8f2d99a32235d3f8d2bb3c8d32c623dc69d89f213c356e7a402e1f84573.jpeg/155.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Street%20Budha/streetbudha.mp4',
  '["Discover Lisbon''s top street art in unexpected places", "Explore the historical centre from an artistic perspective", "Learn the stories and artists behind each piece", "1.5-hour walking tour — perfect kickstart to the city", "See murals, stencils, and installations off the beaten path"]'::jsonb,
  '["Expert street art guide", "Walking tour through the historical centre"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  720,
  'Lisbon',
  true,
  100,
  'https://www.getyourguide.com/lisbon-l42/lisbon-kickstart-street-art-tour-t247097/?partner_id=BONZK5E',
  'GetYourGuide'
);
