-- ============================================
-- Porto Batch 1: 5 Viator experiences in Porto
-- Products: 7592P12, 384973P1, 442666P1, 122201P7, 406702P4
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Complete Douro Valley Wine Tour with Lunch, Wine Tastings and River Cruise (7592P12)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Complete Douro Valley Wine Tour with Lunch, Wine Tastings and River Cruise',
  'Explore the wine culture, through the most complete Douro Valley during a day excursion. This amazing tour, gives you the opportunity to visit two of the best wine estates in the region and feel the essence of being in the heart of this precious wine region. You will have the opportunity to learn the history of the wine estates and see all the wine cultivation and production process, being at the source of the Porto Wine. The "birthplace" of this unique nectar! During the tour enjoy 6 wine tastings while admiring the astonishing landscapes and serenity of the Douro Valley, recognized as World Heritage Site by UNESCO, since 2001. The guided visit to 2 different wine estates with tastings, a complete traditional lunch with Douro wines and a scenic 50 minutes cruise on the Douro River is i...',
  'Explore the wine culture, through the most complete Douro Valley during a day excursion. This amazing tour, gives you the opportunity to visit two of the best wine estates in the region and feel the e',
  'Meeting Point: Calçada da Vandoma, Porto – just next to Porto Cathedral (Sé do Porto).

Look out for',
  'Meeting Point: Calçada da Vandoma, Porto – just next to Porto Cathedral (Sé do Porto).

Look out for our friendly staff dressed in red and clearly identified with Living Tours. They’ll be ready to check you in and introduce you to your guide for the tour.',
  41.1579,
  -8.6291,
  84.15,
  'EUR',
  'Full day',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/96/4e/e9.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/96/4e/e9.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/74/8f/03.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/93/bf/95.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/b0/82/e1.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/b0/82/a4.jpg"]'::jsonb,
  '["It''s now time to sail! Enjoy a 50 minutes scenic cruise on the Douro river departing from Pinhão on "]'::jsonb,
  '["Professional Guide & Transportation", "Porto City Walking Tour (available from the day after your experience)", "Guided visit to 2 wine estates with tastings of diferent wines and port.", "50 minutes - Traditional Rabelo cruise departing from Pinhão", "Lunch (Vegetarian & Gluten-free options available if informed in advance)"]'::jsonb,
  '["English", "French", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  12989,
  'Porto',
  true,
  105,
  'https://www.viator.com/tours/Porto/Douro-Valley-Wine-Tour-with-Lunch-Tastings-and-River-Cruise/d26879-7592P12?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 2) Tile Painting and Cocktails in Downtown Porto (384973P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Tile Painting and Cocktails in Downtown Porto',
  'Welcome to Boiler Studio. Here we work as a team! Holidays and leisure time are for relaxing, socializing, getting to know the city''s culture, and meeting new people. In this tile painting workshop, you can experience a little bit of all of this, because this experience is designed so that you don''t need any prior experience, just to feel good. Enjoy yourself and take a piece of Portugal home with you, the best souvenir made by you and which you will remember as your tile. Oh, and during your activity, you will also enjoy one (or more) cocktails with a variety of choices ranging from the famous Porto Tónico to a glass of champagne.',
  'Welcome to Boiler Studio. Here we work as a team! Holidays and leisure time are for relaxing, socializing, getting to know the city''s culture, and meeting new people. In this tile painting workshop, y',
  'The workshop will take place on Boiler Studio in Rua Chã 77, a very typical street in front of the C',
  'The workshop will take place on Boiler Studio in Rua Chã 77, a very typical street in front of the Cathedral. The most famous spots around us are the São Bento Train Station, Luis I bridge, Time out Market and the Cathedral',
  41.1579,
  -8.6291,
  35.0,
  'EUR',
  '2h',
  NULL,
  'Learn & Create',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/14/1b/16.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/14/1b/16.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/ff/54.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/14/1b/27.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/66/5d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/7b/3d/c0.jpg"]'::jsonb,
  '["Tile Painting and Cocktails in Downtown Porto"]'::jsonb,
  '["Alcoholic beverages", "All materials included", "your own painted Tile"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  194,
  'Porto',
  true,
  106,
  'https://www.viator.com/tours/Porto/Private-Tile-Painting-Workshop-in-Porto/d26879-384973P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 3) Porto Surf Experience (442666P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Porto Surf Experience',
  '30 years of experience We are a team of local surfers (Pedro, Nuno, João Paulo, Tulio) that give you the best surfing experience possible. We are the Surf Coach at Flower Power Surf School, and Certified Surf Instructors by the Portuguese Surfing Federation with licenses to give classes from the local authorities. OUR GOAL IS FOR YOU TO HAVE AN EXCELLENT SURFING EXPERIENCE, whether it''s your first time trying surfing or you are trying to advance your skills.',
  '30 years of experience We are a team of local surfers (Pedro, Nuno, João Paulo, Tulio) that give you the best surfing experience possible. We are the Surf Coach at Flower Power Surf School, and Certif',
  'How to come to Flower Power Surf School:
