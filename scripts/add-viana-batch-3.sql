-- ============================================
-- Viana do Castelo Batch 3: 4 experiences (all GYG)
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- GYG: Ponte de Lima: Professional Family Photo Shoot (t1001021)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Ponte de Lima: Professional Family Photo Shoot',
  'Discover the timeless beauty of Ponte de Lima with a personalized photo shoot. I am a local professional photographer with experience in natural and spontaneous portraits.',
  'Discover the timeless beauty of Ponte de Lima with a personalized photo shoot. I am a local professional photographer with experience in natural and spontaneous portraits.',
  'Viana do Castelo',
  '',
  42.3465576171875,
  -8.003439903259277,
  95.0,
  'EUR',
  '1h',
  NULL,
  'Learn & Create',
  'https://cdn.getyourguide.com/img/tour/a086e4a90d6d5100fd8c00127ff60c6279f37ef0cb1cc1414720bd64e1ad1663.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/a086e4a90d6d5100fd8c00127ff60c6279f37ef0cb1cc1414720bd64e1ad1663.jpg/145.jpg"]'::jsonb,
  '["45-60 minute photo shoot", "Direction and guidance for poses", "20 edited photos in high resolution (delivered via online gallery)", "Possibility to upgrade for more photos", "Suggestions for photogenic locations"]'::jsonb,
  '["Explore Viana do Castelo District", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  2,
  'Viana do Castelo',
  true,
  155,
  'https://www.getyourguide.com/en-gb/ponte-de-lima-l146813/ponte-de-lima-professional-family-photo-shoot-t1001021/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Canoa Raft (t615249)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Canoa Raft',
  'Canoa Raft in Rio Minho is a great choice to explore and get fun at the same time. It''s a activity for all family where you can raft, swin ans even jump to the water. Join us!',
  'Canoa Raft in Rio Minho is a great choice to explore and get fun at the same time. It''s a activity for all family where you can raft, swin ans even jump to the water. Join us!',
  'Viana do Castelo',
  '',
  41.837215423583984,
  -8.572101593017578,
  60.0,
  'EUR',
  '3h',
  NULL,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/290c82b3e2a55821527f1bb56a6a7e6a05df514dfbb767e10aedf8483e172de2.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/290c82b3e2a55821527f1bb56a6a7e6a05df514dfbb767e10aedf8483e172de2.jpeg/145.jpg"]'::jsonb,
  '["Explore and admire the Minho River", "Learn about Melgaço and the river Minho", "Get fun and adventurous with us in safety!"]'::jsonb,
  '["Explore Viana do Castelo District", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  2,
  'Viana do Castelo',
  true,
  156,
  'https://www.getyourguide.com/en-gb/viana-do-castelo-l165161/canoa-raft-t615249/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Viana do Castelo: E-Foil and Wakeboarding Experience (t1223498)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Viana do Castelo: E-Foil and Wakeboarding Experience',
  'Experience the future of watersports with an e-foil and wake park experience. Enjoy a thrilling combination of high-tech e-foiling and dynamic wakeboarding.',
  'Experience the future of watersports with an e-foil and wake park experience. Enjoy a thrilling combination of high-tech e-foiling and dynamic wakeboarding.',
  'Viana do Castelo',
  '',
  41.837215423583984,
  -8.572101593017578,
  330.0,
  'EUR',
  '1h 30min',
  NULL,
  'Sports',
  'https://cdn.getyourguide.com/img/tour/ea7d552fcac2fbcbf77aaf5c43df38ec3a11560ccdab165d1576d9e207aaefd7.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/ea7d552fcac2fbcbf77aaf5c43df38ec3a11560ccdab165d1576d9e207aaefd7.jpg/145.jpg"]'::jsonb,
  '["Feel the thrill of e-foiling on the calm waters of the Rio Lima", "Experience the future of watersports with a high-tech e-foil session", "High-energy wakeboarding experience for beginners and experts."]'::jsonb,
  '["Explore Viana do Castelo District", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  0,
  0,
  'Viana do Castelo',
  true,
  157,
  'https://www.getyourguide.com/en-gb/viana-do-castelo-l165161/viana-do-castelo-e-foil-and-wakeboarding-experience-t1223498/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Melgaço: CanoaRaft Adventure (t720665)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Melgaço: CanoaRaft Adventure',
  'Experience the thrill of rafting on a fast-flowing river with this CanoaRaft adventure. Feel the adrenaline rush as you navigate the waters with the help of a professional guide.',
  'Experience the thrill of rafting on a fast-flowing river with this CanoaRaft adventure. Feel the adrenaline rush as you navigate the waters with the help of a professional guide.',
  'Viana do Castelo',
  '',
  42.11506652832031,
  -8.259597778320312,
  50.0,
  'EUR',
  '3h',
  NULL,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/71c5aca958e6991d37cd171e8d815fce1043f42e2e5470bcc49bf5bcc93c67a1.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/71c5aca958e6991d37cd171e8d815fce1043f42e2e5470bcc49bf5bcc93c67a1.jpg/145.jpg"]'::jsonb,
  '["Feel the adrenaline rush as you navigate the fast waters of the river", "Enjoy a fun and thrilling experience with your friends or family", "Take in the stunning natural scenery as you paddle down the river", "Feel safe with the help of professional guides and all the necessary gear", "Capture the best moments of your adventure with photos and videos"]'::jsonb,
  '["Explore Viana do Castelo District", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  3,
  'Viana do Castelo',
  true,
  158,
  'https://www.getyourguide.com/en-gb/melgaco-l220636/melgaco-rafting-adventure-in-t720665/?partner_id=BONZK5E',
  'GetYourGuide'
);

