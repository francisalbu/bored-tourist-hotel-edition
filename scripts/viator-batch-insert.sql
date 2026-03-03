-- ============================================
-- Viator experiences - batch insert
-- Auto-generated from Viator Partner API
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- Ensure Viator operator exists (run add-viator-experiences.sql first if not done)
-- This script assumes operator_id = 40 for Viator

-- 5383SINTRACASCAIS: Sintra and Cascais Small-Group Day Trip from Lisbon
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Sintra and Cascais Small-Group Day Trip from Lisbon',
  'Experience the natural and historical beauty of Portugal on a small-group day trip from Lisbon to Sintra and Cascais. Just a few hours from Portugal''s capital city, Sintra is a magical place where man and nature exist in perfect harmony. Discover secret trails at Pena Park, admire the natural wonders of Sintra Natural Park and the cliffs of Roca Cape, and visit the whimsical Pena National Palace. Enjoy a scenic drive along the Atlantic coast, and stop at Cascais Beach. Walk around Cascais to...',
  'Experience the natural and historical beauty of Portugal on a small-group day trip from Lisbon to Sintra and Cascais. Just a few hours from Portugal''''s capital city, Sintra is a magical place where man and nature exist in perfect harmony. Discover se',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/63/e4/89.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/63/e4/89.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/63/e4/96.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/63/e4/94.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/63/e4/97.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/63/e4/8a.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Local guide", "Transport by air-conditioned vehicle", "Entrance Ticket to Pena Palace and Park are included or excluded based on the option chosen"]'::jsonb,
  '["en", "es", "fr", "pt"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  7057,
  'Lisbon',
  true,
  5,
  'https://www.viator.com/en-GB/tours/Lisbon/Sintra-and-Cascais-Small-Group-Day-Trip-from-Lisbon/d538-5383SINTRACASCAIS',
  'Viator'
);

-- 268183P3: Alfama Tour in Lisbon Old Town
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Alfama Tour in Lisbon Old Town',
  'See the heart of the city, Portugal''s oldest district, Alfama. This Free Tour let''s you inside the mazy narrow streets of Alfama, the coloured small houses, the balconies, the tile façades. You’ll get to know Lisbon’s most important traditions, legends and cultural aspects that truly make the "Alfacinhas" a unique people.  This Walking tour will take you through 3.000 years of history showing you the true Lisbon, Alfama, and offering you dozens of local tips and plenty of things to do in Li...',
  'See the heart of the city, Portugal''''s oldest district, Alfama. This Free Tour let''''s you inside the mazy narrow streets of Alfama, the coloured small houses, the balconies, the tile façades. You’ll get to know Lisbon’s most important traditions, leg',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/54/19/a0.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/54/19/a0.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/54/1a/a2.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/54/19/6e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/28/df/c2.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/28/df/c7.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Dozens of Suggestions To Enjoy Lisbon to the Fullest", "Great Stories about the Culture and Traditions in Lisbon.", "A Passionate and Informative Guide", "A tip in accordance to the experience at the end of the tours is welcomed and expected."]'::jsonb,
  '["en", "fr", "it"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  4941,
  'Lisbon',
  true,
  6,
  'https://www.viator.com/en-GB/tours/Lisbon/Alfama-Tour-Lisbon-Old-Town/d538-268183P3',
  'Viator'
);

-- 5383GOURMET: Lisbon Small-Group Portuguese Food and Wine Tour
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Small-Group Portuguese Food and Wine Tour',
  'Are you ready to embark on a food and wine journey? With more than 15 tastings, in 6 spots, go on our food and wine walking tour and experience the foodie side of Lisbon. A discovery of typical foods and regional wines that will take in on a cultural journey of tastings while discovering the heart of Lisbon Baixa and get advice from your guide on where to eat for the rest of your trip!. Small-group tour for a more personalized experience, limited to 14 people.',
  'Are you ready to embark on a food and wine journey? With more than 15 tastings, in 6 spots, go on our food and wine walking tour and experience the foodie side of Lisbon. A discovery of typical foods and regional wines that will take in on a cultural',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/60/b2/55.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/60/b2/55.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/68/bf/15.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/60/b5/40.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/d9/2a/0f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/60/b2/0a.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Insider knowledge on where to go for true local experiences.", "Walking tour though the city", "Friendly Local Guide", "6 Tasting Stops with More than 15 Tastings (Food and Drinks)", "Vegetarian and gluten free options are available but not guaranteed in all the stops"]'::jsonb,
  '["en"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  4002,
  'Lisbon',
  true,
  7,
  'https://www.viator.com/en-GB/tours/Lisbon/Lisbon-Small-Group-Gourmet-Portuguese-Food-and-Wine-Tour/d538-5383GOURMET',
  'Viator'
);

-- 15420P3: 2 Hour Lisbon Sunset and Wine Sailing Tour
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  '2 Hour Lisbon Sunset and Wine Sailing Tour',
  'Sailing on the Tagus River at the sunset is a unique experience. The city changes color, the sounds become special and the smells more aromatic!  Imagine yourself enjoying all this while drinking a wonderful Portuguese wine…   Welcome aboard!',
  'Sailing on the Tagus River at the sunset is a unique experience. The city changes color, the sounds become special and the smells more aromatic!  Imagine yourself enjoying all this while drinking a wonderful Portuguese wine…   Welcome aboard!',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/24/2f/95.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/24/2f/95.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/60/95/a7.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/90/5e/99.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/90/63/34.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/c9/86/ba.jpg"]'::jsonb,
  '[]'::jsonb,
  '["All taxes, fees and handling charges", "Sailing cruise", "Skipper", "Portuguese Traditional Wine"]'::jsonb,
  '["en", "pt"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  2685,
  'Lisbon',
  true,
  8,
  'https://www.viator.com/en-GB/tours/Lisbon/Lisbon-2-Hour-Small-Group-Sailing-Tour/d538-15420P3',
  'Viator'
);

-- 54249P2: 2-Hour Lisbon Traditional Boats Sunset Cruise with White Wine
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  '2-Hour Lisbon Traditional Boats Sunset Cruise with White Wine',
  'The sunset cruise lasts for 2 hours and starts at the renovated boat station "Sul e Sueste" next to Commerce Square. During this shared cruise, you have the opportunity to see wonderful landscapes of the historical city center, passing by such sights as: the Commerce Square, São Jorge Castle, Alfama, National Pantheon, Santa Apolónia Station, Cacilhas, Christ the King, 25th of April Bridge, Tower of Belem, Discoveries Monument, MAAT and Palace of Ajuda. After the sunset the colors of the sky ...',
  'The sunset cruise lasts for 2 hours and starts at the renovated boat station "Sul e Sueste" next to Commerce Square. During this shared cruise, you have the opportunity to see wonderful landscapes of the historical city center, passing by such sights',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/a5/03/96.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/a5/03/96.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/a5/03/98.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/6e/f7/66.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/a5/03/99.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/a5/03/a5.jpg"]'::jsonb,
  '[]'::jsonb,
  '["White wine served freely along the tour", "2 hours sightseeing river cruise in one of the few Lisbon Traditional Boat"]'::jsonb,
  '["en", "es", "fr", "pt"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  2099,
  'Lisbon',
  true,
  9,
  'https://www.viator.com/en-GB/tours/Lisbon/Lisbon-Traditional-Boats-Sunset-Cruise/d538-54249P2',
  'Viator'
);

-- 88294P1: Awarded Original Lisbon Food Tour: 17 Tastings Alfama & Mouraria
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Awarded Original Lisbon Food Tour: 17 Tastings Alfama & Mouraria',
  'Oh! My Cod Tour company has been awarded Best Gastronomic Project by Turismo de Portugal (2024). Best Portugal & Spain Cultural Project by Prémios Ibérico (2023)  *4 stops, all in restaurants and shops run by local families *up to 17 tastings! (check our photos!) *explore the 3 oldest districts, namely the one where I was born! Locals will love you! (Alfama,Baixa,Mouraria)   Portuguese gastronomy has so much to offer: famous for its wine, meat & seafood, its ''conventual'' desserts & much mor...',
  'Oh! My Cod Tour company has been awarded Best Gastronomic Project by Turismo de Portugal (2024). Best Portugal & Spain Cultural Project by Prémios Ibérico (2023)  *4 stops, all in restaurants and shops run by local families *up to 17 tastings! (check',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/ac/6b/5c.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/ac/6b/5c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6b/9d/3e/caption.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6b/8b/c8/caption.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6b/8d/20/caption.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6b/9c/25/caption.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Explore NOT ONE, but the 3 of the oldest Lisbon districts, namely the one where OMC founder was born", "Guided experience by a local food expert with transcultural sensivity", "Suitable to Vegetarians/Keto/Celiac/Pescatarians/Nonalcoholic drinkers - INFORM us 36h BEFORE", "BEVERAGES > Up to 5 tastings - Local wines and beer, Porto wine and liqueur", "Not just snacks but ''real'' food also. Exclusive tastings!", "FOOD > Up to 14 tastings - We will have cheese and pastries, fish and meat, from salty to sweet. "]'::jsonb,
  '["en"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  1400,
  'Lisbon',
  true,
  10,
  'https://www.viator.com/en-GB/tours/Lisbon/Taste-of-Portugal-17-tastings-tour/d538-88294P1',
  'Viator'
);

-- 5519168P1: Escape Hunt Experience
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Escape Hunt Experience',
  'Play the part of a famous detective and race against the clock to solve a mystery during this fun-filled live escape adventure in Lisbon. Put your mind to the test as you and your friends hunt for clues and attempt to solve riddles before time runs out. Suitable for all ages, the Escape Hunt Experience Lisbon offers Four unique ‘escape-the-room’ games, with two to five players and a game master in each private room. In the end make your best pose on our photowall and receive your pictures in ...',
  'Play the part of a famous detective and race against the clock to solve a mystery during this fun-filled live escape adventure in Lisbon. Put your mind to the test as you and your friends hunt for clues and attempt to solve riddles before time runs o',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/47/12/b2.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/47/12/b2.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/e7/7d/ca.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/e7/7d/00.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/47/12/b0.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/47/12/aa.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Use of costumes", "Dedicated Game Master"]'::jsonb,
  '["en", "es"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  1013,
  'Lisbon',
  true,
  11,
  'https://www.viator.com/en-GB/tours/Lisbon/Escape-Room-in-the-Heart-of-Lisbon/d538-5519168P1',
  'Viator'
);

-- 66870P1: Private Lisbon Arrabida Wine Tour: Food & Wines, Mountain and Sea
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Private Lisbon Arrabida Wine Tour: Food & Wines, Mountain and Sea',
  'Experience the authenticity of family-run wineries that embrace centuries-old techniques. Enjoy breathtaking views as you journey through Arrábida Natural Park and its rolling vineyards. Taste award-winning wines perfectly paired with artisanal cheeses. Led by passionate local experts who bring the region’s history, culture, and wine heritage to life. Step into two handpicked, family-owned wineries where tradition meets innovation. Learn about sustainable viticulture and the art of winemaking...',
  'Experience the authenticity of family-run wineries that embrace centuries-old techniques. Enjoy breathtaking views as you journey through Arrábida Natural Park and its rolling vineyards. Taste award-winning wines perfectly paired with artisanal chees',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/36/3a/4f.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/36/3a/4f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/ab/8a/d5.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c8/2c/ff.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/1f/11/fe.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c8/31/2a.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Wine tasting of regional wines, award-winning cheese tasting, snacks ", "Local Knowledge ", "Hotel pickup & drop-off, air-conditioned transport, professional guide ", "Monuments "]'::jsonb,
  '["en", "es", "fr", "pt"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  909,
  'Lisbon',
  true,
  12,
  'https://www.viator.com/en-GB/tours/Lisbon/Arrabida-Wine-Tour/d538-66870P1',
  'Viator'
);

-- 116939P8: Lisbon: Dolphin Watching with a Marine Biologist - Ocean Safari
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Dolphin Watching with a Marine Biologist - Ocean Safari',
  'Our main goal is to find dolphins! Depart from Lisbon on a fast Rigid Inflatable Boat (RIB). The adventure starts on a speedboat in search of dolphins as we head into the wide Atlantic Ocean. Get the best views of the Atlantic Coastline, on a comfortable and safe 8.5m RIB as we head out to sea. We will scan the ocean in search of wildlife using several techniques; just like a scientist, you will play an important role in helping us find them. Get to know the different cetacean and seabirds sp...',
  'Our main goal is to find dolphins! Depart from Lisbon on a fast Rigid Inflatable Boat (RIB). The adventure starts on a speedboat in search of dolphins as we head into the wide Atlantic Ocean. Get the best views of the Atlantic Coastline, on a comfort',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/49/e9/7d.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/49/e9/7d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/4f/39.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/49/ea/16.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/e3/e6/fa.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/68/69/45.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Marine Biologist tour guide and crew", "All Fees and Taxes", "Public Liability Insurance", "Motion-sickness pill if necessary", "Lifejackets and seat in the Boat"]'::jsonb,
  '["en", "es", "fr", "it", "pt"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  814,
  'Lisbon',
  true,
  13,
  'https://www.viator.com/en-GB/tours/Lisbon/Dolphin-Watching-Lisbon/d538-116939P8',
  'Viator'
);

-- 203526P19: Lisbon Awakens: A Culinary Crossroads, Reborn.
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Awakens: A Culinary Crossroads, Reborn.',
  'We’ll start by traveling back in time for a taste of the “Age of Exploration,” a golden period when Lisbon became the center of a global empire, awash in power and holding the keys to the spice trade. We’ll search for a taste of those distant roots in the simple offerings of a classic pastry shop beside the 18th-century Estrela Basilica. From there we’ll make our way up to the out-of-the-way Campo de Ourique neighborhood, where our story leaps to contemporary times in this well-preserved “vil...',
  'We’ll start by traveling back in time for a taste of the “Age of Exploration,” a golden period when Lisbon became the center of a global empire, awash in power and holding the keys to the spice trade. We’ll search for a taste of those distant roots i',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/0a/54/51.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/0a/54/51.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/0a/54/4c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/78/ae/0e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/78/ae/02.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/0a/54/4f.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Bottled water", "Alcoholic beverages", "Lunch", "Snacks", "Tea and coffee"]'::jsonb,
  '["en"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  754,
  'Lisbon',
  true,
  14,
  'https://www.viator.com/en-GB/tours/Lisbon/Lisbon-Awakens-A-Culinary-Crossroads-Reborn-with-Culinary-Backstreets/d538-203526P19',
  'Viator'
);

-- 11392P1: Private Wine Tasting in the Setúbal Wine Region, from Lisbon
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Private Wine Tasting in the Setúbal Wine Region, from Lisbon',
  'Tantalize your taste buds on this full day, private guided tour to the Setúbal Wine Region. This tour is a great introduction to the wonderful wines and local cheeses in this beautiful Portuguese region. You can visit and discover three different wineries, and have the opportunity to taste their local wine varietals. Or, you can also opt to visit two wineries instead, and have a full lunch in a small family owned restaurant in one of the villages. Being a private tour, participants will be ju...',
  'Tantalize your taste buds on this full day, private guided tour to the Setúbal Wine Region. This tour is a great introduction to the wonderful wines and local cheeses in this beautiful Portuguese region. You can visit and discover three different win',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/d8/6f/8f.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/d8/6f/8f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/e7/af.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/e7/ab.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/3a/41/6e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/e7/b7.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Full lunch: entrees, main dishes (fish or meat), and desserts (depending on tour option);", "Private tour with Professional guide. Participants will be you and your guide;", "Entrance fees to all the wineries and their visits;", "Pick up and drop off at a hotel/Airbnb in Lisbon or from cruise port;", "Transportation by private air-conditioned car/van.", "Tasting of traditional cheese breads and other goods (depending on tour option);"]'::jsonb,
  '["de", "en", "pt"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  612,
  'Lisbon',
  true,
  15,
  'https://www.viator.com/en-GB/tours/Lisbon/Private-Setubal-Region-Wine-Tasting-Tour-Full-Day-from-Lisbon/d538-11392P1',
  'Viator'
);

-- 86153P1: Pastel de Nata Masterclass at a Real Bakery in Downtown Lisbon
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Pastel de Nata Masterclass at a Real Bakery in Downtown Lisbon',
  'Dive into the only Pastel de Nata baking class in Portugal set inside the buzzing real-life kitchen of Nat''elier, where our expert pastry chefs whip up these beloved treats daily.  Not only do you get to learn in an authentic professional setting, but we also make the whole process fun and accessible. From scratch to pastry perfection, we guide you every step of the way, making it simple to recreate the magic at home. And the fun doesn’t stop there! After crafting your pastries, enjoy the fr...',
  'Dive into the only Pastel de Nata baking class in Portugal set inside the buzzing real-life kitchen of Nat''''elier, where our expert pastry chefs whip up these beloved treats daily.  Not only do you get to learn in an authentic professional setting, b',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/28/d3.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/28/d3.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/28/ce.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/d3/dc/73.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/28/bc.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/28/ca.jpg"]'::jsonb,
  '[]'::jsonb,
  '["All equipment and ingredients provided", "3 Past\u00e9is de Nata", "Certificate of Achievement", "Step-by-step recipe sent via email", "2-hour hands-on class with a professional pastry chef", "Water and a choice of hot or cold drink "]'::jsonb,
  '["en", "pt"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  495,
  'Lisbon',
  true,
  16,
  'https://www.viator.com/en-GB/tours/Lisbon/Pastel-de-Nata-Workshop-at-REAL-Bakery/d538-86153P1',
  'Viator'
);

