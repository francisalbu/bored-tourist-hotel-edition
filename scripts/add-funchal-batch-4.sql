-- ============================================
-- Funchal Batch 4: 7 GYG experiences
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- GYG: Madeira: Jeep Tour with Zipline, Swing, and Volcanic Pools (t1096528)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Madeira: Jeep Tour with Zipline, Swing, and Volcanic Pools',
  'Experience Madeira like never before on a Jeep tour! From Cabo Girão Skywalk to Seixal, Porto Moniz ziplines, Giant Swing, and Ponta do Sol, discover thrill, beauty, and charm. Adventure starts here!',
  'Experience Madeira like never before on a Jeep tour! From Cabo Girão Skywalk to Seixal, Porto Moniz ziplines, Giant Swing, and Ponta do Sol, discover thrill, beauty, and charm. Adventure starts here!',
  'Funchal',
  '',
  32.6669,
  -16.9241,
  62.1,
  'EUR',
  'Varies',
  NULL,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/848d2fe9f5a225ebab5f91d58276515a5176915270fdee9bc75f94ae87a6f0c7.jpg/53.jpg',
  '["https://cdn.getyourguide.com/img/tour/848d2fe9f5a225ebab5f91d58276515a5176915270fdee9bc75f94ae87a6f0c7.jpg/53.jpg"]'::jsonb,
  '["Experience Madeira like never before on a Jeep tour! From Cabo Gir\u00e3o Skywalk to Seixal, Porto Moniz ziplines, Giant Swing, and Ponta do Sol, discover thrill, beauty, and charm", "Adventure starts here!"]'::jsonb,
  '["Explore Funchal", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  4.987038,
  82,
  'Funchal',
  true,
  205,
  'https://www.getyourguide.com/en-gb/madeira-l67/madeira-jeep-tour-with-zipline-swing-and-volcanic-pools-t1096528/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Funchal: Pico do Arieiro & Pico Ruivo Hiking Transfer (t427484)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Funchal: Pico do Arieiro & Pico Ruivo Hiking Transfer',
  'Explore the highest mountains on Madeira on a self-guided hike from Pico do Arieiro and Pico Ruivo. Enjoy a convenient round-trip transfer from your south Madeira hotel to the trailhead.',
  'Explore the highest mountains on Madeira on a self-guided hike from Pico do Arieiro and Pico Ruivo. Enjoy a convenient round-trip transfer from your south Madeira hotel to the trailhead.',
  'Funchal',
  '',
  32.6669,
  -16.9241,
  32.0,
  'EUR',
  'Varies',
  NULL,
  'Outdoors',
  'https://cdn.getyourguide.com/img/tour/474b8f9e5c2474df5dd6f1fbc98ac52cde82f7734fbbecec06cfdb1f6485c4fb.jpg/53.jpg',
  '["https://cdn.getyourguide.com/img/tour/474b8f9e5c2474df5dd6f1fbc98ac52cde82f7734fbbecec06cfdb1f6485c4fb.jpg/53.jpg"]'::jsonb,
  '["Explore the highest mountains on Madeira on a self-guided hike from Pico do Arieiro and Pico Ruivo", "Enjoy a convenient round-trip transfer from your south Madeira hotel to the trailhead"]'::jsonb,
  '["Explore Funchal", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8785152,
  1859,
  'Funchal',
  true,
  206,
  'https://www.getyourguide.com/en-gb/funchal-l1026/funchal-transfer-pr1-pico-do-arieiro-pico-ruivo-trail-t427484/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Caldeirão Verde: Levada Caldeirao Verde Hiking Transfer (t482482)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Caldeirão Verde: Levada Caldeirao Verde Hiking Transfer',
  'Explore the magical Laurissilva Forest in Madeira (Caldeirão Verde) on a self-guided hike. Enjoy a convenient hotel pickup and a round-trip transfer to the trailhead and back.',
  'Explore the magical Laurissilva Forest in Madeira (Caldeirão Verde) on a self-guided hike. Enjoy a convenient hotel pickup and a round-trip transfer to the trailhead and back.',
  'Funchal',
  '',
  32.6669,
  -16.9241,
  33.5,
  'EUR',
  'Varies',
  NULL,
  'Outdoors',
  'https://cdn.getyourguide.com/img/tour/c295d9aa44356e5c5004bdf6ff43a6652f76c7e9d14eef0cae1bf24238d5f429.jpg/53.jpg',
  '["https://cdn.getyourguide.com/img/tour/c295d9aa44356e5c5004bdf6ff43a6652f76c7e9d14eef0cae1bf24238d5f429.jpg/53.jpg"]'::jsonb,
  '["Explore the magical Laurissilva Forest in Madeira (Caldeir\u00e3o Verde) on a self-guided hike", "Enjoy a convenient hotel pickup and a round-trip transfer to the trailhead and back"]'::jsonb,
  '["Explore Funchal", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  4.858176,
  1086,
  'Funchal',
  true,
  207,
  'https://www.getyourguide.com/en-gb/madeira-l67/caldeirao-verde-queimadas-pr9-transfer-hike-t482482/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Madeira Island Bodyboard Experience (t57009)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Madeira Island Bodyboard Experience',
  'Experience the thrill of bodyboarding and the beauty of Madeira Island from the sea. Learn the extreme sport with a choice of 1, 3 or 5 lessons.',
  'Experience the thrill of bodyboarding and the beauty of Madeira Island from the sea. Learn the extreme sport with a choice of 1, 3 or 5 lessons.',
  'Funchal',
  '',
  32.6669,
  -16.9241,
  70.0,
  'EUR',
  'Varies',
  NULL,
  'Sports',
  'https://cdn.getyourguide.com/img/tour/560a9c5f94ff5.jpeg/53.jpg',
  '["https://cdn.getyourguide.com/img/tour/560a9c5f94ff5.jpeg/53.jpg"]'::jsonb,
  '["Experience the thrill of bodyboarding and the beauty of Madeira Island from the sea", "Learn the extreme sport with a choice of 1, 3 or 5 lessons"]'::jsonb,
  '["Explore Funchal", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9836383,
  24,
  'Funchal',
  true,
  208,
  'https://www.getyourguide.com/en-gb/madeira-l67/madeira-island-bodyboard-experience-t57009/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Madeira: Off-Road Buggy Driving Experience (t416695)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Madeira: Off-Road Buggy Driving Experience',
  'Follow your guide along remote dirt tracks to discover the island of Madeira in an exciting way. Cruise around the lush Laurisilva on a buggy to discover stunning mountains and sea views.',
  'Follow your guide along remote dirt tracks to discover the island of Madeira in an exciting way. Cruise around the lush Laurisilva on a buggy to discover stunning mountains and sea views.',
  'Funchal',
  '',
  32.6669,
  -16.9241,
  150.0,
  'EUR',
  'Varies',
  NULL,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/30bee671dedb7949fd28e5d78a398d8e19935216cdcf899dab239a67d4e594da.jpeg/53.jpg',
  '["https://cdn.getyourguide.com/img/tour/30bee671dedb7949fd28e5d78a398d8e19935216cdcf899dab239a67d4e594da.jpeg/53.jpg"]'::jsonb,
  '["Follow your guide along remote dirt tracks to discover the island of Madeira in an exciting way", "Cruise around the lush Laurisilva on a buggy to discover stunning mountains and sea views"]'::jsonb,
  '["Explore Funchal", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9182496,
  226,
  'Funchal',
  true,
  209,
  'https://www.getyourguide.com/en-gb/madeira-l67/madeira-off-road-buggy-driving-experience-t416695/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Porto Moniz: Diving with Sharks and Rays in Madeira Aquarium (t406731)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Porto Moniz: Diving with Sharks and Rays in Madeira Aquarium',
  'Enjoy diving in the Madeira Aquarium in Porto Moniz with this ticket for those with or without diving experience. Dive with rays, sharks, and mantas and take a guided tour of the aquarium.',
  'Enjoy diving in the Madeira Aquarium in Porto Moniz with this ticket for those with or without diving experience. Dive with rays, sharks, and mantas and take a guided tour of the aquarium.',
  'Funchal',
  '',
  32.6669,
  -16.9241,
  135.0,
  'EUR',
  'Varies',
  NULL,
  'Sports',
  'https://cdn.getyourguide.com/img/tour/616ed2fd46860.jpeg/53.jpg',
  '["https://cdn.getyourguide.com/img/tour/616ed2fd46860.jpeg/53.jpg"]'::jsonb,
  '["Enjoy diving in the Madeira Aquarium in Porto Moniz with this ticket for those with or without diving experience", "Dive with rays, sharks, and mantas and take a guided tour of the aquarium"]'::jsonb,
  '["Explore Funchal", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9035587,
  194,
  'Funchal',
  true,
  210,
  'https://www.getyourguide.com/en-gb/madeira-l67/porto-moniz-diving-with-sharks-and-rays-in-madeira-aquarium-t406731/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Madeira: surf lesson at Porto da Cruz (t560222)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Madeira: surf lesson at Porto da Cruz',
  'The village is surrounded by volcanic black sandy beaches, ideal for those who want to take surfing lessons and learn to surf in Madeira Island.
The island offers a vast array of waves.',
  'The village is surrounded by volcanic black sandy beaches, ideal for those who want to take surfing lessons and learn to surf in Madeira Island.
The island offers a vast array of waves.',
  'Funchal',
  '',
  32.6669,
  -16.9241,
  65.0,
  'EUR',
  'Varies',
  NULL,
  'Sports',
  'https://cdn.getyourguide.com/img/tour/4f5e9b12296b870b.jpeg/53.jpg',
  '["https://cdn.getyourguide.com/img/tour/4f5e9b12296b870b.jpeg/53.jpg"]'::jsonb,
  '["The village is surrounded by volcanic black sandy beaches, ideal for those who want to take surfing lessons and learn to surf in Madeira Island", "The island offers a vast array of waves"]'::jsonb,
  '["Explore Funchal", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  4.839087,
  67,
  'Funchal',
  true,
  211,
  'https://www.getyourguide.com/en-gb/madeira-l67/madeira-surf-lesson-at-porto-da-cruz-t560222/?partner_id=BONZK5E',
  'GetYourGuide'
);

