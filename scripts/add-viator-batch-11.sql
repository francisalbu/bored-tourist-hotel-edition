-- ============================================
-- Batch 9: Add 6 Viator experiences to Supabase
-- Products: 406236P1, 203526P27, 24774P7, 23208P8, 465228P1, 16730P3
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Sintra, Pena Palace, Cabo da Roca & Cascais Day Tour (406236P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Sintra, Pena Palace, Cabo da Roca & Cascais: Small Group Day Tour',
  'Discover three of Portugal''s most iconic destinations in a single unforgettable day on this small-group tour from Lisbon. Begin with the fairy-tale town of Sintra, a UNESCO World Heritage Site nestled in lush green mountains, where you''ll skip the long lines and step inside the colourful Pena Palace — a masterpiece of Romantic architecture perched high above the landscape. Wander through the exotic royal gardens following in the footsteps of Portuguese kings and queens, and drink in sweeping panoramic views of the countryside stretching to the Atlantic. After free time in Sintra''s charming centre for lunch and exploration, continue to Cabo da Roca — the westernmost point of continental Europe — where towering cliffs meet the crashing ocean in a dramatic spectacle of nature. Snap unforgettable photos of the rugged coastline before the final stop in Cascais, an elegant seaside resort on the Portuguese Riviera. Stroll the pastel-hued streets, browse boutique shops, and soak in the golden coastal light. A seamless, picture-perfect day that covers Sintra''s palaces, Europe''s edge, and the Riviera charm of Cascais.',
  'A small-group day tour from Lisbon — skip-the-line Pena Palace, exotic gardens, Cabo da Roca cliffs and the elegant seaside town of Cascais.',
  'Sintra, Cabo da Roca & Cascais',
  'In front of "Tabacaria Turista", Lisbon (pickup)',
  38.7979,
  -9.3881,
  65,
  'EUR',
  'Full day',
  8,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/15/9f/5b/66.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/15/9f/5b/66.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/15/9f/5b/6c.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/13/2a/d4/41.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/13/2a/d4/40.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/10/7d/af/59.jpg"]'::jsonb,
  '["Skip-the-line entry to the colourful Pena Palace","Explore the exotic royal gardens of Sintra","Stand at Cabo da Roca — continental Europe''s westernmost point","Free time for lunch in Sintra''s charming historic centre","Stroll the elegant seaside streets of Cascais","Small group experience for a personal touch","Panoramic views from mountains to Atlantic coast"]'::jsonb,
  '["Skip-the-line ticket to Pena Palace exteriors and gardens","Small group transport from Lisbon","Professional guide"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  94,
  'Lisbon',
  true,
  45,
  'https://www.viator.com/en-GB/tours/Lisbon/Lisbon-Pena-Palace-and-Garden-Sintra-CaboRoca-Cascais-DayTour/d538-406236P1',
  'Viator'
);

-- 2) Lisbon's Post-Colonial Feast (203526P27)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon''s Post-Colonial Feast: A Culinary Journey Through History',
  'Explore the complex, layered story of post-colonial Portugal through the kitchens and hidden gems of central Lisbon on this fascinating full-day food tour. Start with the signature Cape Verdean stew, cachupa — packed with hominy, studded with Portuguese chorizo and topped with an egg — prepared by the self-proclaimed "King of Cachupa" himself. Sip coffee from Angola and taste chocolate from São Tomé, learning about these commodities'' deep roots in slavery and their current evolution toward free-trade standards. Visit a shop selling religious icons from Brazil and discover how African religious traditions were disguised within Catholicism for centuries by colonial subjects of the Portuguese crown. This is far more than a food tour — it''s a thoughtful, eye-opening exploration of how colonialism shaped Lisbon''s multicultural identity, told through the flavours, stories and communities that make this city so uniquely rich. Led by an expert guide who weaves history, culture and cuisine into every bite.',
  'A full-day culinary walk through Lisbon''s post-colonial heritage — taste Cape Verdean cachupa, Angolan coffee, São Tomé chocolate and discover hidden multicultural stories.',
  'Arroios & Central Lisbon',
  'Exit of Arroios Metro station, Praça do Chile (in front of "Zainphone" shop)',
  38.7302,
  -9.1345,
  150,
  'EUR',
  'Full day',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0f/e6/e8/22.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0f/e6/e8/22.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0f/e6/e8/fa.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0f/e8/7d/7a.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0f/e8/7d/7b.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0f/e8/7d/7c.jpg"]'::jsonb,
  '["Taste the signature Cape Verdean cachupa from the ''King of Cachupa''","Sip Angolan coffee and São Tomé chocolate with historical context","Discover how African religious traditions were disguised within Catholicism","Explore Lisbon''s multicultural post-colonial neighbourhoods","A thought-provoking blend of food, history and cultural identity","Expert guide weaving colonialism, cuisine and community stories","All food tastings included throughout the full-day tour"]'::jsonb,
  '["All food tastings and drinks throughout the tour","Expert local guide","Walking tour through historic neighbourhoods"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  90,
  'Lisbon',
  true,
  46,
  'https://www.viator.com/en-GB/tours/Lisbon/Lisbons-Post-Colonial-Feast/d538-203526P27',
  'Viator'
);