-- 304603P1: Award Winner Premium Kayak and Coasteering Adventure with Lunch
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Award Winner Premium Kayak and Coasteering Adventure with Lunch',
  'We start the day driving 40 minutes south of Lisbon to the Arrabida Natural Park. Grab a kayak and explore Arrábida in the most epic adventure.  We sail along an untouched coastline and drop anchor at key locations to set on foot and discover unique sea caves filled with sinkholes and fossils, climb the cliffs and dare to go up to 10 meter high dives to jump into into crystal clear waters and snorkel in a Zoological Marine Reserve island to swim with a vibrant ocean environment.  We bring dri...',
  'We start the day driving 40 minutes south of Lisbon to the Arrabida Natural Park. Grab a kayak and explore Arrábida in the most epic adventure.  We sail along an untouched coastline and drop anchor at key locations to set on foot and discover unique ',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/55/16/c3.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/55/16/c3.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/55/16/a9.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/55/16/ea.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/09/b0/5f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/a5/19/f4.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Lunch", "Wetsuit, neoprene socks, rubber shoes, gloves, helmets ", "Snacks", "Personal Insurance ", "Use of snorkeling equipment", "Alcoholic beverages"]'::jsonb,
  '["en", "es", "pt"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  472,
  'Lisbon',
  true,
  17,
  'https://www.viator.com/en-GB/tours/Lisbon/All-Inclusive-Kayak-Adventure/d538-304603P1',
  'Viator'
);

