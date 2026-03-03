-- ============================================
-- Porto Batch 5: 6 Viator experiences in Porto
-- Products: 194996P4, 66616P4, 19333P1, 7812P85, 405446P1, 168365P4
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Porto: Private Tour to the Historic Center in a Classic Car (194996P4)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Porto: Private Tour to the Historic Center in a Classic Car',
  'Vintage Experience: Traveling in a classic car provides a nostalgic and unique atmosphere, reminiscent of times past. Scenic Beauty: The routes include stunning views of Porto, such as the Luís I Bridge and the Douro River estuary, allowing participants to appreciate the city''s beauty. Cultural Immersion: A tour passes through important historical and cultural landmarks, such as the Palácio da Bolsa (Stock Exchange Palace) and the Igreja de São Francisco (Church of Saint Francis), providing a deep understanding of the city''s heritage. Personalized Interaction: The possibility of an interactive and engaging guide enriches the experience, with space for questions and dialogue. Relaxing Atmosphere: The calm pace of the tour offers a moment of relaxation, allowing visitors to absorb the atm...',
  'Vintage Experience: Traveling in a classic car provides a nostalgic and unique atmosphere, reminiscent of times past. Scenic Beauty: The routes include stunning views of Porto, such as the Luís I Brid',
  'Porto',
  '',
  41.1579,
  -8.6291,
  39.0,
  'EUR',
  '1h 30min',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/b8/29/b2.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/b8/29/b2.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/b8/29/b1.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/b8/29/82.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/9e/1e/d2.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/b8/29/87.jpg"]'::jsonb,
  '["Porto: Private Tour to the Historic Center in a Classic Car"]'::jsonb,
  '["Private transportation"]'::jsonb,
  '["English", "French", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  23,
  'Porto',
  true,
  128,
  'https://www.viator.com/tours/Porto/Rabelo-Tour/d26879-194996P4?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 2) Waterfalls, Heritage and Nature in Gerês Park - from Porto (66616P4)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Waterfalls, Heritage and Nature in Gerês Park - from Porto',
  'This visit is an authentic portrait of the region! With a foot inside and outside the protected area of the Peneda Gerês National Park (UNESCO 2010), within just 1 hour from your pick up at Porto, we offer a comprehensive itinerary touching on the legacy, landscape and genesis without forgetting the contact with beautiful waterfalls and lagoons that are off the radar. Get ready to discover the most beautiful spots in the region and feel the peaceful, rural lifestyle of its inhabitants. This is the Authentic Portugal!',
  'This visit is an authentic portrait of the region! With a foot inside and outside the protected area of the Peneda Gerês National Park (UNESCO 2010), within just 1 hour from your pick up at Porto, we ',
  'Under the arch "Porta Nova"',
  'Under the arch "Porta Nova"',
  41.1579,
  -8.6291,
  238.0,
  'EUR',
  'Full day',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/ed/3b/09.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/ed/3b/09.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/60/2e/e3.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/ed/3b/9d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/60/2e/67.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/ed/3c/fd.jpg"]'::jsonb,
  '["Here you will hike on the ancient roman path knowned as - Geira", "Meet the DEVIL''S BRIDGE. Attach to the roman Geira we will find a bridge and water cliff wrapped in ", "The Wolf territory! This small village has a lot to discover, and is where we also make our lunch br", "Enjoy the crystalline water lagoons...", "You will experience the most breathtaking views from the best sightseeing spots.", "You will see and visit a small old village, with only a few inhabitants. Pure state contryside!"]'::jsonb,
  '["Private transportation", "Other", "In-vehicle air conditioning", "Local portuguese Guide/Driver", "Personal accident and liability insurance", "Bottled water", "Contribution to a local development association"]'::jsonb,
  '["English", "French", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  14,
  'Porto',
  true,
  129,
  'https://www.viator.com/tours/Porto/Geres-National-Park-Nature-and-Countryside/d26879-66616P4?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 3) Shopping, cooking and eating together at my home in Porto (19333P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Shopping, cooking and eating together at my home in Porto',
  'Instead of going to the restaurant, how about learning how to make some traditional Portuguese specialities? You''ll be taken to the supermarket or to an organic garden and then you''ll make a meal that you will never forget! We will have always enjoy some cheese, ham, extra virgin olive oil, olives and also a salad. We will also have Dessert and Port wine and Coffee and/or tea',
  'Instead of going to the restaurant, how about learning how to make some traditional Portuguese specialities? You''ll be taken to the supermarket or to an organic garden and then you''ll make a meal that',
  'first left (1esq)',
  'first left (1esq)',
  41.1579,
  -8.6291,
  90.0,
  'EUR',
  '3h 30min',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/6f/3a/29.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/6f/3a/29.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/6f/3a/2a.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/26/b9/b8.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/26/b9/f9.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/26/ba/25.jpg"]'::jsonb,
  '["Shopping, cooking and eating together at my home in Porto"]'::jsonb,
  '["Local guide", "Snacks", "Food tasting"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  70,
  'Porto',
  true,
  130,
  'https://www.viator.com/tours/Porto/Portuguese-Gastronomy-Guided-Workshop-in-Porto/d26879-19333P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 4) Porto Food Tour of 8 Tastings: Custard Tart, Bifana & Hidden Gems (7812P85)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Porto Food Tour of 8 Tastings: Custard Tart, Bifana & Hidden Gems',
  'On our Secret Food Tour: Porto, you''ll start in the heart of Porto''s city center at Coliseu, the largest theater in the city. From there you''ll discover a traditional open-air market; feast on a variety of fresh foods; test local alcohols and come face to face with stunning, quintessential Portuguese architecture. Learn about the area''s fascinating history; experience Porto''s colorful culture; and get a sense of what local life in this idyllic coastal city is like, all while tasting delicious, authentic Portuguese cuisine.',
  'On our Secret Food Tour: Porto, you''ll start in the heart of Porto''s city center at Coliseu, the largest theater in the city. From there you''ll discover a traditional open-air market; feast on a varie',
  'We''ll meet in the Coliseu Porto Ageas, Rua Passos Manuel , 137. Our guide will be standing there to ',
  'We''ll meet in the Coliseu Porto Ageas, Rua Passos Manuel , 137. Our guide will be standing there to greet you with our orange Secret Food Tours umbrella so we are easy to spot!',
  41.1579,
  -8.6291,
  83.0,
  'EUR',
  '3h 30min',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/70/e5/65.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/70/e5/65.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/a0/ac/36.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/70/e5/60.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/70/e5/61.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/a0/ac/21.jpg"]'::jsonb,
  '["The first building in Portugal aimed from its conception to be exclusively dedicated to music, eithe", "Small, historic urban park with a serene vibe featuring a variety of trees, plants & sculptures.", "One of the most beautiful and liveliest districts in Porto''s historic centre.", "A double-deck metal arch bridge that spans the River Douro between the cities of Porto and Vila Nova", "The tallest campanile in Portugal which can be seen from various points of the city and is one of it"]'::jsonb,
  '["Tea or Coffee | Water", "Flaky, creamy Portuguese custard tart (Pastel de Nata)", "Our delicious Secret Dish", "Bifana – tender pork sandwich with local spices", "Crisp Vinho Verde | Local Beer | Aged Port Wine", "The Most Traditional codfish cake", "Traditional canned Portuguese fish with rich flavors"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  231,
  'Porto',
  true,
  131,
  'https://www.viator.com/tours/Porto/Secret-Food-Tours-Porto/d26879-7812P85?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 5) LGBTour Porto: Walk through Porto, discover the LGBTQIA+ History (405446P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'LGBTour Porto: Walk through Porto, discover the LGBTQIA+ History',
  'This experience aims to provide an accessible tour through the central area of Porto, recalling impactful moments that defined LGBTQIAP+ history in the city. This queertour is goven by a gay person native to this city who has experienced these events throughout his 39 years of life. It''s an intimate experience that focuses on the social evolution and awareness of the community over the years and how the city began its journey towards inclusion. We will embark together on a journey remembering facts and analyzing the paradox between two times and destinations in the history of the LGBTQIAP+ community: the 80s to the present day. We will visit different tourist spots that at first glance we would not realize their impact on the community and visit inclusive spaces. We will end with a conv...',
  'This experience aims to provide an accessible tour through the central area of Porto, recalling impactful moments that defined LGBTQIAP+ history in the city. This queertour is goven by a gay person na',
  'In front of the Kebab Restaurante coffee.',
  'In front of the Kebab Restaurante coffee.',
  41.1579,
  -8.6291,
  32.0,
  'EUR',
  '3h',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/7d/12/ba.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/7d/12/ba.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/7d/12/bb.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/7d/12/e1.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/7d/12/e6.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/7d/12/ea.jpg"]'::jsonb,
  '["At the beginning of the tour, we pass by Campo 24 de Agosto where we will see the first location of ", "In this place we will observe and analyze how time and tourism have changed one of the areas that im"]'::jsonb,
  '["Bottled water"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  51,
  'Porto',
  true,
  132,
  'https://www.viator.com/tours/Porto/Caminhe-pelo-Porto-e-descubra-a-historia-LGBTQIA/d26879-405446P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 6) Best of Porto Walking Private Guided Tour (168365P4)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Best of Porto Walking Private Guided Tour',
  'During our Walking Tour you will discover the best of Porto, understand the its culture and lifestyle and become a true Tripeiro. Join us and let this magical city tell you its story in the most unique way possible.',
  'During our Walking Tour you will discover the best of Porto, understand the its culture and lifestyle and become a true Tripeiro. Join us and let this magical city tell you its story in the most uniqu',
  'Our team will be waiting for you properly uniformed and wearing an ID card around their neck.',
  'Our team will be waiting for you properly uniformed and wearing an ID card around their neck.',
  41.1579,
  -8.6291,
  26.66,
  'EUR',
  '3h',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/22/41/a6.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/22/41/a6.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/22/44/1b.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/ec/b7/dc.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/22/42/93.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/ec/b7/e2.jpg"]'::jsonb,
  '["The guests will see the inside of the Railway station, hear about its history and the guide will tel", "The guests will see the outside of the Tower of Clérigos, hear about its history and the guide will ", "The guests will see the outside of the Cathedral, and hear the story about an important wedding that", "During our Walking Tour the guests will see the most important sightseeing points in the city of Por"]'::jsonb,
  '["The guide"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  144,
  'Porto',
  true,
  133,
  'https://www.viator.com/tours/Porto/Best-of-Porto-Walking-Tour/d26879-168365P4?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

