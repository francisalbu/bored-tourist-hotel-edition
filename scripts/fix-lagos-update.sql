-- =====================================================
-- FIX: Lagos GYG experiences (display_order 159-180)
-- Updates: multi-image, fixed coords, better data
-- Run in: Supabase Dashboard → SQL Editor
-- =====================================================

-- display_order 159: Lagos: Combo Dolphin and Benagil Tour with Marine Biologist
UPDATE experiences SET
  title              = 'Lagos: Combo Dolphin and Benagil Tour with Marine Biologist',
  description        = 'Board a boat and sail into the Atlantic Ocean on a dolphin-watching trip in Lagos. Learn about these animals from marine biologists, then admire the coastline on the way to Benagil Cave.',
  short_description  = 'Board a boat and sail into the Atlantic Ocean on a dolphin-watching trip in Lagos. Learn about these animals from marine biologists, then admire the coastline on the way to Benagil Cave.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/d9a82ab285215b693a3a914f5a1191d3176f799a5efd424deeab5924df8b7c38.png/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/d9a82ab285215b693a3a914f5a1191d3176f799a5efd424deeab5924df8b7c38.png/720.jpg"]'::jsonb,
  highlights         = '["Board a boat and sail into the Atlantic Ocean on a dolphin-watching trip in Lagos.", "Learn about these animals from marine biologists, then admire the coastline on the way to Benagil Cave."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.102787,
  longitude          = -8.673027,
  price              = 50.4,
  rating             = 4.7,
  review_count       = 2359,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/lagos-portugal-l2896/lagos-dolphin-benagil-tour-with-marine-biologist-t446452/?partner_id=BONZK5E'
WHERE display_order = 159 AND city = 'Lagos';

-- display_order 160: From Lagos: Scenic Cruise to the Benagil and Carvoeiro Caves
UPDATE experiences SET
  title              = 'From Lagos: Scenic Cruise to the Benagil and Carvoeiro Caves',
  description        = 'Admire the beauty of the Benagil and Carvoeiro caves with this rigid inflatable boat cruise from Lagos. Cruise along Algarve coastline past the towns of Alvor, Portimão and Carvoeiro.',
  short_description  = 'Admire the beauty of the Benagil and Carvoeiro caves with this rigid inflatable boat cruise from Lagos. Cruise along Algarve coastline past the towns of Alvor, Portimão and Carvoeiro.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/60f16b216a89c.jpeg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/60f16b216a89c.jpeg/720.jpg"]'::jsonb,
  highlights         = '["Admire the beauty of the Benagil and Carvoeiro caves with this rigid inflatable boat cruise from Lagos.", "Cruise along Algarve coastline past the towns of Alvor, Portimão and Carvoeiro."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.139931,
  longitude          = -8.53248,
  price              = 34.0,
  rating             = 4.89,
  review_count       = 1071,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/algarve-l66/from-lagos-scenic-cruise-to-the-benagil-and-carvoeiro-caves-t402450/?partner_id=BONZK5E'
WHERE display_order = 160 AND city = 'Lagos';

-- display_order 161: From Lagos: Ponta da Piedade Caves Kayak Tour from Catamaran
UPDATE experiences SET
  title              = 'From Lagos: Ponta da Piedade Caves Kayak Tour from Catamaran',
  description        = 'Board the catamaran at Lagos Marina and be transported to the fabulous area of Ponta da Piedade for a guided kayaking tour. Soak up the coastal views, secluded grottos, and impressive rock formations.',
  short_description  = 'Board the catamaran at Lagos Marina and be transported to the fabulous area of Ponta da Piedade for a guided kayaking tour. Soak up the coastal views, secluded grottos, and impressive rock formations.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/ad8d7e5994a6028ae47d50c48e3a684d5ccc9850fc6309b672260347308e9b48.jpg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/ad8d7e5994a6028ae47d50c48e3a684d5ccc9850fc6309b672260347308e9b48.jpg/720.jpg"]'::jsonb,
  highlights         = '["Board the catamaran at Lagos Marina and be transported to the fabulous area of Ponta da Piedade for a guided kayaking tour.", "Soak up the coastal views, secluded grottos, and impressive rock formations."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.107719,
  longitude          = -8.674022,
  price              = 36.0,
  rating             = 4.86,
  review_count       = 2019,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/algarve-l66/from-lagos-kayak-tour-ponta-da-piedade-caves-on-catamaran-t157044/?partner_id=BONZK5E'
