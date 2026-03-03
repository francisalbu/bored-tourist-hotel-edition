-- ============================================
-- Lisbon Tickets Batch 1: 6 GYG ticket experiences
-- Category: Tickets
-- display_order: 212–217
-- Run in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Jerónimos Monastery Entrance Ticket (t131169)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Jerónimos Monastery Entrance Ticket',
  'Enjoy access to the Jerónimos Monastery with this entry ticket and marvel at the outstanding Manueline architecture. One of Portugal''s most iconic UNESCO World Heritage Sites, this 16th-century monastery in the Belém district is a masterpiece of late Gothic architecture. Admire the intricate stone carvings, the stunning double cloister, and the ornate church interior where Vasco da Gama is buried. Skip the long queue at the ticket office and head straight inside with your e-ticket.',
  'Skip the queue and enter the iconic Jerónimos Monastery in Belém with this e-ticket.',
  'Belém, Lisbon',
  'Praça do Império 1400-206 Lisboa, Portugal',
  38.6978,
  -9.2060,
  18.00,
  'EUR',
  '1–2 hours',
  NULL,
  'Tickets',
  'https://cdn.getyourguide.com/img/tour/685dd4b34762205c.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/685dd4b34762205c.jpeg/145.jpg"]'::jsonb,
  '["UNESCO World Heritage Site", "Manueline architecture", "Tomb of Vasco da Gama", "Skip-the-queue e-ticket", "Double cloister"]'::jsonb,
  '["Entrance ticket"]'::jsonb,
  '["English"]'::jsonb,
  'No refunds once purchased',
  4.1,
  14211,
  'Lisbon',
  true,
  212,
  'https://www.getyourguide.com/lisbon-l42/belem-jeronimos-monastery-admission-ticket-t131169/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 2) Lisbon Card: 24, 48, or 72-Hour Pass (t225711)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Card: 24, 48, or 72-Hour Pass',
  'Enjoy free admission to top attractions and discounts at various landmarks across Lisbon. The Lisboa Card gives you unlimited access to the city''s public transport network including the metro, trams, buses, trains, and ferries. Visit over 40 museums and monuments for free including the Jerónimos Monastery, the Tower of Belém, and the National Museum of Ancient Art. Ideal for first-time visitors who want to explore the city without worrying about individual ticket costs.',
  'Unlimited public transport + free entry to 40+ attractions across Lisbon for 24, 48 or 72 hours.',
  'Lisbon City Centre',
  'Ask Lisbon Visitors Centre, Praça dos Restauradores, Lisbon',
  38.7171,
  -9.1394,
  31.00,
  'EUR',
  '24–72 hours',
  NULL,
  'Tickets',
  'https://cdn.getyourguide.com/img/tour/b72d9ff047051d5a.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/b72d9ff047051d5a.jpeg/145.jpg"]'::jsonb,
  '["Unlimited metro, tram & bus", "Free entry to 40+ sites", "Jerónimos & Tower of Belém included", "Available in 24h / 48h / 72h", "Discounts at restaurants"]'::jsonb,
  '["Lisboa Card pass", "Public transport access", "Entry to partner museums"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'No refunds once activated',
  4.5,
  17959,
  'Lisbon',
  true,
  213,
  'https://www.getyourguide.com/lisbon-l42/lisboa-card-24h-48h-72h-t225711/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 3) Lisbon Cathedral Entry Ticket (t451666)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Lisbon Cathedral Entry Ticket',
  'Visit one of the most significant monuments in Portugal with an entry ticket to the Lisbon Cathedral. Built in the 12th century, the Sé de Lisboa is the oldest church in the city and a stunning example of Romanesque architecture. Explore the beautiful Gothic cloisters, the treasury with centuries-old religious artefacts, and the atmospheric nave with its striking rose window. Conveniently located in the Alfama neighbourhood, it''s a must-visit landmark in the heart of historic Lisbon.',
  'Entry ticket to Lisbon''s oldest and most iconic cathedral in the heart of Alfama.',
  'Alfama, Lisbon',
  'Largo da Sé, 1100-585 Lisboa, Portugal',
  38.7097,
  -9.1327,
  7.00,
  'EUR',
  '1 hour',
  NULL,
  'Tickets',
  'https://cdn.getyourguide.com/img/tour/6412f35874f55.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/6412f35874f55.jpeg/145.jpg"]'::jsonb,
  '["Oldest church in Lisbon (12th century)", "Romanesque architecture", "Gothic cloisters", "Treasury with religious artefacts", "Rose window"]'::jsonb,
  '["Entry ticket", "Cloisters access"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24 hours before',
  4.5,
  1209,
  'Lisbon',
  true,
  214,
  'https://www.getyourguide.com/lisbon-l42/lisbon-lisbon-cathedral-entry-ticket-t451666/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 4) National Palace of Ajuda E-Ticket & City Audio Guide (t513694)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: National Palace of Ajuda E-Ticket & City Audio Guide',
  'Enjoy a smooth visit to the Ajuda National Palace with a timed e-ticket and audio guide included. Built in the 19th century as the official residence of the Portuguese royal family, the Ajuda Palace is home to one of the finest collections of 19th-century decorative arts in Europe. Marvel at the lavishly furnished state rooms, the magnificent throne room, and the royal apartments filled with priceless furniture, tapestries, silverware and porcelain. The included audio guide brings the palace''s rich history to life.',
  'Timed e-ticket to the royal Ajuda Palace with audio guide — no queues, straight inside.',
  'Belém, Lisbon',
  'Largo da Ajuda, 1349-021 Lisboa, Portugal',
  38.7063,
  -9.2005,
  21.00,
  'EUR',
  '1–2 hours',
  NULL,
  'Tickets',
  'https://cdn.getyourguide.com/img/tour/d3ecb19bbcd93bbc.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/d3ecb19bbcd93bbc.jpeg/145.jpg"]'::jsonb,
  '["19th-century royal palace", "Lavish state rooms & throne room", "Audio guide included", "Timed entry e-ticket", "Finest decorative arts collection"]'::jsonb,
  '["Timed entry ticket", "Audio guide"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24 hours before',
  4.1,
  88,
  'Lisbon',
  true,
  215,
  'https://www.getyourguide.com/lisbon-l42/lisbon-e-ticket-to-national-palace-of-ajuda-t513694/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 5) Sintra: Quinta da Regaleira Guided Tour by Train (t544989)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Sintra, Quinta da Regaleira Guided Tour by Train',
  'Discover the history and culture of Portugal on this guided visit from Lisbon to Sintra and the mystical Quinta da Regaleira. Travel by train through scenic countryside to the UNESCO-listed village of Sintra. Your guide will lead you through the stunning estate of Quinta da Regaleira, including its Neo-Manueline palace, mysterious Initiation Well — a spiral staircase that descends 27 metres underground — enchanting gardens, grottoes, and secret tunnels. Tickets to the Quinta are included.',
  'Guided train trip from Lisbon to Sintra + included entry to the mystical Quinta da Regaleira.',
  'Sintra, Lisbon Region',
  'Quinta da Regaleira, Rua Barbosa du Bocage 5, Sintra',
  38.7945,
  -9.3959,
  35.00,
  'EUR',
  'Half day',
  NULL,
  'Tickets',
  'https://cdn.getyourguide.com/img/tour/7f48ccff7af3a77a.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/7f48ccff7af3a77a.jpeg/145.jpg"]'::jsonb,
  '["Train journey from Lisbon to Sintra", "UNESCO World Heritage village", "Quinta da Regaleira entry included", "Initiation Well (27m spiral staircase)", "Secret tunnels & mystical gardens"]'::jsonb,
  '["Return train ticket", "Quinta da Regaleira entry", "Professional guide"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24 hours before',
  4.8,
  22,
  'Lisbon',
  true,
  216,
  'https://www.getyourguide.com/lisbon-l42/lisbon-guided-tour-to-sintra-quinta-da-regaleira-by-train-t544989/?partner_id=BONZK5E',
  'GetYourGuide'
);

