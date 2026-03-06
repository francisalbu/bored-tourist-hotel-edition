-- ============================================
-- Batch Caparica-1: 8 Viator experiences for WOT Soul Costa da Caparica
-- Data fetched via Viator Partner API (exp-api-key: 0a9b6163-...)
-- Prices, descriptions, images and ratings all from live API
-- Run in: Supabase Dashboard → SQL Editor
-- display_order: 218–225
-- ============================================

-- 1) Quad Bike Tour in Lisbon (472426P1) — EUR 129 / 2h
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Quad Bike Tour in Lisbon',
  'This tour takes you to the wild side of Lisbon, visit ancient monuments and experience awe inspiring landscapes with this fun off-road experience! While on a quest to find ancient treasures and secret gems, you will have the opportunity to drive and maneuver quad bikes through diverse terrains and challenging trails. An amazing adventure that blends landscape and culture, and arguably the best kept secret in Lisbon.',
  'Off-road quad bike adventure through dunes and ancient landscapes near Lisbon — no experience required.',
  'Costa da Caparica',
  'Costa da Caparica, Almada',
  38.6411, -9.2353,
  129.0, 'EUR', '2h', 2,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/bb/3e.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/bb/3e.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/bb/4f.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/bb/52.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/bb/4c.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/ba/3f.jpg"]'::jsonb,
  NULL,
  '["Quad bike ride through diverse terrains and challenging trails","Visit ancient monuments and secret gems south of Lisbon","Awe-inspiring coastal landscapes","All fees and taxes included","Suitable for all experience levels"]'::jsonb,
  '["All fees and taxes"]'::jsonb,
  '["English","Portuguese","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0, 9, 'Costa da Caparica',
  true, 218,
  'https://www.viator.com/en-GB/tours/Lisbon/Quad-bike-tour-Lisbon/d538-472426P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 2) The Surf Instructor in Costa da Caparica (160709P1) — EUR 50 / 3h 30min
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'The Surf Instructor in Costa da Caparica',
  'Surfing is not a sport but a passion, once in a life you must try the feeling of riding a wave! With us you will be able to do that in a fun and safe way, and you''re going to have a unique memory taken by our professional photographer!',
  'Surf lesson at Costa da Caparica with certified instructor + professional photographer — all levels welcome.',
  'Costa da Caparica',
  'Praia da Costa da Caparica, Almada',
  38.6411, -9.2353,
  50.0, 'EUR', '3h 30min', 15,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/9d/22/bd.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/9d/22/bd.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/f8/2b/9a.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/9d/ac/e4.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/9d/ad/53.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/9d/ad/68.jpg"]'::jsonb,
  NULL,
  '["Certified surf instructor on one of Europe''s best Atlantic beaches","Professional photographer captures your session","Safe and fun environment for all levels","Private transportation included","Unforgettable first-wave experience"]'::jsonb,
  '["Private transportation","Surfboard and wetsuit","Professional photographer"]'::jsonb,
  '["English","Portuguese","Spanish","French"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9, 404, 'Costa da Caparica',
  true, 219,
  'https://www.viator.com/en-GB/tours/Lisbon/The-Surf-Instructor/d538-160709P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 3) Portuguese Cooking Class at Local Market (9963P25) — EUR 100 / 6h
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Portuguese Cooking Class at Local Market',
  'Get a deeper insight into the true culinary and typical Portuguese cuisine during a cooking class and an excursion to the local market selling fish, meat, fruits and vegetables. A practical experience designed for lovers of gastronomy, this tour allows you to explore Portuguese cuisine in more depth than simply eating in restaurants. Choose fresh ingredients from a list we will provide, buy them at a traditional market, then prepare and delight in the fruits of your work.',
  'Guided Lisbon market visit + hands-on Portuguese cooking class + lunch — all included.',
  'Lisbon',
  'Central Lisbon (meeting point confirmed on booking)',
  38.7169, -9.1399,
  100.0, 'EUR', '6h', NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/95/83/2c.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/95/83/2c.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/0d/7c/12.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/95/82/ef.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/0d/7c/07.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/95/84/8c.jpg"]'::jsonb,
  NULL,
  '["Guided excursion to a traditional Lisbon market","Hands-on cooking class with authentic Portuguese recipes","Lunch of what you prepared — included","Air-conditioned transport","Deep dive into authentic Portuguese gastronomy"]'::jsonb,
  '["Lunch","Air-conditioned vehicle","Cooking class with chef","Market tour"]'::jsonb,
  '["English","Portuguese","Spanish","French"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0, 3, 'Lisbon',
  true, 220,
  'https://www.viator.com/en-GB/tours/Lisbon/Food-Tour-Cooking-Class-and-Lunch-at-a-Market-with-Local-Market-Tour/d538-9963P25?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 4) Ride and Relax Beach Escape — Costa da Caparica (9963P31) — EUR 385 / 8h
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Ride and Relax Beach Escape at Costa da Caparica',
  'Experience the beauty of Costa da Caparica on a private day trip that combines a guided 2-hour horseback ride through dunes, forest trails and sea, with exclusive access to a beach club. Enjoy roundtrip transfers, a reserved sunbed and umbrella, welcome drink, seaside lunch, and personalized service for an unforgettable escape.',
  'Private horseback ride through dunes + exclusive beach club access with sunbed, lunch and welcome drink.',
  'Costa da Caparica',
  'Costa da Caparica Beach, Almada',
  38.6411, -9.2353,
  385.0, 'EUR', '8h', NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/95/d9.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/95/d9.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/95/92.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/95/dd.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/9a/c8.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/95/c5.jpg"]'::jsonb,
  NULL,
  '["2-hour guided horseback ride through dunes, forest and sea","Exclusive beach club access with reserved sunbed and umbrella","Welcome drink + seaside lunch included","Roundtrip hotel transfer Lisbon ↔ Costa da Caparica","All taxes and insurance included"]'::jsonb,
  '["Seaside lunch with one drink and coffee","Roundtrip hotel transfer (Lisbon – Costa da Caparica)","Welcome drink at beach club","Reserved sunbed and umbrella","All taxes and insurance fees"]'::jsonb,
  '["English","Portuguese","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  NULL, 0, 'Costa da Caparica',
  true, 221,
  'https://www.viator.com/en-GB/tours/Lisbon/Ride-and-Relax-Beach-Escape-Lisbon-Costa-da-Caparica/d538-9963P31?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 5) Horseback Riding — 4 Options (9963P6) — EUR 75 / 2h
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Horseback Riding — Mountain, Lesson, Beach or Arrábida',
  'Dive into Portugal''s stunning natural scenery during this 2-hour horseback ride. Choose to walk through a pine forest near a fossil coast on a path to the stunning beach of Costa da Caparica, go horseback riding in the beautiful environment of the Arrábida Louro Mountain, or simply take a 2-hour horse lesson in the ring. Limited to only six people, this small group excursion offers an intimate experience.',
  'Choose your 2h horseback experience: forest trail to the beach, Arrábida mountain or riding lesson — max 6 people.',
  'Almada',
  'Equestrian Centre, Almada',
  38.6761, -9.1569,
  75.0, 'EUR', '2h', 6,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/f1/94/28.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/f1/94/28.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/85/49/a6.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/67/9a/08.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/67/9a/06.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/bd/47/91.jpg"]'::jsonb,
  NULL,
  '["4 options: forest trail, beach, Arrábida mountain or riding lesson","Small group — maximum 6 people","2-hour intimate equestrian experience in stunning scenery","Pine forest and fossil coast trails","Experienced guides and well-trained horses"]'::jsonb,
  '["Horse, tack and equipment","Experienced guide","Safety helmet"]'::jsonb,
  '["English","Portuguese","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8, 36, 'Costa da Caparica',
  true, 222,
  'https://www.viator.com/en-GB/tours/Almada/Horseback-Riding-Options-1-Horseback-ride-lesson-2-Horseback-ride-Arrabida-3-Horseback-ride-beach/d51024-9963P6?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 6) Surf and Sunset Private Full Day — Almada & Caparica (9963P32) — EUR 225 / 8h
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Surf and Sunset Tour in Almada and Caparica — Private Full Day',
  'Discover the best of Almada and Costa da Caparica on this private full-day tour. Start with a surf session tailored to your experience level on the learner-friendly beach breaks of Costa da Caparica, with all equipment and coaching provided. Then walk through the Arriba Fóssil (Mata dos Medos), where dunes and stone pines frame sweeping ocean views. Visit the Cristo Rei monument for panoramic vistas over Lisbon and the Tagus, descend via the Boca do Vento panoramic elevator, explore historic Cacilhas, and finish the day with a sunset drink on Rua do Ginjal.',
  'Private full day: surf at Caparica + Arriba Fóssil walk + Cristo Rei + sunset drinks in Cacilhas.',
  'Costa da Caparica',
  'Costa da Caparica / Almada',
  38.6411, -9.2353,
  225.0, 'EUR', '8h', NULL,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/a8/f5.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/a8/f5.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/a8/f6.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/9a/cd.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/cb/18.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/9a/c8.jpg"]'::jsonb,
  NULL,
  '["Private surf session at Caparica — all levels, full equipment and coaching","Arriba Fóssil (Mata dos Medos) coastal dune walk","Cristo Rei monument — panoramic views over Lisbon and the Tagus","Boca do Vento panoramic elevator to historic Cacilhas riverfront","Sunset drinks on Rua do Ginjal"]'::jsonb,
  '["Cristo Rei platform/elevator ticket","Private transport within Almada and Costa da Caparica","Taxes and standard liability coverage","1x bottled water per person","Surf equipment and coaching"]'::jsonb,
  '["English","Portuguese","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  NULL, 0, 'Costa da Caparica',
  true, 223,
  'https://www.viator.com/en-GB/tours/Lisbon/Surf-and-Sunset-Tour-in-Almada-and-Caparica-Private-Full-Day/d538-9963P32?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 7) Day Tour — Surfing + Arrábida Wine Tasting with Lunch (5520842P2) — EUR 150 / 9h
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Day Tour — Surfing and Arrábida Wine Tasting with Lunch',
  'A full day of surfing and wine tasting awaits you in Portugal. Start your adventure with a surfing lesson at Costa da Caparica, guided by professional surfer Luís Perloiro, suitable for all skill levels. Then drive with guide Francisco Gomes to enjoy a delicious all-inclusive lunch in the charming town of Sesimbra. Afterward, explore the breathtaking Arrábida National Park before indulging in a private wine tasting at a local vineyard. Perfect for adventure seekers and wine enthusiasts alike — small group of up to 7 people.',
  'Surf lesson at Caparica + all-inclusive lunch in Sesimbra + private wine tasting at Arrábida — max 7 people.',
  'Costa da Caparica',
  'Costa da Caparica / Sesimbra / Arrábida',
  38.6411, -9.2353,
  150.0, 'EUR', '9h', 7,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/6e/8a/f0.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/6e/8a/f0.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/6e/8a/f7.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/6e/8a/fa.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/6e/8b/02.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/6e/8b/08.jpg"]'::jsonb,
  NULL,
  '["Surf lesson with pro surfer Luís Perloiro — all levels welcome","All-inclusive lunch in picturesque Sesimbra","Private wine tasting at a family vineyard in Arrábida National Park","Scenic drive through Arrábida — turquoise water and limestone cliffs","Small group — maximum 7 people"]'::jsonb,
  '["Surf lesson with equipment (surfboard and wetsuit)","Bottled water","All-inclusive lunch in Sesimbra","Private wine tasting","Transport (9-seat van or 7-seat SUV)"]'::jsonb,
  '["English","Portuguese","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  NULL, 0, 'Costa da Caparica',
  true, 224,
  'https://www.viator.com/en-GB/tours/Lisbon/Day-Tour-Surfing-and-Arrabida-Wine-Tasting-Lunch-Included/d538-5520842P2?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 8) Boho Chic Picnic Dinner with Water Views (75909P1090) — EUR 108 / 2h
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Boho Chic Picnic Dinner with Water Views',
  'The perfect blend of authenticity, intimacy, and natural beauty. This is not just a picnic — it''s a carefully curated moment where Portugal''s most stunning landscapes become your private dining room. Whether you''re seated on the golden sands of Costa da Caparica or gazing at the calm waters of the Tagus, each location is handpicked for its breathtaking atmosphere. With bohemian touches, cozy decor, and delicious Portuguese delicacies, every detail is designed to create a magical, slow-paced experience that connects you to the land, the flavors, and the moment. Ideal for romantic escapes, special celebrations, or simply indulging in the joy of nature and good food.',
  'Fully set-up boho-chic picnic dinner at a handpicked scenic spot — Portuguese delicacies, cozy decor, stunning views.',
  'Costa da Caparica',
  'Scenic location near Costa da Caparica / Tagus (confirmed on booking)',
  38.6411, -9.2353,
  108.0, 'EUR', '2h', NULL,
  'Night Explorer',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/94/bc/2a.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/94/bc/2a.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/94/bc/18.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/94/bc/d5.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/94/bc/f6.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/94/bd/0e.jpg"]'::jsonb,
  NULL,
  '["Fully set up — just show up and enjoy","Handpicked scenic spot with stunning water or coastal views","Bohemian styling with cozy decor and warm atmosphere","Delicious Portuguese delicacies included","Perfect for couples, anniversaries and special celebrations"]'::jsonb,
  '["Complete picnic set-up and boho styling","Dinner with Portuguese delicacies"]'::jsonb,
  '["English","Portuguese"]'::jsonb,
  'Free cancellation up to 48h before',
  NULL, 0, 'Costa da Caparica',
  true, 225,
  'https://www.viator.com/en-GB/tours/Almada/A-romantic-boho-chic-picnic-dinner-with-stunning-water-views/d51024-75909P1090?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- ============================================
-- Link all 8 new experiences to WOT Soul Costa da Caparica
-- ============================================
INSERT INTO hotel_experiences (hotel_id, experience_id, is_active, display_order)
SELECT
  'wot-soul-costa-da-caparica' AS hotel_id,
  id                           AS experience_id,
  true                         AS is_active,
  display_order                AS display_order
FROM experiences
WHERE display_order BETWEEN 218 AND 225
ON CONFLICT (hotel_id, experience_id) DO NOTHING;

-- Verification
SELECT COUNT(*) AS linked_to_caparica
FROM hotel_experiences
WHERE hotel_id = 'wot-soul-costa-da-caparica';
