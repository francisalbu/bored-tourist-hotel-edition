-- ============================================
-- Batch 12: Add 6 Viator experiences to Supabase
-- Products: 111503P1, 66870P17, 198854P9, 32794P4, 14133P1, 101573P40
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Lisbon Oceanario: Aquarium Entrance Ticket (111503P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Oceanario: Aquarium Entrance Ticket',
  'No matter how many times you come to the Oceanário, its 500 species and 8,000 animals and plants will surprise you and ensure every visit will be different.',
  'No matter how many times you come to the Oceanário, its 500 species and 8,000 animals and plants will surprise you and ensure every visit will be different.',
  'Lisbon',
  '',
  38.7223,
  -9.1393,
  40.0,
  'EUR',
  '2h',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/82/6e/2c.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/82/6e/2c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/82/6e/1e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/82/6e/28.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/82/6e/2a.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/82/6e/2b.jpg"]'::jsonb,
  '["Lisbon Oceanario: Aquarium Entrance Ticket"]'::jsonb,
  '["Aquarium Ticket Admission", "Entrance to the New Exhibition: \"Submerged Universe\"", "Entrance to the Exhibition: \"Forests Underwater by Takashi Amano\""]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.3,
  1465,
  'Lisbon',
  true,
  51,
  'https://www.viator.com/en-GB/tours/Lisbon/Lisbon-Oceanarium-Entrance-Ticket/d538-111503P1',
  'Viator'
);

-- 2) Private Safari Tour to Espichel Cape & West Coast Wild Beaches  (66870P17)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Private Safari Tour to Espichel Cape & West Coast Wild Beaches ',
  'Escape the ordinary and explore the wild beauty of Portugal on this private Jeep tour to Espichel Cape and West Coast Wild Beaches. Journey off the beaten path in a rugged 4x4, discovering dramatic coastal cliffs, ancient sanctuaries, and hidden gems that most travelers miss. Led by a knowledgeable local guide, this adventure blends history, nature, and breathtaking landscapes for an unforgettable experience. Enjoy panoramic viewpoints, secluded beaches, and authentic local insights on a tour designed for curious explorers and nature lovers. Book now for a one-of-a-kind adventure!',
  'Escape the ordinary and explore the wild beauty of Portugal on this private Jeep tour to Espichel Cape and West Coast Wild Beaches. Journey off the beaten path in a rugged 4x4, discovering dramatic co',
  'Lisbon',
  '',
  38.7223,
  -9.1393,
  146.43,
  'EUR',
  '6h',
  NULL,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/60/6f/c6.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/60/6f/c6.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/e7/85/b1.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/e8/58/00.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/e8/5b/3f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/92/9f/7d.jpg"]'::jsonb,
  '["Private Safari Tour to Espichel Cape & West Coast Wild Beaches "]'::jsonb,
  '["Pick-up and drop off", "Local Guide"]'::jsonb,
  '["English", "French", "Italian", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  59,
  'Lisbon',
  true,
  52,
  'https://www.viator.com/en-GB/tours/Lisbon/Jeep-tour-to-Espichel-Cape-and-Hell-beach-Private/d538-66870P17',
  'Viator'
);

-- 3) "Lisbon by Night" up to 6 people, private tour (198854P9)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  '"Lisbon by Night" up to 6 people, private tour',
  'Lisbon''s extraordinary night tour is a trip to some of the city''s secrets, to the bubbling energy, unique atmosphere and part of its history. The night allows for a continuous and fascinating dance through a play of lights, unique and unparalleled contrasts.',
  'Lisbon''s extraordinary night tour is a trip to some of the city''s secrets, to the bubbling energy, unique atmosphere and part of its history. The night allows for a continuous and fascinating dance th',
  'Lisbon',
  '',
  38.7223,
  -9.1393,
  57.21,
  'EUR',
  '2h',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/b8/14/78.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/b8/14/78.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/75/aa/ed.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/77/87/84.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/75/ab/c3.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/04/6d/ef.jpg"]'::jsonb,
  '["\"Lisbon by Night\" up to 6 people, private tour"]'::jsonb,
  '["Private transportation", "Private guide"]'::jsonb,
  '["English", "French", "Italian", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  57,
  'Lisbon',
  true,
  53,
  'https://www.viator.com/en-GB/tours/Lisbon/Lisbon-by-Night-for-up-to-4-people-private-tour/d538-198854P9',
  'Viator'
);

-- 4) Fado Musical Experience with Portuguese Wine & Appetizers (32794P4)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Fado Musical Experience with Portuguese Wine & Appetizers',
  'Experience the heart of Portuguese culture with our mesmerizing Fado show. Enjoy an evening of live music, where heartfelt vocals and acoustic guitar come together in a cozy, welcoming setting. You''ll visit the birthplace of Fado, in the city''s oldest neighborhood. It’s only a 3 minute walk from the meeting point. A Fado show is more than a performance, it''s an immersive cultural encounter that will leave a lasting impression. Due to it’s cultural importance this musical form was declared part of the Intangible Cultural Heritage of Humanity by UNESCO. The performance features two singers, usually a man and a woman, each bringing their own unique style. Sometimes, they''ll sing a duet, offering a memorable highlight of the evening. You’ll be seated mainly close to the singers, making the ...',
  'Experience the heart of Portuguese culture with our mesmerizing Fado show. Enjoy an evening of live music, where heartfelt vocals and acoustic guitar come together in a cozy, welcoming setting. You''ll',
  'The meeting point: In front of the main entrance to the Fado Museum.
