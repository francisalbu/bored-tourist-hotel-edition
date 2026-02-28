-- ============================================
-- Batch 14: Add 5 Viator experiences to Supabase
-- Products: 66870P3, 5538552P1, 17131P6, 85308P3, 63327P5
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Hiking tour to the highest limestone cliff of continental Europe (66870P3)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Hiking tour to the highest limestone cliff of continental Europe',
  'Enjoy a hiking tour to the highest limestone cliff of continental Europe. Go inside Arrábida Natural Park and take a long walk into the remote lands of "Serra do Risco". A place characterized by a landscape with a strong character. The walk is done along the top of the mountain that looks like a wave that advances impetuosly and is suddenly cut off and sculpted in the air, it is a wave of stone and scrub, it is the fossil of a wave.',
  'Enjoy a hiking tour to the highest limestone cliff of continental Europe. Go inside Arrábida Natural Park and take a long walk into the remote lands of "Serra do Risco". A place characterized by a lan',
  'Lisbon',
  '',
  38.7223,
  -9.1393,
  99.0,
  'EUR',
  '7h',
  NULL,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/26/3c/8d.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/26/3c/8d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/26/3c/f5.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/26/3c/f6.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/26/3c/f7.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/26/3c/f8.jpg"]'::jsonb,
  '["Hiking tour to the highest limestone cliff of continental Europe"]'::jsonb,
  '["Guide book of local Flora", "Hotel pickup and drop-off", "Professional guide", "All insurance"]'::jsonb,
  '["English", "French", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  46,
  'Lisbon',
  true,
  63,
  'https://www.viator.com/tours/Lisbon/Hiking-tour-to-the-highest-limestone-cliff-of-continental-Europe/d538-66870P3',
  'Viator'
);

-- 2) Lisbon: Fado Show With Wine and History (5538552P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Fado Show With Wine and History',
  'Immerse yourself in the soul of Lisbon’s history at Fado & Fado, where music and tradition come together in a truly unique setting. Located near the Lisbon Sé Cathedral, the venue is steeped in history, featuring the ancient stone arches of the city’s medieval wall and the old sea gate, dating back to the 11th century. Each performance is a journey through the history of Fado, passed down through generations. From its traditional roots to modern interpretations, the show weaves together haunting melodies and rich storytelling. Between songs, the musicians share tales of its origins, evolution, and the legendary figures who shaped this deeply emotional genre. As you savor the music, enjoy a glass of fine Portuguese wine, included with your ticket, making the experience even more memorabl...',
  'Immerse yourself in the soul of Lisbon’s history at Fado & Fado, where music and tradition come together in a truly unique setting. Located near the Lisbon Sé Cathedral, the venue is steeped in histor',
  'Lisbon',
  '',
  38.7223,
  -9.1393,
  19.5,
  'EUR',
  '50min',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/15/87/7b.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/15/87/7b.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/16/2a/d1.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/16/2b/3a.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/15/86/6d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/15/86/82.jpg"]'::jsonb,
  '["Lisbon: Fado Show With Wine and History"]'::jsonb,
  '["A glass of Port Wine or a drink of your choice"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  46,
  'Lisbon',
  true,
  64,
  'https://www.viator.com/tours/Lisbon/Lisbon-Fado-and-Fado-Music-Wine-and-History/d538-5538552P1',
  'Viator'
);

