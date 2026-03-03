-- ============================================
-- Funchal Batch 1: 8 experiences (all Viator)
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- Viator: Taste Funchal: food, wine & cultural tour (43786P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Taste Funchal: food, wine & cultural tour',
  'On this exceptional cultural and gustatory experience, you will be taken to off the beaten track to sample amazing traditional food from Madeira while sipping a glass of Madeira wine or a cup of Portuguese tea. The tour starts in the charming historic center with a qualified tour guide who has many years of experience. Your guide will explain the historical and cultural details of the city as well as the traditions behind each dish, which will surely enrich the tour. This tour includes various stops with a visit to the local market, from fruit tasting, traditional honey cake and cookies to the famous local custard tarts, the choices of delicious treats will be enough to satisfy anyone’s cravings. A minimum of 4 people is required for this activity to happen. In the unlikely event of not...',
  'On this exceptional cultural and gustatory experience, you will be taken to off the beaten track to sample amazing traditional food from Madeira while sipping a glass of Madeira wine or a cup of Portu',
  'Start from our office, Madeira Exquisite Food on Foot Tours,
next to Sé Boutique Hotel

',
  'Start from our office, Madeira Exquisite Food on Foot Tours,
next to Sé Boutique Hotel

',
  32.6669,
  -16.9241,
  93.0,
  'EUR',
  '4h',
  NULL,
  'Food & Drinks',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/a2/9e/25.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/a2/9e/25.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/a2/9f/0e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/a2/9e/29.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/a2/9f/1e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/a2/9e/34.jpg"]'::jsonb,
  '["Our qualified local tour guide will meet you at the meeting point and will accompany during all tour"]'::jsonb,
  '["Alcoholic beverages", "Personal Insurance.", "Qualified Tour Guide", "Food and Drinks"]'::jsonb,
  '["English", "French", "German", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  915,
  'Funchal',
  true,
  181,
  'https://www.viator.com/en-GB/tours/Madeira/Madeira-Exquisite-Food-on-Foot-Tours/d5392-43786P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- Viator: Around The Island - Two Days Tour From 9am To 5pm (Each Day) (112367P38)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Around The Island - Two Days Tour From 9am To 5pm (Each Day)',
  'Get involved with nature, history and tradition. Feeling Madeira gives you adventure and a unique experience that you will never forget!',
  'Get involved with nature, history and tradition. Feeling Madeira gives you adventure and a unique experience that you will never forget!',
  'Funchal',
  '',
  32.6669,
  -16.9241,
  60.0,
  'EUR',
  'Full day',
  NULL,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/2b/d6/0d.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/2b/d6/0d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/2b/d6/01.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/2b/d6/04.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/2b/d6/0b.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/2b/d6/0c.jpg"]'::jsonb,
  '["Around The Island - Two Days Tour From 9am To 5pm (Each Day)"]'::jsonb,
  '["GST (Goods and Services Tax)"]'::jsonb,
  '["English", "French", "German", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  804,
  'Funchal',
  true,
  182,
  'https://www.viator.com/en-GB/tours/Funchal/AROUND-THE-ISLAND-TWO-DAYS-TOUR/d22388-112367P38?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- Viator: Sunrise Transfer To Pico Do Arieiro, Hike To Pico Ruivo & Return From Teixeira (192925P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Sunrise Transfer To Pico Do Arieiro, Hike To Pico Ruivo & Return From Teixeira',
  'Shared budget transfers to enjoy this amazing hike in your own rhythm! Designed for travelers that are looking for freedom! Pick-up and drop-off are included in Funchal and Caniço. After we pick all guests (up to 8) in their accommodation in Funchal or Caniço (only), we will go to Pico Do Arieiro 20-45 min. before sunrise and you can enjoy the amazing hike to Pico Ruivo, the highest point of the island! Prepare yourself for stunning landscapes! You will walk on your own rhythm through this famous trail and find the challenging "stairs to heaven" and walk "above the clouds" or with the other guests if you choose to. We will pick you all at the ending point to take you back to your accommodation. The path to do this hike is from Pico Do Arieiro To Pico Ruivo To Achada Do Teixeira (11 km =...',
  'Shared budget transfers to enjoy this amazing hike in your own rhythm! Designed for travelers that are looking for freedom! Pick-up and drop-off are included in Funchal and Caniço. After we pick all g',
  'For customers coming by car to Funchal from other parts of the island outside our pick-up areas (Fun',
  'For customers coming by car to Funchal from other parts of the island outside our pick-up areas (Funchal and Caniço) we recommend to park at Parque 2000 as it is the cheapest and most comfortable parking of Funchal center. We will pick you and drop you there.',
  32.6669,
  -16.9241,
  36.0,
  'EUR',
  '7h 30min',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/3a/f8/f5.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/3a/f8/f5.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/16/91/06.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/16/8f/fd.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/16/91/03.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/16/90/4a.jpg"]'::jsonb,
  '["Pick-up of all travelers (máx. 8) in Funchal and Caniço.", "At the end of the hike, in the drive from Achada Do Teixeira to Funchal/Caniço, we will pass by with"]'::jsonb,
  '["Taxes"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  234,
  'Funchal',
  true,
  183,
  'https://www.viator.com/en-GB/tours/Madeira/Sunrise-At-Pico-Do-Arieiro-Hike-To-Pico-Ruivo/d5392-192925P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- Viator: Jeep Tour Amazing West to Natural Pools -Full-Day (125569P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Jeep Tour Amazing West to Natural Pools -Full-Day',
  'On this Jeep tour we have everything; Sea, Mountains, Waterfalls and Natural Pools. From Funchal to the fishing village of Câmara de Lobos, then we go up to the cliff of Cabo Girão, 580m above of sea level, with an amazing glass platform viewpoint. Next we begin our adventure from sea level to the mountains climbing through old paths where we can see how the local people live and how they work the terraces of banana trees among. We will pass through the forest, mountains valleys and off-road paths to reach places as such Lombo do Mouro, Paul da Serra, Fanal and in Ribeira da Janela we descend to sea level to visit the coast and enjoy the ocean view. In Porto Moniz Village are famous for its Natural Swimming Pools, where we stop for swim, and lunch. Going to Natural Pools of Seixal Villa...',
  'On this Jeep tour we have everything; Sea, Mountains, Waterfalls and Natural Pools. From Funchal to the fishing village of Câmara de Lobos, then we go up to the cliff of Cabo Girão, 580m above of sea ',
  'Funchal',
  '',
  32.6669,
  -16.9241,
  65.0,
  'EUR',
  'Full day',
  NULL,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0e/15/74/82.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0e/15/74/82.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/47/da/fc.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/9a/1b/0a.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/0c/9c/2b.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/47/db/df.jpg"]'::jsonb,
  '["Beatiful tiny village we pass by."]'::jsonb,
  '["Little dose of adrenaline and lots of fun", "Amazing emotions", "We stop for swimming on the Natural Pools off Porto Moniz Village and in Seixal Villa Natural Pools "]'::jsonb,
  '["English", "French", "Italian", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  832,
  'Funchal',
  true,
  184,
  'https://www.viator.com/en-GB/tours/Funchal/Jeep-Tours-4x4/d22388-125569P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- Viator: Porto Moniz, Seixal, Fanal Forest, Cliff Skywalk in Open Roof 4X4 (16720P4)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Porto Moniz, Seixal, Fanal Forest, Cliff Skywalk in Open Roof 4X4',
  'Be ready to join us on an unforgettable adventure that only few people get to experience on a jeep tour. Our first stop takes us to São Vicente waterfall that resembles a bride''s veil. Continuing our tour, we visit the coastal town of Seixal, a hidden treasure with a black volcanic sand beach voted 3erd Best Beach in Europe and the secret place of Poças das Lesmas, where time stands still among ancient lava rock formations. Our journey proceeds to Porto Moniz, where natural volcanic pools are waiting for us to immerse ourselves in the beauty of this unique place. Then, be ready to enjoy an amazing off-road experience as we head to the magical Fanal, one of the 7th natural wonders of Portugal. (Lunch break-not included)Continuing our journey, we go through Paúl da Serra, the largest plat...',
  'Be ready to join us on an unforgettable adventure that only few people get to experience on a jeep tour. Our first stop takes us to São Vicente waterfall that resembles a bride''s veil. Continuing our ',
  'Funchal',
  '',
  32.6669,
  -16.9241,
  69.0,
  'EUR',
  'Full day',
  NULL,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/65/46/bb.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/65/46/bb.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/31/d0/12.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/29/f7/66.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/3f/72/67.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/24/f8/85.jpg"]'::jsonb,
  '["São Vicente in the north, known by its vineyards, volcanic caves and Madeira wine production.", "A famous waterfall that resembling a bride''s veil due to the abundance in water.", "Volcanics pools where you can swim in crystaline waters and enjoy the beautiful scenery around them.", "One of the most visited places in Madeira", "Skywalk. The highest Sea Cliff In Europe (589m) with the amazing glass floor balcony.", "Fanal, one of the 7th Natural Wonders of Portugal, with centenary trees in the middle of the Lauriss", "Madeira''s black sand beach, one of the most visited on the island"]'::jsonb,
  '["Professional local guide", "Safety Instructions and First aid", "Free pickup and drop-off from Funchal´s Central Area and next to Funchal´s Port", "Vehicles sanitized with Ozone", "Wi-Fi", "All insurances according to the Portuguese law", "Local taxes", "Alcohol-Gel available"]'::jsonb,
  '["English", "French", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  3647,
  'Funchal',
  true,
  185,
  'https://www.viator.com/en-GB/tours/Funchal/Northern-Wonders-Jeep-Tour/d22388-16720P4?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- Viator: Whale and Dolphin Watching in Calheta, Madeira Island (23523P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Whale and Dolphin Watching in Calheta, Madeira Island',
  'Experience breathtaking moments with wild animals in their natural habitat with a touch of adrenaline included!',
  'Experience breathtaking moments with wild animals in their natural habitat with a touch of adrenaline included!',
  'We ask you to do the check-in 20 minutes before departure at our Store "H2oMadeira", at the Marina o',
  'We ask you to do the check-in 20 minutes before departure at our Store "H2oMadeira", at the Marina of Calheta (Level 0). (https://g.page/h2omadeira?share)

Parking: The marina''s car parking lot is the closest and least expensive one in the area (https://maps.app.goo.gl/Ly1e8j92jBX8EQMt6)',
  32.6669,
  -16.9241,
  60.0,
  'EUR',
  '2h',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/70/06/e3.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/70/06/e3.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/70/06/e2.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/64/c2/77.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/64/c2/8e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/64/c2/95.jpg"]'::jsonb,
  '["Whale and Dolphin Watching in Calheta, Madeira Island"]'::jsonb,
  '["Local guide", "Driver/guide", "Live commentary on board"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  1232,
  'Funchal',
  true,
  186,
  'https://www.viator.com/en-GB/tours/Calheta/Whale-and-Dolphin-Watching-or-Swim-with-Dolphins-in-Madeira/d50841-23523P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- Viator: Madeira Valley of the Nuns Tour (23651P5)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Madeira Valley of the Nuns Tour',
  'Make your way up to Eira do Serrado where you''ll find one of the most exclusive and beautiful views, not to mention a great "green" location unlike any other in Madeira. The journey down to the Nuns Valley (Curral da Freiras) village takes approximately 20 minutes where guests will enjoy the countryside, forest brushes mixed with populated areas with quaint houses typical of the Madeiran society. The village is very isolated and locals mainly live off what they cultivate. The local chestnuts are delicious and are used in everyday cooking. Upon your return, stop at the stunning fishing village of Câmara de Lobos. This is were Winston Churchill spent his time painting his beautiful landscapes and were you will be able to try the famous local drink, Poncha.',
  'Make your way up to Eira do Serrado where you''ll find one of the most exclusive and beautiful views, not to mention a great "green" location unlike any other in Madeira. The journey down to the Nuns V',
  'At the bus stop near the cable-car station in the "Old Town" part of Funchal',
  'At the bus stop near the cable-car station in the "Old Town" part of Funchal',
  32.6669,
  -16.9241,
  24.0,
  'EUR',
  '3h 30min',
  NULL,
  'Culture',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/ab/f6/80.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/ab/f6/80.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/70/09/ce.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/70/09/cf.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/ab/f6/83.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/ab/f6/82.jpg"]'::jsonb,
  '["The Eira do Serrado viewpoint offers fantastic views of parish of Curral das Freiras (Nuns Valley) l", "Curral das Freiras (Nuns Valley) is situated in a deep valley and encircled by steep mountain slopes", "The fishing village of Câmara de Lobos is were Winston Churchill spent his time painting his beautif"]'::jsonb,
  '["Professional guide", "All taxes, fees and handling charges", "Hotel pickup and drop-off (Free for hotels in Funchal only)"]'::jsonb,
  '["English", "French", "German", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.6,
  378,
  'Funchal',
  true,
  187,
  'https://www.viator.com/en-GB/tours/Madeira/Madeira-Nuns-Valley-Tour/d5392-23651P5?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- Viator: Old Funchal Walking Tour (10440P2)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Old Funchal Walking Tour',
  'Your 2-hour tour to the emblematic monuments of this part of the town will be guided by a former university student or a European volunteer (European Voluntary Service - part of the European Union''s Erasmus+ programme) integrated in this project, developed at the University of Madeira. This will be a university project with a side that will most certainly fascinate you.',
  'Your 2-hour tour to the emblematic monuments of this part of the town will be guided by a former university student or a European volunteer (European Voluntary Service - part of the European Union''s E',
  'Inside of Madeira University Rectory, Rua dos Ferreiras opposite the court house',
  'Inside of Madeira University Rectory, Rua dos Ferreiras opposite the court house',
  32.6669,
  -16.9241,
  16.4,
  'EUR',
  '2h',
  NULL,
  'Culture',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/3d/43/c4.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/3d/43/c4.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/6a/cf/bb.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/3d/43/f3.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/46/40/11.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/3d/44/0e.jpg"]'::jsonb,
  '["Founded by King Sebastian of Portugal in the 16th century.", "Praça do Colombo", "Building from 16th century served as the seat of the largest diocese in the world.", "One of the three navigators responsible for the rediscovery of the island.”", "We then stop at the Municipal Garden for a quick visit and after the traditional Wine Lodge, before "]'::jsonb,
  '["Tour escort/host", "Driver/guide"]'::jsonb,
  '["English", "French", "German"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  520,
  'Funchal',
  true,
  188,
  'https://www.viator.com/en-GB/tours/Funchal/History-Tellers/d22388-10440P2?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