Please look for the guide holdi',
  'The meeting point: In front of the main entrance to the Fado Museum.
Please look for the guide holding yellow umbrella near to the entrance of Fado Museum.',
  38.7223,
  -9.1393,
  35.0,
  'EUR',
  '2h 10min',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/90/41/c0.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/90/41/c0.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/7b/b5/c6.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/7b/a1/30.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/90/41/bd.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/90/41/c2.jpg"]'::jsonb,
  '["Here the guide will take you to the traditional Fado house and make you feel the nostalgia woven int"]'::jsonb,
  '["Captivating singers accompanied by talented guitarists", "A variety of Portuguese appetizers", "Glass of Port wine (sodas available for non-alcoholic drinkers)", "Traditional Fado show", "Passionate guide "]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.3,
  81,
  'Lisbon',
  true,
  54,
  'https://www.viator.com/en-GB/tours/Lisbon/Fado-Tour/d538-32794P4',
  'Viator'
);

-- 5) Balloon Ride with Complimentary Drink from Coruche (14133P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Balloon Ride with Complimentary Drink from Coruche',
  'Experience the sky in a peaceful, slow moving way with a unique balloon ride through the skies of Coruche, Portugal. Embark on an unique adventure and be greeted by a complimentary glass of Champagne in the end of your ride. This balloon ride is available at sunrise daily and at sunset during the winter months. Hotel pick up/drop-off is not available.',
  'Experience the sky in a peaceful, slow moving way with a unique balloon ride through the skies of Coruche, Portugal. Embark on an unique adventure and be greeted by a complimentary glass of Champagne ',
  'We will send the meeting point and take-off time by email or WhatsApp after confirming the weather c',
  'We will send the meeting point and take-off time by email or WhatsApp after confirming the weather conditions for the flight. Please do not come without receiving our confirmation',
  38.7223,
  -9.1393,
  259.0,
  'EUR',
  '3h',
  NULL,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/7b/1f/30.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/7b/1f/30.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/7b/1f/31.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d7/e1/d0.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d7/e1/d4.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d7/e1/db.jpg"]'::jsonb,
  '["Sorraia River, Green from the fields, blue from the river, golden from the sun''s rays and a world of"]'::jsonb,
  '["Champagne toast at the end of the flight", "Certificate of Flight", "Glass of Champagne", "Hot air Balloon ride 60 to 90 minutes", "Return transport to the starting point", "Insurance passengers"]'::jsonb,
  '["Dutch", "English", "French", "German", "Italian", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  55,
  'Lisbon',
  true,
  55,
  'https://www.viator.com/en-GB/tours/Lisbon/Balloon-Ride-with-Complimentary-Drink-from-Coruche/d538-14133P1',
  'Viator'
);

-- 6) From Lisbon : Óbidos & Nazaré Giant Waves, Ginja & Small Group (101573P40)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'From Lisbon : Óbidos & Nazaré Giant Waves, Ginja & Small Group',
  'Discover Óbidos, a charming medieval Villa surrounded by historic walls. Enjoy free time to explore its picturesque streets, walk through the walls and visit local craft shops. Taste the traditional ginjinha, already included on the tour. Then travel to Nazaré, world famous for its giant waves and world-class surfing. Visit North Beach and have free time at the Site of Nazaré to explore the Miradouro with stunning views of the Atlantic, the Shrine of Our Lady of Nazaré and the iconic Farol of Nazaré. Return to Lisbon at the end of the day with unforgettable memories of this unique experience in Portugal.',
  'Discover Óbidos, a charming medieval Villa surrounded by historic walls. Enjoy free time to explore its picturesque streets, walk through the walls and visit local craft shops. Taste the traditional g',
  'Pick-up: Praça Marques de Pombal Nº8
In front of the Hotel Fenix Marques de Pombal',
  'Pick-up: Praça Marques de Pombal Nº8
In front of the Hotel Fenix Marques de Pombal',
  38.7223,
  -9.1393,
  136.0,
  'EUR',
  '6h',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/e6/e7/b3.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/e6/e7/b3.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/03/f9/a7.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/03/f9/ac.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/03/f9/ae.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/b2/45/e9.jpg"]'::jsonb,
  '["From Lisbon : Óbidos & Nazaré Giant Waves, Ginja & Small Group"]'::jsonb,
  '["Free time to explore Óbidos and Nazareth.", "Bottled water", "On-board WiFi", "Tasting of ginjinha in Óbidos.", "In-vehicle air conditioning", "Transport in a comfortable minivan"]'::jsonb,
  '["English", "Portuguese", "Spanish", "gu", "hi"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  55,
  'Lisbon',
  true,
  56,
  'https://www.viator.com/en-GB/tours/Lisbon/Obidos-and-Nazare-tour-from-Lisbon/d538-101573P40',
  'Viator'
);

