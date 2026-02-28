-- ============================================
-- Batch 2: Add 4 Viator experiences to Supabase
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Traditional Boats Sunset Cruise (54249P2)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Traditional Boats Sunset Cruise with Wine & Fado',
  'Step aboard one of Lisbon''s iconic traditional boats for a magical 2-hour sunset cruise along the Tagus River. Departing from the beautifully renovated "Sul e Sueste" boat station beside Praça do Comércio, you''ll glide past the city''s most stunning landmarks — São Jorge Castle towering above Alfama, the National Pantheon, the 25th of April Bridge, Torre de Belém and the Monument to the Discoveries. As the sun dips below the horizon, the sky transforms into a canvas of warm colours while live Fado music fills the air. Sip on white wines from the Setúbal region, served freely throughout the cruise, and let the sailors share their stories of life on the river. An unforgettable way to experience Lisbon from the water.',
  'A magical sunset cruise on a traditional Lisbon boat along the Tagus River with unlimited Setúbal wine, live Fado music and stunning views of the city''s skyline.',
  'Tagus River, Lisbon',
  'Estação Fluvial Sul e Sueste, Terreiro do Paço, Lisbon',
  38.7075,
  -9.1364,
  29,
  'EUR',
  '2h',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/a5/03/96.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/a5/03/96.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/a5/03/98.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/6e/f7/66.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/a5/03/99.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/a5/03/a5.jpg"]'::jsonb,
  '["Sail on a beautifully restored traditional Lisbon boat","Watch the sunset paint the sky over the Tagus River","Live Fado music on board throughout the cruise","Unlimited Setúbal white wine included","Pass iconic landmarks: Torre de Belém, 25 de Abril Bridge, Alfama","Depart from the historic Sul e Sueste station at Praça do Comércio","Hear fascinating sailors'' stories about life on the river"]'::jsonb,
  '["White wine served freely throughout the cruise","2-hour sightseeing river cruise on a traditional Lisbon boat","Live Fado music on board"]'::jsonb,
  '["Portuguese","English","French","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  2099,
  'Lisbon',
  true,
  10,
  'https://www.viator.com/tours/Lisbon/Lisbon-Traditional-Boats-Sunset-Cruise/d538-54249P2',
  'Viator'
);

-- 2) Awarded Original Lisbon Food Tour: 17 Tastings (88294P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Award-Winning Lisbon Food Tour: 17 Tastings in Alfama & Mouraria',
  'Join the award-winning Oh! My Cod Tour — named Best Gastronomic Project by Turismo de Portugal (2024) and Best Cultural Project by Prémios Ibérico (2023). Over 4 hours, you''ll explore three of Lisbon''s oldest and most authentic districts: Alfama, Baixa and Mouraria. Stop at family-run restaurants and shops for up to 17 tastings, from artisan cheeses and cured meats to fresh seafood, conventual desserts and the wide variety of spices inherited from Portugal''s colonial history. Each dish is paired with the perfect beverage — local wines, Porto wine, craft beer and traditional liqueurs. Your guide, a local born in the neighbourhood, will share stories of the city''s past and present, taking you through hidden corners that only residents know. This is a full cultural immersion through the flavours of Lisbon.',
  'The most awarded food tour in Lisbon — up to 17 tastings across Alfama, Baixa and Mouraria with wines, Porto wine and stories from a local-born guide.',
  'Alfama, Baixa & Mouraria, Lisbon',
  'Arco da Rua Augusta, Terreiro do Paço, Lisbon',
  38.7085,
  -9.1368,
  200,
  'EUR',
  '4h',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/ac/6b/5c.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/ac/6b/5c.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6b/9d/3e/caption.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6b/8b/c8/caption.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6b/8d/20/caption.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6b/9c/25/caption.jpg"]'::jsonb,
  '["Award-winning tour: Best Gastronomic Project in Portugal (2024)","Up to 17 tastings — from cheese and seafood to conventual desserts","Explore 3 of Lisbon''s oldest districts: Alfama, Baixa & Mouraria","Up to 5 beverage tastings: wines, Porto wine, beer & liqueurs","Local-born guide with deep knowledge of the neighbourhoods","Family-run restaurants and shops off the tourist trail","Suitable for vegetarians, keto, celiac and pescatarians"]'::jsonb,
  '["Up to 17 food tastings at family-run restaurants","Up to 5 beverage tastings (wines, Porto wine, beer, liqueur)","Expert local-born guide","Vegetarian/keto/celiac options available (inform 36h before)"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  1400,
  'Lisbon',
  true,
  11,
  'https://www.viator.com/tours/Lisbon/Taste-of-Portugal-17-tastings-tour/d538-88294P1',
  'Viator'
);

