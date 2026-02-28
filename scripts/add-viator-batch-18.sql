-- ============================================
-- Batch Viator-18: Surf Lesson Carcavelos + Countryside Food Tour
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Surf Lesson on Praia de Carcavelos (13724P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Surf Lesson on Praia de Carcavelos',
  'Get your adrenaline going during this 1.5-hour surfing lesson on gorgeous Praia de Carcavelos. Receive instruction from one of the first surf schools in Portugal and get outfitted with a wetsuit and surfboard. Practice basic techniques on the sand and then take to the waves with your instructor. Learn how to push up off the board, find balance, and stay on a wave — all on one of the prettiest beaches near Lisbon. Limited to 15 participants to ensure a more personal experience.',
  'Surf lesson on Praia de Carcavelos — wetsuit, board, and pro instructor included. Max 15 people.',
  'Carcavelos',
  'Praia de Carcavelos, next to Windsurf Cafe',
  38.6773,
  -9.3398,
  40.0,
  'EUR',
  '1h 30min',
  15,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/8a/09/bf.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/8a/09/bf.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/8a/09/e2.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/8a/0a/1a.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/88/1f/18.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/a9/e7/28.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Carcavelos%20Surf%20School/carcavelossurfschool.mp4',
  '["Learn to surf on beautiful Praia de Carcavelos", "Professional instruction from one of Portugal''s first surf schools", "Wetsuit and surfboard included", "Practice on sand before hitting the waves", "Small groups — max 15 participants"]'::jsonb,
  '["Surf equipment (board & wetsuit)", "Professional instructor", "Insurance"]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  84,
  'Lisbon',
  true,
  97,
  'https://www.viator.com/tours/Cascais/Surf-Lesson/d28587-13724P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 2) Lisbon Countryside Food Tour on a Vintage Car (282843P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Countryside Food Tour on a Vintage Citroën 2CV',
  'Explore the countryside around Sintra, Mafra, and Ericeira aboard a classic Citroën 2CV or Volkswagen T3 van. Run by the team at Agora Sim, this tour celebrates the villages where they grew up — surrounded by the sounds of nature and smells of the countryside. Enjoy organic, home-prepared food using sustainable materials while discovering charming rural landscapes. Small groups of up to 4 in the 2CV, or up to 8 in the VW van.',
  'Countryside food tour in a vintage Citroën 2CV — organic tastings through Sintra, Mafra & Ericeira.',
  'Sintra',
  'Portela de Sintra Train Station, Av. Mário Firmino Miguel',
  38.7985,
  -9.3767,
  30.0,
  'EUR',
  '4h',
  8,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/2c/2d/41.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/2c/2d/41.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/37/e7/61.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/37/e7/6f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/37/ed/72.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/37/e7/6a.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Agora%20Sim/agorasim.mp4',
  '["Ride in a classic Citroën 2CV or VW T3 van", "Taste organic, home-prepared countryside food", "Explore charming villages around Sintra, Mafra & Ericeira", "Small group experience with local hosts", "Sustainable materials and locally sourced ingredients"]'::jsonb,
  '["Private vintage car transport", "Organic snacks and tastings"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  30,
  'Lisbon',
  true,
  98,
  'https://www.viator.com/tours/Sintra/Vintage-Countryside-Gastronomic-Tour/d50861-282843P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);
