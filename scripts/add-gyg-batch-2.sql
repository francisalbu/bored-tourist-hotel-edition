-- ============================================
-- Batch GYG-2: Add 15 GetYourGuide experiences to Supabase
-- Partner ID: BONZK5E
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Lisbon: Cascais Walking Tour (t1222088)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Cascais Walking Tour',
  'A walking tour through the heart of Cascais, exploring history, the ocean, and traditions, from its maritime origins to elegant architecture and spectacular views like Boca do Inferno, off the beaten track',
  'A walking tour through the heart of Cascais, exploring history, the ocean, and traditions, from its maritime origins to elegant architecture and spectacular views like Boca do Inferno, off the beaten ',
  'Lisbon',
  'Open in Google Maps',
  38.7002245,
  -9.4184687,
  30.0,
  'EUR',
  '3h',
  NULL,
  'Culture Dive',
  'https://cdn.getyourguide.com/img/tour/614d981479bc5e2673c655244ed3a0744eeb3b6f9cb0224ca998d7a288ca5908.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/614d981479bc5e2673c655244ed3a0744eeb3b6f9cb0224ca998d7a288ca5908.jpeg/145.jpg"]'::jsonb,
  '["Italian walking tour in Cascais", "an off-the-beaten-track experience", "Cultural connection with Italy"]'::jsonb,
  '["Explore Cascais", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian", "Dutch"]'::jsonb,
  'Free cancellation up to 24h before',
  0,
  0,
  'Lisbon',
  true,
  69,
  'https://www.getyourguide.com/en-gb/cascais-l100/cascais-walking-tour-t1222088/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 2) Lisbon: Kayaking and Snorkeling Adventure (t405960)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Kayaking and Snorkeling Adventure',
  'Experience an unforgettable adventure in the Arrabida Natural Park near Lisbon. Have great fun kayaking, exploring caves, snorkeling, and cliff jumping',
  'Experience an unforgettable adventure in the Arrabida Natural Park near Lisbon. Have great fun kayaking, exploring caves, snorkeling, and cliff jumping',
  'Lisbon',
  '',
  38.7430914,
  -9.1692039,
  70.0,
  'EUR',
  '7h',
  NULL,
  'Outdoors',
  'https://cdn.getyourguide.com/img/tour/b62e6a703091873c4ae1ede6e90c1b0695df8ef562c258fdd529be8c76ca6217.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/b62e6a703091873c4ae1ede6e90c1b0695df8ef562c258fdd529be8c76ca6217.jpg/145.jpg"]'::jsonb,
  '["Starting location:Jardim Zoológico de Lisboa", "Van(40 minutes)", "Portinho da ArrábidaGuided tour, Swimming, Snorkeling, Kayaking, Marine life viewing, Wildlife viewi", "Van(40 minutes)", "Arrive back at:Jardim Zoológico de Lisboa"]'::jsonb,
  '["Explore Portinho da Arrábida", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian", "Dutch"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  538,
  'Lisbon',
  true,
  70,
  'https://www.getyourguide.com/en-gb/portinho-da-arrabida-l122090/lisbon-kayaking-and-snorkeling-adventure-t405960/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 3) Ericeira: 5-Day Beginner Surf Course (t643599)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Ericeira: 5-Day Beginner Surf Course',
  'Take part in a 5 day course on learning how to surf with the best surf school in Ericeira area, with a qualified instructor and all equipment for your fun and safety.',
  'Take part in a 5 day course on learning how to surf with the best surf school in Ericeira area, with a qualified instructor and all equipment for your fun and safety.',
  'Lisbon',
  '',
  41.27450180053711,
  -1.212132215499878,
  234.0,
  'EUR',
  '1h 30min',
  NULL,
  'Sports',
  'https://cdn.getyourguide.com/img/tour/392a139eed9e2e3bf02536fb4152c54e79ca6b3077536c439e154805ee199ce9.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/392a139eed9e2e3bf02536fb4152c54e79ca6b3077536c439e154805ee199ce9.jpg/145.jpg"]'::jsonb,
  '["Embark on a 5 day surf course", "Learn how to surf with the best teachers", "Optional photo and video coaching for better results", "Enjoy the convenience of hotel pickup and drop-off in Venice", "Benefit from optional photo and video coaching."]'::jsonb,
  '["Explore Ericeira", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian", "Dutch"]'::jsonb,
  'Free cancellation up to 24h before',
  4.0,
  1,
  'Lisbon',
  true,
  71,
  'https://www.getyourguide.com/en-gb/ericeira-l2085/ericeira-5-day-beginner-surf-course-t643599/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 4) Sintra Historical Jeep Adventure - Palaces & Secret Routes (t402144)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Sintra Historical Jeep Adventure - Palaces & Secret Routes',
  'Get ready for a day full of surprises, breathtaking landscapes, and unforgettable adventures! Combines history, nature and a touch of adrenaline to take you to the most magical corners of Sintra.',
  'Get ready for a day full of surprises, breathtaking landscapes, and unforgettable adventures! Combines history, nature and a touch of adrenaline to take you to the most magical corners of Sintra.',
  'Lisbon',
  'Meeting point may vary depending on the option booked.Jeep Tour from Sintra without Pena Palace Gardens TicketsJeep Tour from Sintra with Pena Palace Gardens Entry TicketsJeep Tour from Lisbon with Pena Palace Gardens Entry Tickets',
  38.7988965,
  -9.3872236,
  70.0,
  'EUR',
  '7h',
  NULL,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/642c542556981.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/642c542556981.jpeg/145.jpg"]'::jsonb,
  '["Explore Sintra", "Places to see", "Things to do", "Trip inspiration"]'::jsonb,
  '["Explore Sintra", "Places to see", "Things to do", "Trip inspiration"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian", "Dutch"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  230,
  'Lisbon',
  true,
  72,
  'https://www.getyourguide.com/en-gb/sintra-l99/sintra-historical-jeep-adventure-palaces-secret-routes-t402144/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 5) Lisbon Night Cruise: Illuminated Sights on the Tagus River (t746991)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Night Cruise: Illuminated Sights on the Tagus River',
  'Step into Lisbon’s fairytale night! Drift along the Tagus as iconic sights light up, reflections dance on the water, and the city’s charm takes your breath away.',
  'Step into Lisbon’s fairytale night! Drift along the Tagus as iconic sights light up, reflections dance on the water, and the city’s charm takes your breath away.',
  'Lisbon',
  'Open in Google Maps',
  38.7064488,
  -9.1340898,
  21.8,
  'EUR',
  '1h 30min',
  NULL,
  'Outdoors',
  'https://cdn.getyourguide.com/img/tour/025fd5a3e41facd4293a9bde91666d5729273f1aefda3be7e71cfb45b072fde5.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/025fd5a3e41facd4293a9bde91666d5729273f1aefda3be7e71cfb45b072fde5.jpg/145.jpg"]'::jsonb,
  '["Starting location:FRS Portugal", "Commerce Square, LisbonPhoto stop", "25 de Abril BridgePhoto stop", "Museum of Art, Architecture and Technology, LisbonPhoto stop", "Belem LighthousePhoto stop", "Belem TowerPhoto stop", "25 de Abril BridgePhoto stop"]'::jsonb,
  '["Explore Lisbon", "Places to see", "Things to do", "Trip inspiration"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian", "Dutch"]'::jsonb,
  'Free cancellation up to 24h before',
  4.3,
  132,
  'Lisbon',
  true,
  73,
  'https://www.getyourguide.com/en-gb/lisbon-l42/lisbon-nighttime-city-lights-river-cruise-t746991/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 6) From Lisbon: Nazare Big Waves & Óbidos Small Group Tour (t848419)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'From Lisbon: Nazare Big Waves & Óbidos Small Group Tour',
  'Experience the wild beauty of Portugal''s coast and the charm of its countryside in a single day. From the dramatic ocean vistas of Nazaré to the fairytale village of Óbidos.',
  'Experience the wild beauty of Portugal''s coast and the charm of its countryside in a single day. From the dramatic ocean vistas of Nazaré to the fairytale village of Óbidos.',
  'Lisbon',
  'Meeting point may vary depending on the option booked.My Story Hotel Figueira ENFenix Lisbon Hotel ENVIP Executive Eden ENMy Story Hotel Figueira ESMy Story Hotel Figueira PTFenix Lisbon Hotel ESFenix Lisbon Hotel PTVIP Executive Eden ESVIP Executive Eden PT',
  38.7133475,
  -9.1372854,
  71.1,
  'EUR',
  'Full day',
  NULL,
  'Culture Dive',
  'https://cdn.getyourguide.com/img/tour/1f66c54a9a5545eabcb6d03d72d552f042843bb42a0ae62fef4887b1cbb2b7be.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/1f66c54a9a5545eabcb6d03d72d552f042843bb42a0ae62fef4887b1cbb2b7be.jpg/145.jpg"]'::jsonb,
  '["Guide: English", "Meet at Pç da Figueira 15, 1100-213 Lisboa, Portugal"]'::jsonb,
  '["Explore Obidos", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian", "Dutch"]'::jsonb,
  'Free cancellation up to 24h before',
  4.6,
  229,
  'Lisbon',
  true,
  74,
  'https://www.getyourguide.com/en-gb/lisbon-l42/from-lisbon-nazare-big-waves-medieval-obidos-small-group-t848419/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 7) Lisboa - A Morte do Corvo, new immersive theatre, not spoken (t472888)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisboa - A Morte do Corvo, new immersive theatre, not spoken',
  '“A Morte do Corvo” (“Death of the Raven”) is a large-scale immersive show, set in 1924, in the center of Lisbon. You are free to explore more that 2.000 sqm (+25 rooms). The show has no spoken word.',
  '“A Morte do Corvo” (“Death of the Raven”) is a large-scale immersive show, set in 1924, in the center of Lisbon. You are free to explore more that 2.000 sqm (+25 rooms). The show has no spoken word.',
  'Lisbon',
  'Look for a gate that leads into a parking lot with 24/7 security at the door - the abandoned Military Hospital is right there! There will be a concierge at the gate to lead the way.Open in Google Maps',
  38.71355939999999,
  -9.1620697,
  38.0,
  'EUR',
  '2h',
  NULL,
  'Culture Dive',
  'https://cdn.getyourguide.com/img/tour/64832c6d4cae2.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/64832c6d4cae2.jpeg/145.jpg"]'::jsonb,
  '["This theatre format can only be seen in New York or London.", "No spoken word.", "Characters tell the story through body movement and choreography"]'::jsonb,
  '["Explore Lisbon", "Places to see", "Things to do", "Trip inspiration"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian", "Dutch"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  53,
  'Lisbon',
  true,
  75,
  'https://www.getyourguide.com/en-gb/lisbon-l42/lisboa-a-morte-do-corvo-new-immersive-theatre-not-spoken-t472888/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 8) Lisbon: Tagus Estuary Nature Reserve Birdwatching Boat Tour (t458631)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Tagus Estuary Nature Reserve Birdwatching Boat Tour',
  'Discover the south bank of the Tagus on a boat tour from Lisbon through a natural reserve. Listen to your captain''s commentary as you observe a huge diversity of birds that call this place home.',
  'Discover the south bank of the Tagus on a boat tour from Lisbon through a natural reserve. Listen to your captain''s commentary as you observe a huge diversity of birds that call this place home.',
  'Lisbon',
  'Skip to main content',
  38.757439,
  -9.093400299999999,
  50.0,
  'EUR',
  '3h',
  NULL,
  'Outdoors',
  'https://cdn.getyourguide.com/img/tour/6b745241380db7eedc6f10d3b2f908aef79d9cfbabe5d8bbcf490453195197ba.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/6b745241380db7eedc6f10d3b2f908aef79d9cfbabe5d8bbcf490453195197ba.jpg/145.jpg"]'::jsonb,
  '["55 out of 5 starsKKaren – United StatesSeptember 15, 2025 - Verified booking A highlight of our trip"]'::jsonb,
  '["Explore Lisbon District", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian", "Dutch"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  117,
  'Lisbon',
  true,
  76,
  'https://www.getyourguide.com/en-gb/lisbon-l42/lisbon-birdwatching-boat-tour-on-tagus-natural-reserve-t458631/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 9) Lisbon: City of Spies Guided Walking Tour (t404717)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: City of Spies Guided Walking Tour',
  'Discover Lisbon and its history as the city of spies on this guided walking tour. Learn about double agents, escape routes, the spy network, and more.',
  'Discover Lisbon and its history as the city of spies on this guided walking tour. Learn about double agents, escape routes, the spy network, and more.',
  'Lisbon',
  'Meeting point may vary depending on the option booked.Shared Group City of Spies TourPrivate City of Spies Tour',
  38.70770901249399,
  -9.137436961376947,
  25.0,
  'EUR',
  '3h',
  NULL,
  'Culture Dive',
  'https://cdn.getyourguide.com/img/tour/612d1d65c1a9d.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/612d1d65c1a9d.jpeg/145.jpg"]'::jsonb,
  '["Guide: English", "Meet at Praça do Comércio 744, 1100-148 Lisboa, Portugal"]'::jsonb,
  '["Explore Lisbon", "Places to see", "Things to do", "Trip inspiration"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian", "Dutch"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  81,
  'Lisbon',
  true,
  77,
  'https://www.getyourguide.com/en-gb/lisbon-l42/lisbon-city-of-spies-guided-walking-tour-t404717/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 10) Lisbon by Night: Guided Walking Tour - The Unholy Secrets (t847040)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon by Night: Guided Walking Tour - The Unholy Secrets',
  'Explore the heart of Lisbon on an immersive guided walking tour focused on the Holy Inquisition and the Legends of the city that shaped the Lisbon we know of today!',
  'Explore the heart of Lisbon on an immersive guided walking tour focused on the Holy Inquisition and the Legends of the city that shaped the Lisbon we know of today!',
  'Lisbon',
  'Meet your guide next to "JOALHARIA FERREIRA MARQUES". An ancient jewelry store, in the south part of Rossio Square. The guide will be holding a lantern!Open in Google Maps',
  38.7129163,
  -9.139046,
  19.55,
  'EUR',
  '105min',
  NULL,
  'Culture Dive',
  'https://cdn.getyourguide.com/img/tour/ce1fcf843e9a701e00df9daba1fb54c1767861d0cb1990b4cfcdc02ff6a106a7.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/ce1fcf843e9a701e00df9daba1fb54c1767861d0cb1990b4cfcdc02ff6a106a7.jpg/145.jpg"]'::jsonb,
  '["Starting location:Praça Dom Pedro IV 7", "Baixa de LisboaWalk", "Finish at:Alfama"]'::jsonb,
  '["Explore Lisbon", "Places to see", "Things to do", "Trip inspiration"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian", "Dutch"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  96,
  'Lisbon',
  true,
  78,
  'https://www.getyourguide.com/en-gb/lisbon-l42/lisbon-by-night-guided-walking-tour-the-unholy-secrets-t847040/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 11) Lisbon: Helicopter Tour over Belem (t64012)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Helicopter Tour over Belem',
  'Soar above Lisbon on a thrilling helicopter ride, enjoying stunning views of Cristo Rei, Belém Tower, Jerónimos Monastery, and more. Come and discover the city from a breathtaking, unique perspective.',
  'Soar above Lisbon on a thrilling helicopter ride, enjoying stunning views of Cristo Rei, Belém Tower, Jerónimos Monastery, and more. Come and discover the city from a breathtaking, unique perspective.',
  'Lisbon',
  'Lisbon Heliport, Passeio Marítimo de Algés (near the VTS Tower)Open in Google Maps',
  38.69574300000001,
  -9.23581999999999,
  369.0,
  'EUR',
  '10min',
  NULL,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/63b852113b337.png/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/63b852113b337.png/145.jpg"]'::jsonb,
  '["10 minutes", "Guide: English", "Meet at Passeio Marítimo de Algés, Portugal"]'::jsonb,
  '["Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian", "Dutch"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  38,
  'Lisbon',
  true,
  79,
  'https://www.getyourguide.com/en-gb/lisbon-l42/lisbon-12-minutes-helicopter-flight-t64012/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 12) Lisbon: Vegan Food and Culture Walking Tour with Tastings (t1073679)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Vegan Food and Culture Walking Tour with Tastings',
  'Discover Lisbon’s culinary soul on a 3.5-hour vegan food tour.