-- 3) Belém District and the Salazar Dictatorship Legacy - Private Walking Tour (17131P6)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Belém District and the Salazar Dictatorship Legacy - Private Walking Tour',
  'Embark on an insightful and exciting tour that rewinds Portugal into the 20th century, a century in which the country became one of the first republics in Europe, then was ruled by the ruthless dictator Salazar and only in 1974 regained freedom and democracy. We give the word to Belém quarter and its monuments, sculptures and unique places that have played and continue to play a crucial role in the country’s destinies. Belém (Bethlehem) was the name given to the anchorage from which the ships of the Portuguese Maritime Discoveries departed. A hundred years ago, however, this was a grim industrial area. The turning point came with the Portuguese World Exhibition of 1940, a nationalist celebration not usually documented in touristic guides. This walk explores Belém taking the controversia...',
  'Embark on an insightful and exciting tour that rewinds Portugal into the 20th century, a century in which the country became one of the first republics in Europe, then was ruled by the ruthless dictat',
  'Our meeting point is by the entrance of the station, under the big red letters - "Estação Fluvial" (',
  'Our meeting point is by the entrance of the station, under the big red letters - "Estação Fluvial" (River Station). This is opposite to the Belém Train Station, also near Museu dos Coches.',
  38.7223,
  -9.1393,
  18.0,
  'EUR',
  '3h',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/e6/ae/b9.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/e6/ae/b9.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/7f/51/97.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/c7/cb/f5.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/c7/cb/8b.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/c7/e9/06.jpg"]'::jsonb,
  '["Belém area avatars from the Discoveries period to the 1940 Exhibition", "Old Belém town (or what''s left of it)", "The facade and the interior spaces of the most lavish late Gothic Cathedral in Lisbon with insightfu", "This square was the hub and is the main heritage of the Portuguese World Exhibition. We do quick sto", "We walk around and try to shed light on the the main icon of the 1940 exhibition, not forgetting the", "The Museum of Popular is a conundrum and a real oddity of Modernist Lisbon.", "The other great monument of the Discoveries Age and the Restelo upper class neighborhood that develo"]'::jsonb,
  '["Private walking tour", "Local professional guide", "Professional photographer guide"]'::jsonb,
  '["English", "French", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  41,
  'Lisbon',
  true,
  65,
  'https://www.viator.com/tours/Lisbon/Belem-district-and-the-Salazar-dictatorship-legacy/d538-17131P6',
  'Viator'
);

-- 4) Évora and Monsaraz from Lisbon (85308P3)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Évora and Monsaraz from Lisbon',
  'Discover the soul of Portugal on a private Alentejo tour from Lisbon. Experience a landscape defined by rolling vineyards, ancient cork trees, and traditional olive groves. Explore the UNESCO city of Évora, famous for its Roman heritage and medieval charm. Your journey continues to the hilltop village of Monsaraz, offering stunning views to Spain across the historic border. This is an authentic escape into the heart of Portuguese culture, history, and nature.',
  'Discover the soul of Portugal on a private Alentejo tour from Lisbon. Experience a landscape defined by rolling vineyards, ancient cork trees, and traditional olive groves. Explore the UNESCO city of ',
  'Lisbon',
  '',
  38.7223,
  -9.1393,
  152.78,
  'EUR',
  '6h',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/36/6a/ad.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/36/6a/ad.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/36/6a/99.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/38/22/10.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/38/22/11.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/7b/e8/92.jpg"]'::jsonb,
  '["Pick up in any accommodation in Lisbon"]'::jsonb,
  '["Hotel pickup and drop-off", "Private tour", "Bottled water", "Driver/guide", "Live commentary on board", "Transport by air-conditioned minivan"]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  37,
  'Lisbon',
  true,
  66,
  'https://www.viator.com/tours/Lisbon/Evora-and-Monsaraz/d538-85308P3',
  'Viator'
);

-- 5) Kayak and Snorkeling Adventure in Lisbon (63327P5)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Kayak and Snorkeling Adventure in Lisbon',
  'This is the offbeaten activity everybody is looking for. This summer if you are in Portugal you don''t want to miss Arrabida Natural Park. It balances, fun, history, adventure and food in a whole package and you still do some friends along the way. We are not even mentioning the beatiful tan you will get',
  'This is the offbeaten activity everybody is looking for. This summer if you are in Portugal you don''t want to miss Arrabida Natural Park. It balances, fun, history, adventure and food in a whole packa',
  'Pickup is right in front of Lisbons Zoo. A white van branded with our company logo in green and blue',
  'Pickup is right in front of Lisbons Zoo. A white van branded with our company logo in green and blue will be there at 10 AM.

NOTE: If you booked our activity but selected the "NO PICKUP" option then you will have to meet us at 11 AM at the beach of Creiro instead.',
  38.7223,
  -9.1393,
  45.0,
  'EUR',
  '7h',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/d9/68/d7.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/d9/68/d7.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/f1/2e/5b.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/d9/68/d9.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/f1/2d/e0.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/f1/2d/d4.jpg"]'::jsonb,
  '["Kayak and Snorkeling Adventure in Lisbon"]'::jsonb,
  '["Kayaks, wetsuits, watershoes", "Use of snorkeling equipment"]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  146,
  'Lisbon',
  true,
  67,
  'https://www.viator.com/tours/Lisbon/Lisbons-Best-Gem-Kayak-and-Snorkeling-Adventure/d538-63327P5',
  'Viator'
);

