-- ============================================
-- Batch GYG-8: Mystery City Treasure Hunt in Sintra
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Sintra: Treasure Hunt & Walking Tour "The King's Secret" (t462357)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Sintra: Treasure Hunt & Walking Tour "The King''s Secret"',
  'Set out on a self-guided adventure through Sintra''s historic city centre. Explore must-visit places, find hidden clues, and unlock a treasure box to solve a mystery. Follow the trail through cobblestone streets, romantic palaces, and lush gardens as you piece together the king''s secret. A perfect blend of sightseeing, puzzle-solving, and storytelling — ideal for couples, families, and groups of friends.',
  'Self-guided treasure hunt through Sintra — solve puzzles, find hidden clues, and uncover the king''s secret.',
  'Sintra',
  'Centro Histórico de Sintra, Sintra',
  38.7507,
  -9.2591,
  22.0,
  'EUR',
  '2h',
  NULL,
  'Culture Dive',
  'https://cdn.getyourguide.com/img/tour/6499954c54e1a.jpeg/97.jpg',
  '["https://cdn.getyourguide.com/img/tour/6499954c54e1a.jpeg/97.jpg", "https://cdn.getyourguide.com/img/tour/645278d578d94.jpeg/97.jpg", "https://cdn.getyourguide.com/img/tour/649995342b0cb.jpeg/97.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Mystery%20City/mysterycity2.mp4',
  '["Self-guided treasure hunt at your own pace", "Explore Sintra''s most iconic historical spots", "Solve puzzles and find hidden clues", "Unlock a treasure box to reveal the king''s secret", "Perfect for families, couples, and groups of friends"]'::jsonb,
  '["Treasure hunt kit", "Clue booklet & map"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  3,
  'Lisbon',
  true,
  92,
  'https://www.getyourguide.com/sintra-l99/sintra-passeio-historico-de-caca-ao-tesouro-t462357/?partner_id=BONZK5E',
  'GetYourGuide'
);
