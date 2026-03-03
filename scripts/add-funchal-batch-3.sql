-- ============================================
-- Funchal Batch 3: 8 experiences (6 Viator + 2 GYG)
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- Viator: Funchal: Scuba Diving Experience for Beginners (409330P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Funchal: Scuba Diving Experience for Beginners',
  'Start the experience at the Madeira Divepoint, which boasts its own private reef. Following an introduction and safety briefing, practice breathing and floating in a pool to get familiar with the equipment. To finish, head out to the reef to explore an incredible underwater world. Come face to face with colorful fish and striking coral as you enjoy the thrill of your first dive.',
  'Start the experience at the Madeira Divepoint, which boasts its own private reef. Following an introduction and safety briefing, practice breathing and floating in a pool to get familiar with the equi',
  'The dive center is inside the Pestana Carlton Hotel. Use the 2 elevators to go down to sea level to ',
  'The dive center is inside the Pestana Carlton Hotel. Use the 2 elevators to go down to sea level to reach it.',
  32.6669,
  -16.9241,
  85.0,
  'EUR',
  '3h',
  NULL,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/4f/97/a4.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/4f/97/a4.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/4f/97/f5.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/4f/98/44.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/4f/98/6f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/4f/98/91.jpg"]'::jsonb,
  '["Funchal: Scuba Diving Experience for Beginners"]'::jsonb,
  '["Full Insurance", "Use of SCUBA equipment", "Dive in the sea (when Ocean Dive option is selected)", "Safety and training session", "PADI Instructor"]'::jsonb,
  '["English", "German", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  54,
  'Funchal',
  true,
  197,
  'https://www.viator.com/tours/Madeira/Scuba-Diving-Experience-for-Beginners/d5392-409330P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- Viator: Madeira Sidecar Adventure – Old West Road (1 or 2 Persons) (9951P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Madeira Sidecar Adventure – Old West Road (1 or 2 Persons)',
  'Indulge in a private 3-hour coastal and hillside adventure in Madeira aboard a classic sidecar motorcycle. Explore historic roads and visit some of Madeira’s most breathtaking viewpoints, including Cabo Girão and Câmara de Lobos. This scenic sidecar tour is perfect for photography enthusiasts, offering plenty of stops for photos, relaxing coffee breaks, and engaging stories from your expert local guide. Fully customizable to suit your preferred time, pace, and interests, this private Madeira island tour guarantees an unforgettable and personalized experience.',
  'Indulge in a private 3-hour coastal and hillside adventure in Madeira aboard a classic sidecar motorcycle. Explore historic roads and visit some of Madeira’s most breathtaking viewpoints, including Ca',
  'Please come to our office where your sidecar driver awaits you.',
  'Please come to our office where your sidecar driver awaits you.',
  32.6669,
  -16.9241,
  0,
  'EUR',
  '1h',
  NULL,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/08/6b/fd/7e.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/08/6b/fd/7e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/75/c5/97.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/08/6b/fe/0c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/08/6b/fd/8c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/08/6b/fd/fc.jpg"]'::jsonb,
  '["Madeira Sidecar Adventure – Old West Road (1 or 2 Persons)"]'::jsonb,
  '["All taxes, fees and handling charges", "Driver/guide", "Helmet(s) and disposable rain ponchos", "Insurance", "Gas"]'::jsonb,
  '["English", "French", "German", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  235,
  'Funchal',
  true,
  198,
  'https://www.viator.com/tours/Madeira/Madeira-Scenic-Tour-by-Sidecar/d5392-9951P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- Viator: Fado Show with Wine and History in Madeira (5538552P6)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Fado Show with Wine and History in Madeira',
  'Immerse yourself in the soul of Madeira history at Fado & Fado, where music and tradition come together in a truly unique setting. Each performance is a journey through the history of Fado, passed down through generations. From its traditional roots to modern interpretations, the show weaves together haunting melodies and rich storytelling. Between songs, the musicians share tales of its origins, evolution, and the legendary figures who shaped this deeply emotional genre. They’ll also guide you through the meaning behind each piece, revealing the poetic essence that makes Fado so unique. As you enjoy the music, enjoy a glass of fine Portuguese wine, included with your ticket, making the experience even more memorable. Surrounded by centuries-old walls, you’ll witness the timeless beauty...',
  'Immerse yourself in the soul of Madeira history at Fado & Fado, where music and tradition come together in a truly unique setting. Each performance is a journey through the history of Fado, passed dow',
  'Funchal',
  '',
  32.6669,
  -16.9241,
  25.0,
  'EUR',
  '50min',
  NULL,
  'Culture',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/65/44.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/65/44.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/65/45.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/65/46.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/65/47.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/65/41.jpg"]'::jsonb,
  '["Watch a live Fado show, learn about it''s history and enjoy a glass of Madeira Wine."]'::jsonb,
  '["Glass of Madeira Wine"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.6,
  14,
  'Funchal',
  true,
  199,
  'https://www.viator.com/tours/Funchal/Fado-Show-with-Wine-and-History-in-Madeira/d22388-5538552P6?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- Viator: Fanal Assobiadores - Mountain Walk (23651P17)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Fanal Assobiadores - Mountain Walk',
  'A very special foot expedition for regular walkers! Starting at Paul da Serra and finishing in Fanal, this full-day breathtaking 7.15 mile (11.5km) walk is one of the few places in Madeira where you can see the Laurissilva vegetation at its best.',
  'A very special foot expedition for regular walkers! Starting at Paul da Serra and finishing in Fanal, this full-day breathtaking 7.15 mile (11.5km) walk is one of the few places in Madeira where you c',
  'In front of the main entrance of Marina Shopping in the city center.',
  'In front of the main entrance of Marina Shopping in the city center.',
  32.6669,
  -16.9241,
  43.0,
  'EUR',
  'Full day',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/73/4a/df.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/73/4a/df.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/ab/f2/43.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/73/4a/e1.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/ab/f2/29.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/73/4a/f1.jpg"]'::jsonb,
  '["Fanal Assobiadores - Mountain Walk"]'::jsonb,
  '["11 Km Walk", "Professional guide", "All taxes, fees and handling charges", "Hotel pickup and drop-off (selected hotels only)"]'::jsonb,
  '["English", "French", "German", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.6,
  30,
  'Funchal',
  true,
  200,
  'https://www.viator.com/tours/Madeira/Fanal-Assobiadores-Levada-Walk/d5392-23651P17?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- Viator: Scuba Diving Experience in Madeira (39129P5)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Scuba Diving Experience in Madeira',
  'Discover the amazing sensation of scuba diving in the sparkling blue sea of Madeira. Explore new worlds, make new friends, and enjoy a unique activity.',
  'Discover the amazing sensation of scuba diving in the sparkling blue sea of Madeira. Explore new worlds, make new friends, and enjoy a unique activity.',
  'Please watch this video to find easily our location:
https://youtube.com/shorts/xM2QYD9PIr4?si=uL2DD',
  'Please watch this video to find easily our location:
https://youtube.com/shorts/xM2QYD9PIr4?si=uL2DD-DL-rO3YViy
',
  32.6669,
  -16.9241,
  85.0,
  'EUR',
  '2h 30min',
  NULL,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/ee/5f/5c.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/ee/5f/5c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/0b/7e/71.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0e/80/bd/c2.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/eb/04/df.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/eb/04/bb.jpg"]'::jsonb,
  '["Scuba Diving Experience in Madeira"]'::jsonb,
  '["Use of SCUBA equipment", "Professional instructor ", "All Fees and Taxes"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  267,
  'Funchal',
  true,
  201,
  'https://www.viator.com/tours/Funchal/TRY-SCUBA-DIVING/d22388-39129P5?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- Viator: Madeira Levada Walk - Rabacal Lakes and Fountains (7543P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Madeira Levada Walk - Rabacal Lakes and Fountains',
  'The levada walk will allow hikers to enjoy the evergreen and luxuriant Rabacal valley situated within the natural park of Madeira, in the North West of the island and discover the concealed treasures of the indigenous Laurisilva forest with its abundance of mosses, lichens and ferns. As you stroll along the levada to Risco and the 25 fountains, the cascading waterfalls will seem to be singing fountains and the tiny translucent lakes will enchant you.',
  'The levada walk will allow hikers to enjoy the evergreen and luxuriant Rabacal valley situated within the natural park of Madeira, in the North West of the island and discover the concealed treasures ',
  'Will will confirm exact pickup location with confirmation e-mail',
  'Will will confirm exact pickup location with confirmation e-mail',
  32.6669,
  -16.9241,
  44.0,
  'EUR',
  '7h',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/74/87/c7.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/74/87/c7.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/fd/1f/3b.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/fd/1f/41.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/fd/1f/4b.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/fd/1f/4c.jpg"]'::jsonb,
  '["Madeira Levada Walk - Rabacal Lakes and Fountains"]'::jsonb,
  '["Professional guide", "Pickup and drop-off from designated meeting points", "Driver/guide", "Hotel/port pickup and drop-off"]'::jsonb,
  '["English", "French", "German", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.4,
  50,
  'Funchal',
  true,
  202,
  'https://www.viator.com/tours/Madeira/Madeira-Levada-Walk-Rabacal-Lakes-and-Fountains/d5392-7543P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- GYG: Madeira: Aventura Off-Road de ATV ou Quad - Adrenalina (t756800)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Madeira: Aventura Off-Road de ATV ou Quad - Adrenalina',
  'Instagram: Quad_Madeira (follow for more).

Welcome to Quad Xperience, your gateway to unforgettable experiences in nature!
Quad Xperience Tours is a company specialised in off road Quad Bike tours',
  'Instagram: Quad_Madeira (follow for more).

Welcome to Quad Xperience, your gateway to unforgettable experiences in nature!
Quad Xperience Tours is a company specialised in off road Quad Bike tours',
  'Funchal',
  '',
  39.399871826171875,
  -8.224453926086426,
  110.0,
  'EUR',
  '2h 30min',
  NULL,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/004d64c02e8bffbe13db6946179a14ba933af07ddde601a6dea1ca144533cad5.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/004d64c02e8bffbe13db6946179a14ba933af07ddde601a6dea1ca144533cad5.jpeg/145.jpg"]'::jsonb,
  '["2 starting location options:Caminho da Chã, Caminho da Chã", "Casa das FundurasQuad bike ride", "Secret stopQuad bike ride", "Viewpoint PortelaQuad bike ride", "2 drop-off locations:Caminho da Chã, Caminho da Chã"]'::jsonb,
  '["Explore Porto da Cruz", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  336,
  'Funchal',
  true,
  203,
  'https://www.getyourguide.com/en-gb/porto-da-cruz-l142617/madeira-aventura-off-road-de-atv-ou-quad-adrenalina-t756800/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Madeira: Coasteering Adventure with Snorkeling, w/pick-up (t873844)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Madeira: Coasteering Adventure with Snorkeling, w/pick-up',
  'Discover the stunning coastline of Madeira on a coasteering adventure. Jump off cliffs, snorkel in crystal-clear waters, swim through sea caves, and scramble over rocks, all-year activity, 20ºC waters',
  'Discover the stunning coastline of Madeira on a coasteering adventure. Jump off cliffs, snorkel in crystal-clear waters, swim through sea caves, and scramble over rocks, all-year activity, 20ºC waters',
  'Funchal',
  '',
  32.648311614990234,
  -16.835758209228516,
  64.4,
  'EUR',
  '5h',
  NULL,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/bf30675004942957b624b9923a4ed8440c32f5673196a0da94c72ff765695061.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/bf30675004942957b624b9923a4ed8440c32f5673196a0da94c72ff765695061.jpeg/145.jpg"]'::jsonb,
  '["55 out of 5 starsCCyle – IrelandSeptember 22, 2025 - Verified booking This was a great activity, sup"]'::jsonb,
  '["Explore Machico", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  103,
  'Funchal',
  true,
  204,
  'https://www.getyourguide.com/en-gb/madeira-l67/madeira-coasteering-adventure-with-snorkeling-wpick-up-t873844/?partner_id=BONZK5E',
  'GetYourGuide'
);