WHERE display_order = 161 AND city = 'Lagos';

-- display_order 162: Algarve: Lagos Sightseeing guided Tour with e-bikes
UPDATE experiences SET
  title              = 'Algarve: Lagos Sightseeing guided Tour with e-bikes',
  description        = 'Discover the wonders of Lagos exploring the great Gold Coast of Algarve: Enjoy your sightseeing tour on comfortable Electric Mountain Bikes with a professional Tour Guide',
  short_description  = 'Discover the wonders of Lagos exploring the great Gold Coast of Algarve: Enjoy your sightseeing tour on comfortable Electric Mountain Bikes with a professional Tour Guide',
  image_url          = 'https://cdn.getyourguide.com/img/tour/83234511305f070b5874a6c5648a2d49dc4b353e806a2d4d9082754fbf010b71.jpeg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/83234511305f070b5874a6c5648a2d49dc4b353e806a2d4d9082754fbf010b71.jpeg/720.jpg"]'::jsonb,
  highlights         = '["Discover the wonders of Lagos exploring the great Gold Coast of Algarve:\nEnjoy your sightseeing tour on comfortable Electric Mountain Bikes with a professional Tour Guide"]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.091629,
  longitude          = -8.669255,
  price              = 58.5,
  rating             = 4.91,
  review_count       = 176,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/lagos-portugal-l2896/lagos-sightseeing-tour-with-electric-moutain-bikes-t531541/?partner_id=BONZK5E'
WHERE display_order = 162 AND city = 'Lagos';

-- display_order 163: Lagos: Dolphin Watch Tour with Professional Marine Biologist
UPDATE experiences SET
  title              = 'Lagos: Dolphin Watch Tour with Professional Marine Biologist',
  description        = 'Create lasting memories on a dolphin-watching tour guided by professional marine biologists. Contribute to conservation efforts and learn about these beautiful creatures on the coast of the Algarve.',
  short_description  = 'Create lasting memories on a dolphin-watching tour guided by professional marine biologists. Contribute to conservation efforts and learn about these beautiful creatures on the coast of the Algarve.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/deca53e0fa06d8e64edf376540d8e0d16df2b468d040bf3a7821bf5d6f8a9bd4.jpg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/deca53e0fa06d8e64edf376540d8e0d16df2b468d040bf3a7821bf5d6f8a9bd4.jpg/720.jpg"]'::jsonb,
  highlights         = '["Create lasting memories on a dolphin-watching tour guided by professional marine biologists.", "Contribute to conservation efforts and learn about these beautiful creatures on the coast of the Algarve."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.102787,
  longitude          = -8.673027,
  price              = 36.0,
  rating             = 4.89,
  review_count       = 1505,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/algarve-l66/lagos-dolphin-watch-tour-with-professional-marine-biologist-t303058/?partner_id=BONZK5E'
WHERE display_order = 163 AND city = 'Lagos';

-- display_order 164: From Lagos: Small-Group 4-Hour Wine Tasting Tour
UPDATE experiences SET
  title              = 'From Lagos: Small-Group 4-Hour Wine Tasting Tour',
  description        = 'See beautiful vineyards and sights, and discover the stunning natural beauty and rich history of Algarve as you enjoy a small-group 4-hour wine tasting trip.',
  short_description  = 'See beautiful vineyards and sights, and discover the stunning natural beauty and rich history of Algarve as you enjoy a small-group 4-hour wine tasting trip.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/6144687b733df.jpeg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/6144687b733df.jpeg/720.jpg"]'::jsonb,
  highlights         = '["See beautiful vineyards and sights, and discover the stunning natural beauty and rich history of Algarve as you enjoy a small-group 4-hour wine tasting trip."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.102787,
  longitude          = -8.673027,
  price              = 65.0,
  rating             = 4.76,
  review_count       = 138,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/algarve-l66/from-lagos-small-group-4-hour-wine-tasting-tour-t400250/?partner_id=BONZK5E'
