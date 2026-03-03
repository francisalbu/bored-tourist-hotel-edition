-- ============================================
-- Batch 4: Add 5 Viator experiences to Supabase
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) The Surf Instructor in Costa da Caparica (160709P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Surf Lesson in Costa da Caparica with Transport & Photos',
  'Surfing is not just a sport — it''s a passion. And there''s no better place to try it for the first time than the golden beaches of Costa da Caparica, just across the river from Lisbon. Your certified instructor will pick you up and drive you to the best surf spot of the day, where you''ll spend 2 hours learning the fundamentals: paddling, popping up and riding your first wave. Whether you''re a complete beginner or looking to improve your technique, the lesson is tailored to your level in a fun, safe environment. All equipment is provided — from wetsuits to a range of surfboards. A professional photographer captures the whole session, so you''ll take home unique memories of your time on the water. An unforgettable active experience just 20 minutes from Lisbon.',
  'Catch your first wave on the golden beaches of Costa da Caparica — a 2-hour surf lesson with certified instructor, all equipment, transport and professional photos.',
  'Costa da Caparica',
  'Restaurante Titanic Sur Mer, Costa da Caparica (Ferry Boat harbour)',
  38.6446,
  -9.2353,
  50,
  'EUR',
  '3h 30min',
  NULL,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/f8/2b/9a.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/f8/2b/9a.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/9d/ac/e4.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/9d/ad/53.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/9d/ad/68.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/9d/ad/d7.jpg"]'::jsonb,
  '["2-hour surf lesson with a certified instructor","All equipment included: wetsuit and surfboard","Private transport to and from the beach","Professional photographer captures your session","Suitable for all levels — beginners to intermediate","Golden beaches of Costa da Caparica, just 20 min from Lisbon","Fun, safe and personalised instruction"]'::jsonb,
  '["Private transportation to the beach","Wetsuit and surfboard (winter or summer)","Certified surf instructor","2-hour lesson","Insurance","Professional photos"]'::jsonb,
  '["English","Italian","Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  403,
  'Lisbon',
  true,
  19,
  'https://www.viator.com/en-GB/tours/Lisbon/The-Surf-Instructor/d538-160709P1',
  'Viator'
);

-- 2) Lisbon Street Art Tour (263176P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Street Art Walking Tour & Workshop',
  'Explore one of Europe''s most creative cities through its vibrant urban art scene. Led by passionate street art lovers and artists who started this project over 10 years ago as the first of its kind in Lisbon, this immersive walk takes you through a patchwork of streets, alleys and squares to discover stunning murals, graffiti and installations. Learn about the political, economic and social issues that gave rise to Lisbon''s street art movement, while your guide shares the stories behind works by international and local artists. You''ll also learn about the history of Lisbon and its diverse neighbourhoods along the way. Your participation directly supports emerging artists through the yesyoucan.spray collective, helping fund new murals across the city. At the end, take home a street art gift and a card with exclusive local deals.',
  'Discover Lisbon''s vibrant street art scene on this 2-hour immersive walk — learn the stories behind the murals, support local artists and take home a street art gift.',
  'Graça, Lisbon',
  'Rua Natália Correia, Graça (in front of "Peaceguard" by OBEY)',
  38.7178,
  -9.1303,
  20,
  'EUR',
  '2h',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/08/c8/01.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/08/c8/01.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/06/b4/ac.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/06/b4/ad.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/06/b4/b1.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/06/b4/b4.jpg"]'::jsonb,
  '["The original Lisbon street art tour — running for over 10 years","Passionate guides who are street art lovers and practising artists","Discover murals by international and local artists","Learn the political and social stories behind each piece","Your ticket directly supports emerging artists and new murals","Take home a street art gift and a card with local deals","Some of the best street art views in the city"]'::jsonb,
  '["Experienced and passionate street art guide","Street art gift at the end of the tour","#whatsuplisboa card with local partner deals","Spray tools for the optional tote bag workshop","Learn about international and local street artists"]'::jsonb,
  '["Dutch","English","French","Portuguese","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  379,
  'Lisbon',
  true,
  20,
  'https://www.viator.com/en-GB/tours/Lisbon/Lisbon-Street-Art-Walk-and-Workshop/d538-263176P1',
  'Viator'
);

