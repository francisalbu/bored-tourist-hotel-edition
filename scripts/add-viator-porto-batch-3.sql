-- ============================================
-- Porto Batch 3: 6 Viator experiences in Porto
-- Products: 31913P1, 12546DOUROVALLEY, 48293P7, 6877P104, 8996P137, 5902P10
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Port Wine Lodges Tour Including 7 Port Wine Tastings (English) (31913P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Port Wine Lodges Tour Including 7 Port Wine Tastings (English)',
  'Experience what makes Port Wine unique and how it distinguishes from other wines. Learn how and when to consume it and to identify the differences between the different Port Wine families. (port wine is sweet, it is a dessert type of wine) Learn about its history and how the world''s oldest demarcated wine region is nowadays. Visit 3 port wine brands and try a total of 7 different Port Wines - including a visit to a traditional wine cellar learning all about Port Wine production and aging, a small producer tasting room and a visit to a modern interactive museum with a professional tasting room and workshop learning how to taste wine. By the end of this tour you should understand why Port Wines are so unique and exclusive to the Douro valley, what the different kinds of wine are, and how ...',
  'Experience what makes Port Wine unique and how it distinguishes from other wines. Learn how and when to consume it and to identify the differences between the different Port Wine families. (port wine ',
  'Address: Rua da Ribeira Negra, 4050-321 Porto, Portugal, 41.140890, -8.609970
By the pillars of the ',
  'Address: Rua da Ribeira Negra, 4050-321 Porto, Portugal, 41.140890, -8.609970
By the pillars of the old Pensil bridge, next to the D. Luis Bridge (lower level), on Porto''s side.
Look for the guide with a red jacket/t-shirt saying "Porto Walkers".',
  41.1579,
  -8.6291,
  56.0,
  'EUR',
  '3h 30min',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/20/c1/77.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/20/c1/77.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/b7/cb/ae.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/7d/0c/47.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/7d/0c/72.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/20/c1/71.jpg"]'::jsonb,
  '["Pass without stopping"]'::jsonb,
  '["Local guide (speaking in English)", "7 port wine tastings", "Wine lodge entry tickets", "All Fees and Taxes", "visit to 3 port houses", "4h Tour (all walking) - Farthest walk is 800m"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  2057,
  'Porto',
  true,
  116,
  'https://www.viator.com/en-GB/tours/Porto/Skip-the-Line-Port-Wine-Lodges-Tour-Including-7-Wine-Tastings/d26879-31913P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 2) Douro Valley Small-Group Tour with Wine Tasting, Lunch and Boat (12546DOUROVALLEY)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Douro Valley Small-Group Tour with Wine Tasting, Lunch and Boat',
  'Explore the Douro Valley on this award-winning wine tour from Porto! Renowned for its port wine, this UNESCO World Heritage region offers more than just breathtaking landscapes and terraced vineyards. Start with a visit to a family-owned winery, where you’ll taste exceptional Douro DOC wines and learn about winemaking traditions. Then, drive along the scenic N222 road, famous for its stunning river views, followed by a relaxing boat cruise (upgradeable for free to private depending on minimum participants). Enjoy a delightful three-course Portuguese lunch at a local restaurant, paired with regional wines. Vegan and gluten-free options are available upon request. In the afternoon, stop at a scenic viewpoint for memorable photos before visiting a second winery to explore port wine product...',
  'Explore the Douro Valley on this award-winning wine tour from Porto! Renowned for its port wine, this UNESCO World Heritage region offers more than just breathtaking landscapes and terraced vineyards.',
  'At the Cooltour Oporto office/store, entrance of Shopping Italia, behind Guilty Restaurant',
  'At the Cooltour Oporto office/store, entrance of Shopping Italia, behind Guilty Restaurant',
  41.1579,
  -8.6291,
  148.0,
  'EUR',
  'Full day',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/5c/7f/9b.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/5c/7f/9b.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/5c/7f/8f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/5c/7f/a4.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/5c/7f/cc.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/5c/7f/bb.jpg"]'::jsonb,
  '["First winery visit and Douro DOC wine tasting. Visit a family-owned winery to taste exceptional Dour", "Relax on a scenic boat cruise along the Douro River. Enjoy the unique perspective of the valley’s be", "Enjoy a traditional three-course Portuguese meal at a local restaurant, served with regional wines. ", "Conclude the day with an immersive visit to a second winery, where you''ll explore the process of por"]'::jsonb,
  '["Bottled water in sustainable packaging", "Drop off at two locations: Trindade Station & Bolsa Palace", "Wine and port tastings", "Professional guide", "Hotel pickup (Most centrally located Porto hotels)", "Comfortable and modern Minivan", "River Cruise (Private boat if minimum participants)", "Traditional 3-Course Lunch served with Douro wines"]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  3643,
  'Porto',
  true,
  117,
  'https://www.viator.com/en-GB/tours/Porto/Douro-Valley-Small-Group-Tour-with-Wine-Tasting-Portuguese-Lunch-and-Optional-River-Cruise/d26879-12546DOUROVALLEY?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 3) Eat Porto Like a Local: The Ultimate Full-Meal Food Tour (48293P7)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Eat Porto Like a Local: The Ultimate Full-Meal Food Tour',
  'Do Eat Better Experience Porto Food Tour is a walking food tour around the historical center of the city. You will be guided by a Local Expert who''s able to explain every detail of the restaurants, their preparations, and any other relevant curiosity. At the end of the tour you will have eaten the equivalent of a full meal in at least 4 stops and all food and drinks described are included. These tours are a mix of high-quality gastronomy as a way for showing local culture and lifestyle and a walking experience together with a local friend. This is the reason why we accept small groups only: we want to focus on a genuine exchange and give to each tourist the highest attention possible. Our food tour in Porto is a walking tour in stops, we are going to stop in at least 4 different venues ...',
  'Do Eat Better Experience Porto Food Tour is a walking food tour around the historical center of the city. You will be guided by a Local Expert who''s able to explain every detail of the restaurants, th',
  'Please, meet your Local Expert for the Do Eat Better Experience Porto Food Tour in front of the entr',
  'Please, meet your Local Expert for the Do Eat Better Experience Porto Food Tour in front of the entrance to the Chapel of Souls',
  41.1579,
  -8.6291,
  58.0,
  'EUR',
  '3h 30min',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/b6/4f/f8.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/b6/4f/f8.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/65/26/35.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/3b/08/e4.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/3b/08/ed.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/3b/08/f3.jpg"]'::jsonb,
  '["Eat Porto Like a Local: The Ultimate Full-Meal Food Tour"]'::jsonb,
  '["Water", "English-speaking Local Tour Guide", "Alcoholic beverages", "Meals"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  361,
  'Porto',
  true,
  118,
  'https://www.viator.com/en-GB/tours/Porto/Porto-Food-Tour-Full-Meal-and-Drinks/d26879-48293P7?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 4) Porto: Aveiro with cruise, Costa Nova, Capelha do Senhor da Pedra (6877P104)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Porto: Aveiro with cruise, Costa Nova, Capelha do Senhor da Pedra',
  'From Porto, we offer you the opportunity to discover two cities in the north of Portugal adored by many: • We leave Porto and after 1 hour drive, you will get to know Aveiro the "little Venice" with its canals that divide the city in two parts. We will take a guided tour admiring its architecture, discovering the old fishermen''s houses and the historical buildings of the city. • Afterwards, depending on the modality choosen, we will take a 45-minute ride aboard one of the traditional “Moliceiros” boats, similar in design to the Venetian gondolas. After this ride, we will have free time to visit the city. • Then, we will leave Aveiro and head towards Costa Nova, one of the most spectacular ️️beaches in Portugal, known for the emblematic striped houses that line the bay. • Afterwards, we ...',
  'From Porto, we offer you the opportunity to discover two cities in the north of Portugal adored by many: • We leave Porto and after 1 hour drive, you will get to know Aveiro the "little Venice" with i',
  'Meeting point at the monument to King Pedro V, in Batalha Square, in front of the São João National ',
  'Meeting point at the monument to King Pedro V, in Batalha Square, in front of the São João National Theatre.
To avoid delays, please make sure to arrive at the meeting point 15 minutes before the tour starts.
The guide cannot wait for latecomers due to the strict schedule of the itinerary.
',
  41.1579,
  -8.6291,
  54.0,
  'EUR',
  'Full day',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/2a/fb/25.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/2a/fb/25.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/2a/cd/3d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/2a/cc/8f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/2a/cc/9d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/2a/cd/c8.jpg"]'::jsonb,
  '["Once in Aveiro, we will enjoy a guided tour with our guide, who will show us all the corners of Avei", "Then, we will enjoy a ride on the traditional boat called “moliceiro”. Our local guide on board will", "After the visit and the boat ride, we will enjoy free time to enjoy the city and the gastronomy on o", "Our next stop is Costa Nova, discover the typical colorful houses and visit one of the most emblemat"]'::jsonb,
  '["Guided tour in Costa Nova", "Free time in Aveiro, Costa Nova and Gaia Coast", "Boat ride in Moliceiro (Depending on option choosen)", "Separate driver and guide", "Guided tour in Aveiro", "Travel reccomendations", "In-vehicle air conditioning", "Visit to Capelha do señor da Pedra"]'::jsonb,
  '["English", "French", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.4,
  50,
  'Porto',
  true,
  119,
  'https://www.viator.com/en-GB/tours/Porto/Excursion-to-Aveiro-and-Costa-Nova-with-moliceiro-boat-ride/d26879-6877P104?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 5) Livraria Lello Entry Ticket – Porto’s Most Iconic Bookstore  (8996P137)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Livraria Lello Entry Ticket – Porto’s Most Iconic Bookstore ',
  'Fast and Easy Access. Visit one of the most famous landmarks with a pre-booked entry ticket and start exploring right away. Your ticket will be sent to you by email 24 hours before your visit — please remember to check your inbox and spam folder. Use the Full Value Toward a Book Purchase. Redeem your entire ticket value in-store. Step Into One of the World’s Most Iconic Bookstores. Neo-Gothic design, stained-glass skylights, and the famous crimson staircase. Explore a Cultural and Architectural Gem in Porto. More than a bookstore—it''s a literary landmark. PLEASE NOTE: IT IS NOT POSSIBLE TO SKIP OR BYPASS SECURITY CHECKS AT THE ENTRANCE. DURING THE HIGH SEASON, WAITING TIMES FOR SECURITY MAY TAKE UP TO ONE HOUR.',
  'Fast and Easy Access. Visit one of the most famous landmarks with a pre-booked entry ticket and start exploring right away. Your ticket will be sent to you by email 24 hours before your visit — please',
  'Porto',
  '',
  41.1579,
  -8.6291,
  23.9,
  'EUR',
  '1h 30min',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/06/55/03.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/06/55/03.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/6b/43.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/6b/45.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/6b/38.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/6b/34.jpg"]'::jsonb,
  '["Livraria Lello Entry Ticket – Porto’s Most Iconic Bookstore "]'::jsonb,
  '["The Supplier emails Entry Tickets 24h before reservation date.", "Due to high demand, your selected time slot may be adjusted by up to ± 1-2 hours", "Please check your Official Livraria Lello Bookstore Ticket from the Supplier in your Mails and Spam", "Gold Entry ticket to Livraria Lello (for selected date and time)", "€15.95 bookstore credit (redeemable on any book)"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  3.4,
  11,
  'Porto',
  true,
  120,
  'https://www.viator.com/en-GB/tours/Porto/Livraria-Lello-Entry-Ticket-Portos-Most-Iconic-Bookstore/d26879-8996P137?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 6) 3-Hour Porto Highlights on a Electric Bike Guided Tour (5902P10)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  '3-Hour Porto Highlights on a Electric Bike Guided Tour',
  'The Bestseller experience on an Electric Bike! All bikes in this tour are powered by an electric motor, you will be able to stroll with ease through all the highlights of the city. Discover a charming city perched over the river, composed by old houses that huddle together from the river quay until the sea. See the old palaces, the churches, the emblematic neighborhoods as well as the people that bring life into the city that was recognized by UNESCO as a World Heritage Site. This is perfect for those who enjoy bike riding and culture. Combining both in an exhilarating experience through Porto’s hills and cobblestone streets. Choose between the morning and afternoon schedule and make sure everyone has a minimum height of 4.3 feet. Let''s GO! HIGHLIGHTS: * Cordoaria Garden * Clérigos Towe...',
  'The Bestseller experience on an Electric Bike! All bikes in this tour are powered by an electric motor, you will be able to stroll with ease through all the highlights of the city. Discover a charming',
  'Porto',
  '',
  41.1579,
  -8.6291,
  44.0,
  'EUR',
  '3h',
  NULL,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0b/37/ec.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0b/37/ec.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0b/38/0c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0b/38/74.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0b/38/bd.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0b/38/76.jpg"]'::jsonb,
  '["One of the best views of the city of porto", "The bridge was built in 1886 by the Belgian engineer Théiohile Seyrig, and connects the cities of Po", "Ribeira is one of the oldest and typical places of the city. Located along the Douro River, it is pa", "Miragaia is a must-see neighborhood close to the Ribeira in Porto, full of picturesque traditional b", "Considered one of the ex-libris of Porto, the Church and Tower of Clérigos (18th century) are a rema"]'::jsonb,
  '["Electric Bike Tour of 3-Hours with live comentary.", "General briefing is given before the activity.", "Company Liability Insurance and Personal Injury Insurance", "Each Tour is accompanied by one of our Storytellers."]'::jsonb,
  '["Dutch", "English", "French", "German", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  4420,
  'Porto',
  true,
  121,
  'https://www.viator.com/en-GB/tours/Porto/Porto-Highlights-E-Bike-Tour/d26879-5902P10?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