-- 3) Escape Hunt Experience (5519168P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Escape Hunt Lisbon: Live Escape Room Adventure',
  'Play the part of a famous detective and race against the clock to solve a mystery in the heart of Lisbon. Put your mind to the test as you and your team hunt for clues, crack codes and attempt to solve riddles before time runs out. Escape Hunt Lisbon offers four unique escape-the-room games, each with its own theme and storyline, accommodating two to five players with a dedicated game master in your private room guiding the experience. Suitable for all ages and experience levels — whether you''re a first-timer or a seasoned escape room enthusiast. At the end, strike your best detective pose at the photo wall and receive your pictures by email. A perfect rainy-day activity or a fun group experience right in downtown Lisbon.',
  'Race against the clock in Lisbon''s top-rated escape room — four unique detective games with a dedicated game master, perfect for groups of 2 to 5 players.',
  'Downtown Lisbon',
  'Escape Hunt Lisbon, Lisbon',
  38.7139,
  -9.1394,
  22,
  'EUR',
  '1h 30min',
  5,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/47/12/b2.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/47/12/b2.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/e7/7d/ca.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/e7/7d/00.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/47/12/b0.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/47/12/aa.jpg"]'::jsonb,
  '["Four unique themed escape rooms to choose from","Dedicated game master in your private room","Suitable for all ages and experience levels","Perfect for groups of 2 to 5 players","Fun detective costumes provided","Photo wall with pictures sent to your email","Top-rated escape room in Lisbon with 5.0 rating"]'::jsonb,
  '["Use of detective costumes","Dedicated game master","Private room for your group","Photo wall pictures sent by email"]'::jsonb,
  '["English","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  1013,
  'Lisbon',
  true,
  12,
  'https://www.viator.com/tours/Lisbon/Escape-Room-in-the-Heart-of-Lisbon/d538-5519168P1',
  'Viator'
);

-- 4) Private Lisbon Arrábida Wine Tour (66870P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Private Arrábida Wine Tour: Family Wineries, Cheese & Coastal Views',
  'Escape Lisbon for a day and discover the breathtaking Arrábida Natural Park on this private wine tour. You''ll be chauffeured through one of Portugal''s most picturesque landscapes — towering limestone cliffs, rolling vineyards and panoramic views of the Atlantic Ocean. Visit two handpicked, family-owned wineries where centuries-old winemaking traditions meet modern innovation. Taste award-winning wines perfectly paired with artisan cheeses, freshly baked bread and regional delicacies. Learn about sustainable viticulture directly from the people who craft these exceptional wines. Enjoy a Portuguese lunch at a hidden gem restaurant nestled in the countryside. Your passionate local guide brings the region''s history, culture and wine heritage to life throughout the journey. With hotel pickup and drop-off in an air-conditioned vehicle, this is the ultimate hassle-free wine experience from Lisbon.',
  'A private full-day wine tour through the stunning Arrábida Natural Park — visit family-owned wineries, taste award-winning wines with artisan cheeses and enjoy a traditional Portuguese lunch.',
  'Arrábida Natural Park, Setúbal',
  'Hotel pickup in Lisbon',
  38.5098,
  -8.9880,
  256,
  'EUR',
  '7h',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/36/3a/4f.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/36/3a/4f.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/ab/8a/d5.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c8/2c/ff.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/1f/11/fe.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c8/31/2a.jpg"]'::jsonb,
  '["Private tour — just you, your group and your guide","Visit two family-owned wineries with centuries-old traditions","Taste award-winning wines paired with artisan cheeses","Scenic drive through Arrábida Natural Park''s coastal cliffs","Traditional Portuguese lunch at a hidden countryside restaurant","Hotel pickup and drop-off in an air-conditioned vehicle","Learn about sustainable viticulture from the winemakers themselves"]'::jsonb,
  '["Wine tasting at family-owned wineries","Award-winning cheese tasting and regional snacks","Traditional Portuguese lunch","Hotel pickup and drop-off","Air-conditioned private transport","Professional local guide","Entrance to monuments"]'::jsonb,
  '["English","French","Portuguese","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  909,
  'Lisbon',
  true,
  13,
  'https://www.viator.com/tours/Lisbon/Arrabida-Wine-Tour/d538-66870P1',
  'Viator'
);