Savor plant-based versions of traditional dishes, explore historic sites, and enjoy a Ginjinha tasting as, literally, the cherry on top.',
  'Discover Lisbon’s culinary soul on a 3.5-hour vegan food tour.
Savor plant-based versions of traditional dishes, explore historic sites, and enjoy a Ginjinha tasting as, literally, the cherry on top.',
  'Lisbon',
  'In front of the Statue.

The tour guide will have an identifying badge with a red stripe.Open in Google Maps',
  38.7105849,
  -9.143476399999999,
  89.0,
  'EUR',
  '3h',
  NULL,
  'Local Cooking',
  'https://cdn.getyourguide.com/img/tour/bf10a9733fe31f5a5c465e2f5f57fea9c64373166b520641518ed0af32bdfc83.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/bf10a9733fe31f5a5c465e2f5f57fea9c64373166b520641518ed0af32bdfc83.jpeg/145.jpg"]'::jsonb,
  '["Starting location:Praça Luís de CamõesChiadoFood tasting (10 minutes)OptionalLisbonRegional food (10", "ChiadoGuided tour (30 minutes)Baixa de LisboaFood tasting (30 minutes)OptionalLisbonFood tasting (20", "Baixa de LisboaGuided tour (20 minutes)RossioStreet food (10 minutes)Optional", "Finish at:Square São Domingos"]'::jsonb,
  '["Explore Lisbon", "Places to see", "Things to do", "Trip inspiration"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian", "Dutch"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  10,
  'Lisbon',
  true,
  80,
  'https://www.getyourguide.com/en-gb/lisbon-l42/lisbon-vegan-food-and-culture-walking-tour-with-tastings-t1073679/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 13) Lisbon: Erotic Cabaret Show and Dinner (t777691)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Erotic Cabaret Show and Dinner',
  'Discover Portuguese cuisine on a food tour with a sensual cabaret show. Taste Portuguese wines in an unforgettable experience.',
  'Discover Portuguese cuisine on a food tour with a sensual cabaret show. Taste Portuguese wines in an unforgettable experience.',
  'Lisbon',
  'Open in Google Maps',
  38.7317217,
  -9.151496700000001,
  65.0,
  'EUR',
  '2h 30min',
  NULL,
  'Culture Dive',
  'https://cdn.getyourguide.com/img/tour/081cabd6ed0624ab51ddaaad432808de8c03c896f35c2fa4d8a4dafa14542d88.png/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/081cabd6ed0624ab51ddaaad432808de8c03c896f35c2fa4d8a4dafa14542d88.png/145.jpg"]'::jsonb,
  '["2.5 hours", "Host or greeter: English", "Meet at Av. António Augusto de Aguiar 88, 1069-413 Lisboa, Portugal"]'::jsonb,
  '["Explore Lisbon", "Places to see", "Things to do", "Trip inspiration"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian", "Dutch"]'::jsonb,
  'Free cancellation up to 24h before',
  4.5,
  84,
  'Lisbon',
  true,
  81,
  'https://www.getyourguide.com/en-gb/lisbon-l42/lisbon-erotic-cabaret-show-and-dinner-t777691/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 14) Antique Car Tour (t698863)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Antique Car Tour',
  'Pick up at the hotel in a colourful eletric vintage car.
