-- ============================================
-- Viana do Castelo Batch 1: 6 experiences (2 Viator + 4 GYG)
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- Viator: 4X4 Privat Tour – Discovering DA Serra d ́ Arga (176562P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  '4X4 Privat Tour – Discovering DA Serra d ́ Arga',
  'In our 4x4 vehicles, which in addition to the comfort offered, takes us to unique places, come to the discovery and be dazzled by the surrounding nature. You will see stunning and unique landscapes (sea, mountain, valleys and rivers), the existing fauna and flora, historical villages, customs and traditions and their people, monuments, history and cultural heritage. You will get to know the natural waterfalls and lagoons on the slopes of the mountains, where you can take a refreshing shower and delight in the whole environment, as well as savor the local gastronomy. Guaranteedly awaits you a filled day and to remember.',
  'In our 4x4 vehicles, which in addition to the comfort offered, takes us to unique places, come to the discovery and be dazzled by the surrounding nature. You will see stunning and unique landscapes (s',
  'Viana do Castelo',
  '',
  41.6931,
  -8.834,
  160.0,
  'EUR',
  'Full day',
  NULL,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/6e/18/57.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/6e/18/57.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/48/d0/61.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/ba/2c/0e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/48/d0/85.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/48/d0/88.jpg"]'::jsonb,
  '["4X4 Privat Tour – Discovering DA Serra d ́ Arga"]'::jsonb,
  '["Photos and video", "Lunch", "Guide", "Insurance"]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  3,
  'Viana do Castelo',
  true,
  142,
  'https://www.viator.com/tours/Porto/Tour-4X4-Discovering-the-Serra-dArga-in-Alto-Minho/d27331-176562P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- Viator: City & Mountain E-Bike Tour (63975P3)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'City & Mountain E-Bike Tour',
  'You’ll discover the charming historical city center of Viana do Castelo, followed by a coffee break at one of Viana’s most known spots. You’ll take the exciting “Funicular de Santa Luzia” and visit the Sanctuary of Santa Luzia, and before the tour ends you will get the chance to swim at a hidden gem of the city, a natural lagoon in the mountain.',
  'You’ll discover the charming historical city center of Viana do Castelo, followed by a coffee break at one of Viana’s most known spots. You’ll take the exciting “Funicular de Santa Luzia” and visit th',
  'We can pick you up anywhere, contact us for more details.',
  'We can pick you up anywhere, contact us for more details.',
  41.6931,
  -8.834,
  100.0,
  'EUR',
  '3h',
  NULL,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/82/7d/f2.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/82/7d/f2.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/73/31/ef.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/36/5b/b4.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/36/5b/b2.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/82/7e/09.jpg"]'::jsonb,
  '["City & Mountain E-Bike Tour"]'::jsonb,
  '["Professional guide", "Use of bicycle", "Snacks", "Use of helmet", "All activities"]'::jsonb,
  '["English", "French", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  2,
  'Viana do Castelo',
  true,
  143,
  'https://www.viator.com/tours/Porto/CITY-and-MOUNTAIN-BIKE-TOUR/d26879-63975P3?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- GYG: Viana do Castelo: Clay, Ceramics and Tea Workshop (t912608)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Viana do Castelo: Clay, Ceramics and Tea Workshop',
  'Create your own hand-modeled and hand-painted piece of ceramic art in Viana do Castelo. Choose from a variety of items to create, such as a mug or a plate
enjoying a creative and relaxing atmosphere.',
  'Create your own hand-modeled and hand-painted piece of ceramic art in Viana do Castelo. Choose from a variety of items to create, such as a mug or a plate
enjoying a creative and relaxing atmosphere.',
  'Viana do Castelo',
  '',
  41.36091995239258,
  -7.438135623931885,
  35.0,
  'EUR',
  '2h 30min',
  NULL,
  'Learn & Create',
  'https://cdn.getyourguide.com/img/tour/6fd1c0ad650871253ee22378e99c64f7a05dd121f1c19ff4efa424e6730f4b5f.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/6fd1c0ad650871253ee22378e99c64f7a05dd121f1c19ff4efa424e6730f4b5f.jpeg/145.jpg"]'::jsonb,
  '["2.5 hours", "Instructor: English", "Meet at R. Roque Barros 24A, 4900-530 Viana do Castelo, Portugal"]'::jsonb,
  '["Explore Viana do Castelo District", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  13,
  'Viana do Castelo',
  true,
  144,
  'https://www.getyourguide.com/en-gb/viana-do-castelo-l165161/viana-do-castelo-clay-ceramics-and-tea-workshop-t912608/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Can-Am Experience (t568688)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Can-Am Experience',
  'An exciting and complete ride for people of all ages who like nature, driving and challenge.',
  'An exciting and complete ride for people of all ages who like nature, driving and challenge.',
  'Viana do Castelo',
  '',
  39.399871826171875,
  -8.224453926086426,
  165.0,
  'EUR',
  '2h',
  NULL,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/681a9cef5d353d0bc2e26b4c0bb838ccd69ef18772fcdc2d9d17199aabb63dd5.png/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/681a9cef5d353d0bc2e26b4c0bb838ccd69ef18772fcdc2d9d17199aabb63dd5.png/145.jpg"]'::jsonb,
  '["Beautiful landscapes over Ponte de Lima and Viana do Castelo from Serra da Nó", "Passages through natural monuments that surround the mountain range", "Complete ride for people of all ages who like nature, driving and challenge"]'::jsonb,
  '["Explore Viana do Castelo District", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  8,
  'Viana do Castelo',
  true,
  145,
  'https://www.getyourguide.com/en-gb/ponte-de-lima-l146813/can-am-experience-t568688/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Viana do Castelo: Wakeboarding Experience at FeelViana (t1223540)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Viana do Castelo: Wakeboarding Experience at FeelViana',
  'Experience the thrill of wakeboarding at FeelViana Wake Park in Viana do Castelo. Enjoy a 15-minute cable ride on a modern, eco-friendly system with real-time coaching.',
  'Experience the thrill of wakeboarding at FeelViana Wake Park in Viana do Castelo. Enjoy a 15-minute cable ride on a modern, eco-friendly system with real-time coaching.',
  'Viana do Castelo',
  '',
  41.36091995239258,
  -7.438135623931885,
  35.0,
  'EUR',
  '3h',
  NULL,
  'Sports',
  'https://cdn.getyourguide.com/img/tour/6a5a68f0724caec5cdd10e31ad7996cc39e67459a71ae9668b40754c8bec844d.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/6a5a68f0724caec5cdd10e31ad7996cc39e67459a71ae9668b40754c8bec844d.jpg/145.jpg"]'::jsonb,
  '["Feel the thrill of wakeboarding at FeelViana Wake Park", "Enjoy a 15-minute cable ride on a modern, eco-friendly system", "Get real-time coaching through helmet radio communication", "Receive all necessary equipment, including wakeboards and helmets"]'::jsonb,
  '["Explore Viana do Castelo District", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  0,
  0,
  'Viana do Castelo',
  true,
  146,
  'https://www.getyourguide.com/en-gb/viana-do-castelo-l165161/viana-do-castelo-wakeboarding-experience-at-feelviana-t1223540/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Horseback Riding Tour (t546491)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Horseback Riding Tour',
  'Take a horseback ride through fields of flowers, moutain trails and even the paradisiac beaches. An amazing experience prepared for any technical level',
  'Take a horseback ride through fields of flowers, moutain trails and even the paradisiac beaches. An amazing experience prepared for any technical level',
  'Viana do Castelo',
  '',
  41.837215423583984,
  -8.572101593017578,
  108.0,
  'EUR',
  '2h 30min',
  NULL,
  'Outdoors',
  'https://cdn.getyourguide.com/img/tour/83d847335eeb1ab4.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/83d847335eeb1ab4.jpeg/145.jpg"]'::jsonb,
  '["It will be supervised by an experienced teacher", "We will take you through the breathtaking scenery of Viana do Castelo", "An amazing experience prepared for any technical level"]'::jsonb,
  '["Explore Viana do Castelo District", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  4.4,
  13,
  'Viana do Castelo',
  true,
  147,
  'https://www.getyourguide.com/en-gb/viana-do-castelo-l165161/horseback-riding-tour-t546491/?partner_id=BONZK5E',
  'GetYourGuide'
);

