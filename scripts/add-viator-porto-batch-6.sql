-- ============================================
-- Porto Batch 6: 8 Viator experiences in Porto
-- Products: 57617P1, 18121P3, 66671P1, 102838P1, 203526P17, 131810P2, 7378P2, 124583P2
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Private Tour: Viana do Castelo, Ponte de Lima and Braga from Porto (57617P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Private Tour: Viana do Castelo, Ponte de Lima and Braga from Porto',
  'Visit Vila do Conde, Viana do Castelo, Ponte de Lima and Braga. From Porto, always traveling by the sea, we will visit all these cities with stops in the most emblematic monuments of each city, in the most beautiful beaches, and to taste the local sweets. Lots of surprises along the way, visit small fisherman villages and taste local gastronomy. We will visit Viana do Castelo the jewel of Minho and Ponte de Lima the oldest village in Portugal. Braga is the 3rd largest city in Portugal with over 2000 years of history. Visit the Bom Jesus Unesco Heritage site. Travel in a Mercedes-class V250 Avantgarde van with 8 seats, with tinted windows, leather seats, air conditioning, refrigerator and wi-fi. For cruises we can change the itinerary started early and finish at the time you need to be o...',
  'Visit Vila do Conde, Viana do Castelo, Ponte de Lima and Braga. From Porto, always traveling by the sea, we will visit all these cities with stops in the most emblematic monuments of each city, in the',
  'Porto',
  '',
  41.1579,
  -8.6291,
  150.0,
  'EUR',
  'Full day',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/71/a2/3d.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/71/a2/3d.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/71/a2/3e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/ee/c9/64.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/ee/c9/81.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/ee/c9/85.jpg"]'::jsonb,
  '["Visit the replica of the ship that was used to discover Brazil in 1500", "Ponte de Lima, the oldest village in Portugal with 900 years of history. In its streets by the river", "In Braga we will walk through the historic center of this city with over 2000 years of history an vi", "visit to the Sanctuary of Bom Jesus, a UNESCO Heritage Site, and its gardens."]'::jsonb,
  '["Local guide", "Hotel pickup and drop-off", "Private tour", "Bottled water", "Snacks", "Driver/guide", "Surcharges on fuel"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  13,
  'Porto',
  true,
  134,
  'https://www.viator.com/en-GB/tours/Porto/Private-Tour-Viana-do-Castelo-from-Porto/d26879-57617P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 2) Craft Beer & Food Tour in Porto by Taste Porto (since 2013) (18121P3)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Craft Beer & Food Tour in Porto by Taste Porto (since 2013)',
  'Porto is more than just that heavenly nectar we call port wine; it''s a city fueled by a profound passion for beer. Join us on our Portuguese Craft Beer & Food Tour and allow us to quench both your thirst and hunger as we stroll through the charming streets of Porto. Rest assured, this tour is far from a pub crawl! Indulge in 7 beer tastings paired with a selection of Porto’s favorite foods, including the world-famous francesinha, as you explore the city’s four hottest craft beer spots with exclusive brewery access. Step behind the scenes and uncover sacred brewing techniques passed down through generations, with exclusive access to a working brewery and the city’s first craft beer bar, the second of its kind in Portugal. After more than a decade in business, we’re honored to be recogniz...',
  'Porto is more than just that heavenly nectar we call port wine; it''s a city fueled by a profound passion for beer. Join us on our Portuguese Craft Beer & Food Tour and allow us to quench both your thi',
  'We''ll meet at Armazém da Cerveja, the "Beer Warehouse" of Porto.',
  'We''ll meet at Armazém da Cerveja, the "Beer Warehouse" of Porto.',
  41.1579,
  -8.6291,
  75.0,
  'EUR',
  '3h',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/f1/57.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/f1/57.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/f4/93.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/f4/8e.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/f4/90.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0f/f4/8f.jpg"]'::jsonb,
  '["Welcome to the \"Beer Warehouse\" of Porto. Local beer lovers flock to this out-of-the-way spot to tas", "We bet you weren''t expecting to visit the fresh produce market on a craft beer tour, but this is the", "No tour is complete without a visit to the craft pioneers of the city. Join us at the very first cra"]'::jsonb,
  '["Meals", "Snacks", "Alcoholic beverages"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  1733,
  'Porto',
  true,
  135,
  'https://www.viator.com/en-GB/tours/Porto/Craft-Beer-and-Food-Tour/d26879-18121P3?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 3) Port Wine Cocktails Workshop at Espaço Porto Cruz, Vila Nova de Gaia, Portugal (66671P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Port Wine Cocktails Workshop at Espaço Porto Cruz, Vila Nova de Gaia, Portugal',
  'Learn how to make delicious cocktails with Port wine at this 1-hour workshop at the Espaço Porto Cruz. Discover the history of Port wine and the winemaking process with a sommelier. Sample two Ports wines, white and pink and then use them to create the Caipiporto and Spicy pink cocktails. Enjoy them at the terrace lounge overlooking the Douro River. Join us!!!',
  'Learn how to make delicious cocktails with Port wine at this 1-hour workshop at the Espaço Porto Cruz. Discover the history of Port wine and the winemaking process with a sommelier. Sample two Ports w',
  'Porto',
  '',
  41.1579,
  -8.6291,
  25.0,
  'EUR',
  '1h',
  NULL,
  'Learn & Create',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/73/34/a3.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/73/34/a3.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/73/34/a4.jpg"]'::jsonb,
  '["Port Wine Cocktails Workshop at Espaço Porto Cruz, Vila Nova de Gaia, Portugal"]'::jsonb,
  '["Sommelier instructor", "Wine tasting", "Port wine cocktails workshop"]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  3.7,
  13,
  'Porto',
  true,
  136,
  'https://www.viator.com/en-GB/tours/Porto/Port-Wine-Cocktails-Workshop-at-Espaco-Porto-Cruz/d26879-66671P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 4) Porto 1/2 Day Walking Photo Tour & Portraits (102838P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Porto 1/2 Day Walking Photo Tour & Portraits',
  'Explore Porto’s historic center on foot, discovering hidden, colorful streets, stunning viewpoints, and iconic hand-painted tiles. Learn the city''s rich history from your local photographer guide while capturing incredible photos. After the tour, receive at least 25 professionally edited photos of yourself at the best locations—your own Porto Photo Story to remember this one-of-a-kind experience.',
  'Explore Porto’s historic center on foot, discovering hidden, colorful streets, stunning viewpoints, and iconic hand-painted tiles. Learn the city''s rich history from your local photographer guide whil',
  'At Clérigos Tower''s door. I''ll be there waiting for you with a black cap with "Pictury Photo Tours" ',
  'At Clérigos Tower''s door. I''ll be there waiting for you with a black cap with "Pictury Photo Tours" logo and a black backpack. So it will be very easy to recognize me.',
  41.1579,
  -8.6291,
  120.0,
  'EUR',
  '3h',
  NULL,
  'Learn & Create',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/6e/2f.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/6e/2f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/65/ec/2f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/c5/5f/43.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/6f/1c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/6e/70.jpg"]'::jsonb,
  '["Stunning views to Douro''s river and Porto''s historic center", "Most charming historic neighborhood, perfect to photograph and be photographed", "The oldest and most historic in the city, with fantastic views over the city and the river, colorful", "One of the most stunning viewpoints to Porto''s historic center", "Lovely and colorful little square in the heart of Porto''s historic center"]'::jsonb,
  '["Even if you can''t find the date you''re interested in, contact me and we can try to find a solution.", "Possibility of organizing a tailor-made experience (e.g. bachelorette party, wedding proposal, etc.)", "Possibility of a Private Experience-Minimum 2 people (must contact me first to see if it''s possible)", "25 edited photos of the guests along the photo tour sent 3 days later"]'::jsonb,
  '["English", "French", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  163,
  'Porto',
  true,
  137,
  'https://www.viator.com/en-GB/tours/Porto/Half-Day-Porto-Photo-Tour/d26879-102838P1?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 5) Beyond the Barrel: From Decadent to Down-home in the Heart of Porto (203526P17)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Beyond the Barrel: From Decadent to Down-home in the Heart of Porto',
  'Porto is a picture-perfect city, its beauty easily captured in a single frame — monumental churches dressed in blue tiles line a steep street opening up onto a view over the Douro River to Vila Nova de Gaia on the other side of the river, where the city’s famed Port wine lodges and their iconic billboards dot the hill. Dig deeper into the backstreets and we find the complexities of city life and the culinary diversity that comes with it. On this full-day food tour, with at least ten tasting stops, we’ll start with the city’s favorite pastry, the éclair, and strong coffee before visiting a 3rd generation chocolate-maker. We’ll stop into a tavern for a quick petisco of smoked meat and whatever’s fresh and then visit a traditional cheese shop for a tasting. We’ll sample one of Porto’s fame...',
  'Porto is a picture-perfect city, its beauty easily captured in a single frame — monumental churches dressed in blue tiles line a steep street opening up onto a view over the Douro River to Vila Nova d',
  'The meeting point is at the entrance of the gardens of Palácio de Cristal – meeting by the main gate',
  'The meeting point is at the entrance of the gardens of Palácio de Cristal – meeting by the main gate - R. de D. Manuel II, 4050-346 Porto.',
  41.1579,
  -8.6291,
  150.0,
  'EUR',
  '5h 30min',
  NULL,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/08/01/7c.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/08/01/7c.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/08/01/77.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/08/01/7a.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/08/01/7b.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/08/01/80.jpg"]'::jsonb,
  '["A magnificent viewpoint to enjoy the city and it’s geography, where we can taste a traditional savor", "Nearby we will enjoy one the best sandwiches of the city, a Porto speciality, with the friendliest s", "Cheese, wine and small plates in a square full of delicious food.", "Here we will take in the amazing views as we reflect on the amazing food we had during the tour", "Nearby we will enjoy dessert in a very special bakery."]'::jsonb,
  '["Alcoholic beverages", "Lunch", "Snacks", "Breakfast", "Tea and coffee"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  246,
  'Porto',
  true,
  138,
  'https://www.viator.com/en-GB/tours/Porto/Beyond-the-Barrel-From-Decadent-to-Down-home-in-the-Heart-of-Porto/d26879-203526P17?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 6) From Porto with view to Gaia: Private Bike Tour #DuckSideOfPorto (131810P2)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'From Porto with view to Gaia: Private Bike Tour #DuckSideOfPorto',
  'Porto and Gaia share an incredible relationship with the Douro river in between and the Dom Luis I bridge connecting them, it''s pretty easy to discover these two beauties. If you are looking for a unique way to explore these two picturesque cities, I have what you are looking for! Join me on a private bike tour that will take you to see the best of Porto and the beauty of Gaia. Ride through the streets of Porto admiring its highlights and beautiful buildings. Cross the Douro river and enjoy the view! Explore the local streets of Gaia and catch a glimpse of the traditional daily life. On this unique ride, you''ll be able to reach secret streets and spots only known by the locals. This experience can be done on a mountain bike tour or on the mountain if you''re feeling adventurous. Let me k...',
  'Porto and Gaia share an incredible relationship with the Douro river in between and the Dom Luis I bridge connecting them, it''s pretty easy to discover these two beauties. If you are looking for a uni',
  'TT3Ways ',
  'TT3Ways ',
  41.1579,
  -8.6291,
  47.15,
  'EUR',
  '3h',
  NULL,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/37/df/df.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/37/df/df.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/37/de/d6.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/37/da/e9.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/37/da/ea.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/37/da/eb.jpg"]'::jsonb,
  '["From Porto with view to Gaia: Private Bike Tour #DuckSideOfPorto"]'::jsonb,
  '["Carbonated beverages", "Private guide", "Bicycle use"]'::jsonb,
  '["English", "Portuguese"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  124,
  'Porto',
  true,
  139,
  'https://www.viator.com/en-GB/tours/Porto/From-Porto-to-Gaia-Private-Bike-Tour/d26879-131810P2?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 7) Private Douro 4x4 Adventure from Porto with Deluxe Pic nic (7378P2)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Private Douro 4x4 Adventure from Porto with Deluxe Pic nic',
  'Venture away from the bustling city and spend a day exploring the peaceful, evergreen Douro Valley. Discover Portugal’s renowned vintners as you rumble along dirt roads in a capable 4x4, sample a glass of the area’s famous port and indulge in a tasty picnic lunch.',
  'Venture away from the bustling city and spend a day exploring the peaceful, evergreen Douro Valley. Discover Portugal’s renowned vintners as you rumble along dirt roads in a capable 4x4, sample a glas',
  'Porto',
  '',
  41.1579,
  -8.6291,
  170.0,
  'EUR',
  'Full day',
  NULL,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/38/18/a9.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/38/18/a9.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/06/d6.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/75/42/5a.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/47/da/f2.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d8/06/d1.jpg"]'::jsonb,
  '["Pick up anywhere in central Porto.", "Spot for Picnic!", "Church of São Gonçalo, Tamega River , traditional local sweets made once by the monks."]'::jsonb,
  '["Hotel pickup and drop-off", "Local guide", "Winery Visit", "Wine tasting", "Lunch", "Port pickup and drop-off"]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  142,
  'Porto',
  true,
  140,
  'https://www.viator.com/en-GB/tours/Porto/Douro-4x4-Offtrack-Adventure-from-Porto/d26879-7378P2?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

-- 8) Pinhão Hiking Tour (124583P2)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Pinhão Hiking Tour',
  'Discover the beauty of the Douro Valley on a scenic hike through the amazing hills of Pinhão, with a total elevation gain of 370 meters. Enjoy the tranquility of nature while taking in panoramic views of the Douro Valley and river. This walk leads us to a stunning viewpoint where you can see wave after wave of mountains beyond the wide expanse of the Douro. It’s a magnificent tour that perfectly shows what the Douro Valley means : the river, villages, wine estates and vineyards. Learn about the region’s history, flora, and fauna as you traverse the scenic trail. At the end, we celebrate this region by having a picnic lunch with wine at a Wine Estate (or Traditional homemade picnic) Tour highlights: - Private experience; - knowledgeable guide; - Typical Picnic with wine; - Local insights...',
  'Discover the beauty of the Douro Valley on a scenic hike through the amazing hills of Pinhão, with a total elevation gain of 370 meters. Enjoy the tranquility of nature while taking in panoramic views',
  'Take national road 222, towards Pinhão. Look for the Train Station. We will be here.',
  'Take national road 222, towards Pinhão. Look for the Train Station. We will be here.',
  41.1579,
  -8.6291,
  320.0,
  'EUR',
  '5h',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/4d/c3/fe.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/4d/c3/fe.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/4d/c3/e7.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/12/6a/4f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/4d/c3/6f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/4d/c3/36.jpg"]'::jsonb,
  '["This walking tour allows us to look at the rich part of the Douro Valley from the famous viewpoint.", "Stunning viewpoint of Douro Valley.", "Typical picnic with wine"]'::jsonb,
  '["Alcoholic beverages", "Lunch", "Responsible tourism, sustainable experience", "Private local hiking guide"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  18,
  'Porto',
  true,
  141,
  'https://www.viator.com/en-GB/tours/Porto/Pinhao-private-hike/d26879-124583P2?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);