-- 160709P1: The Surf Instructor in Costa da Caparica
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'The Surf Instructor in Costa da Caparica',
  'Surfing is not a sport but a passion, once in a life you must try the feeling of riding a wave! With us you will be able to do that in a fun and safe way, and you''re going to have a unique memory taken by our professional photographer!',
  'Surfing is not a sport but a passion, once in a life you must try the feeling of riding a wave! With us you will be able to do that in a fun and safe way, and you''''re going to have a unique memory taken by our professional photographer!',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/f8/2b/9a.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/f8/2b/9a.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/9d/ac/e4.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/9d/ad/53.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/9d/ad/68.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/9d/ad/d7.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Private transportation", "Wetsuit and Surfboard Winter or Summer wetsuit, All kind of Surfboards, from softboards, to hard epoxy boards", "Certified Instructor", "2h lesson", "Insurance"]'::jsonb,
  '["en", "it", "pt"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  403,
  'Lisbon',
  true,
  18,
  'https://www.viator.com/en-GB/tours/Lisbon/The-Surf-Instructor/d538-160709P1',
  'Viator'
);

-- 263176P1: LISBON Street Art Tour 
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'LISBON Street Art Tour ',
  'Explore & experience one of the most beautiful and creative cities of Europe with our immersive walks passing by Lisbon''s urban art scenery.  Join our enthusiast & passionate team of street art lovers & artists who started this project over 10 years ago as the first ones in Lisbon. Open to anybody who wants to discover Lisbon for the first time or wants to dig into this vivid city through an artistic and fun way.  We highlight the political, economic, and social issues that gave rise to Lisb...',
  'Explore & experience one of the most beautiful and creative cities of Europe with our immersive walks passing by Lisbon''''s urban art scenery.  Join our enthusiast & passionate team of street art lovers & artists who started this project over 10 years',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/08/c8/01.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/08/c8/01.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/06/b4/ac.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/06/b4/ad.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/06/b4/b1.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/06/b4/b4.jpg"]'::jsonb,
  '[]'::jsonb,
  '["#whatsuplisboa card with our LOCAL partners-in-crime offering special deals ", "Spray tools for those who opted for the street art workshop on a totebag", "#whatsuplisboa recommendations with our partners-in-crime WORLDWIDE", "Learn about the wallpaintings, history & stories of a wide range of [inter]national street artists", "An experienced & passionate street art guide", "Your beloved support to our street art collective yesyoucan.spray and more murals in town !"]'::jsonb,
  '["en", "es", "fr", "nl", "pt"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  379,
  'Lisbon',
  true,
  19,
  'https://www.viator.com/en-GB/tours/Lisbon/Lisbon-Street-Art-Walk-and-Workshop/d538-263176P1',
  'Viator'
);

