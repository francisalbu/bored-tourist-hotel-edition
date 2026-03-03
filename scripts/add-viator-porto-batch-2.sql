-- ============================================
-- Porto Batch 2: 6 Viator experiences in Porto
-- Products: 7372P39, 204176P3, 264534P1, 154994P1, 174294P3, 14873P1
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Douro Valley Tour: 2 Vineyard Visits, River Cruise, Winery Lunch (7372P39)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Douro Valley Tour: 2 Vineyard Visits, River Cruise, Winery Lunch',
  'Leaving from Porto, meet your tour guide at 08:30 a.m and travel to the beautiful Douro Valley in a comfortable climatized vehicle. After the first stretch of the journey you will be visiting a small family owned vineyard, with a wine tasting of their own production. Next enjoy a scenic drive through the world famous National Road 222, to the heart of the Douro Valley (Pinhão) where we will embark on the unique experience of doing a short 45 min cruise in the Douro River, to soak in the beautiful landscape while admiring the terraced hills with the quintessential vineyards and estates that turn the margins of the Douro River into one of the most unique in the world. Then, in order to complete this experience, enjoy a traditional lunch in a vineyard of a small-medium producer, finishing ...',
  'Leaving from Porto, meet your tour guide at 08:30 a.m and travel to the beautiful Douro Valley in a comfortable climatized vehicle. After the first stretch of the journey you will be visiting a small ',
  'This tour departures at 8:30 from Lapa''s Church.',
  'This tour departures at 8:30 from Lapa''s Church.',
  41.1579,
  -8.6291,
  129.0,
  'EUR',
  'Full day',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/6e/d0/58.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/6e/d0/58.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/ba/7d/80.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/5b/67/ed.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0d/a8/13.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/d2/e7/90.jpg"]'::jsonb,
  '["After meeting with your tour guide, leave from Porto, and travel to the beautiful Douro Valley in a ", "After the first winery, enjoy a scenic drive through the world famous National Road 222, to the hear"]'::jsonb,
  '["On-board WiFi", "Lunch", "Visit to two Vineyards with wine tastings (Samples of several different wines, honey and olive oil)", "In-vehicle air conditioning", "45 min river cruise in Traditional Rabelo boat, departing from Pinhão", "Professional Tour Guide"]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  3570,
  'Porto',
  true,
  110,
  'https://www.viator.com/en-GB/tours/Porto/Douro-Valley-Tour-with-Visit-to-two-Vineyards-River-Cruise-and-Lunch-at-Winery/d26879-7372P39?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 2) Spiritus Porto: Videomapping Immersive Show at Clerigos Church (204176P3)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Spiritus Porto: Videomapping Immersive Show at Clerigos Church',
  'Enjoy this audiovisual experience, pairing light, music, and architecture in the heart of Clérigos Church, in Porto. We invite you to feel the beauty of life with us and to reflect upon our place in this world.',
  'Enjoy this audiovisual experience, pairing light, music, and architecture in the heart of Clérigos Church, in Porto. We invite you to feel the beauty of life with us and to reflect upon our place in t',
  'Porto',
  '',
  41.1579,
  -8.6291,
  10.0,
  'EUR',
  '30min',
  NULL,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c0/c9/a3.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c0/c9/a3.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0e/9b/4a/92.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0e/9b/4a/94.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c0/c9/9c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c0/c9/9f.jpg"]'::jsonb,
  '["Spiritus Porto: Videomapping Immersive Show at Clerigos Church"]'::jsonb,
  '["All Fees and Taxes"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.4,
  227,
  'Porto',
  true,
  111,
  'https://www.viator.com/en-GB/tours/Porto/SPIRITUS-A-melhor-maneira-de-viajar-e-sentir/d26879-204176P3?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 3) Port : 6 bridges tour with Portuguese custard tart & Port wine (264534P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Port : 6 bridges tour with Portuguese custard tart & Port wine',
  'Our main service is to guarantee the smile and satisfaction of our customers, through several experiences on the Douro river, contemplating the faces of the cities of Porto and Vila Nova de Gaia, separated by century-old and contemporary bridges that receive the Atlantic breeze. Our experiences offer in the best way and refine all the sensations on board our vessel.',
  'Our main service is to guarantee the smile and satisfaction of our customers, through several experiences on the Douro river, contemplating the faces of the cities of Porto and Vila Nova de Gaia, sepa',
  'Boarding at Douro Marina, meeting at Pontão C preferably 10 minutes before the scheduled time
',
  'Boarding at Douro Marina, meeting at Pontão C preferably 10 minutes before the scheduled time