Bus stop: Transparent Building. You can catch the bus 500 i',
  'How to come to Flower Power Surf School:
Bus stop: Transparent Building. You can catch the bus 500 in front of São Bento Train Station.
Metro Stop: Matosinhos Sul, then 10 minutes walking.
The classes will be given on the main beach of Porto - Praia International',
  41.1579,
  -8.6291,
  25.0,
  'EUR',
  '2h',
  NULL,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/1e/03/82.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/1e/03/82.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/1e/07/0e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/1e/07/0f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/1e/07/29.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/90/cc/04.jpg"]'::jsonb,
  '["Porto Surf Experience"]'::jsonb,
  '["Board and Wetsuit", "Insurance"]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  28,
  'Porto',
  true,
  107,
  'https://www.viator.com/tours/Porto/Porto-Surf-Experience/d26879-442666P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 4) Pastel de Nata | Workshop from scratch | Porto's city center (122201P7)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Pastel de Nata | Workshop from scratch | Porto''s city center',
  'Learn how to make the famous "Pastel de Nata" from scratch so that you can return home and enjoy the traditional Portuguese pastries totally made by you. In a group activity, you''ll take turns participating while enjoying a local wine in a specially designed kitchen with exceptional hosts experienced in teaching and entertainment. Our two spaces are centrally located, one near "São Bento Train Station" and "Ribeira", and the other near "Jardim do Morro" and the Port Wine Cellars. If we don''t have availability at the location you''re looking at, please check with our other location.',
  'Learn how to make the famous "Pastel de Nata" from scratch so that you can return home and enjoy the traditional Portuguese pastries totally made by you. In a group activity, you''ll take turns partici',
  'The closest metro stop is "São Bento" and it is the best way to get to us, as UBERS and Taxis are co',
  'The closest metro stop is "São Bento" and it is the best way to get to us, as UBERS and Taxis are constantly stuck in traffic.
It''s mandatory to arrive before the class starts because it''s not possible to enter after the workshop has started.',
  41.1579,
  -8.6291,
  45.0,
  'EUR',
  '2h 30min',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/8b/94/b5.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/8b/94/b5.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/60/cc/48.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/60/cc/24.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/60/cb/ea.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/60/cc/10.jpg"]'::jsonb,
  '["Pastel de Nata | Workshop from scratch | Porto''s city center"]'::jsonb,
  '["Alcoholic beverages", "Tea and coffee"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  456,
  'Porto',
  true,
  108,
  'https://www.viator.com/tours/Porto/Pastel-de-Nata-Pastery-Class/d26879-122201P7?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 5) Porto: Douro River Boat Cruise with Port Wine and Snacks (406702P4)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Porto: Douro River Boat Cruise with Port Wine and Snacks',
  'Discover Porto like never before with a relaxed boat ride along the river! Picture yourself soaking in the stunning city views on a small boat with a friendly group—it’s way more personal and special than those big touristy boats. As you glide along, you’ll dive into the region''s amazing wine culture, sampling three wines while the historic cellars provide the perfect background. Plus, a super friendly local guide will be on deck to share the city’s fascinating history and culture, pointing out landmarks and fun stories as you cruise.',
  'Discover Porto like never before with a relaxed boat ride along the river! Picture yourself soaking in the stunning city views on a small boat with a friendly group—it’s way more personal and special ',
  'Just as you arrive at the location that will have the river in front of you, you’ll be able to see t',
  'Just as you arrive at the location that will have the river in front of you, you’ll be able to see the marine with boats and the dock, that’s the meeting point where we are going to start our journey, will just meet by the entrance door.',
  41.1579,
  -8.6291,
  280.0,
  'EUR',
  '2h',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/df/b2/26.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/df/b2/26.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c1/40/89.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/6b/5a/1f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/6b/59/d9.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/8e/e8/a3.jpg"]'::jsonb,
  '["The start of our experience in our beloved river, in latin \"Douro\" means \"made of gold\" these waters", "Our oldest bridge with a lot of interesting details to get to know", "One of the biggest icons of the city, from 1881 and still used to this day."]'::jsonb,
  '["Alcoholic beverages", "Bottled water", "All Fees and Taxes"]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  605,
  'Porto',
  true,
  109,
  'https://www.viator.com/tours/Porto/Porto-Douro-River-Boat-Cruise-with-Port-Wine-and-Snacks/d26879-406702P4?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