-- 325678P1: Traditional Portuguese Cooking Class in Lisbon
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Traditional Portuguese Cooking Class in Lisbon',
  'What better way to enjoy the best Portugal has to offer than experiencing a hands-on Traditional Portuguese Cooking Class in a cozy and fun environment.   So, you are not an experienced chef? No worries! During your Portuguese Traditional Cooking Class, our team of competent and empathic chefs and instructors will guide you through the preparation, step-by-step, of a three-course meal of typical Portuguese cuisine.  Ou cooking class includes the preparation of a three-course meal of typical P...',
  'What better way to enjoy the best Portugal has to offer than experiencing a hands-on Traditional Portuguese Cooking Class in a cozy and fun environment.   So, you are not an experienced chef? No worries! During your Portuguese Traditional Cooking Cla',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/03/f8/a7.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/03/f8/a7.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/03/f8/ae.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/03/f8/af.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/29/31/aa.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/29/31/ad.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Carbonated beverages", "Bottled water", "Alcoholic beverages", "Snacks", "Tea and coffee"]'::jsonb,
  '["en"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  287,
  'Lisbon',
  true,
  20,
  'https://www.viator.com/en-GB/tours/Lisbon/Traditional-Portuguese-Cooking-Class/d538-325678P1',
  'Viator'
);