-- 6) Lisbon: Oceanário de Lisboa Entrance Ticket (t38079)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Oceanário de Lisboa Entrance Ticket',
  'Discover more than 8,000 sea creatures from 4 ocean habitats at the Oceanário de Lisboa. One of the world''s largest aquariums and consistently ranked among Europe''s best, the Lisbon Oceanarium immerses visitors in the world''s oceans. Encounter playful sea otters, sunfish, rays, sharks, and hundreds of fish species in the massive central tank. The oceanarium is divided into four sections representing the North Atlantic, Antarctic, Temperate Pacific and Tropical Indian Ocean ecosystems.',
  'Entry ticket to one of Europe''s best aquariums with 8,000+ sea creatures across 4 ocean habitats.',
  'Parque das Nações, Lisbon',
  'Esplanada Dom Carlos I, 1990-005 Lisboa, Portugal',
  38.7633,
  -9.0950,
  25.00,
  'EUR',
  '2 hours',
  NULL,
  'Tickets',
  'https://cdn.getyourguide.com/img/tour/52ebec56dceb8676.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/52ebec56dceb8676.jpeg/145.jpg"]'::jsonb,
  '["One of Europe''s best aquariums", "8,000+ sea creatures", "4 ocean habitats", "Sea otters, sharks & sunfish", "Parque das Nações location"]'::jsonb,
  '["Entrance ticket"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24 hours before',
  4.6,
  9973,
  'Lisbon',
  true,
  217,
  'https://www.getyourguide.com/lisbon-l42/lisbon-oceanario-de-lisboa-entrance-ticket-t38079/?partner_id=BONZK5E',
  'GetYourGuide'
);