-- 3) Traditional Portuguese Cooking Class (325678P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Traditional Portuguese Cooking Class in Lisbon',
  'Experience the best of Portuguese cuisine in a hands-on cooking class set in a cozy, fun environment. No prior cooking experience needed — the team of friendly chefs and instructors at Homecooking Lisbon will guide you step by step through the preparation of a full three-course meal of classic Portuguese dishes. From starters to dessert, you''ll learn the techniques, ingredients and stories behind the country''s beloved recipes. Once everything is ready, sit down and enjoy the meal you''ve prepared together, paired with Portuguese wines, beer and other beverages — all included. A delicious way to take a piece of Portugal home with you.',
  'A hands-on 3-hour cooking class where you prepare a full three-course Portuguese meal from scratch — then sit down and enjoy it with wines included.',
  'Lisbon',
  'Rua da Aliança Operária 54-A, 1300-049 Lisbon',
  38.7075,
  -9.1611,
  85,
  'EUR',
  '3h',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/03/f8/a7.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/03/f8/a7.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/03/f8/ae.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/03/f8/af.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/29/31/aa.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/29/31/ad.jpg"]'::jsonb,
  '["Hands-on 3-hour class with friendly professional chefs","Prepare a full three-course traditional Portuguese meal","No cooking experience needed — step-by-step guidance","Enjoy the meal you''ve cooked with Portuguese wines","Cozy and fun atmosphere at Homecooking Lisbon HUB","Learn the stories and techniques behind classic recipes","All beverages included: wines, beer, water, tea and coffee"]'::jsonb,
  '["All ingredients and equipment","Portuguese wines and beer","Carbonated beverages","Bottled water","Snacks and finger food","Tea and coffee"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  287,
  'Lisbon',
  true,
  21,
  'https://www.viator.com/en-GB/tours/Lisbon/Traditional-Portuguese-Cooking-Class/d538-325678P1',
  'Viator'
);

-- 4) Fado Show with Port Wine (400715P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Intimate Live Fado Show with Port Wine at Lisboa em Fado',
  'Experience the soul of Portugal in an intimate, microphone-free setting at Lisboa em Fado. Skilled local Fado artists perform soul-stirring songs accompanied by the enchanting sounds of traditional Portuguese guitars, in a cozy venue with a small, respectful audience. This is Fado as it was meant to be heard — raw, emotional and deeply authentic. Before the show, informative videos provide context on the history of Lisbon, the origins of Fado and the significance of the Portuguese guitar. Sip on a complimentary glass of port wine as the music washes over you, connecting you to centuries of Lisbon''s rich cultural traditions. At just 50 minutes, it''s the perfect way to experience Portugal''s most iconic musical art form without committing to a full evening.',
  'A raw, intimate live Fado performance in a cozy microphone-free venue — soulful singing, Portuguese guitar and a glass of port wine included.',
  'Lisbon',
  'Lisboa em Fado, Lisbon',
  38.7103,
  -9.1334,
  18,
  'EUR',
  '50min',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/14/1d/3e.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/14/1d/3e.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/bc/9d.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/7b/1d/86.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/7b/1d/98.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/14/1d/52.jpg"]'::jsonb,
  '["Intimate microphone-free setting for an authentic experience","Skilled local Fado artists with traditional Portuguese guitar","Complimentary glass of port wine included","Informative videos on Fado history and Lisbon culture","Cozy venue with a small, respectful audience","Just 50 minutes — perfect to fit into any evening","One of the most affordable Fado experiences in Lisbon"]'::jsonb,
  '["Entry ticket to Lisboa em Fado","A glass of port wine or juice per ticket","Live Fado performance","Cultural history videos"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  278,
  'Lisbon',
  true,
  22,
  'https://www.viator.com/en-GB/tours/Lisbon/An-intimate-live-Fado-music-show-with-our-amazing-artists/d538-400715P1',
  'Viator'
);

-- 5) Relaxing Sailboat Cruise along the Tagus (69837P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Relaxing Sailboat Cruise on the Tagus with Wine & Snacks',
  'See Lisbon from a completely different perspective on this relaxing 2-hour sailboat cruise along the Tagus River. Departing from Doca de Santo Amaro, right under the iconic 25th of April Bridge, you''ll sail past Praça do Comércio — one of the most beautiful plazas in the world — with sweeping views of Chiado, Baixa, Castelo de São Jorge and Alfama spread across the hills. Cross to the south bank to admire Cristo Rei up close, then sail to Belém to see the famous Tower and Monument to the Discoveries. On the sunset option, watch the sky transform as the sun dips below the horizon. Throughout the cruise, enjoy a complimentary drink — white wine, rosé, beer or water — along with light snacks, while your experienced skipper shares stories of the river and the city.',
  'A relaxing 2-hour sailboat cruise on the Tagus River past Lisbon''s iconic landmarks — with a drink and snacks included and stunning views of the city skyline.',
  'Tagus River, Lisbon',
  'Gate 1, Doca de Santo Amaro (under the 25th of April Bridge), Lisbon',
  38.6973,
  -9.1783,
  45,
  'EUR',
  '2h',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/15/66/b5.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/15/66/b5.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/c6/bd/8c.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/c6/bd/eb.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/c6/bd/fe.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/f6/0b/40.jpg"]'::jsonb,
  '["Sail past Praça do Comércio, Alfama, Castelo and Belém","See Cristo Rei and the 25th of April Bridge from the water","Complimentary drink: white wine, rosé, beer or water","Light snacks served on board","Sunset option available for magical golden hour views","Experienced skipper who shares stories of the river","Depart from Doca de Santo Amaro, a stunning marina location"]'::jsonb,
  '["White wine, rosé wine or beer","Bottled water","Light snacks","2-hour sailboat cruise"]'::jsonb,
  '["English","French","German","Portuguese","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  204,
  'Lisbon',
  true,
  23,
  'https://www.viator.com/en-GB/tours/Lisbon/Relaxing-Time-in-a-sailboat-A-different-way-to-look-at-Lisbon/d538-69837P1',
  'Viator'
);