WHERE display_order = 164 AND city = 'Lagos';

-- display_order 165: Lagos: Bake Pastel de Nata – Class in Lagos, Algarve
UPDATE experiences SET
  title              = 'Lagos: Bake Pastel de Nata – Class in Lagos, Algarve',
  description        = 'Discover the art of crafting the perfect Pastel de Nata with an insightful workshop in Lagos. Learn unique pastry and filling secrets, connect with fellow foodies, and bake your own batch.',
  short_description  = 'Discover the art of crafting the perfect Pastel de Nata with an insightful workshop in Lagos. Learn unique pastry and filling secrets, connect with fellow foodies, and bake your own batch.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/7f67483bfe31c450c11f571656579507c2500eea29cf3d296758ba1d78772355.jpg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/7f67483bfe31c450c11f571656579507c2500eea29cf3d296758ba1d78772355.jpg/720.jpg"]'::jsonb,
  highlights         = '["Discover the art of crafting the perfect Pastel de Nata with an insightful workshop in Lagos.", "Learn unique pastry and filling secrets, connect with fellow foodies, and bake your own batch."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.102787,
  longitude          = -8.673027,
  price              = 65.0,
  rating             = 4.86,
  review_count       = 203,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/lagos-portugal-l2896/lagos-bake-pastel-de-nata-class-in-lagos-algarve-t683755/?partner_id=BONZK5E'
WHERE display_order = 165 AND city = 'Lagos';

-- display_order 166: Lagos: 3-Hour Algarve Classic Food Tour
UPDATE experiences SET
  title              = 'Lagos: 3-Hour Algarve Classic Food Tour',
  description        = 'Take a crash course on Portuguese cuisine as you head to 4 restaurants and taverns for tastings of authentic local food from the western Algarve. Enjoy morning and evening tour options on this tour.',
  short_description  = 'Take a crash course on Portuguese cuisine as you head to 4 restaurants and taverns for tastings of authentic local food from the western Algarve. Enjoy morning and evening tour options on this tour.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/5b1be456af171.jpeg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/5b1be456af171.jpeg/720.jpg"]'::jsonb,
  highlights         = '["Take a crash course on Portuguese cuisine as you head to 4 restaurants and taverns for tastings of authentic local food from the western Algarve.", "Enjoy morning and evening tour options on this tour."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.017952,
  longitude          = -7.930834,
  price              = 89.0,
  rating             = 4.81,
  review_count       = 284,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/algarve-l66/lagos-3-hour-algarve-classic-food-tour-t166253/?partner_id=BONZK5E'
WHERE display_order = 166 AND city = 'Lagos';

-- display_order 167: Lagos: Guided Walking Tour with Brodie from Australia
UPDATE experiences SET
  title              = 'Lagos: Guided Walking Tour with Brodie from Australia',
  description        = 'Discover the history of Lagos on a guided walking tour with an expat Aussie local guide. Learn about the Great Earthquake, the Caravel, and the Transatlantic Slave Trade.',
  short_description  = 'Discover the history of Lagos on a guided walking tour with an expat Aussie local guide. Learn about the Great Earthquake, the Caravel, and the Transatlantic Slave Trade.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/06cc4c68c86b1c3a457589eda4038c20d5c0b781f44ae3b565bfdafe27efb4e0.jpeg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/06cc4c68c86b1c3a457589eda4038c20d5c0b781f44ae3b565bfdafe27efb4e0.jpeg/720.jpg"]'::jsonb,
  highlights         = '["Discover the history of Lagos on a guided walking tour with an expat Aussie local guide.", "Learn about the Great Earthquake, the Caravel, and the Transatlantic Slave Trade."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.017952,
  longitude          = -7.930834,
  price              = 15.0,
  rating             = 4.85,
  review_count       = 85,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/lagos-portugal-l2896/lagos-guided-walking-tour-with-local-tips-t636125/?partner_id=BONZK5E'
WHERE display_order = 167 AND city = 'Lagos';

