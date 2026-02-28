-- ============================================
-- Batch 3: Add 5 Viator experiences to Supabase
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Dolphin Watching with Marine Biologist (116939P8)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Dolphin Watching Ocean Safari with a Marine Biologist',
  'Depart from Lisbon on a fast Rigid Inflatable Boat and head straight into the wide Atlantic Ocean in search of dolphins. Led by an expert marine biologist, you''ll use real scientific techniques to scan the waters — spotting bottlenose dolphins, common dolphins, and sometimes even whales, sunfish, sea turtles and sharks. The 3-hour adventure takes you along the stunning Atlantic coastline on a comfortable 8.5m RIB, offering incredible views of the open sea and Lisbon''s waterfront. On the way back through the Tagus River, you''ll pass by the iconic monuments of Belém and sail beneath the 25th of April Bridge. This is nature tourism at its best — an unforgettable ocean safari led by true marine experts, just minutes from the heart of Lisbon.',
  'A thrilling 3-hour ocean safari on a speedboat led by a marine biologist — search for wild dolphins, whales and sea turtles off the Lisbon coast.',
  'Atlantic Coast, Lisbon',
  'Doca de Santo Amaro, Gate 3, Lisbon',
  38.6973,
  -9.1783,
  65,
  'EUR',
  '3h',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/49/e9/7d.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/49/e9/7d.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/4f/39.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/49/ea/16.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/e3/e6/fa.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/68/69/45.jpg"]'::jsonb,
  '["Led by an expert marine biologist who explains every sighting","Spot dolphins, whales, sunfish, sea turtles and sharks","Fast Rigid Inflatable Boat for an adrenaline-filled ride","Sail past Belém monuments and under the 25th of April Bridge","Use real scientific techniques to scan the ocean","Motion-sickness pills provided if needed","Depart from Doca de Santo Amaro, right under the iconic bridge"]'::jsonb,
  '["Marine biologist tour guide and crew","All fees and taxes","Public liability insurance","Motion-sickness pill if necessary","Lifejackets and seat on the boat"]'::jsonb,
  '["English","French","Italian","Portuguese","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  814,
  'Lisbon',
  true,
  14,
  'https://www.viator.com/tours/Lisbon/Dolphin-Watching-Lisbon/d538-116939P8',
  'Viator'
);

-- 2) Lisbon Awakens: A Culinary Crossroads (203526P19)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon Awakens: A Culinary Crossroads by Culinary Backstreets',
  'Travel back in time to the Age of Exploration, when Lisbon held the keys to the global spice trade, and trace those distant roots through the city''s modern food scene. Starting beside the 18th-century Estrela Basilica, you''ll make your way to the charming Campo de Ourique neighbourhood — a well-preserved "village" within the city. Warm up with a shot of ginjinha, the traditional sour-cherry liqueur, before diving into one of Lisbon''s finest traditional markets. Meet the old-school artisans — fishmongers, butchers, greengrocers and bakers — working alongside boutique stalls with contemporary offerings. Over 5.5 hours, enjoy a full lunch with wines and snacks as you discover where past and present, near and far, meet and become deliciously entwined. This is Culinary Backstreets'' signature Lisbon experience.',
  'A 5.5-hour culinary journey through Lisbon''s hidden food scene — from the Age of Exploration to Campo de Ourique''s traditional market, with a full lunch and wines included.',
  'Estrela & Campo de Ourique, Lisbon',
  'Jardim da Estrela (main entrance), Praça da Estrela, Lisbon',
  38.7137,
  -9.1599,
  150,
  'EUR',
  '5h 30min',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/0a/54/51.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/0a/54/51.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/0a/54/4c.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/78/ae/0e.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/78/ae/02.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/0a/54/4f.jpg"]'::jsonb,
  '["Culinary Backstreets'' signature Lisbon experience","Explore the charming Campo de Ourique neighbourhood","Visit a traditional Lisbon market and meet local artisans","Full lunch with wines and snacks included","Taste ginjinha, Portugal''s beloved sour-cherry liqueur","Discover the spice trade legacy in Lisbon''s modern cuisine","5.5 hours of deep food and cultural immersion"]'::jsonb,
  '["Full lunch","Alcoholic beverages (wines)","Bottled water","Snacks","Tea and coffee"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  754,
  'Lisbon',
  true,
  15,
  'https://www.viator.com/tours/Lisbon/Lisbon-Awakens-A-Culinary-Crossroads-Reborn-with-Culinary-Backstreets/d538-203526P19',
  'Viator'
);

