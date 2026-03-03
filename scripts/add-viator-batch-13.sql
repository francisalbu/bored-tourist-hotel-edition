-- ============================================
-- Batch 13: Add 6 Viator experiences to Supabase
-- Products: 279535P1, 121012P3, 7626P564, 75380P3, 11392P9, 66870P6
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Sunset sailboat tour in Lisbon with green wine (279535P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Sunset sailboat tour in Lisbon with green wine',
  'Experience the magic of Lisbon aboard our sailboat, where relaxation meets breathtaking views. Sip your favorite drink as the city’s iconic skyline transforms under the golden hues of a sunset like no other. Capture picture-perfect moments that will make your memories last a lifetime. Our experienced crew is here to ensure your journey is as seamless as it is unforgettable. Whether you’re a seasoned sailor or a first-time adventurer, this is your chance to see Lisbon from a whole new perspective—gliding over the serene waters of the Tejos River. Join us for an evening of tranquility, beauty, and unparalleled views. This isn’t just another sunset; it’s the sunset experience you’ve been dreaming of.',
  'Experience the magic of Lisbon aboard our sailboat, where relaxation meets breathtaking views. Sip your favorite drink as the city’s iconic skyline transforms under the golden hues of a sunset like no',
  'Our meeting point is next to the dock entrance.',
  'Our meeting point is next to the dock entrance.',
  38.7223,
  -9.1393,
  40.0,
  'EUR',
  '2h',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/c3/7b/d6.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/c3/7b/d6.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/c3/7b/82.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/c3/7c/f4.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0e/93/65/d6.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/c3/7c/f1.jpg"]'::jsonb,
  '["See Caís do Sodré from the river.", "See Terreiro do Paço from the river.", "See Cristo Rei from the river.", "We pass under the bridge, next to the pillars.", "See MAAT from the river.", "See Padrão dos Descobrimentos from the river.", "See Torre de Belém from the river."]'::jsonb,
  '["All Fees and Taxes", "Alcoholic beverages"]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  52,
  'Lisbon',
  true,
  57,
  'https://www.viator.com/en-GB/tours/Lisbon/Sailing-Tour-on-Tejo-River/d538-279535P1',
  'Viator'
);

-- 2) Half day Spa Water Therapy experience at THE SPA at Corinthia Lisbon (121012P3)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Half day Spa Water Therapy experience at THE SPA at Corinthia Lisbon',
  'Offering harmony and tranquillity in the heart of one of Europe''s most beautiful cities, THE SPA at Corinthia Lisbon presents an exclusive collection from world-renowned spa treatment and facilities. Awarded “Portugal''s Best Hotel Spa” by the World Spa Awards 2023.',
  'Offering harmony and tranquillity in the heart of one of Europe''s most beautiful cities, THE SPA at Corinthia Lisbon presents an exclusive collection from world-renowned spa treatment and facilities. ',
  'Corinthia Lisbon - Spa reception',
  'Corinthia Lisbon - Spa reception',
  38.7223,
  -9.1393,
  85.0,
  'EUR',
  '2h',
  NULL,
  'Wellness',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/34/0e/89.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/34/0e/89.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/34/1b/c3.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/34/1b/dd.jpg"]'::jsonb,
  '["Half day Spa Water Therapy experience at THE SPA at Corinthia Lisbon"]'::jsonb,
  '["Water Therapy Circuit (2 Hours)", "Indoor Pool", "Sun Deck Lounge", "Provided during the activity: bathrobe, slippers, towels and a selection of flavoured waters."]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  51,
  'Lisbon',
  true,
  58,
  'https://www.viator.com/en-GB/tours/Lisbon/Day-Spa/d538-121012P3',
  'Viator'
);

-- 3) Private Traditional Portuguese Cooking Class in Lisbon with Paula (7626P564)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Private Traditional Portuguese Cooking Class in Lisbon with Paula',
  'Enjoy a private and authentic cooking class in a local home kitchen with your host Paula. This is a wonderful experience for anyone looking to connect with local culture over food. Your cooking class will take place in a local home kitchen where Paula will teach you 2-3 traditional Portuguese-influenced Goan dishes from her family recipes. After cooking, you will enjoy your meal together in Paula''s home. Please note, for parties larger than two guests, you will start your experience in Paula’s home with a welcome drink and snacks, and then walk across the street to Paula’s cooking studio (located just across the street from Paula''s apartment) to cook and eat there. • Cooking lesson in a local home • Introduction to Portuguese and Portuguese-influenced Goan dishes • 100% private activity...',
  'Enjoy a private and authentic cooking class in a local home kitchen with your host Paula. This is a wonderful experience for anyone looking to connect with local culture over food. Your cooking class ',
  'Meet your host at Da Cacilhas, a red kiosk located at the exit of the ferry in Cacilhas. To get here',
  'Meet your host at Da Cacilhas, a red kiosk located at the exit of the ferry in Cacilhas. To get here, take a 7-min ferry from Cais do Sodre in Lisbon and get off at the Cacilhas stop. Paula will meet you at the red kiosk in Cacilhas and together you will walk 5 min to get to her apartment. ',
  38.7223,
  -9.1393,
  94.0,
  'EUR',
  '3h 30min',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/75/e1/66.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/75/e1/66.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/75/e1/63.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/75/e1/5f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/75/e1/5e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/75/e1/61.jpg"]'::jsonb,
  '["Private Traditional Portuguese Cooking Class in Lisbon with Paula"]'::jsonb,
  '["Alcoholic beverages", "Private cooking class and meal with your host Paula", "Pick up from Cacilhas ferry terminal"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  50,
  'Lisbon',
  true,
  59,
  'https://www.viator.com/en-GB/tours/Lisbon/Private-Traditional-Portuguese-and-Goan-Cooking-Class/d538-7626P564',
  'Viator'
);

