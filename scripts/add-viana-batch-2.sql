-- ============================================
-- Viana do Castelo Batch 2: 7 experiences (all GYG)
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- GYG: Serra D'Arga Canyoning (t965527)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Serra D''Arga Canyoning',
  'On this tour, you''ll enjoy water walking, water jumps, rappelling, slides, and zip-lining.

Besides a fantastic activity, you''ll get to know the best places in the Sacred Mountain (Serra D''Arga).',
  'On this tour, you''ll enjoy water walking, water jumps, rappelling, slides, and zip-lining.

Besides a fantastic activity, you''ll get to know the best places in the Sacred Mountain (Serra D''Arga).',
  'Viana do Castelo',
  '',
  42.3465576171875,
  -8.003439903259277,
  65.0,
  'EUR',
  '4h',
  NULL,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/b454fb701a3a5a45318c9cdb50d7b285bb30034a10b8acd3c82abadb4ba67a5e.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/b454fb701a3a5a45318c9cdb50d7b285bb30034a10b8acd3c82abadb4ba67a5e.jpg/145.jpg"]'::jsonb,
  '["4 hours", "Guide: English", "Meet at EM552 19, 4910 Arga de Baixo, Portugal"]'::jsonb,
  '["Explore Porto", "Places to see", "Things to do", "Trip inspiration"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  21,
  'Viana do Castelo',
  true,
  148,
  'https://www.getyourguide.com/en-gb/porto-l151/serra-d-arga-canyoning-t965527/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Rafting em Melgaço, Rio Minho (t485748)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Rafting em Melgaço, Rio Minho',
  'Rafting in Rio Minho is a great choice to explore and get fun at the same time. It''s a activity for all family where you can raft, swin ans even jump to the water. Join us!',
  'Rafting in Rio Minho is a great choice to explore and get fun at the same time. It''s a activity for all family where you can raft, swin ans even jump to the water. Join us!',
  'Viana do Castelo',
  '',
  39.399871826171875,
  -8.224453926086426,
  50.0,
  'EUR',
  '3h',
  NULL,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/607c75acc77db430850fbdf3acebf872861bc5eb42a494c94d3dd86ecaaeb8c0.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/607c75acc77db430850fbdf3acebf872861bc5eb42a494c94d3dd86ecaaeb8c0.jpg/145.jpg"]'::jsonb,
  '["3 hours", "Instructor: English", "Meet at Monte do Prado, 4960-320 Melgaço, Portugal"]'::jsonb,
  '["Explore Viana do Castelo District", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  14,
  'Viana do Castelo',
  true,
  149,
  'https://www.getyourguide.com/en-gb/viana-do-castelo-l165161/rafting-rio-minho-t485748/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Viana do Castelo: Guided Bike Tour at Feelviana (t1224320)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Viana do Castelo: Guided Bike Tour at Feelviana',
  'Explore Viana do Castelo on a guided bike tour with premium Scott bikes. Choose from road, mountain, gravel, or e-bike options and ride through diverse terrains with expert guides.',
  'Explore Viana do Castelo on a guided bike tour with premium Scott bikes. Choose from road, mountain, gravel, or e-bike options and ride through diverse terrains with expert guides.',
  'Viana do Castelo',
  '',
  41.55038833618164,
  -8.426130294799805,
  100.0,
  'EUR',
  '3h 30min',
  NULL,
  'Sports',
  'https://cdn.getyourguide.com/img/tour/f678f2efca118676e0ee9a280d0168244d8c8e8bd039bd5527beac95b16130e2.png/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/f678f2efca118676e0ee9a280d0168244d8c8e8bd039bd5527beac95b16130e2.png/145.jpg"]'::jsonb,
  '["Feel the thrill of adventure as you explore diverse terrains by bike", "Choose from road, mtb, gravel or e-bike options to suit your style", "Ride through dirt roads, cliffs, wild beaches, and pine forests", "Enjoy the support of experienced local guides familiar with the trails"]'::jsonb,
  '["Explore Viana do Castelo District", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  0,
  0,
  'Viana do Castelo',
  true,
  150,
  'https://www.getyourguide.com/en-gb/viana-do-castelo-l165161/viana-do-castelo-guided-bike-tour-at-feelviana-t1224320/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Hike, Dive & Dine Like A Local in a Secret Spot (t568620)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Hike, Dive & Dine Like A Local in a Secret Spot',
  'Discover the best secret places in Minho and end with a Portuguese beer in one hand, and a table full of Minho’s best traditional food.',
  'Discover the best secret places in Minho and end with a Portuguese beer in one hand, and a table full of Minho’s best traditional food.',
  'Viana do Castelo',
  '',
  54.525962829589844,
  15.255118370056152,
  100.0,
  'EUR',
  '3h 30min',
  NULL,
  'Outdoors',
  'https://cdn.getyourguide.com/img/tour/5fb5f3123e966ded733d01833d96bbf34efcaeabf8452fa99af8cf93be58df0a.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/5fb5f3123e966ded733d01833d96bbf34efcaeabf8452fa99af8cf93be58df0a.jpeg/145.jpg"]'::jsonb,
  '["Dive in a secret lagoon", "Time to taste the best traditional food", "Discover a secret waterfall and lagoon – a true hidden gem of Viana do Castelo."]'::jsonb,
  '["Explore Viana do Castelo District", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  0,
  0,
  'Viana do Castelo',
  true,
  151,
  'https://www.getyourguide.com/en-gb/viana-do-castelo-l165161/hike-dive-dine-like-a-local-in-a-secret-spot-t568620/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Viana do Castelo Costume Museum (t593250)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Viana do Castelo Costume Museum',
  'The Viana do Castelo Costume Museum is a non-profit institution, which incorporates cultural assets and values them through research, inventory, conservation, exhibition and interpretation.',
  'The Viana do Castelo Costume Museum is a non-profit institution, which incorporates cultural assets and values them through research, inventory, conservation, exhibition and interpretation.',
  'Viana do Castelo',
  '',
  39.399871826171875,
  -8.224453926086426,
  2.4,
  'EUR',
  '3h',
  NULL,
  'Culture',
  'https://cdn.getyourguide.com/img/tour/0e63e5d7f795b14dfb7c0757423d930b746c76e7ad58f344b32744e83deb722b.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/0e63e5d7f795b14dfb7c0757423d930b746c76e7ad58f344b32744e83deb722b.jpeg/145.jpg"]'::jsonb,
  '["Collection of regional costumes from the municipality of Viana do Castelo", "Collection of Popular Portuguese Jewelry", "The Museum is located in the building of the former Bank of Portugal in Viana do Castelo"]'::jsonb,
  '["Explore Viana do Castelo District", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  13,
  'Viana do Castelo',
  true,
  152,
  'https://www.getyourguide.com/en-gb/viana-do-castelo-l165161/museu-do-traje-de-viana-do-castelo-t593250/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Visit to Gil Eannes hospital Ship Museum (t561495)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Visit to Gil Eannes hospital Ship Museum',
  'The Gil Eannes ship is a former hospital dating from 1955 which was built to provide assistant to the cod fishermen on the freezing Northern Atlantic seas.',
  'The Gil Eannes ship is a former hospital dating from 1955 which was built to provide assistant to the cod fishermen on the freezing Northern Atlantic seas.',
  'Viana do Castelo',
  '',
  41.69007110595703,
  -8.83022403717041,
  5.5,
  'EUR',
  '3h',
  NULL,
  'Culture',
  'https://cdn.getyourguide.com/img/tour/72eb73787942ea7338fcadd4e57ce0db2eae1300db734b17edfddefb6ccb7f76.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/72eb73787942ea7338fcadd4e57ce0db2eae1300db734b17edfddefb6ccb7f76.jpeg/145.jpg"]'::jsonb,
  '["Discover the fascinating history of a hospital operating on freezing seas", "Experience the atmosphere of a former life saving ship", "Feel the hard living conditions of the cod fishermen back in the 1950s"]'::jsonb,
  '["Explore Viana do Castelo District", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  45,
  'Viana do Castelo',
  true,
  153,
  'https://www.getyourguide.com/en-gb/viana-do-castelo-l165161/visit-to-gil-eannes-hospital-ship-museum-t561495/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Entrance to the Roots Gallery + 1 glass of wine with snacks + 1 fine art print (t974998)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Entrance to the Roots Gallery + 1 glass of wine with snacks + 1 fine art print',
  'You''ll visit the Roots Art Gallery in the city of Viana do Castelo, where you can enjoy a unique experience while sipping a glass of wine and soaking up the paintings of its artists.',
  'You''ll visit the Roots Art Gallery in the city of Viana do Castelo, where you can enjoy a unique experience while sipping a glass of wine and soaking up the paintings of its artists.',
  'Viana do Castelo',
  '',
  41.36091995239258,
  -7.438135623931885,
  29.0,
  'EUR',
  '1h',
  NULL,
  'Culture',
  'https://cdn.getyourguide.com/img/tour/003fdd0368dc01f1b038c89a627f2eb0392623c6179e7ed0d6638dc86b2da103.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/003fdd0368dc01f1b038c89a627f2eb0392623c6179e7ed0d6638dc86b2da103.jpg/145.jpg"]'::jsonb,
  '["An \"outside the box\" gallery with art and wine in Viana do Castelo", "An innovative art gallery concept in Europe, very close to Galicia (Spain)", "Art and wine experiences in downtown Viana do Castelo"]'::jsonb,
  '["Explore Viana do Castelo District", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  1,
  'Viana do Castelo',
  true,
  154,
  'https://www.getyourguide.com/en-gb/viana-do-castelo-l165161/entrance-to-the-roots-gallery-1-glass-of-wine-with-snacks-1-fine-art-print-t974998/?partner_id=BONZK5E',
  'GetYourGuide'
);