-- 3) Lisbon Fado Experience: Walking Tour, Dinner & Live Show (24774P7)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Fado Night: Walking Tour, Dinner & Live Music Show',
  'Experience Portugal''s soul through its most iconic musical tradition on this immersive Fado evening in Lisbon. Begin with a guided walking tour (approx. 1 hour) through the atmospheric alleys and winding streets of Mouraria and Alfama — the working-class neighbourhoods where Fado was born. Your guide reveals the history and cultural significance of this uniquely Portuguese art form, and how its mournful, heartbreaking lyrics shaped the country''s identity and sense of saudade. As evening falls, settle into a traditional Fado house where live performers — accompanied by the distinctive Portuguese guitar — fill the intimate room with raw emotion and haunting melodies. While you lose yourself in the music, enjoy a typical Portuguese dinner of homemade food paired with local wine. Warm ambiance, candlelit tables, soulful music and authentic cuisine come together for the quintessential Lisbon evening. An unforgettable night that captures the true spirit of Portugal.',
  'An immersive Fado evening — walking tour through Mouraria and Alfama, traditional Portuguese dinner and live Fado show with Portuguese guitar.',
  'Mouraria & Alfama, Lisbon',
  'Lisbon Destination Hostel, 2nd floor of Rossio Train Station (in front of ticket office)',
  38.7139,
  -9.1396,
  49,
  'EUR',
  '4h',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/14/b8/e1/2f.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/14/b8/e1/2f.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/14/b8/e1/2b.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/14/b8/e1/2a.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/14/b8/e1/24.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/14/b8/e1/25.jpg"]'::jsonb,
  '["Walking tour through Mouraria and Alfama — Fado''s birthplace","Live Fado performance with traditional Portuguese guitar","Traditional Portuguese dinner with homemade food and wine","Learn about the cultural history and meaning behind Fado","Intimate candlelit Fado house atmosphere","Discover how Fado shaped Portugal''s identity and sense of saudade","337+ reviews — one of Lisbon''s most popular evening experiences"]'::jsonb,
  '["Guided walking tour through Mouraria and Alfama","Traditional Portuguese dinner with wine","Live Fado music show","Insurance","Professional guide"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.5,
  337,
  'Lisbon',
  true,
  47,
  'https://www.viator.com/en-GB/tours/Lisbon/Fado-Tour/d538-24774P7',
  'Viator'
);

-- 4) Sintra & Cascais 4x4 Land Rover Panoramic Private Tour (23208P8)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Sintra & Cascais 4x4 Land Rover Panoramic Private Tour',
  'This is not your typical sightseeing tour — it''s an adventure. Climb aboard a custom Land Rover and explore the dramatic landscapes of Sintra and Cascais from viewpoints most visitors never reach. Designed for those who crave visual memories, cultural depth and off-road thrills, this private tour takes you through the Sintra Mountains, past hidden palaces, and along the rugged Atlantic coastline. Stop at the Peninha Sanctuary perched atop the mountain with staggering ocean views, discover secret beaches nestled beneath the cliffs, and drive through Estoril — the glamorous international resort that sheltered European royalty during World War II. Continue to the Portuguese Riviera town of Cascais, where cosmopolitan streets meet fishing village charm. Stand at Cabo da Roca, continental Europe''s westernmost point, where the land dramatically gives way to the Atlantic. Your private guide shares the history, gastronomy and culture of each stop, while the Land Rover conquers terrain a regular bus could only dream of. With hotel pickup and drop-off, this is the most exhilarating way to experience Sintra and Cascais.',
  'A private 4x4 Land Rover tour through Sintra and Cascais — hidden viewpoints, off-road thrills, Cabo da Roca, Peninha Sanctuary and the Portuguese Riviera.',
  'Sintra & Cascais',
  'Hotel pickup in Lisbon',
  38.7979,
  -9.3881,
  231,
  'EUR',
  'Full day',
  NULL,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/15/82/7a/2f.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/15/82/7a/2f.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/06/6f/7c/e9.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/06/6f/7c/eb.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/15/82/78/f7.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/15/82/78/f8.jpg"]'::jsonb,
  '["Private tour in a custom 4x4 Land Rover","Reach hidden viewpoints inaccessible by regular transport","Visit the Peninha Sanctuary with staggering ocean panoramas","Stand at Cabo da Roca — Europe''s westernmost point","Explore Estoril, Cascais and the Portuguese Riviera","Perfect 5.0 rating from 69 reviews","Hotel pickup and drop-off included"]'::jsonb,
  '["Hotel pickup and drop-off in Lisbon","Private tour in custom Land Rover","Private guide (multilingual)"]'::jsonb,
  '["Portuguese","English","French","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  69,
  'Lisbon',
  true,
  48,
  'https://www.viator.com/en-GB/tours/Lisbon/Land-Rover-Panoramic-Tour-Cascais-Sintra/d538-23208P8',
  'Viator'
);