-- 4) Half-Day Kayak Tour in Sesimbra (75380P3)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Half-Day Kayak Tour in Sesimbra',
  'Within an hour distance from Lisbon, this is a nature experience you will like to share with your family and friends. Using very stable double-seat sit-on-top Kayaks, you will comfortably and effortlessly paddle along these incredible landscapes.',
  'Within an hour distance from Lisbon, this is a nature experience you will like to share with your family and friends. Using very stable double-seat sit-on-top Kayaks, you will comfortably and effortle',
  'If you need Transfer from Lisbon - we will pick up near the Hard Rock Café.

Booking without transfe',
  'If you need Transfer from Lisbon - we will pick up near the Hard Rock Café.

Booking without transfer
Meeting point - Porto de Sesimbra
2970-152 Sesimbra
(Vertente Natural, shop 6) 

Booking with transfer
Pick up - Av. da Liberdade, 2 - 1250-144 Lisboa (in front of Hard Rock Café)

',
  38.7223,
  -9.1393,
  35.0,
  'EUR',
  '3h',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/74/87/2d.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/74/87/2d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/e5/b7/ab.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/e5/b6/8c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/e5/b6/81.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/e5/b7/85.jpg"]'::jsonb,
  '["Half-Day Kayak Tour in Sesimbra"]'::jsonb,
  '["Life jacket", "Waterproof bag", "Backboard", "Sit-on-top canoe", "Paddle", "Insurance", "Guide"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  49,
  'Lisbon',
  true,
  60,
  'https://www.viator.com/en-GB/tours/Setubal-District/Kayak-Tour/d5016-75380P3',
  'Viator'
);

-- 5) Jewish Sephardic history in Lisbon (11392P9)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Jewish Sephardic history in Lisbon',
  'Explore the history and culture of our Jewish community during this small group tour in Lisbon. Portugal was one of the first world powers to recognize the Jewish people, and has served as an important home for the community ever since. You will stop by historic areas, important memorials, and landmarks, especially the Shaare Tikva, Lisbon’s synagogue, to learn about the history of various religions in the city.',
  'Explore the history and culture of our Jewish community during this small group tour in Lisbon. Portugal was one of the first world powers to recognize the Jewish people, and has served as an importan',
  'Your guide will be in front of our synagogue to meet you. ',
  'Your guide will be in front of our synagogue to meet you. ',
  38.7223,
  -9.1393,
  60.0,
  'EUR',
  '4h',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/b7/ae/f6.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/b7/ae/f6.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/b7/ae/f7.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/8e/69/b8.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/a6/c7/97.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/9f/da/af.jpg"]'::jsonb,
  '["From the synagogue we walk through the Principe Real Park down to the Chiado neighborhood.", "Reaching Chiado, you will learn about a very famous Jewish writer and see one curiosity in the oldes"]'::jsonb,
  '["Guaranteed to skip ticket lines.", "Visit the Sinagoga Shaare Tikva from the inside (tickets included);", "Guide will accompany you inside locations to explain its history;", "Small group tour with Professional guide;"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.6,
  48,
  'Lisbon',
  true,
  61,
  'https://www.viator.com/en-GB/tours/Lisbon/The-Jewish-Odyssey-in-Lisbon/d538-11392P9',
  'Viator'
);

-- 6) Jurassic Hiking tour to footprints of dinosaur in Espichel Cape (66870P6)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Jurassic Hiking tour to footprints of dinosaur in Espichel Cape',
  'Discover on the promontory, on a ledge of the Jurassic cliffs located in the mysterious Espichel Cape The second cape more Western of Europe,the incredible footprints of dinosaurs. Are an ichnofossil of tracks left by saurops and theropods, about 150 million years ago. A location simultaneously isolated and insulating, desolate, rough where the mountain´s lush and vigorous vegetation is nearly impenetrable by man and where the promontory´s absolute aridness is uninhabitable, but to where people were attacted because of the site´s frontier-like and mysterious nature.',
  'Discover on the promontory, on a ledge of the Jurassic cliffs located in the mysterious Espichel Cape The second cape more Western of Europe,the incredible footprints of dinosaurs. Are an ichnofossil ',
  'Lisbon',
  '',
  38.7223,
  -9.1393,
  88.0,
  'EUR',
  '7h',
  NULL,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/7c/fc/05.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/7c/fc/05.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/fa/9d/15.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/33/68.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/3f/db.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/3f/cf.jpg"]'::jsonb,
  '["Walk in a historic military structure located in Sesimbra and take astonishing pictures of beautiful", "Walk in the medieval streets of the picturesque fishing village of Sesimbra, that offers a huge vari"]'::jsonb,
  '["Hotel pickup and drop-off", "Qualified guide", "Transport by private vehicle"]'::jsonb,
  '["English", "French", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  47,
  'Lisbon',
  true,
  62,
  'https://www.viator.com/en-GB/tours/Lisbon/Hiking-tour-to-footprints-of-dinosaur-in-Espichel-Cape/d538-66870P6',
  'Viator'
);