',
  41.1579,
  -8.6291,
  50.0,
  'EUR',
  '2h',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/9b/a3/7b.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/9b/a3/7b.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/9b/a4/96.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/9b/a4/95.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/b7/92/54.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/9b/a3/7d.jpg"]'::jsonb,
  '["Arrábida Bridge, one of the largest concrete arches in Europe, here you can admire the fishing villa", "The Infante bridge was built as an alternative for car passage, you can see the banks of the 2 citie"]'::jsonb,
  '["insurance and fuel", "safety equipment", "certified team", "welcome drink", "All Fees and Taxes"]'::jsonb,
  '["English", "French", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  58,
  'Porto',
  true,
  112,
  'https://www.viator.com/en-GB/tours/Porto/Private-Cruise-on-the-Douro-River/d26879-264534P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 4) Authentic Food and Wine Tour in Porto by Food Lover Tour (154994P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Authentic Food and Wine Tour in Porto by Food Lover Tour',
  'Everyone knows that breakfast is the most important meal of the day, so start your day off right! Join us on this petiscos brunch in Porto to see what the locals enjoy eating in the morning and to take in the city’s early day atmosphere. You’ll live a morning in the life of a Porto native, eating all the best local foods along the way!',
  'Everyone knows that breakfast is the most important meal of the day, so start your day off right! Join us on this petiscos brunch in Porto to see what the locals enjoy eating in the morning and to tak',
  'Porto',
  '',
  41.1579,
  -8.6291,
  69.0,
  'EUR',
  '3h',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/93/9e/3d.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/93/9e/3d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/93/9a/af.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/93/9e/3a.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/93/9e/38.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/93/9b/12.jpg"]'::jsonb,
  '["Visite du mercado Bolhao"]'::jsonb,
  '["Alcoholic beverages", "Tea and coffee", "Lunch"]'::jsonb,
  '["English", "French", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  1063,
  'Porto',
  true,
  113,
  'https://www.viator.com/en-GB/tours/Porto/FOOD-TOURS-IN-PORTO-TO-EAT-LIKE-A-LOCAL/d26879-154994P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 5) Porto: Sunset or Daytime, Charming Sailboat Cruise on the Douro River (174294P3)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Porto: Sunset or Daytime, Charming Sailboat Cruise on the Douro River',
  'Sunset is proof that no matter what happens, every day ends beautifully. Come and share this experience that will awaken in your mind a true moment of inner peace and happiness.',
  'Sunset is proof that no matter what happens, every day ends beautifully. Come and share this experience that will awaken in your mind a true moment of inner peace and happiness.',
  'Please wait next to Pontoon C',
  'Please wait next to Pontoon C',
  41.1579,
  -8.6291,
  45.0,
  'EUR',
  '2h',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/d6/23/f5.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/d6/23/f5.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c0/7c/f2.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c0/7d/08.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c0/7d/02.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c0/7c/d0.jpg"]'::jsonb,
  '["The Arrábida Bridge, with its imposing arch over the Douro, is a symbol of ingenuity and boldness th", "Cais de Gaia, with its centuries-old Port Wine caves, is the place where history, the aroma of wood ", "The Gardens of the Crystal Palace is a haven of beauty and tranquility in the heart of Porto, where ", "The Don Luis I Bridge, opened in 1886, connects Porto with Villa Nova de Gaia over the river Douro a", "The Douro Estuary Natural Reservation is a sanctuary of life and tranquility where the river meets t"]'::jsonb,
  '["Alcoholic beverages"]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  397,
  'Porto',
  true,
  114,
  'https://www.viator.com/en-GB/tours/Porto/Private-Sunset-Sailing-Cruise-on-the-Douro-River/d26879-174294P3?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 6) Workshop Cook & Taste Portugal in Porto (14873P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Workshop Cook & Taste Portugal in Porto',
  'This is a total interactive experience. You will be able to cook and taste typical portuguese food while having a blast! You may choose to complete the experience with the visit of the famous local market (Mercado do Bolhão) and learn with the chef how to choose the best ingredients that you will use later in the cooking class.',
  'This is a total interactive experience. You will be able to cook and taste typical portuguese food while having a blast! You may choose to complete the experience with the visit of the famous local ma',
  'Porto',
  '',
  41.1579,
  -8.6291,
  70.0,
  'EUR',
  '3h',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/82/85/3c.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/82/85/3c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/82/85/30.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/82/85/74.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/82/85/24.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/82/85/2f.jpg"]'::jsonb,
  '["Workshop Cook & Taste Portugal in Porto"]'::jsonb,
  '["Lunch", "Portuguese Recipes", "Alcoholic beverages", "Carbonated beverages", "Wi-fi", "Tea and coffee"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  43,
  'Porto',
  true,
  115,
  'https://www.viator.com/en-GB/tours/Porto/Cook-and-Taste-Porto/d26879-14873P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

