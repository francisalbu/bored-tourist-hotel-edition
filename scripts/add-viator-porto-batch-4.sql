-- ============================================
-- Porto Batch 4: 6 Viator experiences in Porto
-- Products: 118678P21, 58705P7, 75688P1, 26918P6, 7372P18, 43382P8
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) From Porto Suspension Bridge 516 Arouca and Passadiços do Paiva (118678P21)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'From Porto Suspension Bridge 516 Arouca and Passadiços do Paiva',
  'Take part in a guided tour to the Suspension Bridge 516 Arouca and the Passadiços do Paiva from Porto. Crossing the 175 metres high bridge over the Paiva River with a local Guide and discover one of Portugal’s most impressive landscapes. The tour begins in Porto, with transportation to the UNESCO Geopark in Arouca. After a brief security briefing, prepare to cross one of the world’s largest suspended pedestrian bridges. Walk through the Paiva Passages and admire the stunning views of cliffs, river and waterfalls. The tour ends at the river beach of Espiunca, ideal for relaxing. If you choose the option with lunch, a typical dish of the region will be served. Important note: Due to the recent fires, about 2 km of the passages have been destroyed and will not be passed. The remaining rout...',
  'Take part in a guided tour to the Suspension Bridge 516 Arouca and the Passadiços do Paiva from Porto. Crossing the 175 metres high bridge over the Paiva River with a local Guide and discover one of P',
  'Meet us at Largo do Actor Dias, next to the historic Fernandina Wall

https://maps.app.goo.gl/6FYge1',
  'Meet us at Largo do Actor Dias, next to the historic Fernandina Wall

https://maps.app.goo.gl/6FYge1go2hr2YHCNA',
  41.1579,
  -8.6291,
  110.0,
  'EUR',
  'Full day',
  NULL,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/7b/ba/27.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/7b/ba/27.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/7b/ba/19.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/33/a8/fb.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/33/a8/b0.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/1a/17/7a.jpg"]'::jsonb,
  '["Near the Fernandine Walls in Porto", "Transfer to Alvarenga", "The walk begins here, lasting approximately 4 hours along the Passadiços do Paiva passing through th", "Bridge Crossing 516", "Start of the walk to Espiunca. There are almost 8km of walkways alongside the Paiva River with stunn", "End of the walk\nTime for a break and Lunch (if selected)", "Transfer to Arouca"]'::jsonb,
  '["Professional guide", "In-vehicle air conditioning", "Lunch (When selected)"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  24,
  'Porto',
  true,
  122,
  'https://www.viator.com/tours/Porto/9-Hour-Suspension-Bridge-516-Arouca-and-Passadicos-do-Paiva/d26879-118678P21?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 2) HIKING in the Douro Valley (58705P7)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'HIKING in the Douro Valley',
  'We will hike/walk through the vineyards in Douro valley until the amazing Pinhão village trough the amazing scenario of the Douro Valley Vineyards, wine region which is the only wine region in the world which is world heritage site by UNESCO. At midday, we’ll take a well-deserved break for a Picnic (not included—please bring your own food and drinks) and enjoy the peaceful surroundings. After the picnic, the hike will continue with the amazing views of Douro Valley vineyards until the beautiful village of Pinhão where will finish our hike and have the chance to visit the secular train station. The hike has an extension of 9 Km and can be considered easy to medium for people who can walk easily 10 km. And difficult to people not used to walking long distances. From August to September, t...',
  'We will hike/walk through the vineyards in Douro valley until the amazing Pinhão village trough the amazing scenario of the Douro Valley Vineyards, wine region which is the only wine region in the wor',
  'Porto',
  '',
  41.1579,
  -8.6291,
  75.0,
  'EUR',
  'Full day',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/48/23/04.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/48/23/04.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/48/1c/87.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/38/d9/f0.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/38/d9/fc.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/38/d9/ea.jpg"]'::jsonb,
  '["We will have our first stop in Sabrosa, a village on top of the Douro valley. This will be a stop to", "Douro Valley is the first demarcated wine region in the world and the only which is World Heritage b"]'::jsonb,
  '["In-vehicle air conditioning", "Tour Guide"]'::jsonb,
  '["English", "French", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  13,
  'Porto',
  true,
  123,
  'https://www.viator.com/tours/Porto/HIKE-in-DOURO-VALLEY-w-winery-and-Boat-Cruise/d26879-58705P7?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 3) Fado by Casa da Guitarra (75688P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Fado by Casa da Guitarra',
  'Discover the true soul of Portuguese music in the first Fado concert in show format in Porto, led by a luthier expert in traditional music. This is the only venue in the city that builds and exhibits handmade Portuguese string instruments, such as the Portuguese guitar, mandolin, and viola. More than a performance, this is a deep cultural immersion, with explanations about Fado in video format, the instruments, and workshops — discover the exhibition Journey through String Instruments. Enjoy a glass of Port wine as you listen to powerful and emotional live Fado in an intimate and authentic setting, a traditional portuguese instrument store. Perfect for someone seeking a genuine cultural experience, with local artists and an expert in instrument building playing the portuguese guitar.',
  'Discover the true soul of Portuguese music in the first Fado concert in show format in Porto, led by a luthier expert in traditional music. This is the only venue in the city that builds and exhibits ',
  'Porto',
  '',
  41.1579,
  -8.6291,
  20.0,
  'EUR',
  '1h',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/09/94/f3.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/09/94/f3.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/6d/e2/e4.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/45/90/c9.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/45/90/c4.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/45/90/cc.jpg"]'::jsonb,
  '["Fado by Casa da Guitarra"]'::jsonb,
  '["Alcoholic beverages", "Wine tasting"]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  440,
  'Porto',
  true,
  124,
  'https://www.viator.com/tours/Porto/Fado-at-6h/d26879-75688P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 4) Braga & Guimarães Small Group Tour: Lunch & All Tickets Included (26918P6)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Braga & Guimarães Small Group Tour: Lunch & All Tickets Included',
  'Discover the Baroque Art and the Birthplace of Portugal: Braga & Guimarães Day Tour from Porto! Embark on an unforgettable guided day trip from Porto in a comfortable, air-conditioned van to two of Portugal’s most historic cities — Braga and Guimarães. Start your journey with a hotel pickup and head to Bom Jesus Sanctuary, admiring its iconic baroque staircase and panoramic views. Explore Braga Cathedral, the oldest in Portugal, with exclusive access to its chapels and high choir. Savor a traditional meal at a local restaurant paired with the region’s famous Vinho Verde wine. Step back in time with a peaceful stroll through this enchanting medieval city. Visit the legendary Guimarães Castle, where Portugal was born, and explore the Palace of the Dukes, showcasing the splendor of royal l...',
  'Discover the Baroque Art and the Birthplace of Portugal: Braga & Guimarães Day Tour from Porto! Embark on an unforgettable guided day trip from Porto in a comfortable, air-conditioned van to two of Po',
  'Porto',
  '',
  41.1579,
  -8.6291,
  120.0,
  'EUR',
  'Full day',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/70/5c/de.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/70/5c/de.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/f8/63/29.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/0b/9f/06.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/5b/4d/d2.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/11/5e/10.jpg"]'::jsonb,
  '["We start our tour on the top of the mountain and visit the most magnificent Sanctuary in Portugal an", "Stop for a delicious lunch at the Diana Restaurant where the intense flavors of the northern cuisine", "The oldest castle in Portugal was where the first Portuguese king grew up and has a very important s"]'::jsonb,
  '["Hotel pickup and drop-off", "Local guide", "Bottled water", "Exclusive access to parts of the Braga Cathedral (Chapels and High Choir)", "Lunch", "Admission Ticket Guimarães Castle"]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  518,
  'Porto',
  true,
  125,
  'https://www.viator.com/tours/Porto/Braga-and-Guimaraes-with-Lunch-Included-Small-Group-Full-Day/d26879-26918P6?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 5) 3-Hour Porto Jewish Heritage Walking Tour with Local Guide (7372P18)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  '3-Hour Porto Jewish Heritage Walking Tour with Local Guide',
  'Start this tour in the original core of the city of Porto, next to the pilory in front of the Cathedral. Follow the directions of the expansion of the city, getting to know the places marked by the jewish presence and the contribution of this community to the development of this mercantile city in the first centuries of the country foundation. From Pena Ventosa till Ribeira, imagine yourself in the medieval city, whilst you walk through the oldest streets and see what is left of the city walls and other medieval buildings. Find out also the role that the jews took during the discoveries and how three centuries of inquisition tried to erase theirpresence. Know the places of the old jewish quarters and how these are still imprinted in the city nowadays. End up this tour appreciating a nic...',
  'Start this tour in the original core of the city of Porto, next to the pilory in front of the Cathedral. Follow the directions of the expansion of the city, getting to know the places marked by the je',
  'Meet your tourguide in front of Porto''s Cathedral, by the stone pillar.