-- 5) Lisbon Sunset Sailing Cruise with Drinks & Tapas (465228P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Sunset Sailing Cruise with Drinks & Portuguese Tapas',
  'Chase the last golden rays of light on a magical 2-hour sunset cruise along the Lisbon waterfront. As the city bathes in warm amber hues, sail between the iconic riverbanks of the Tagus with a charismatic crew who shares fascinating stories about each landmark you pass. Welcome aboard with a Moscatel cocktail, then settle in with Portuguese wine, beer or juice as a trio of traditional bites is served: crispy codfish cakes (pastéis de bacalhau), tender suckling pig pastries and the legendary pastel de nata. Toast the evening with a bitter almond liqueur as iconic landmarks glide past — Praça do Comércio, the ancient Alfama hillside, the towering Cristo Rei, Belém Tower, the dramatic 25 de Abril Bridge, and the modern MAAT museum. Cosy blankets are provided for the cooler evening breeze. Meet new travellers, feel the soul of Lisbon from the water, and watch the city transform as the sun dips below the horizon. A truly unforgettable way to end a day in Lisbon.',
  'A 2-hour sunset cruise on the Tagus — Moscatel cocktail, Portuguese tapas, codfish cakes, pastéis de nata and iconic landmarks bathed in golden light.',
  'Tagus River, Lisbon',
  'Office 6, Doca do Espanhol (20m in front, facing the river, at Gate 1)',
  38.6941,
  -9.1780,
  40,
  'EUR',
  '2h',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/13/2b/6a/9c.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/13/2b/6a/9c.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/15/82/69/6d.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/12/d6/69/d2.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/13/2b/6a/a8.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/15/82/69/71.jpg"]'::jsonb,
  '["Sail at sunset along the Tagus past Lisbon''s iconic landmarks","Welcome Moscatel cocktail and bitter almond liqueur toast","Portuguese tapas: codfish cakes, suckling pig pastry and pastel de nata","See Belém Tower, Cristo Rei, 25 de Abril Bridge and Alfama from the water","Wine, beer or juice included throughout the cruise","Cosy blankets provided for the evening breeze","A magical, romantic way to end a day in Lisbon"]'::jsonb,
  '["Moscatel cocktail welcome drink","Portuguese wines, beer or juice","Trio of tapas (codfish cake, suckling pig pastry, pastel de nata)","Bitter almond liqueur toast","Blankets for comfort","2-hour sunset cruise"]'::jsonb,
  '["Portuguese","English"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  70,
  'Lisbon',
  true,
  49,
  'https://www.viator.com/en-GB/tours/Lisbon/2-horas-passeio-de-veleiro-ao-por-do-sol/d538-465228P1',
  'Viator'
);

-- 6) Authentic Fado Show, Dinner & Night Tour (16730P3)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon by Night: Authentic Fado Show, Dinner & Panoramic Tour',
  'Experience the very best of Lisbon after dark on this all-inclusive evening that combines an authentic Fado performance, a delicious traditional dinner with drinks, and a panoramic night tour of the illuminated city. Begin at a genuine Fado restaurant where talented performers — accompanied by the soulful Portuguese guitar — fill the intimate room with the haunting melodies that define Portugal''s musical identity. While the music stirs your emotions, indulge in a spread of Portuguese specialities with all beverages included. After dinner, step into the Lisbon night for a panoramic drive through the historic city centre. While Lisbon is beautiful by day, the evening lights add a charismatic, magical touch — revealing the city of light without the daytime crowds. Glide past the illuminated National Pantheon, the ancient streets of Alfama, the Fado Museum and more, as your guide shares the stories and legends behind each landmark. With hotel pickup and drop-off included, this is the definitive Lisbon night experience: culture, cuisine and city lights all in one seamless evening.',
  'The ultimate Lisbon night — authentic Fado show with dinner and drinks, followed by a panoramic tour of the illuminated city. Hotel pickup included.',
  'Alfama & Historic Lisbon',
  'Hotel pickup in Lisbon',
  38.7139,
  -9.1301,
  235,
  'EUR',
  '4h',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0d/0a/86/32.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0d/0a/86/32.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0d/0a/86/29.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0d/0a/86/33.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0d/0a/86/30.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0d/0a/86/0d.jpg"]'::jsonb,
  '["Authentic Fado show at a genuine traditional restaurant","Full Portuguese dinner with all drinks included","Panoramic night tour of illuminated Lisbon landmarks","See the National Pantheon, Alfama and Fado Museum lit up at night","Hotel pickup and drop-off for a seamless experience","Professional and local guides throughout the evening","Experience Lisbon''s magical nighttime atmosphere without the crowds"]'::jsonb,
  '["Hotel pickup and drop-off","Traditional Portuguese dinner with all drinks","Authentic Fado show with live performers","Panoramic night tour of Lisbon","Local guide and professional guide"]'::jsonb,
  '["Portuguese","English","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.4,
  73,
  'Lisbon',
  true,
  50,
  'https://www.viator.com/en-GB/tours/Lisbon/Fado-Show-and-Dinner-all-included/d538-16730P3',
  'Viator'
);
