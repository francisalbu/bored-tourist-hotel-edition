-- ============================================
-- Batch 6: Add 5 Viator experiences to Supabase
-- (14060P13 already inserted in batch 5 — skipped)
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Lisbon Sketching Tour (164947P46)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Sketching Tour: Hidden Views & Urban Art with a Local Artist',
  'Uncover Lisbon''s charm through the eyes of Natércia, a talented Portuguese artist, on this full-day urban sketching adventure. You''ll explore the city''s most iconic and secret viewpoints — places loved by artists and locals alike — while your guide shares fascinating stories and fun facts about Lisbon''s historic streets and hidden corners. No prior art experience is needed: Natércia will be your private teacher, providing brushes, paints and postcards, and guiding you as you capture the city''s beauty in your own sketches. Visit the Church and Museum of Carmo, discover quiet miradouros away from the crowds, and experience Lisbon in a creative rhythm that turns memorable sights into personalised postcards. Take home unique works of art and gain exclusive insight into Lisbon''s vibrant art scene.',
  'A full-day urban sketching adventure with a local Portuguese artist — discover hidden viewpoints, learn to sketch Lisbon and take home your own artwork.',
  'Lisbon',
  'Meeting point at the park, Lisbon',
  38.7139,
  -9.1394,
  200,
  'EUR',
  '8h',
  NULL,
  'Learn & Create',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/a2/38.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/a2/38.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/a2/1f.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/a2/3a.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/a2/41.jpg"]'::jsonb,
  '["Full-day sketching tour guided by a professional Portuguese artist","Discover Lisbon''s most iconic and secret viewpoints","No art experience needed — all materials and guidance provided","Visit the Church and Museum of Carmo","Take home unique artwork you''ve created throughout the day","Learn techniques for turning memorable sights into sketches","A creative, relaxed way to experience Lisbon like a local"]'::jsonb,
  '["Tickets to Church and Museum of Carmo","A professional artist as your private teacher and guide","Brushes, paints and postcards provided"]'::jsonb,
  '["English","Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  3,
  'Lisbon',
  true,
  29,
  'https://www.viator.com/tours/Lisbon/Lisbon-Sketching-Tour-Discover-Hidden-Views-and-Art/d538-164947P46',
  'Viator'
);

-- 2) Photography Masterclass (7842P37)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Photography Masterclass: Private Lesson with a Pro',
  'Washed in an artist''s light, the roller-coaster city of Lisbon was made for photography. On this private 3-hour masterclass, stroll through the streets with a professional photographer who will help you capture the city at its best. Shoot the old steps of Alfama, catch sweeping views from one of Lisbon''s many miradouros, or photograph the city''s inhabitants and the beautiful tiled facades. Your guide tailors the session entirely to your level — from amateur to advanced enthusiast — focusing on your technical settings, composition and creative vision. Walk away with stunning shots and lessons that will last a lifetime. This is photography education meets city exploration, and every frame tells a story.',
  'A private 3-hour photography masterclass with a professional photographer — explore Lisbon''s most photogenic streets and master your camera skills.',
  'Alfama & Miradouros, Lisbon',
  'Miradouro de Portas do Sol (in front of the statue of St. Vincent), Lisbon',
  38.7122,
  -9.1301,
  150,
  'EUR',
  '3h',
  NULL,
  'Learn & Create',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/a3/d6/88.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/a3/d6/88.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/74/aa/ca.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/a3/d6/35.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/a3/d6/36.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/a3/d6/3c.jpg"]'::jsonb,
  '["Private 1-on-1 session with a professional photographer","Tailored to your skill level — amateur to advanced","Explore Alfama, miradouros and Lisbon''s most photogenic streets","Focus on technical settings, composition and creative vision","Capture iconic shots of tiled facades, old steps and city views","Walk away with stunning photos and lasting photography skills","3 hours of hands-on, personalised instruction"]'::jsonb,
  '["Professional photographer guide","Private tour tailored to your level","Local guide knowledge"]'::jsonb,
  '["English","French","Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.6,
  5,
  'Lisbon',
  true,
  30,
  'https://www.viator.com/tours/Lisbon/Private-Lisbon-Photography-Walking-Tour-with-a-Professional-Photographer/d538-7842P37',
  'Viator'
);

-- 3) Age of Discoveries Walking Tour in Belém (268183P7)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Age of Discoveries Free Walking Tour in Belém',
  'Dive into Portugal''s golden era on this walking tour through the monumental neighbourhood of Belém. Start in the lush Afonso de Albuquerque Gardens, then be enchanted by the legendary aroma of Pastéis de Belém — the original custard tart. Wander past the magnificent Jerónimos Monastery, feeling the pulse of Portugal''s Age of Discovery, and discover the legacy of Prince Henry the Navigator at the School of Sagres. Marvel at the Monument to the Discoveries, where the great explorers are immortalised in stone, before the tour culminates at the iconic Belém Tower by the Tagus River, where the spirit of exploration comes alive. Led by passionate, expert guides with blue umbrellas, this is a journey through history, flavours and innovation — all on a pay-what-you-wish basis.',
  'A free walking tour through Belém exploring the Age of Discoveries — from Jerónimos Monastery and Pastéis de Belém to the Tower and Monument to the Discoveries.',
  'Belém, Lisbon',
  'Next to the statue in Afonso de Albuquerque Gardens, Belém (look for blue umbrellas)',
  38.6966,
  -9.2063,
  3,
  'EUR',
  '2h 30min',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/84/19/1c.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/84/19/1c.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/84/19/3a.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/84/19/3d.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/84/19/43.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/84/19/49.jpg"]'::jsonb,
  '["Free walking tour — pay what you wish at the end","Explore the magnificent Jerónimos Monastery","Pass by the legendary Pastéis de Belém bakery","Marvel at the Monument to the Discoveries and Belém Tower","Learn about Prince Henry the Navigator and the Age of Discovery","Expert, passionate guides with blue umbrellas","1,500+ reviews with a 4.9 rating"]'::jsonb,
  '["Expert and passionate free tour guide"]'::jsonb,
  '["English","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  1517,
  'Lisbon',
  true,
  31,
  'https://www.viator.com/tours/Lisbon/Age-of-Discoveries-Walking-Tour-Belem/d538-268183P7',
  'Viator'
);