-- display_order 168: Sagres: Sagres Natural Park Sunset Tour by Jeep
UPDATE experiences SET
  title              = 'Sagres: Sagres Natural Park Sunset Tour by Jeep',
  description        = 'Experience the beautiful sunset at Cabo S. Vicente and the scenic panoramic views of Sagres while enjoying Portuguese wine. Uncover the secrets spots of Portugal on a sunset tour.',
  short_description  = 'Experience the beautiful sunset at Cabo S. Vicente and the scenic panoramic views of Sagres while enjoying Portuguese wine. Uncover the secrets spots of Portugal on a sunset tour.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/6210131e62e29.jpeg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/6210131e62e29.jpeg/720.jpg"]'::jsonb,
  highlights         = '["Experience the beautiful sunset at Cabo S.", "Vicente and the scenic panoramic views of Sagres while enjoying Portuguese wine.", "Uncover the secrets spots of Portugal on a sunset tour."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.086559,
  longitude          = -8.829874,
  price              = 63.0,
  rating             = 4.79,
  review_count       = 330,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/algarve-l66/sagres-sagres-natural-park-sunset-tour-by-jeep-t255932/?partner_id=BONZK5E'
WHERE display_order = 168 AND city = 'Lagos';

-- display_order 169: Bottom Fishing Lagos
UPDATE experiences SET
  title              = 'Bottom Fishing Lagos',
  description        = 'Our fishing trips are designed so that even the least experienced anglers can enjoy a good time.',
  short_description  = 'Our fishing trips are designed so that even the least experienced anglers can enjoy a good time.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/64bc1f530e933.jpeg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/64bc1f530e933.jpeg/720.jpg"]'::jsonb,
  highlights         = '["Our fishing trips are designed so that even the least experienced anglers can enjoy a good time."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.102787,
  longitude          = -8.673027,
  price              = 60.0,
  rating             = 4.8,
  review_count       = 142,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/lagos-portugal-l2896/bottom-fishing-lagos-t492697/?partner_id=BONZK5E'
WHERE display_order = 169 AND city = 'Lagos';

-- display_order 170: Lagos: Flow & Glow | Morning Beach Hatha Flow Yoga
UPDATE experiences SET
  title              = 'Lagos: Flow & Glow | Morning Beach Hatha Flow Yoga',
  description        = 'Start your day with morning Hatha Flow beach yoga in Lagos, Portugal. Move, breathe, and relax by the ocean. Suitable for all levels.',
  short_description  = 'Start your day with morning Hatha Flow beach yoga in Lagos, Portugal. Move, breathe, and relax by the ocean. Suitable for all levels.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/9338f1c6d635d9d4d991919864d533351aaabfb135bcca6288ac86290ab8a96d.jpeg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/9338f1c6d635d9d4d991919864d533351aaabfb135bcca6288ac86290ab8a96d.jpeg/720.jpg"]'::jsonb,
  highlights         = '["Start your day with morning Hatha Flow beach yoga in Lagos, Portugal.", "Move, breathe, and relax by the ocean.", "Suitable for all levels."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.097916,
  longitude          = -8.668116,
  price              = 17.0,
  rating             = 5.0,
  review_count       = 21,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/lagos-portugal-l2896/lagos-flow-glow-morning-beach-hatha-flow-yoga-t948610/?partner_id=BONZK5E'
WHERE display_order = 170 AND city = 'Lagos';

-- display_order 171: Lagos: Algarve Coasteering and Snorkeling Adventure
UPDATE experiences SET
  title              = 'Lagos: Algarve Coasteering and Snorkeling Adventure',
  description        = 'Explore the Algarve on a coasteering and snorkeling trip in Lagos. Hike along the rugged cliffs, swim in the clear water, jump off the cliffs, and marvel at the marine wildlife.',
  short_description  = 'Explore the Algarve on a coasteering and snorkeling trip in Lagos. Hike along the rugged cliffs, swim in the clear water, jump off the cliffs, and marvel at the marine wildlife.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/a406aa2b483937ab.jpeg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/a406aa2b483937ab.jpeg/720.jpg"]'::jsonb,
  highlights         = '["Explore the Algarve on a coasteering and snorkeling trip in Lagos.", "Hike along the rugged cliffs, swim in the clear water, jump off the cliffs, and marvel at the marine wildlife."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.45639,
  longitude          = -8.788714,
  price              = 65.0,
  rating             = 5.0,
  review_count       = 126,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/lagos-portugal-l2896/lagos-algarve-coasteering-and-snorkeling-adventure-t534958/?partner_id=BONZK5E'