-- 3) Private Wine Tasting in Setúbal (11392P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Private Setúbal Wine Region Tour: Wineries, Cheese & Full Lunch',
  'Tantalize your taste buds on this full-day private guided tour to the Setúbal Wine Region. Just south of Lisbon, this beautiful region is home to some of Portugal''s most distinctive wines and artisan cheeses. Choose between visiting three different wineries for an extensive tasting journey, or two wineries combined with a full sit-down lunch at a small family-owned restaurant in one of the charming local villages. Being a fully private experience, it''s just you, your group and your dedicated guide — so the day adapts entirely to your pace and preferences. Taste 7 to 10 wines across the cellars you visit, paired with traditional cheese breads and regional delicacies. With hotel pickup and drop-off in a private air-conditioned vehicle, everything is taken care of from door to door.',
  'A fully private full-day wine tour to the Setúbal region — visit up to 3 wineries, taste 7–10 wines with artisan cheeses and enjoy a traditional lunch, all with hotel pickup.',
  'Setúbal Wine Region',
  'Hotel pickup in Lisbon',
  38.5244,
  -8.8882,
  125,
  'EUR',
  '6h',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/d8/6f/8f.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/d8/6f/8f.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/e7/af.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/e7/ab.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/3a/41/6e.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/e7/b7.jpg"]'::jsonb,
  '["Fully private tour — just your group and your guide","Visit up to 3 different wineries in the Setúbal region","Taste 7 to 10 wines with artisan cheese and bread","Option for a full sit-down lunch at a family restaurant","Hotel pickup and drop-off in a private air-conditioned vehicle","Discover one of Portugal''s most distinctive wine regions","Flexible itinerary adapted to your pace and preferences"]'::jsonb,
  '["7–10 wine tastings across the wineries","Traditional cheese bread and regional snacks","Full lunch (depending on tour option)","Private professional guide","Hotel/Airbnb pickup and drop-off","Private air-conditioned transport","Entrance fees to all wineries"]'::jsonb,
  '["English","German","Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  612,
  'Lisbon',
  true,
  16,
  'https://www.viator.com/tours/Lisbon/Private-Setubal-Region-Wine-Tasting-Tour-Full-Day-from-Lisbon/d538-11392P1',
  'Viator'
);

-- 4) Pastel de Nata Masterclass (86153P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Pastel de Nata Masterclass at a Real Bakery in Downtown Lisbon',
  'Dive into the only Pastel de Nata baking class in Portugal set inside a real working bakery. At Nat''elier in downtown Lisbon, expert pastry chefs whip up these beloved custard tarts daily — and now you get to learn their secrets in the same buzzing professional kitchen. From scratch to pastry perfection, you''ll be guided through every step: preparing the dough, crafting the custard, and mastering the iconic flaky layers. The whole process is fun, hands-on and accessible to all skill levels. After baking, taste your freshly made pastéis de nata paired with a selection of hot or cold drinks prepared by skilled baristas. You''ll leave with a certificate of achievement, the full recipe sent to your email, and ongoing support so you can recreate the magic at home whenever the craving strikes.',
  'Learn to bake Portugal''s iconic pastéis de nata from scratch in a real working bakery in downtown Lisbon — hands-on, fun and suitable for all skill levels.',
  'Downtown Lisbon',
  'Nat''elier, Downtown Lisbon',
  38.7105,
  -9.1398,
  70,
  'EUR',
  '2h',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/28/d3.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/28/d3.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/28/ce.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/d3/dc/73.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/28/bc.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/28/ca.jpg"]'::jsonb,
  '["The only Pastel de Nata class inside a real working bakery in Portugal","Hands-on 2-hour masterclass with a professional pastry chef","Learn to make the dough, custard and iconic flaky layers from scratch","Taste your freshly baked pastéis de nata with drinks","Take home a certificate of achievement","Full recipe sent to your email with ongoing support","Fun and accessible for all skill levels — no experience needed"]'::jsonb,
  '["2-hour hands-on class with a professional pastry chef","All equipment and ingredients","3 pastéis de nata to taste","Water and a choice of hot or cold drink","Certificate of achievement","Step-by-step recipe sent via email"]'::jsonb,
  '["English","Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  495,
  'Lisbon',
  true,
  17,
  'https://www.viator.com/tours/Lisbon/Pastel-de-Nata-Workshop-at-REAL-Bakery/d538-86153P1',
  'Viator'
);

-- 5) Premium Kayak and Coasteering Adventure (304603P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Award-Winning Kayak & Coasteering Adventure in Arrábida with Lunch',
  'Start the day with a 40-minute drive south of Lisbon to the stunning Arrábida Natural Park. Grab a kayak and paddle along an untouched coastline, dropping anchor at hidden spots to explore unique sea caves filled with sinkholes and fossils. Climb the cliffs for dives up to 10 metres high, plunging into crystal-clear waters below. Snorkel in a Zoological Marine Reserve island surrounded by vibrant marine life. The adventure includes drinks and snacks served on the kayaks at a scenic stop, followed by a full lunch at a table right on the beach sand. On the drive back, wind through scenic mountain views and stop for a toast with homemade port wine. This award-winning all-inclusive experience is the ultimate active day trip from Lisbon.',
  'An all-inclusive adventure day at Arrábida — kayaking along sea caves, cliff jumping, snorkelling in a marine reserve, plus a full beach lunch and homemade port wine.',
  'Arrábida Natural Park, Setúbal',
  'Quinta Nova Aljubarrota nº38, Setúbal',
  38.4894,
  -8.9757,
  95,
  'EUR',
  '10h',
  NULL,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/55/16/c3.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/55/16/c3.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/55/16/a9.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/55/16/ea.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/09/b0/5f.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/a5/19/f4.jpg"]'::jsonb,
  '["Kayak along Arrábida''s untouched coastline and hidden sea caves","Cliff jumping with dives up to 10 metres into crystal-clear water","Snorkel in a Zoological Marine Reserve island","Full lunch served at a beachside table on the sand","Drinks and snacks on the kayaks at a scenic stop","Toast with homemade port wine on the drive back","All equipment included: wetsuit, helmet, kayak, snorkelling gear"]'::jsonb,
  '["Full lunch on the beach","Alcoholic beverages and snacks","3-person kayak, paddle and life jacket","Wetsuit, neoprene socks, rubber shoes, gloves, helmet","Snorkelling equipment","Personal insurance","Tea and coffee"]'::jsonb,
  '["English","Portuguese","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  472,
  'Lisbon',
  true,
  18,
  'https://www.viator.com/tours/Lisbon/All-Inclusive-Kayak-Adventure/d538-304603P1',
  'Viator'
);
