-- ============================================
-- Batch 7: Add 5 Viator experiences to Supabase
-- Products: 114041P9, 63327P5, 100456P2, 451173P2, 18875P1
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Setúbal Wine Tour with Visit and Tasting at 2 Wineries (114041P9)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Setúbal Wine Tour: Visit & Tasting at 2 Wineries',
  'Escape the city and head south to the Setúbal wine region, one of Portugal''s most celebrated wine territories. This immersive full-day tour takes you to two distinct wineries where you''ll taste between 6 and 7 wines, including the legendary Moscatel Roxo de Setúbal — a rare dessert wine with centuries of tradition. Learn about the winemaking process first-hand, from vine to bottle, as passionate producers guide you through their estates and cellars. Between tastings, enjoy a traditional Portuguese lunch paired with regional delicacies. Drive through the dramatic landscape of the Arrábida Natural Park, with its Mediterranean forests tumbling down to turquoise Atlantic waters. Your expert guide shares stories of Setúbal''s maritime and viticultural heritage, making every glass richer with context. Whether you''re a wine connoisseur or a curious beginner, this is the perfect introduction to Portugal''s southern wine country.',
  'A full-day wine tour visiting 2 Setúbal wineries — taste 6–7 wines including the rare Moscatel Roxo, enjoy a traditional lunch and drive through Arrábida Natural Park.',
  'Setúbal & Arrábida',
  'Central Lisbon (pickup included)',
  38.5244,
  -8.8882,
  95,
  'EUR',
  'Full day',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0e/e9/5e/99.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0e/e9/5e/99.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/07/b1/79/18.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/07/6b/07/07.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/07/ad/b0/e3.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/20/67/42.jpg"]'::jsonb,
  '["Visit 2 distinct wineries in the Setúbal wine region","Taste 6–7 wines including the rare Moscatel Roxo de Setúbal","Learn about winemaking from vine to bottle with passionate producers","Enjoy a traditional Portuguese lunch paired with regional wines","Drive through the stunning Arrábida Natural Park","Expert guide sharing Setúbal''s maritime and wine heritage","Suitable for wine connoisseurs and curious beginners alike"]'::jsonb,
  '["Visits and tastings at 2 wineries (6–7 wines)","Traditional Portuguese lunch","Expert guide / information guide","Transport from central Lisbon","Moscatel Roxo de Setúbal tasting"]'::jsonb,
  '["Portuguese","English","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.5,
  149,
  'Lisbon',
  true,
  34,
  'https://www.viator.com/en-GB/tours/Lisbon/Setubal-Wine-Tour-with-Visit-and-Tasting-at-2-Wineries/d538-114041P9',
  'Viator'
);

-- 2) Kayak and Snorkeling Adventure in Lisbon (63327P5)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Kayak & Snorkel Adventure in Arrábida from Lisbon',
  'This is the off-the-beaten-path adventure everyone is searching for. Leave Lisbon behind and spend a day exploring the breathtaking Arrábida Natural Park by kayak and snorkel — a perfect blend of fun, history, adventure and food all rolled into one unforgettable experience. Meet at the Lisbon Zoo at 10AM for pickup, then head to the park''s crystal-clear waters. Paddle along dramatic limestone cliffs, discover hidden caves and grottoes, and dive into the Atlantic for snorkeling among colourful marine life. Your experienced guides share stories about the area''s rich history and ecology, pointing out secret spots only locals know. After working up an appetite on the water, refuel with a relaxed beachside break. You''ll come back with a gorgeous tan, new friends made along the way, and memories of one of Portugal''s most spectacular natural parks. All equipment — kayaks, wetsuits and water shoes — is provided.',
  'An off-the-beaten-path kayak and snorkeling adventure in Arrábida Natural Park — paddle along dramatic cliffs, explore hidden caves and snorkel in crystal-clear waters.',
  'Arrábida Natural Park',
  'Main entrance of the Lisbon Zoo (pickup at 10AM)',
  38.4759,
  -8.9863,
  45,
  'EUR',
  'Full day',
  NULL,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/13/d9/68/d7.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/13/d9/68/d7.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0b/f1/2e/5b.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/13/d9/68/d9.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0b/f1/2d/e0.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0b/f1/2d/d4.jpg"]'::jsonb,
  '["Explore Arrábida Natural Park by kayak and snorkel","Paddle along dramatic limestone cliffs and hidden caves","Snorkel in crystal-clear Atlantic waters with marine life","Pickup included from the Lisbon Zoo","All equipment provided: kayaks, wetsuits and water shoes","Experienced local guides sharing history and ecology","The perfect off-the-beaten-path day trip from Lisbon"]'::jsonb,
  '["Kayaks, wetsuits and water shoes","Experienced local guides","Pickup and transport from Lisbon Zoo","Snorkeling equipment"]'::jsonb,
  '["Portuguese","English","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  146,
  'Lisbon',
  true,
  35,
  'https://www.viator.com/en-GB/tours/Lisbon/Kayak-and-Snorkeling-Adventure-in-Lisbon/d538-63327P5',
  'Viator'
);