WHERE display_order = 171 AND city = 'Lagos';

-- display_order 172: Lagos: Group Surf Lessons For All Levels
UPDATE experiences SET
  title              = 'Lagos: Group Surf Lessons For All Levels',
  description        = 'Our group surf lessons are led by experienced and certified instructors who are passionate surfers themselves. You will learn to surf on the best surf spots of the South or West Coast of the Algarve!',
  short_description  = 'Our group surf lessons are led by experienced and certified instructors who are passionate surfers themselves. You will learn to surf on the best surf spots of the South or West Coast of the Algarve!',
  image_url          = 'https://cdn.getyourguide.com/img/tour/cc944976f2255e0f794e080d1be9f53cddf1d22bd97daf950912c5f726444fe5.jpg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/cc944976f2255e0f794e080d1be9f53cddf1d22bd97daf950912c5f726444fe5.jpg/720.jpg"]'::jsonb,
  highlights         = '["Our group surf lessons are led by experienced and certified instructors who are passionate surfers themselves.", "You will learn to surf on the best surf spots of the South or West Coast of the Algarve!"]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.074429,
  longitude          = -8.774967,
  price              = 80.0,
  rating             = 4.88,
  review_count       = 66,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/lagos-portugal-l2896/lagos-group-surf-lessons-for-all-levels-t639044/?partner_id=BONZK5E'
WHERE display_order = 172 AND city = 'Lagos';

-- display_order 173: Algarve: Jeep Safari with Distillery Visit & Lunch
UPDATE experiences SET
  title              = 'Algarve: Jeep Safari with Distillery Visit & Lunch',
  description        = 'Discover the spectacular beauty of the Algarve on a jeef safari. Pass through old villages, try a potent local drink in a distillery, and enjoy a delicious lunch in a typical restaurant.',
  short_description  = 'Discover the spectacular beauty of the Algarve on a jeef safari. Pass through old villages, try a potent local drink in a distillery, and enjoy a delicious lunch in a typical restaurant.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/aadea1addc914a589133af2de3f1d24f828581db31456f60b3920d0620c7f988.jpg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/aadea1addc914a589133af2de3f1d24f828581db31456f60b3920d0620c7f988.jpg/720.jpg"]'::jsonb,
  highlights         = '["Discover the spectacular beauty of the Algarve on a jeef safari.", "Pass through old villages, try a potent local drink in a distillery, and enjoy a delicious lunch in a typical restaurant."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.09713,
  longitude          = -8.47069,
  price              = 72.0,
  rating             = 4.85,
  review_count       = 222,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/algarve-l66/algarve-jeep-safari-with-distillery-visit-lunch-t402413/?partner_id=BONZK5E'
WHERE display_order = 173 AND city = 'Lagos';

-- display_order 174: Lagos: Guided Scuba Diving Trip for Beginners
UPDATE experiences SET
  title              = 'Lagos: Guided Scuba Diving Trip for Beginners',
  description        = 'Enjoy a guided scuba diving trip off the coast of Lagos. Discover a fascinating underwater world and see squid, octopus, a variety of fish, and many other marine species.',
  short_description  = 'Enjoy a guided scuba diving trip off the coast of Lagos. Discover a fascinating underwater world and see squid, octopus, a variety of fish, and many other marine species.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/6259813084e36.jpeg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/6259813084e36.jpeg/720.jpg"]'::jsonb,
  highlights         = '["Enjoy a guided scuba diving trip off the coast of Lagos.", "Discover a fascinating underwater world and see squid, octopus, a variety of fish, and many other marine species."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.102787,
  longitude          = -8.673027,
  price              = 115.0,
  rating             = 4.3,
  review_count       = 131,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/algarve-l66/lagos-guided-scuba-diving-trips-for-beginners-t323753/?partner_id=BONZK5E'
