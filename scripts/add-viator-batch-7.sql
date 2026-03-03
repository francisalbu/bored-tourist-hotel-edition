-- ============================================
-- Batch 5: Add 5 Viator experiences to Supabase
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Arrábida Safari (66870P4)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Arrábida Safari: Europe''s Most Beautiful Beach & Hidden Gems',
  'Climb aboard a classic convertible Jeep 4x4 and venture deep into the wild heart of Arrábida Natural Park on roads most visitors never see. Your local guide will drive you through the most secret and inhospitable trails inside the park, revealing prehistoric ruins, a hidden cave and the dense Mediterranean forest that blankets the mountains. Discover the raw, untouched side of the Arrábida coastline before arriving at Galapinhos Beach — voted the most beautiful beach in Europe by European Best Destinations. Spend a relaxed afternoon on pristine golden sand, swimming in crystal-clear turquoise waters surrounded by dramatic cliffs. With hotel pickup and drop-off included, this is the ultimate off-road adventure just south of Lisbon.',
  'An off-road Jeep adventure through Arrábida Natural Park — discover hidden caves, prehistoric ruins and spend the afternoon at Europe''s most beautiful beach.',
  'Arrábida Natural Park, Setúbal',
  'Hotel pickup in Lisbon',
  38.4894,
  -8.9757,
  99,
  'EUR',
  '7h',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/2b/11/41.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/2b/11/41.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/a4/fc.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/b8/2c.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/96/97/19.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/73/37/7d.jpg"]'::jsonb,
  '["Ride in a classic convertible Jeep 4x4 through secret trails","Visit Galapinhos — voted Europe''s most beautiful beach","Explore prehistoric ruins and a hidden cave","Drive through Arrábida''s dense Mediterranean forest","Afternoon of swimming in crystal-clear turquoise waters","Hotel pickup and drop-off included","Local guide who knows every hidden corner of the park"]'::jsonb,
  '["Hotel pickup and drop-off","Local guide","Bottled water","Classic Jeep 4x4 drive"]'::jsonb,
  '["English","French","Portuguese","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  190,
  'Lisbon',
  true,
  24,
  'https://www.viator.com/en-GB/tours/Lisbon/Arrabida-Jeep-tour-to-the-most-beautiful-beach-of-Europe/d538-66870P4',
  'Viator'
);

-- 2) Slave Trade Historical Walking Tour (14060P13)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'The Slave Trade in Lisbon: Historical Walking Tour',
  'On this small-group 3-hour walking tour, discover a side of Lisbon''s history rarely told. Learn how Portugal created the Atlantic Slave Trade in the 15th century and how slavery went hand in hand with the famous journeys of exploration. Your professional guide will walk you through the locations in Lisbon''s historic centre directly associated with the slave trade and African history — from the medieval fountain at Largo do Chafariz de Dentro to key sites across Alfama and the old city. The tour also addresses Portugal''s contemporary history and the recent fall of the colonial empire in the mid-1970s. An essential, educational experience for anyone who wants to understand the full complexity of Lisbon''s past and its lasting impact on the present.',
  'A powerful 3-hour walking tour through Lisbon''s historic centre exploring the Atlantic Slave Trade, African history and the legacy of Portugal''s colonial empire.',
  'Alfama, Lisbon',
  'Largo do Chafariz de Dentro (in front of the medieval fountain), Lisbon',
  38.7108,
  -9.1289,
  33,
  'EUR',
  '3h',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/36/07/f1.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/36/07/f1.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/26/dc/44.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/26/dc/49.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/36/07/f2.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/26/dc/43.jpg"]'::jsonb,
  '["Discover the untold history of the Atlantic Slave Trade in Lisbon","Visit key historical locations across the old city centre","Learn how exploration and slavery went hand in hand","Covers contemporary history and the fall of the colonial empire","Professional guide specialised in African and colonial history","Small group for an intimate, educational experience","Perfect 5.0 rating from 176 reviews"]'::jsonb,
  '["Professional guide","Local taxes"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  176,
  'Lisbon',
  true,
  25,
  'https://www.viator.com/en-GB/tours/Lisbon/The-Slave-Trade-in-Lisbon-A-historical-walking-tour/d538-14060P13',
  'Viator'
);

