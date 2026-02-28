-- ============================================
-- Batch Viator-16: Escala25 Climbing on Ponte 25 de Abril
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Lisbon Climbing Shared Bridge Experience (366484P2)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Climbing Experience on Ponte 25 de Abril',
  'Visit one of Lisbon''s most unique outdoor adventures — climb the iconic Ponte 25 de Abril! This introduction to climbing offers a one-of-a-kind experience where all ages and abilities can learn the basics of climbing on Lisbon''s breathtaking version of the Golden Gate Bridge. Enter through the Pilar 7 Experience welcome centre, gear up with safety equipment, and enjoy stunning panoramic views of the city and the Tagus river as you climb.',
  'Learn to climb on Lisbon''s iconic Ponte 25 de Abril bridge — a unique adventure for all ages with stunning panoramic views.',
  'Lisbon',
  'Pilar 7 Experience, Ponte 25 de Abril, Lisbon',
  38.6876,
  -9.1782,
  25.0,
  'EUR',
  '1h',
  NULL,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/6e/71/fd.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/6e/71/fd.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/6e/72/03.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/6e/72/08.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/4f/6f/da.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/4f/6f/ed.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/videos/1762947010019-escala25.mp4',
  '["Climb Lisbon''s iconic Ponte 25 de Abril bridge", "Suitable for all ages and abilities — no experience needed", "Stunning panoramic views of the city and Tagus river", "Learn the basics of climbing with professional guides", "A truly unique, one-of-a-kind Lisbon adventure"]'::jsonb,
  '["Safety equipment", "Entrance ticket", "Professional guide"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  5,
  'Lisbon',
  true,
  91,
  'https://www.viator.com/tours/Lisbon/Introduction-to-Climbing/d538-366484P2?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);