Tour around lisbon with stops in the best viewpoints, monuments, squares, gardens.',
  'Pick up at the hotel in a colourful eletric vintage car.
Tour around lisbon with stops in the best viewpoints, monuments, squares, gardens.',
  'Lisbon',
  '',
  38.719871520996094,
  -9.129752159118652,
  135.0,
  'EUR',
  '3h',
  NULL,
  'Culture Dive',
  'https://cdn.getyourguide.com/img/tour/2b597a27696eb7323aaf58287d437bfedce4e52b48721c1fa09394beee823064.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/2b597a27696eb7323aaf58287d437bfedce4e52b48721c1fa09394beee823064.jpg/145.jpg"]'::jsonb,
  '["Driver: English", "View 2 pickup locations"]'::jsonb,
  '["Explore Lisbon", "Places to see", "Things to do", "Trip inspiration"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian", "Dutch"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  4,
  'Lisbon',
  true,
  82,
  'https://www.getyourguide.com/en-gb/lisbon-l42/antique-car-tour-t698863/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 15) Lisbon: Try Scuba Diving in Arrábida Marine Reserve w/photos (t417419)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Try Scuba Diving in Arrábida Marine Reserve w/photos',
  'Take your first steps into the underwater world on a beginner''s scuba diving experience in Sesimbra. Learn about your equipment and stay safe with certified trainers as you explore beneath the waves.',
  'Take your first steps into the underwater world on a beginner''s scuba diving experience in Sesimbra. Learn about your equipment and stay safe with certified trainers as you explore beneath the waves.',
  'Lisbon',
  'We will meet you a little ahead of the Clube Naval de Sesimbra, near a dirtroad parking lot - where you will find our diving center saying the name of the company, "Arrabida Experiences". ThanksOpen in Google Maps',
  38.4353937,
  -9.115265500000001,
  90.0,
  'EUR',
  '3h',
  NULL,
  'Outdoors',
  'https://cdn.getyourguide.com/img/tour/63f607342d296.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/63f607342d296.jpeg/145.jpg"]'::jsonb,
  '["Starting location:Clube Naval de Sesimbra", "SesimbraSafety briefing (30 minutes)", "Speedboat(20 minutes)", "Arrabida Natural ParkScuba diving", "Speedboat(20 minutes)", "Arrive back at:Clube Naval de Sesimbra"]'::jsonb,
  '["Explore Lisbon District", "Places to see", "Things to do"]'::jsonb,
  '["English", "Portuguese", "Spanish", "French", "German", "Italian", "Dutch"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  50,
  'Lisbon',
  true,
  83,
  'https://www.getyourguide.com/en-gb/sesimbra-l4957/lisbon-try-scuba-diving-in-arrabida-marine-reserve-wphotos-t417419/?partner_id=BONZK5E',
  'GetYourGuide'
);