-- 3) Kayak Adventure in Sesimbra — All-Inclusive Day Trip (100456P2)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'All-Inclusive Kayak Adventure in Sesimbra & Arrábida',
  'Escape the city and dive into one of Portugal''s most breathtaking landscapes with this all-inclusive kayak adventure in Sesimbra, inside the stunning Arrábida Natural Park. Start with a convenient pickup from Lisbon (Time Out Market) or meet directly in Sesimbra. Paddle stable double kayaks along dramatic limestone cliffs, discover hidden caves and secret grottoes, and enjoy crystal-clear Atlantic waters that rival the Mediterranean. Land at the spectacular Ribeiro do Cavalo Beach — regularly voted one of Europe''s most beautiful — to relax on a cozy beach blanket and savor a homemade picnic with fresh baguette sandwiches, fruit, local sweets and water. After a refreshing break, paddle back with the help of the ocean breeze. Your expert local guides share stories, tips and the region''s best-kept secrets throughout the journey. Suitable for all levels and requiring no prior kayaking experience, this is the perfect mix of nature, adventure and authentic Portuguese flavours — an unforgettable day trip from Lisbon.',
  'An all-inclusive kayak adventure along Arrábida''s dramatic cliffs — paddle to secret caves, relax at Ribeiro do Cavalo Beach with a homemade picnic and enjoy crystal-clear waters.',
  'Sesimbra & Arrábida Natural Park',
  'Time Out Market, Lisbon (pickup) or Sesimbra',
  38.4437,
  -9.1041,
  369,
  'EUR',
  'Full day',
  NULL,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/10/6c/ea/08.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/10/6c/ea/08.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/10/6c/ea/02.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/10/6c/ea/0c.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/07/81/f7/6e.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/07/81/f7/7b.jpg"]'::jsonb,
  '["All-inclusive experience with homemade picnic on the beach","Paddle double kayaks along dramatic limestone cliffs","Discover hidden caves and secret grottoes in Arrábida","Relax at Ribeiro do Cavalo Beach — one of Europe''s most beautiful","Pickup from Lisbon''s Time Out Market included","No experience needed — suitable for all levels","Expert local guides sharing stories and the region''s secrets"]'::jsonb,
  '["Professional local guide","Kayak equipment (lifevest, paddle, seat, drybag)","Beach blanket for relaxing","Homemade picnic (baguette sandwiches, fruit, sweets, water)","Pickup and transport from Time Out Market, Lisbon"]'::jsonb,
  '["Portuguese","English"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  145,
  'Lisbon',
  true,
  36,
  'https://www.viator.com/en-GB/tours/Sesimbra/Kayak-Adventure-in-Sesimbra/d50533-100456P2',
  'Viator'
);