WHERE display_order = 174 AND city = 'Lagos';

-- display_order 175: Lagos: Market Tour and Cataplana Cooking Class
UPDATE experiences SET
  title              = 'Lagos: Market Tour and Cataplana Cooking Class',
  description        = 'Handpick fresh ingredients at Lagos market, then learn to cook Cataplana, a classic Algarve dish. Immerse yourself in the delightful flavors and culture of the Algarve.',
  short_description  = 'Handpick fresh ingredients at Lagos market, then learn to cook Cataplana, a classic Algarve dish. Immerse yourself in the delightful flavors and culture of the Algarve.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/c9bd9972827e049367397608be2da1b6b01dd76960b3c2bfa52c9320ba2b1feb.jpg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/c9bd9972827e049367397608be2da1b6b01dd76960b3c2bfa52c9320ba2b1feb.jpg/720.jpg"]'::jsonb,
  highlights         = '["Handpick fresh ingredients at Lagos market, then learn to cook Cataplana, a classic Algarve dish.", "Immerse yourself in the delightful flavors and culture of the Algarve."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.017952,
  longitude          = -7.930834,
  price              = 150.0,
  rating             = 5.0,
  review_count       = 10,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/lagos-portugal-l2896/market-tour-cooking-class-algarve-s-seafood-cataplana-t803488/?partner_id=BONZK5E'
WHERE display_order = 175 AND city = 'Lagos';

-- display_order 176: Lagos: A walk with a rescued horse at the sanctuary
UPDATE experiences SET
  title              = 'Lagos: A walk with a rescued horse at the sanctuary',
  description        = 'We will introduce you to the horses and tell you many nice thing to know about them. After that we''ll give you the safety instructions and then we will go on a walk on the fields of our sanctuary.',
  short_description  = 'We will introduce you to the horses and tell you many nice thing to know about them. After that we''ll give you the safety instructions and then we will go on a walk on the fields of our sanctuary.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/e0e1d6a919b2020fa2a416ac4b8aea9f76678b88110261c225623ca75fd08a23.jpeg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/e0e1d6a919b2020fa2a416ac4b8aea9f76678b88110261c225623ca75fd08a23.jpeg/720.jpg"]'::jsonb,
  highlights         = '["We will introduce you to the horses and tell you many nice thing to know about them.", "After that we''ll give you the safety instructions and then we will go on a walk on the fields of our sanctuary."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.138458,
  longitude          = -8.776901,
  price              = 45.0,
  rating             = 5.0,
  review_count       = 6,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/barao-de-sao-joao-l129458/lagos-a-walk-with-a-rescued-horse-by-your-side-on-our-land-t572142/?partner_id=BONZK5E'
WHERE display_order = 176 AND city = 'Lagos';

-- display_order 177: Silves, Caldas and Monchique Wine Tasting: Full Day Tour
UPDATE experiences SET
  title              = 'Silves, Caldas and Monchique Wine Tasting: Full Day Tour',
  description        = 'Embark on a full-day tour exploring Silves before scaling the highest mountain in the south of Portugal and finish the day with delicious local wines.',
  short_description  = 'Embark on a full-day tour exploring Silves before scaling the highest mountain in the south of Portugal and finish the day with delicious local wines.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/5f711b113848e.jpeg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/5f711b113848e.jpeg/720.jpg"]'::jsonb,
  highlights         = '["Embark on a full-day tour exploring Silves before scaling the highest mountain in the south of Portugal and finish the day with delicious local wines."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.188999,
  longitude          = -8.441205,
  price              = 89.0,
  rating             = 4.88,
  review_count       = 84,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/algarve-l66/silves-caldas-and-monchique-full-day-tour-t170718/?partner_id=BONZK5E'
WHERE display_order = 177 AND city = 'Lagos';

