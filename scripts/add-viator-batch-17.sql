-- ============================================
-- Batch Viator-17: Azulejos Design Workshop at Formettes
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Portuguese Tile Workshop (5511908P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Portuguese Tile Workshop — Create Your Own Azulejo',
  'Create your unique souvenir of Lisbon at this hands-on Portuguese tile workshop! Join Agathe, artist and creator of the Formettes method, and meet fellow travellers from around the world. Learn about the history and art of traditional Portuguese azulejos, then design and paint your own tile to take home. No artistic experience needed — the Formettes method makes it accessible and fun for everyone.',
  'Hands-on azulejo workshop — design and paint your own Portuguese tile to take home as a unique souvenir.',
  'Lisbon',
  'Rua de Timor / Rua de Cabo Verde, Lisbon',
  38.7554,
  -9.1375,
  55.0,
  'EUR',
  '2h',
  NULL,
  'Learn & Create',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/52/65/42.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/52/65/42.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/52/65/43.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/52/65/44.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/52/65/47.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/52/65/48.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Azulejos%20Design/azulejos.mp4',
  '["Design and paint your own Portuguese azulejo tile", "Learn the history of traditional Portuguese tilework", "Guided by Agathe, creator of the Formettes method", "No artistic experience required", "Take your unique handmade souvenir home"]'::jsonb,
  '["Tea and coffee", "All art materials", "Your finished tile to take home"]'::jsonb,
  '["English", "Portuguese", "French"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  17,
  'Lisbon',
  true,
  93,
  'https://www.viator.com/tours/Lisbon/Azulejosdesign-with-at-Formettes-Create-your-own-Portuguese-tile/d538-5511908P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);