-- 4) Portuguese Cooking Class in Lisbon (451173P2)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Portuguese Cooking Class: 3-Course Meal with Local Chef',
  'Discover the heart of Portuguese cuisine under the guidance of a local professional chef in this hands-on cooking class near Alvalade station. You''ll learn traditional cooking techniques passed down through generations as you prepare a complete 3-course Portuguese meal from scratch. Work alongside a small, international group of classmates from around the world — sharing laughter, wine and local snacks throughout the cooking lesson. Your enthusiastic chef walks you through every step, from selecting ingredients to plating your masterpiece. Vegetarians are very welcome, and dietary restrictions can be accommodated with advance notice. To cap off the experience, sit down to enjoy the menu you''ve prepared, paired with excellent Portuguese wines. It''s more than a cooking class — it''s a cultural immersion into Portugal''s rich culinary traditions, and you''ll leave with recipes and skills to recreate the magic at home.',
  'A hands-on cooking class with a local chef — prepare a 3-course Portuguese meal, share laughs with an international group and enjoy your creation paired with Portuguese wines.',
  'Alvalade, Lisbon',
  'Near Alvalade station, Lisbon',
  38.7544,
  -9.1467,
  125,
  'EUR',
  '3h 30min',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/12/43/8b/a7.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/12/43/8b/a7.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/13/2d/90/b0.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/13/2d/91/04.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/13/2d/91/03.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/13/2d/91/0e.jpg"]'::jsonb,
  '["Hands-on cooking class guided by a local professional chef","Prepare a complete 3-course Portuguese meal from scratch","Small international group — share laughter and local snacks","Enjoy your creation paired with excellent Portuguese wines","Vegetarian-friendly with dietary accommodations available","Learn traditional techniques passed down through generations","Take home recipes and skills to recreate Portuguese dishes"]'::jsonb,
  '["Local professional chef instructor","All ingredients and cooking equipment","3-course meal you prepare and enjoy","Portuguese wines to pair with your meal","Snacks and drinks during the cooking session","Recipes to take home"]'::jsonb,
  '["Portuguese","English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  142,
  'Lisbon',
  true,
  37,
  'https://www.viator.com/en-GB/tours/Lisbon/Portuguese-Cooking-Class-in-Lisbon/d538-451173P2',
  'Viator'
);

-- 5) Portuguese Cooking Experience in Lisbon (18875P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Portuguese Cooking Experience: Fish, Meat & Dessert with Drinks',
  'Relieve your senses in this immersive 3.5-hour hands-on cooking experience in the heart of Lisbon. Working side by side with a professional Portuguese chef, you''ll prepare a complete 3-course menu featuring fish, meat and dessert — three pillars of Portuguese gastronomy. Learn essential cooking techniques as well as how to select, prepare and combine ingredients the Portuguese way. Throughout the class, taste wines and olive oils, discovering the subtle flavours that define this cuisine. Once your masterpiece is ready, sit down to feast on the meal you''ve made alongside your classmates, sharing stories and newly acquired cooking wisdom. Everything is included: the meal itself, drinks (wines, water, juice, beer, coffee), mandatory insurance and — as a special touch — you''ll receive all the recipes in PDF after the experience, so the flavours of Portugal travel home with you.',
  'A 3.5-hour hands-on cooking class in Lisbon — prepare a 3-course menu of fish, meat and dessert with a Portuguese chef. All drinks, recipes and insurance included.',
  'Lisbon',
  'Central Lisbon',
  38.7223,
  -9.1393,
  100,
  'EUR',
  '3h 30min',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/c0/2c/fd.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/c0/2c/fd.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/c0/2c/d7.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/c0/2c/e2.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/c0/2c/f0.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/c0/2d/4b.jpg"]'::jsonb,
  '["3.5-hour hands-on cooking class with a professional Portuguese chef","Prepare a full 3-course menu: fish, meat and dessert","All drinks included: wines, water, juice, beer and coffee","Taste wines and olive oils throughout the class","Receive all recipes in PDF after the experience","Mandatory insurance included for peace of mind","Mingle with classmates and share your culinary creations"]'::jsonb,
  '["Professional Portuguese chef instructor","Complete meal (3-course menu you prepare)","All drinks (wines, water, juice, beer, coke, coffee)","Mandatory insurance","Recipes sent after the experience in PDF"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  140,
  'Lisbon',
  true,
  38,
  'https://www.viator.com/en-GB/tours/Lisbon/Portuguese-Cooking-Experience-in-Lisbon/d538-18875P1',
  'Viator'
);