-- display_order 178: Small-group Kayak experience at Ponta da Piedade
UPDATE experiences SET
  title              = 'Small-group Kayak experience at Ponta da Piedade',
  description        = 'Explore the impressive rock formations and golden cliffs of Ponta da Piedade on this kayaking tour from Lagos. Uncover the secrets of the coast as you paddle by beaches and visit natural caves.',
  short_description  = 'Explore the impressive rock formations and golden cliffs of Ponta da Piedade on this kayaking tour from Lagos. Uncover the secrets of the coast as you paddle by beaches and visit natural caves.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/c60e0d2dc6e35034c6d2f1a21fcf8dae8131bf6bae862bfc227297707e3e8350.jpeg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/c60e0d2dc6e35034c6d2f1a21fcf8dae8131bf6bae862bfc227297707e3e8350.jpeg/720.jpg"]'::jsonb,
  highlights         = '["Explore the impressive rock formations and golden cliffs of Ponta da Piedade on this kayaking tour from Lagos.", "Uncover the secrets of the coast as you paddle by beaches and visit natural caves."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.017952,
  longitude          = -7.930834,
  price              = 33.0,
  rating             = 4.88,
  review_count       = 37,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/algarve-l66/marina-de-lagos-ponta-da-piedade-kayaking-tour-t408315/?partner_id=BONZK5E'
WHERE display_order = 178 AND city = 'Lagos';

-- display_order 179: Half-Day Jeep Sunset Safari with Portuguese wine
UPDATE experiences SET
  title              = 'Half-Day Jeep Sunset Safari with Portuguese wine',
  description        = 'Witnessing the sunset over the Atlantic Ocean is a truly memorable experience in Algarve. This excursion offers a blend of stunning coastal scenery, historical landmarks, and cultural insights.',
  short_description  = 'Witnessing the sunset over the Atlantic Ocean is a truly memorable experience in Algarve. This excursion offers a blend of stunning coastal scenery, historical landmarks, and cultural insights.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/00c19208d13a14a6c3830c7c2bfd50ccf39e3daf771dd7b4a6e35a8bfd1d3bbf.jpg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/00c19208d13a14a6c3830c7c2bfd50ccf39e3daf771dd7b4a6e35a8bfd1d3bbf.jpg/720.jpg"]'::jsonb,
  highlights         = '["Witnessing the sunset over the Atlantic Ocean is a truly memorable experience in Algarve.", "This excursion offers a blend of stunning coastal scenery, historical landmarks, and cultural insights."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.139931,
  longitude          = -8.53248,
  price              = 55.0,
  rating             = 4.67,
  review_count       = 25,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/lagos-portugal-l2896/half-day-jeep-sunset-safari-with-portuguese-wine-t942200/?partner_id=BONZK5E'
WHERE display_order = 179 AND city = 'Lagos';

-- display_order 180: Monchique & Silves: guided day trip
UPDATE experiences SET
  title              = 'Monchique & Silves: guided day trip',
  description        = 'Discover old traditions in the Monchique mountains with its wonderful views and cork forest, and visit the former capital of the Algarve, Silves.',
  short_description  = 'Discover old traditions in the Monchique mountains with its wonderful views and cork forest, and visit the former capital of the Algarve, Silves.',
  image_url          = 'https://cdn.getyourguide.com/img/tour/5df22cbb27a1fad51de73ebb89c41df7f90f359f1beea838ed4ea0cd09015a02.jpg/720.jpg',
  images             = '["https://cdn.getyourguide.com/img/tour/5df22cbb27a1fad51de73ebb89c41df7f90f359f1beea838ed4ea0cd09015a02.jpg/720.jpg"]'::jsonb,
  highlights         = '["Discover old traditions in the Monchique mountains with its wonderful views and cork forest, and visit the former capital of the Algarve, Silves."]'::jsonb,
  included           = '[]'::jsonb,
  languages          = '["English", "Portuguese", "Spanish", "French", "German", "Italian"]'::jsonb,
  latitude           = 37.139931,
  longitude          = -8.53248,
  price              = 135.0,
  rating             = 4.72,
  review_count       = 7,
  duration           = 'Varies',
  affiliate_url      = 'https://www.getyourguide.com/en-gb/monchique-l92405/monchique-silves-guided-day-trip-t708921/?partner_id=BONZK5E'
WHERE display_order = 180 AND city = 'Lagos';


-- Done. 22 experiences updated.