-- 400715P1: Fado Show with Port Wine at Historic Lisboa em Fado 
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Fado Show with Port Wine at Historic Lisboa em Fado ',
  'Intimate Experience: Enjoy an intimate, microphone-free setting with a cozy venue and a small, respectful audience, providing an authentic and genuine Fado experience.  Local Talent & Music: Be serenaded by skilled local Fado artists whose emotive performances are accompanied by the enchanting sounds of traditional Portuguese guitars.  Soulful Repertoire: Immerse in the heart and soul of Portugal as you listen to a selection of treasured, soul-stirring Fado songs that convey the nation''s his...',
  'Intimate Experience: Enjoy an intimate, microphone-free setting with a cozy venue and a small, respectful audience, providing an authentic and genuine Fado experience.  Local Talent & Music: Be serenaded by skilled local Fado artists whose emotive pe',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/14/1d/3e.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/14/1d/3e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/bc/9d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/7b/1d/86.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/7b/1d/98.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/14/1d/52.jpg"]'::jsonb,
  '[]'::jsonb,
  '["A glass of Port wine or juice per ticket", "Entry ticket for Lisboa em Fado"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  278,
  'Lisbon',
  true,
  21,
  'https://www.viator.com/en-GB/tours/Lisbon/An-intimate-live-Fado-music-show-with-our-amazing-artists/d538-400715P1',
  'Viator'
);