-- 3) Portuguese Petiscos Cooking Class (325678P3)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Portuguese Petiscos Cooking Class in Lisbon',
  'Petiscos are Portugal''s answer to tapas — simple, delicious small plates meant to be shared with friends over good wine and conversation. In this hands-on cooking class at Homecooking Lisbon, you''ll learn how to recreate these beloved dishes at home with easy, impressive recipes. No cooking experience needed — the friendly team of chefs and instructors will guide you through every step. The menu changes seasonally to feature the freshest premium ingredients Portugal has to offer, so you''ll always be working with what''s best that time of year. After cooking, sit down and enjoy the petiscos you''ve prepared, paired with Portuguese wines, beer and other beverages — all included. A fun, social way to dive into Portuguese food culture.',
  'A hands-on 3-hour class where you learn to cook Portuguese petiscos (tapas-style small plates) with seasonal ingredients — then enjoy them with wines included.',
  'Lisbon',
  'Rua da Aliança Operária 54-A, 1300-049 Lisbon',
  38.7075,
  -9.1611,
  85,
  'EUR',
  '3h',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/08/95/e3.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/08/95/e3.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/08/95/e6.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/08/95/e7.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/08/95/e8.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/08/95/ec.jpg"]'::jsonb,
  '["Learn to make authentic Portuguese petiscos (tapas-style plates)","Seasonal menus with the freshest premium ingredients","No cooking experience needed — step-by-step guidance","Enjoy your creations with Portuguese wines and beer","Fun, social atmosphere at Homecooking Lisbon HUB","Simple recipes you can easily recreate at home","Perfect 5.0 rating — a top-rated cooking experience"]'::jsonb,
  '["All ingredients and equipment","Portuguese wines and beer","Carbonated beverages","Bottled water","Snacks","Tea and coffee"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  31,
  'Lisbon',
  true,
  26,
  'https://www.viator.com/en-GB/tours/Lisbon/Portuguese-Petiscos-Cooking-Class/d538-325678P3',
  'Viator'
);

-- 4) Lisbon Painting Workshop in Majólica (5636223P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Portuguese Tile Painting Workshop: Majólica Technique',
  'Paint your own traditional Portuguese azulejo tiles in this creative, history-rich workshop. Discover the Majólica technique — one of the most emblematic methods of Portuguese ceramics — in a relaxed environment surrounded by authentic tiles. The experience begins with a practical introduction to the technique, materials and painting on raw glass. Over 60 minutes, you''ll paint 2 tiles per person, choosing between free painting or stencils with beautiful historical and cultural designs: 17th-century patterns, Pombaline tiles from Lisbon''s reconstruction after the 1755 earthquake, classic 18th-century motifs, or iconic images like the Lisboeta electric tram and the Portuguese sardine. Your tiles are then fired in the ceramic oven and can be picked up at the store in 3–4 business days or shipped to your home. A unique piece of Lisbon, made by your own hands.',
  'Paint your own Portuguese azulejo tiles using the traditional Majólica technique — choose from historical patterns and take home a unique handmade souvenir.',
  'Lisbon',
  'Majólica Workshop, Lisbon',
  38.7139,
  -9.1394,
  35,
  'EUR',
  '1h',
  NULL,
  'Learn & Create',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6a/b6/f0/caption.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6a/b6/f0/caption.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6a/b6/f8/caption.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6a/b7/0e/caption.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6a/b7/1e/caption.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6a/b7/45/caption.jpg"]'::jsonb,
  '["Learn the traditional Majólica ceramic technique","Paint 2 tiles per person with historical designs","Choose from 17th-century patterns, Pombaline tiles or iconic Lisbon motifs","Tiles fired in a real ceramic oven","Pick up at the store in 3–4 days or ship home","Relaxed, creative environment surrounded by authentic azulejos","Take home a unique, handmade piece of Lisbon"]'::jsonb,
  '["All ceramic materials and paints","2 tiles per person","Practical introduction to the technique","Oven firing of your tiles"]'::jsonb,
  '["English","French","Portuguese","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  0,
  0,
  'Lisbon',
  true,
  27,
  'https://www.viator.com/en-GB/tours/Lisbon/Lisbon-Painting-Workshop-in-Majolica/d538-5636223P1',
  'Viator'
);

-- 5) Lisbon Street Photography Photowalks (5614014P2)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Street Photography Photowalk with a Pro Photographer',
  'This is not your typical photo tour of postcard views and preset stops. Led by Jaki, a working photographer and co-founder of the Lisbon Street Photo Fest, this experience focuses on how to see rather than where to go. You''ll walk through areas of Lisbon chosen for their light, texture and atmosphere, learning how to read a scene, notice timing and rhythm, and photograph with intention instead of impulse. The group stays deliberately small so everyone receives personal guidance, no matter what camera they use — from smartphones to professional gear. By the end of the walk, you''ll understand how street photographers approach a city and how to translate what you see into meaningful, compelling images. A transformative experience for anyone who wants to go beyond snapshots.',
  'A guided photowalk with a professional street photographer — learn to see Lisbon through light, texture and timing, and capture meaningful images with any camera.',
  'Lisbon',
  'Fábrica Coffee Roasters, Praça do Comércio, Lisbon',
  38.7083,
  -9.1368,
  700,
  'EUR',
  '3h',
  NULL,
  'Learn & Create',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/05/cf/6b.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/05/cf/6b.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/05/cf/6c.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/05/cf/6d.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/05/cf/6e.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/05/cf/6f.jpg"]'::jsonb,
  '["Led by Jaki, co-founder of the Lisbon Street Photo Fest","Focus on seeing — not just shooting postcard views","Learn to read scenes, timing and rhythm in street photography","Personal guidance in a deliberately small group","Suitable for any camera — smartphone to professional","Walk through areas chosen for light, texture and atmosphere","A transformative experience that goes beyond typical photo tours"]'::jsonb,
  '["Professional street photographer guide","Tea and coffee","Personal guidance and feedback"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  0,
  0,
  'Lisbon',
  true,
  28,
  'https://www.viator.com/en-GB/tours/Lisbon/Lisbon-Street-Photography-Photowalks/d538-5614014P2',
  'Viator'
);
