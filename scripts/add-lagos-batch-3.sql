-- ============================================
-- Lagos Batch 3: 6 experiences (all GYG)
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- GYG: Lagos: Market Tour and Cataplana Cooking Class (t803488)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lagos: Market Tour and Cataplana Cooking Class',
  'Handpick fresh ingredients at Lagos market, then learn to cook Cataplana, a classic Algarve dish. Immerse yourself in the delightful flavors and culture of the Algarve.',
  'Handpick fresh ingredients at Lagos market, then learn to cook Cataplana, a classic Algarve dish. Immerse yourself in the delightful flavors and culture of the Algarve.',
  'Lagos',
  '',
  39.399871826171875,
  -8.224453926086426,
  150.0,
  'EUR',
  '3h 30min',
  NULL,
  'Food & Drinks',
  'https://cdn.getyourguide.com/img/tour/c9bd9972827e049367397608be2da1b6b01dd76960b3c2bfa52c9320ba2b1feb.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/c9bd9972827e049367397608be2da1b6b01dd76960b3c2bfa52c9320ba2b1feb.jpg/145.jpg"]'::jsonb,
  '["3.5 hours", "Instructor: English", "Meet at Rua Lucinda Anino dos Santos F, 8600-722 Lagos, Portugal"]'::jsonb,
  '["Explore Lagos, Portugal", "Places to see", "Things to do", "Trip inspiration"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  10,
  'Lagos',
  true,
  175,
  'https://www.getyourguide.com/en-gb/lagos-portugal-l2896/market-tour-cooking-class-algarve-s-seafood-cataplana-t803488/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Lagos: A walk with a rescued horse at the sanctuary (t572142)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lagos: A walk with a rescued horse at the sanctuary',
  'We will introduce you to the horses and tell you many nice thing to know about them. After that we''ll give you the safety instructions and then we will go on a walk on the fields of our sanctuary.',
  'We will introduce you to the horses and tell you many nice thing to know about them. After that we''ll give you the safety instructions and then we will go on a walk on the fields of our sanctuary.',
  'Lagos',
  '',
  54.525962829589844,
  15.255118370056152,
  45.0,
  'EUR',
  '2h',
  NULL,
  'Outdoors',
  'https://cdn.getyourguide.com/img/tour/e0e1d6a919b2020fa2a416ac4b8aea9f76678b88110261c225623ca75fd08a23.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/e0e1d6a919b2020fa2a416ac4b8aea9f76678b88110261c225623ca75fd08a23.jpeg/145.jpg"]'::jsonb,
  '["2 hours", "Guide: English", "Meet at 46H7+JM Barão de São João, Portugal"]'::jsonb,
  '["Explore Algarve", "Places to see", "Things to do", "Trip inspiration"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  6,
  'Lagos',
  true,
  176,
  'https://www.getyourguide.com/en-gb/barao-de-sao-joao-l129458/lagos-a-walk-with-a-rescued-horse-by-your-side-on-our-land-t572142/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Silves, Caldas and Monchique Wine Tasting: Full Day Tour (t170718)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Silves, Caldas and Monchique Wine Tasting: Full Day Tour',
  'Embark on a full-day tour exploring Silves before scaling the highest mountain in the south of Portugal and finish the day with delicious local wines.',
  'Embark on a full-day tour exploring Silves before scaling the highest mountain in the south of Portugal and finish the day with delicious local wines.',
  'Lagos',
  '',
  54.525962829589844,
  15.255118370056152,
  89.0,
  'EUR',
  '7h',
  NULL,
  'Culture',
  'https://cdn.getyourguide.com/img/tour/5f711b113848e.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/5f711b113848e.jpeg/145.jpg"]'::jsonb,
  '["Visit Fóia, the highest point in the Algarve region", "See all the most important sights of Silves", "Visit a winery and try some local wines", "Experience 360º panoramic views"]'::jsonb,
  '["Explore Silves", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  84,
  'Lagos',
  true,
  177,
  'https://www.getyourguide.com/en-gb/algarve-l66/silves-caldas-and-monchique-full-day-tour-t170718/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Small-group Kayak experience at Ponta da Piedade (t408315)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Small-group Kayak experience at Ponta da Piedade',
  'Explore the impressive rock formations and golden cliffs of Ponta da Piedade on this kayaking tour from Lagos. Uncover the secrets of the coast as you paddle by beaches and visit natural caves.',
  'Explore the impressive rock formations and golden cliffs of Ponta da Piedade on this kayaking tour from Lagos. Uncover the secrets of the coast as you paddle by beaches and visit natural caves.',
  'Lagos',
  '',
  37.01795196533203,
  -7.93083381652832,
  33.0,
  'EUR',
  '2h',
  NULL,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/c60e0d2dc6e35034c6d2f1a21fcf8dae8131bf6bae862bfc227297707e3e8350.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/c60e0d2dc6e35034c6d2f1a21fcf8dae8131bf6bae862bfc227297707e3e8350.jpeg/145.jpg"]'::jsonb,
  '["55 out of 5 starsGGraydon – CanadaMay 6, 2025 - Verified booking Amazing time! Rodrigo was a fantast"]'::jsonb,
  '["Explore Lagos, Portugal", "Places to see", "Things to do", "Trip inspiration"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  37,
  'Lagos',
  true,
  178,
  'https://www.getyourguide.com/en-gb/algarve-l66/marina-de-lagos-ponta-da-piedade-kayaking-tour-t408315/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Half-Day Jeep Sunset Safari with Portuguese wine (t942200)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Half-Day Jeep Sunset Safari with Portuguese wine',
  'Witnessing the sunset over the Atlantic Ocean is a truly memorable experience in Algarve. This excursion offers a blend of stunning coastal scenery, historical landmarks, and cultural insights.',
  'Witnessing the sunset over the Atlantic Ocean is a truly memorable experience in Algarve. This excursion offers a blend of stunning coastal scenery, historical landmarks, and cultural insights.',
  'Lagos',
  '',
  37.139930725097656,
  -8.532480239868164,
  55.0,
  'EUR',
  '4h',
  NULL,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/00c19208d13a14a6c3830c7c2bfd50ccf39e3daf771dd7b4a6e35a8bfd1d3bbf.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/00c19208d13a14a6c3830c7c2bfd50ccf39e3daf771dd7b4a6e35a8bfd1d3bbf.jpg/145.jpg"]'::jsonb,
  '["Guide: English", "View pickup areas"]'::jsonb,
  '["Explore Sagres", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  25,
  'Lagos',
  true,
  179,
  'https://www.getyourguide.com/en-gb/lagos-portugal-l2896/half-day-jeep-sunset-safari-with-portuguese-wine-t942200/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- GYG: Monchique & Silves: guided day trip (t708921)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Monchique & Silves: guided day trip',
  'Discover old traditions in the Monchique mountains with its wonderful views and cork forest, and visit the former capital of the Algarve, Silves.',
  'Discover old traditions in the Monchique mountains with its wonderful views and cork forest, and visit the former capital of the Algarve, Silves.',
  'Lagos',
  '',
  37.139930725097656,
  -8.532480239868164,
  135.0,
  'EUR',
  '7h',
  NULL,
  'Culture',
  'https://cdn.getyourguide.com/img/tour/5df22cbb27a1fad51de73ebb89c41df7f90f359f1beea838ed4ea0cd09015a02.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/5df22cbb27a1fad51de73ebb89c41df7f90f359f1beea838ed4ea0cd09015a02.jpg/145.jpg"]'::jsonb,
  '["Full day Silves-Monchique: visit everything of interest not just the highlights", "Perfect mix of culture, nature, history, gastronomy and fun.", "More than a stroll: high quality information given in a fun and relaxed way!"]'::jsonb,
  '["Explore Algarve", "Places to see", "Things to do", "Trip inspiration"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  7,
  'Lagos',
  true,
  180,
  'https://www.getyourguide.com/en-gb/monchique-l92405/monchique-silves-guided-day-trip-t708921/?partner_id=BONZK5E',
  'GetYourGuide'
);