-- 69837P1: Relaxing Sailboat Cruise along the Tagus
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Relaxing Sailboat Cruise along the Tagus',
  'Join us on a boat tour along the Tagus River. Come and visit Lisbon in a different way, be amazed by it’s colours, the way they spread over the hills and touch the river.  The sailing tour starts from Santo Amaro''s Dock) and the boat tour will take us to the Praça do Comércio, one of the most beautiful plazas in the word. From there we can see the old neighborhoods of Lisbon: Chiado, Baixa, Castelo and Alfama. Then the boat tour will take us to the other side of the river to get the widest p...',
  'Join us on a boat tour along the Tagus River. Come and visit Lisbon in a different way, be amazed by it’s colours, the way they spread over the hills and touch the river.  The sailing tour starts from Santo Amaro''''s Dock) and the boat tour will take ',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/15/66/b5.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/15/66/b5.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/c6/bd/8c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/c6/bd/eb.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/c6/bd/fe.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/f6/0b/40.jpg"]'::jsonb,
  '[]'::jsonb,
  '["White wine, rose wine or beer", "Bottled water", "Snacks"]'::jsonb,
  '["de", "en", "es", "fr", "pt"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  204,
  'Lisbon',
  true,
  22,
  'https://www.viator.com/en-GB/tours/Lisbon/Relaxing-Time-in-a-sailboat-A-different-way-to-look-at-Lisbon/d538-69837P1',
  'Viator'
);

-- 66870P4: Arrabida Safari – Europe's Most Beautiful Beach & Hidden Gems
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Arrabida Safari – Europe''s Most Beautiful Beach & Hidden Gems',
  'Experience to be driven in a classic jeep cabrio 4x4 in the most secret and inhospitable ways inside Arrábida Natural Park, discover the Pre-historic ruins, a secret cave and go inside the deep Mediterranean forest of Arrábida. Enjoy an afternoon in the beach of Galapinhos, considered by european best destinations, the most beautiful beach of Europe!',
  'Experience to be driven in a classic jeep cabrio 4x4 in the most secret and inhospitable ways inside Arrábida Natural Park, discover the Pre-historic ruins, a secret cave and go inside the deep Mediterranean forest of Arrábida. Enjoy an afternoon in ',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/2b/11/41.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/2b/11/41.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/a4/fc.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/b8/2c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/96/97/19.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/73/37/7d.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Hotel pickup and drop-off", "Local guide", "Bottled water", "Drive"]'::jsonb,
  '["en", "es", "fr", "pt"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  190,
  'Lisbon',
  true,
  23,
  'https://www.viator.com/en-GB/tours/Lisbon/Arrabida-Jeep-tour-to-the-most-beautiful-beach-of-Europe/d538-66870P4',
  'Viator'
);

-- 14060P13: Half Day Historical Walking Tour about the Slave Trade in Lisbon
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Half Day Historical Walking Tour about the Slave Trade in Lisbon',
  'On this small group 3 hour walking tour, you will learn how, in the 15th century, Portugal created the Atlantic Slave Trade, and how slavery went hand in hand with the journeys of exploration Portugal is most famous for.  This educational experience cover the locations in Lisbon''s historical city center associated with the Slave Trade and African History, but will also address Portugal''s contemporary History and the recent fall of the country''s colonial empire in the mid 1970''s.',
  'On this small group 3 hour walking tour, you will learn how, in the 15th century, Portugal created the Atlantic Slave Trade, and how slavery went hand in hand with the journeys of exploration Portugal is most famous for.  This educational experience ',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/36/07/f1.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/36/07/f1.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/26/dc/44.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/26/dc/49.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/36/07/f2.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/26/dc/43.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Professional guide", "Local taxes"]'::jsonb,
  '["en"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  176,
  'Lisbon',
  true,
  24,
  'https://www.viator.com/en-GB/tours/Lisbon/The-Slave-Trade-in-Lisbon-A-historical-walking-tour/d538-14060P13',
  'Viator'
);

-- 325678P3: Portuguese 'Petiscos' Cooking Class
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Portuguese ''Petiscos'' Cooking Class',
  'Join us on a fun environment and learn how to recreate these moments at home with simple and tasty recipes to impress all!  So, you are not an experienced chef? Perfect! Petiscos are simple tasty food and made to impress. During your experience, our team of competent chefs and instructors will guide you through the preparation process.  Our menus change seasonally so you can enjoy the freshest and premium ingredients Portugal has to offer. Don´t worry! We have a long list of Petiscos from whi...',
  'Join us on a fun environment and learn how to recreate these moments at home with simple and tasty recipes to impress all!  So, you are not an experienced chef? Perfect! Petiscos are simple tasty food and made to impress. During your experience, our ',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/08/95/e3.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/08/95/e3.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/08/95/e6.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/08/95/e7.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/08/95/e8.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/08/95/ec.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Carbonated beverages", "Bottled water", "Alcoholic beverages", "Snacks", "Tea and coffee"]'::jsonb,
  '["en"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  31,
  'Lisbon',
  true,
  25,
  'https://www.viator.com/en-GB/tours/Lisbon/Portuguese-Petiscos-Cooking-Class/d538-325678P3',
  'Viator'
);

-- 5636223P1: Lisbon Painting Workshop in Majólica
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Painting Workshop in Majólica',
  'Have you ever painted your own Portuguese tiles in a creative experience full of history? In this Majólica workshop, you will discover one of the most emblematic techniques of Portuguese ceramics, in a relaxed environment, surrounded by authentic tiles.  The experience begins with a practical introduction to the technique, materials and painting on raw glass. During 60 minutes you can paint 2 tiles per person (each extra tiles + 10€), choosing between free painting or stencils with historical...',
  'Have you ever painted your own Portuguese tiles in a creative experience full of history? In this Majólica workshop, you will discover one of the most emblematic techniques of Portuguese ceramics, in a relaxed environment, surrounded by authentic til',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Learn & Create',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6a/b6/f0/caption.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6a/b6/f0/caption.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6a/b6/f8/caption.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6a/b7/0e/caption.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6a/b7/1e/caption.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/r/32/6a/b7/45/caption.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Ceramic Material"]'::jsonb,
  '["en", "es", "fr", "pt"]'::jsonb,
  'Free cancellation up to 24h before',
  0.0,
  0,
  'Lisbon',
  true,
  26,
  'https://www.viator.com/en-GB/tours/Lisbon/Lisbon-Painting-Workshop-in-Majolica/d538-5636223P1',
  'Viator'
);

-- 5614014P2: Lisbon Street Photography Photowalks
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Street Photography Photowalks',
  'Most photo walks focus on postcard views or preset stops. This experience is different. Led by Jaki, a working photographer and co-founder of the Lisbon Street Photo Fest, it focuses on how to see rather than where to go. The walk blends teaching and exploration, moving through areas chosen for their light, texture, and atmosphere. You’ll learn how to read a scene, notice timing and rhythm, and photograph with intention instead of impulse. The group stays small so everyone receives personal g...',
  'Most photo walks focus on postcard views or preset stops. This experience is different. Led by Jaki, a working photographer and co-founder of the Lisbon Street Photo Fest, it focuses on how to see rather than where to go. The walk blends teaching and',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Learn & Create',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/05/cf/6b.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/05/cf/6b.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/05/cf/6c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/05/cf/6d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/05/cf/6e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/05/cf/6f.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Tea and coffee"]'::jsonb,
  '["en"]'::jsonb,
  'Free cancellation up to 24h before',
  0.0,
  0,
  'Lisbon',
  true,
  27,
  'https://www.viator.com/en-GB/tours/Lisbon/Lisbon-Street-Photography-Photowalks/d538-5614014P2',
  'Viator'
);

-- 164947P46: Lisbon Sketching Tour and Discover Hidden Views and Art
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Sketching Tour and Discover Hidden Views and Art',
  'Join this exclusive Lisbon Sketching Tour and uncover the city’s charm through the eyes of Natercia, a talented local artist. Over a relaxed, one-day urban sketching adventure, you’ll explore Lisbon’s most iconic and secret viewpoints—places loved by artists and locals alike. Your guide, a Portuguese artist, will share fascinating stories and fun facts about Lisbon’s historic streets and hidden corners as you capture the city’s beauty with your own sketches. No prior art experience needed—thi...',
  'Join this exclusive Lisbon Sketching Tour and uncover the city’s charm through the eyes of Natercia, a talented local artist. Over a relaxed, one-day urban sketching adventure, you’ll explore Lisbon’s most iconic and secret viewpoints—places loved by',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Learn & Create',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/a2/38.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/a2/38.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/a2/1f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/a2/3a.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/a2/41.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Tickets to Church and museum of Carmo", "An artist that will be your private teacher and guide", "brushes, paints and postcards"]'::jsonb,
  '["en", "pt"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  3,
  'Lisbon',
  true,
  28,
  'https://www.viator.com/en-GB/tours/Lisbon/Lisbon-Sketching-Tour-Discover-Hidden-Views-and-Art/d538-164947P46',
  'Viator'
);

-- 7842P37: Lisbon Photography Masterclass - Private Photography Lesson
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Photography Masterclass - Private Photography Lesson',
  'Washed in an artist''s light, the roller coaster city of Lisbon was made for photography. Stroll through the streets during this 3 or 6 hour photography focused exploration. Shoot the old steps of Alpharma, of catch a view of the city from one of its many lookouts, or just shoot the city''s inhabitants and end up with some classic shots of the beautiful squares with a professional photographer in tow to help you with all your technical settings and to unleash your creative side. From armature...',
  'Washed in an artist''''s light, the roller coaster city of Lisbon was made for photography. Stroll through the streets during this 3 or 6 hour photography focused exploration. Shoot the old steps of Alpharma, of catch a view of the city from one of its',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Learn & Create',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/a3/d6/88.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/a3/d6/88.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/74/aa/ca.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/a3/d6/35.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/a3/d6/36.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/a3/d6/3c.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Local guide", "Private tour", "Professional photographer guide"]'::jsonb,
  '["en", "fr", "pt"]'::jsonb,
  'Free cancellation up to 24h before',
  4.6,
  5,
  'Lisbon',
  true,
  29,
  'https://www.viator.com/en-GB/tours/Lisbon/Private-Lisbon-Photography-Walking-Tour-with-a-Professional-Photographer/d538-7842P37',
  'Viator'
);