-- 4) Arrábida Wine Tour: Small Group with Tile Factory (7589P3)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Arrábida Wine Tour: Wineries, Tastings & Tile Workshop (Small Group)',
  'Head south from Lisbon on this intimate small-group tour (max 8 people) through the stunning Arrábida region. Cross the Tagus River past the iconic 25 de Abril Bridge and spend the day exploring stunning beaches, towering Atlantic cliffs, historic fortifications and the charming fishing village of Sesimbra. Venture into the Arrábida UNESCO Natural Park to discover an isolated monastery hidden in the Mediterranean forest. Visit a local tile workshop to admire beautiful azulejo art, then stop at two family-owned wineries to sample the region''s delightful pastries, the famous Queijo de Azeitão cheese and taste seven different wines. Before heading back, visit the Cristo Rei statue for a breathtaking panoramic view of Lisbon across the river. An unforgettable day that combines nature, wine, history and Portuguese artisan culture.',
  'A small-group day trip (max 8) through Arrábida — visit wineries, taste 7 wines with local cheese, explore a tile workshop, stunning beaches and the fishing village of Sesimbra.',
  'Arrábida & Sesimbra',
  'Avenida da Liberdade 9, Lisbon (in front of American Vintage store)',
  38.7168,
  -9.1425,
  95,
  'EUR',
  'Full day',
  8,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/12/9f/4f.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/12/9f/4f.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/5d/78/55.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/4f/b4/64.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/12/9f/46.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/12/9f/47.jpg"]'::jsonb,
  '["Small group of max 8 people for an intimate experience","Visit 2 family-owned wineries and taste 7 different wines","Try the famous Queijo de Azeitão cheese and local pastries","Admire azulejo art at a local tile workshop","Explore the Arrábida UNESCO Natural Park and hidden monastery","Visit the charming fishing village of Sesimbra","Panoramic view of Lisbon from Cristo Rei statue"]'::jsonb,
  '["Tasting of 7 wines at 2 family-owned wineries","Torta de Azeitão (local pastry) and Queijo de Azeitão","Local guide and driver","Air-conditioned vehicle","Central meeting point pickup and drop-off"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  154,
  'Lisbon',
  true,
  32,
  'https://www.viator.com/tours/Lisbon/Setubal-and-Arrabida-Small-Group-Tour-from-Lisbon/d538-7589P3',
  'Viator'
);

-- 5) Lisbon Surf Experience (23590P3)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Surf Experience: Hidden Spots with a Local Surfer',
  'Discover Lisbon''s best-kept surf secrets with a local surfer who knows every hidden break along the coast. Just 10 to 30 minutes from the city centre, you''ll find white sand beaches and world-class waves for every level — from complete beginners to experienced surfers. Your guide picks the perfect spot based on the day''s sea conditions and your skill level, ensuring the best possible session. Enjoy a 2-hour surf lesson with all equipment provided, including board and wetsuit, plus transport from the meeting point at the Lisbon Zoo. With a certified instructor, full insurance and the inside knowledge of a local, this is the most authentic way to experience Lisbon''s incredible surf culture.',
  'Surf Lisbon''s hidden coastal spots with a local surfer guide — 2-hour lesson with all equipment, transport and certified instructor included.',
  'Lisbon Coast',
  'Main entrance of the Lisbon Zoo',
  38.7420,
  -9.1699,
  50,
  'EUR',
  '3h 30min',
  NULL,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/51/df/ee.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/51/df/ee.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/17/7f/9c.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/51/e7/9c.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/51/ed/75.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/17/7f/af.jpg"]'::jsonb,
  '["Surf hidden spots only locals know about","2-hour lesson with a certified surf instructor","All equipment included: board, wetsuit and accessories","Transport to the beach from the Lisbon Zoo","Spot chosen based on conditions and your level","Suitable for beginners and experienced surfers","Local guide who lives and breathes Lisbon''s surf culture"]'::jsonb,
  '["Local surf guide","Transport to the beach","Certified and experienced surf instructor","Full surf equipment (board and wetsuit)","Sports insurance","2-hour surf session"]'::jsonb,
  '["Portuguese","English","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  152,
  'Lisbon',
  true,
  33,
  'https://www.viator.com/tours/Lisbon/Lisbon-Surf-Experience/d538-23590P3',
  'Viator'
);
