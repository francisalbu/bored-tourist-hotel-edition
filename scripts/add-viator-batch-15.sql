-- ============================================
-- Batch Viator-15: Spinach Tours Self-Drive Electric Car
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Lisbon Self-Drive Sightseeing Tour in an Electric Car (5509LSBGOCAR)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Self-Drive Sightseeing Tour in an Electric Car',
  'Explore Lisbon aboard a stylish green electric car! With Spinach Tours, forget the exhaustion of walking tours and embark on a dynamic experience. Our electric vehicles allow you to explore more, without missing the historic and cultural gems that make Lisbon unique. With fun and unique audio commentary, you''ll get a privileged view of Portugal''s capital, with the flexibility and freedom that a walking tour simply can''t offer. Choose from multiple routes through Alfama, Chiado, Belém and more.',
  'Explore Lisbon in a fun electric car with audio guide — choose your route through Alfama, Chiado, Belém and more at your own pace.',
  'Lisbon',
  'Largo do Terreiro do Trigo 16, Lisbon',
  38.7098,
  -9.1325,
  30.0,
  'EUR',
  '1-3h',
  NULL,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/1f/7e/4e.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/1f/7e/4e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/1f/7e/85.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/1f/7e/31.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/1f/7e/38.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/1f/7e/44.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Spinach%20Tours/spinachtours.mp4',
  '["Self-drive through Lisbon in a fun electric car", "Choose from multiple routes: Alfama, Chiado, Belém and more", "Audio commentary with fun facts and cultural insights", "Flexible 1 to 3 hour options to explore at your own pace", "Complimentary spinach shot and gift at the end"]'::jsonb,
  '["Spinach electric vehicle for the duration", "Exclusive app and voice narrations", "Curated routes passing by all Lisbon highlights", "Spinach briefing and support along the way", "Spinach shot and gift at the end"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German"]'::jsonb,
  'Free cancellation up to 24h before',
  4.5,
  201,
  'Lisbon',
  true,
  85,
  'https://www.viator.com/tours/Lisbon/Lisbon-Self-Driving-Interactive-Sightseeing-Tour/d538-5509LSBGOCAR?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);