-- 268183P7: Age of Discoveries Walking Tour in Belém
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Age of Discoveries Walking Tour in Belém',
  'Join our Belém Free Walking Tour in Lisbon and dive into the Age of Discovery. Start in the lush Afonso de Albuquerque Gardens, then be enchanted by the aroma of Pastéis de Belém, a legendary treat. Wander past the Jerónimos Monastery, feeling the pulse of Portugal''s golden era.  Discover the legacy of Prince Henry at the School of Sagres and marvel at the Monument to the Discoveries. Our tour culminates at Belém Tower, by the Tagus River, where the spirit of exploration comes alive.  This i...',
  'Join our Belém Free Walking Tour in Lisbon and dive into the Age of Discovery. Start in the lush Afonso de Albuquerque Gardens, then be enchanted by the aroma of Pastéis de Belém, a legendary treat. Wander past the Jerónimos Monastery, feeling the pu',
  'Lisbon',
  'Lisbon',
  38.7223,
  -9.1393,
  0,
  'EUR',
  '3h',
  12,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/84/19/1c.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/84/19/1c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/84/19/3a.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/84/19/3d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/84/19/43.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/84/19/49.jpg"]'::jsonb,
  '[]'::jsonb,
  '["Expert and Passionate Free Tour Guide"]'::jsonb,
  '["en", "es"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  1517,
  'Lisbon',
  true,
  30,
  'https://www.viator.com/en-GB/tours/Lisbon/Age-of-Discoveries-Walking-Tour-Belem/d538-268183P7',
  'Viator'
);