The stone pillar is right on',
  'Meet your tourguide in front of Porto''s Cathedral, by the stone pillar.
The stone pillar is right on the center of the square in front of the Cathedral''s main entrance.',
  41.1579,
  -8.6291,
  50.0,
  'EUR',
  '3h',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/75/40/e4.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/75/40/e4.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0d/64/3c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0d/64/3e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0d/64/42.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0d/64/47.jpg"]'::jsonb,
  '["Meeting point", "Visit the wonderfull cathedral", "Now more about the old jewish quarter", "Learn more abour the memorial", "Witness medieval Porto", "Learn more abour the memorial", "Glimpse the view from this pont"]'::jsonb,
  '["Local guide", "Professional guide"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  396,
  'Porto',
  true,
  126,
  'https://www.viator.com/tours/Porto/Porto-Jewish-Heritage-Walking-Tour/d26879-7372P18?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 6) Buggy Tour Offroad - Polaris RZR 4x4 (43382P8)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Buggy Tour Offroad - Polaris RZR 4x4',
  'Adventure lovers will be able to drive a fantastic Polaris RZR in one of the most beautiful places in Portugal.',
  'Adventure lovers will be able to drive a fantastic Polaris RZR in one of the most beautiful places in Portugal.',
  'Porto',
  '',
  41.1579,
  -8.6291,
  175.0,
  'EUR',
  '3h',
  NULL,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/72/39/57.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/72/39/57.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/84/98/6d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/fc/82/1b.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/84/99/f4.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/84/9c/eb.jpg"]'::jsonb,
  '["Buggy Tour Offroad - Polaris RZR 4x4"]'::jsonb,
  '["This fantastic experience includes the rental of an RZR for 2 people, a guide in another Buggy, fuel, helmet and glasses. "]'::jsonb,
  '["English", "French", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  56,
  'Porto',
  true,
  127,
  'https://www.viator.com/tours/Porto/Polaris-RZR-Buggy-Tour-4x4/d26879-43382P8?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

