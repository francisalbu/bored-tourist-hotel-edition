-- ============================================
-- Batch GYG-10: Caving in Arrábida + Escape Game Lisbon
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Caving in Arrábida Natural Park (t447042)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Caving in Arrábida Natural Park',
  'Discover the hidden cave systems of Arrábida Natural Park with a professional instructor. Descend into an underground world of stunning rock formations, be amazed by the geological wonders, and be entertained by the fascinating stories your guide shares along the way. Located between Setúbal and Sesimbra, this caving adventure is a perfect day trip from Lisbon for nature lovers and thrill seekers alike.',
  'Explore Arrábida''s cave systems with a pro instructor — stunning underground formations just south of Lisbon.',
  'Sesimbra',
  'Arrábida Natural Park, Sesimbra / Setúbal',
  38.4694,
  -8.9848,
  60.0,
  'EUR',
  '3h',
  NULL,
  'Outdoors',
  'https://cdn.getyourguide.com/img/tour/63f902a0a10b9.jpeg/97.jpg',
  '["https://cdn.getyourguide.com/img/tour/63f902a0a10b9.jpeg/97.jpg", "https://cdn.getyourguide.com/img/tour/63f902a0a10b9.jpeg/98.jpg", "https://cdn.getyourguide.com/img/tour/63f902a0a10b9.jpeg/99.jpg", "https://cdn.getyourguide.com/img/tour/63f902a0a10b9.jpeg/145.jpg", "https://cdn.getyourguide.com/img/tour/63f902a0a10b9.jpeg/155.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Discover%20the%20Nature/caing.mp4',
  '["Explore underground cave systems in Arrábida Natural Park", "Professional caving instructor and guide", "Discover stunning geological formations", "Hear fascinating stories about the caves'' history", "Perfect day trip from Lisbon for adventure lovers"]'::jsonb,
  '["Professional caving instructor", "Safety equipment and helmets", "Headlamps"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  18,
  'Lisbon',
  true,
  95,
  'https://www.getyourguide.com/sesimbra-l4957/lisbon-caving-in-arrabida-natural-park-setubal-sesimbra-t447042/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 2) Lisbon Old Town Immersive Escape Game with Live Actors (t642109)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Immersive Escape Game with Live Actors',
  'Embark on an immersive escape game set in Lisbon''s atmospheric Old Town. Solve puzzles and riddles as you visit iconic landmarks and uncover the city''s hidden history. Live actors bring the storyline to life, making this far more than a regular walking tour. Work as a team, crack the clues, and race against time through cobblestone streets — a thrilling way to explore Lisbon.',
  'Outdoor escape game with live actors through Lisbon''s Old Town — solve puzzles at iconic landmarks.',
  'Lisbon',
  'Old Town, Lisbon',
  38.7223,
  -9.1393,
  29.0,
  'EUR',
  '2h',
  NULL,
  'Culture Dive',
  'https://cdn.getyourguide.com/img/tour/d9533b6c449b58f1df2e27cf325f1df6b8b502ece682d1b2564ca35ed55fff62.jpeg/97.jpg',
  '["https://cdn.getyourguide.com/img/tour/d9533b6c449b58f1df2e27cf325f1df6b8b502ece682d1b2564ca35ed55fff62.jpeg/97.jpg", "https://cdn.getyourguide.com/img/tour/d9533b6c449b58f1df2e27cf325f1df6b8b502ece682d1b2564ca35ed55fff62.jpeg/98.jpg", "https://cdn.getyourguide.com/img/tour/d9533b6c449b58f1df2e27cf325f1df6b8b502ece682d1b2564ca35ed55fff62.jpeg/99.jpg", "https://cdn.getyourguide.com/img/tour/d9533b6c449b58f1df2e27cf325f1df6b8b502ece682d1b2564ca35ed55fff62.jpeg/145.jpg", "https://cdn.getyourguide.com/img/tour/d9533b6c449b58f1df2e27cf325f1df6b8b502ece682d1b2564ca35ed55fff62.jpeg/155.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Timeless%20Experiences/timelessvideo.mp4',
  '["Immersive outdoor escape game through Lisbon''s Old Town", "Live actors bring the storyline to life", "Solve puzzles and riddles at iconic landmarks", "Learn about Lisbon''s hidden history", "Great team activity for friends, couples, or families"]'::jsonb,
  '["Escape game kit and clues", "Live actor interactions", "Access to all game locations"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.5,
  15,
  'Lisbon',
  true,
  96,
  'https://www.getyourguide.com/lisbon-l42/lisbon-old-town-immersive-escape-game-with-live-actors-t642109/?partner_id=BONZK5E',
  'GetYourGuide'
);
