-- ============================================
-- Batch 8: Add 6 Viator experiences to Supabase
-- Products: 73338P6, 6999GOLDEN, 67744P12, 121012P1, 75380P4, 6999P16
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Óbidos Medieval Walking Tour (73338P6)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Óbidos: Medieval Tales, Secret Spots & Ginjinha Tasting',
  'Step through the ancient gates of Óbidos and lose yourself in one of Portugal''s most enchanting medieval towns. Led by an experienced and passionate local guide, this walking tour takes you through cobblestone streets, hidden alleys and centuries-old quarters — Moorish, Jewish, and royal — revealing the layers of history that shaped this remarkable walled village. Explore the 1,300-year-old Muslim castle, marvel at the renaissance masterpiece "Pietá" by Nicolau de Chanterene, and discover the works of Josefa de Óbidos, the celebrated 17th-century local painter and the first Portuguese female artist exhibited at the Louvre. Browse the trendy bookstore "Ler Devagar", tucked inside a former royal chapel, and soak in panoramic views from the castle walls. The grand finale? A tasting of the famous Ginjinha de Óbidos — a sweet cherry liqueur served in an edible chocolate cup. Come for the history, stay for the charm, and take home gorgeous photos of one of Portugal''s best-kept secrets.',
  'A guided walking tour through medieval Óbidos — explore the castle, hidden quarters, a bookstore in a chapel and taste Ginjinha in a chocolate cup.',
  'Óbidos',
  'Tourist Office (in front of), Óbidos',
  39.3622,
  -9.1571,
  35,
  'EUR',
  '2h',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/13/64/53/dc.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/13/64/53/dc.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/13/64/53/d4.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0a/06/6e/c1.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/13/64/53/e0.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0a/06/6e/fd.jpg"]'::jsonb,
  '["Explore the 1,300-year-old Muslim castle and medieval walls","Taste Ginjinha de Óbidos served in an edible chocolate cup","Discover hidden Moorish and Jewish quarters with a local guide","Visit the trendy bookstore ''Ler Devagar'' inside a former royal chapel","See works by Josefa de Óbidos — the first Portuguese female artist at the Louvre","Marvel at Chanterene''s renaissance masterpiece ''Pietá''","Capture stunning photos from the castle walls and panoramic viewpoints"]'::jsonb,
  '["Experienced local guide","Ginjinha de Óbidos tasting in chocolate cup","All activities included"]'::jsonb,
  '["Portuguese","English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  137,
  'Óbidos',
  true,
  39,
  'https://www.viator.com/en-GB/tours/Lisbon/Medieval-Obidos-History-and-Tasting/d538-73338P6',
  'Viator'
);

-- 2) Évora & Almendres Cromlech Day Trip (6999GOLDEN)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Alentejo Day Trip: Évora, Roman Temple & Megalithic Cromlech',
  'Leave Lisbon behind and head into the golden plains of the Alentejo — Portugal''s sun-drenched heartland — on this private full-day tour to the UNESCO-listed city of Évora and the mysterious Almendres Cromlech. Travel in comfort aboard a private minivan with your own guide, who brings the region''s 2,000-year history to life. In Évora, explore the grand Gothic cathedral built in the 12th century and climb to the rooftop for sweeping views of the countryside. Stand before the Temple of Diana, one of the best-preserved Roman temples on the Iberian Peninsula. Then descend into the haunting Chapel of Bones (Capela dos Ossos), where the walls and pillars are lined with the remains of over 5,000 monks — a powerful meditation on the brevity of life. After free time for lunch in one of Évora''s excellent restaurants, venture into the countryside to visit the Almendres Cromlech, a Neolithic stone circle older than Stonehenge. This is Portugal at its most authentic: ancient, unhurried and deeply beautiful.',
  'A private full-day tour from Lisbon to UNESCO Évora — visit the Roman Temple, Chapel of Bones, Gothic cathedral and the ancient Almendres Cromlech.',
  'Évora, Alentejo',
  'Palácio Foz, Restauradores Square, Lisbon (Tourism Office)',
  38.5667,
  -7.9135,
  90,
  'EUR',
  'Full day',
  NULL,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/06/73/fb/53.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/06/73/fb/53.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/b3/99/c4.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/b3/91/3c.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/b3/99/9d.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/b3/91/15.jpg"]'::jsonb,
  '["Private tour with your own guide and minivan","Explore the UNESCO World Heritage city of Évora","Visit the Temple of Diana — one of Iberia''s best-preserved Roman temples","Descend into the haunting Chapel of Bones (Capela dos Ossos)","Climb the 12th-century Gothic cathedral for panoramic views","Discover the Almendres Cromlech — a stone circle older than Stonehenge","Free time for lunch in Évora''s excellent local restaurants"]'::jsonb,
  '["Hotel pickup and drop-off in Lisbon","Private guide throughout the day","Transport by private minivan","Entrance fees included"]'::jsonb,
  '["Portuguese","English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  134,
  'Lisbon',
  true,
  40,
  'https://www.viator.com/en-GB/tours/Lisbon/Private-Tour-Evora-and-Almendres-Cromlech-Day-Trip-from-Lisbon/d538-6999GOLDEN',
  'Viator'
);

-- 3) Dolphin Watching with Marine Biologist (67744P12)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Dolphin Watching in Lisbon with a Marine Biologist',
  'Set sail from the iconic Doca de Santo Amaro — right beneath the 25 de Abril Bridge — on this unforgettable dolphin watching experience led by a real marine biologist, in partnership with the Oceanário de Lisboa. Before boarding, relax at the Mercedes Benz Oceanic Lounge with facilities and stunning river views. Once on the water, cruise down the Tagus and out toward the Atlantic, spotting wild dolphins as they leap, play and swim freely in their natural habitat. Your onboard marine biologist shares fascinating insights about dolphin behaviour, ocean ecosystems and the research you''re helping to support — every trip contributes data to Oceanário de Lisboa''s conservation programmes. Along the way, enjoy a unique perspective of Lisbon''s top landmarks from the water: the Belém Tower, the Monument to the Discoveries, Cristo Rei and the dramatic 25 de Abril Bridge. This family-friendly experience unites nature, science and sustainable travel in one spectacular outing.',
  'A dolphin watching cruise led by a marine biologist — spot wild dolphins, enjoy Lisbon''s landmarks from the water and support ocean research with Oceanário de Lisboa.',
  'Doca de Santo Amaro, Lisbon',
  'Mercedes Benz Oceanic Lounge, Doca de Santo Amaro, Armazém 17 (below the 25 de Abril Bridge)',
  38.7042,
  -9.1778,
  65,
  'EUR',
  '2h',
  NULL,
  'Outdoors',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/12/78/60/47.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/12/78/60/47.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0b/cd/c3/b1.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/12/00/b2/c6.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/12/78/60/4f.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/12/80/b3/79.jpg"]'::jsonb,
  '["Spot wild dolphins in their natural Atlantic habitat","Led by a real marine biologist from Oceanário de Lisboa","See Lisbon''s top landmarks from the water — Belém Tower, Cristo Rei, 25 de Abril Bridge","Relax at the Oceanic Lounge before boarding","Family-friendly experience suitable for all ages","Support ocean research and dolphin conservation with every trip","A unique blend of nature, science and sustainable travel"]'::jsonb,
  '["Marine biologist guide onboard","Sea jackets and sea pants","Lifevest","Water","Insurance","Facilities with bathrooms at the lounge"]'::jsonb,
  '["Portuguese","English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  131,
  'Lisbon',
  true,
  41,
  'https://www.viator.com/en-GB/tours/Lisbon/Dolphin-watching/d538-67744P12',
  'Viator'
);

-- 4) Corinthia Signature Massage (121012P1)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Corinthia Signature Massage: Luxury Spa Experience in Lisbon',
  'Surrender to pure relaxation at THE SPA at Corinthia Lisbon — one of Europe''s most acclaimed luxury hotel spas. This signature massage draws on ancient therapies from both East and West, combining the most advanced techniques with world-renowned ESPA skincare products to deliver a truly bespoke, therapeutic experience. From the moment you arrive at the elegant spa reception, every detail is designed for tranquillity: slip into a plush bathrobe and slippers, and let the expert team guide you through a personalised treatment tailored to your body''s needs. Whether you seek deep muscle relief, stress reduction or simply a moment of indulgent calm, the therapists use their skilled hands to melt away tension and restore balance. After your massage, unwind in the spa''s serene relaxation area with a selection of herbal teas, water and dried fruits. This is not just a massage — it''s a complete sensory escape in the heart of Lisbon, offering harmony and tranquillity that lingers long after you leave.',
  'A luxury signature massage at Corinthia Lisbon''s award-winning spa — bespoke ESPA treatments, plush amenities and total relaxation in the heart of the city.',
  'Corinthia Lisbon',
  'Corinthia Lisbon, Av. Columbano Bordalo Pinheiro 105, Lisbon',
  38.7342,
  -9.1583,
  160,
  'EUR',
  '1h',
  NULL,
  'Spa & Wellness',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/14/e1/65/55.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/14/e1/65/55.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/34/0e/0c.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/34/0e/89.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/14/e1/6b/b5.jpg"]'::jsonb,
  '["Signature massage at the award-winning Corinthia Lisbon spa","World-renowned ESPA skincare products and techniques","Ancient therapies combining Eastern and Western traditions","Bespoke treatment tailored to your body''s specific needs","Plush bathrobe, slippers and serene relaxation area","Selection of herbal teas, water and dried fruits after treatment","A complete luxury escape in the heart of Lisbon"]'::jsonb,
  '["Signature massage treatment","Bathrobe, slippers and towels","Selection of teas, water and dried fruits","Access to spa relaxation area","ESPA skincare products"]'::jsonb,
  '["Portuguese","English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  128,
  'Lisbon',
  true,
  42,
  'https://www.viator.com/en-GB/tours/Lisbon/Corinthia-Signature-Massage/d538-121012P1',
  'Viator'
);

-- 5) Coasteering in Arrábida Natural Park (75380P4)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Coasteering in Arrábida: Cliff Jumps, Zip-Lines & Wild Swimming',
  'Get ready for an adrenaline-fuelled adventure along the dramatic coastline of the Arrábida Natural Park with Vertente Natural — the pioneers of coasteering in Portugal and global leaders in the sport. This isn''t just a walk along the cliffs: you''ll scramble over rocks, swim through crystal-clear coves, climb natural rock faces, rappel down cliff walls, fly across zip-lines and — for the brave — leap off cliffs straight into the sparkling Atlantic below. A support boat follows alongside for safety and peace of mind, and your expert guides provide all the equipment you need: wetsuit, helmet, harness and life jacket. The only requirement? You need to be an able swimmer. Everything else — courage, laughter and unforgettable memories — comes naturally. With its turquoise waters, towering limestone cliffs and lush Mediterranean vegetation, Arrábida is the ultimate playground for anyone craving a wild, active and beautiful day out from Lisbon. Transfer from Lisbon available near the Hard Rock Café.',
  'Coasteering along Arrábida''s dramatic cliffs — scramble, swim, climb, rappel, zip-line and cliff-jump into the Atlantic with Portugal''s coasteering pioneers.',
  'Arrábida Natural Park',
  'Near Hard Rock Café, Lisbon (transfer available) or direct meeting in Arrábida',
  38.4759,
  -8.9863,
  65,
  'EUR',
  '4h',
  NULL,
  'Sports',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/06/74/87/2f.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/06/74/87/2f.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/e5/b2/3e.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/e5/b2/44.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/e5/b2/7b.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/e5/b2/95.jpg"]'::jsonb,
  '["Portugal''s coasteering pioneers — Vertente Natural","Scramble, swim, climb, rappel, zip-line and cliff-jump","Stunning Arrábida Natural Park with turquoise waters","Full safety equipment: wetsuit, helmet, harness and life jacket","Support boat follows alongside for safety","Expert guides leading every step of the adventure","Transfer from Lisbon available (near Hard Rock Café)"]'::jsonb,
  '["Life jacket","Wetsuit","Helmet","Harness","Insurance","Support boat","Expert coasteering guides"]'::jsonb,
  '["Portuguese","English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  124,
  'Lisbon',
  true,
  43,
  'https://www.viator.com/en-GB/tours/Setubal-District/Coasteering/d5016-75380P4',
  'Viator'
);

-- 6) Fátima, Batalha, Nazaré & Óbidos Day Trip (6999P16)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Fátima, Batalha, Nazaré & Óbidos: Full-Day Small Group Tour',
  'Immerse yourself in Portugal''s rich history, faith and coastal beauty on this unforgettable full-day small group tour visiting four of the country''s most iconic destinations. Start the day with a drive to Fátima, one of the most important religious sanctuaries in the world, where the legendary apparitions of the Virgin Mary to three shepherd children in 1917 created a place of extraordinary devotion. Continue to Batalha to visit the stunning late-Gothic Monastery — a UNESCO World Heritage Site built to commemorate the heroic Battle of Aljubarrota, one of the defining moments in Portuguese history. After lunch (not included, but your guide recommends the best local spots), head to the charming seaside village of Nazaré, famous for its dramatic cliffs, giant waves and fresh seafood. End the day in the fairy-tale medieval village of Óbidos, wandering its cobblestone streets, castle walls and whitewashed houses draped in bougainvillea. Travel in a comfortable air-conditioned minivan with a knowledgeable local guide who brings every stop to life.',
  'A small group day trip from Lisbon visiting Fátima Sanctuary, Batalha Monastery, the seaside village of Nazaré and the medieval walled town of Óbidos.',
  'Fátima, Batalha, Nazaré & Óbidos',
  'MANGO Store, Restauradores Square, Lisbon',
  38.7158,
  -9.1420,
  80,
  'EUR',
  'Full day',
  8,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/17/04/dc/73.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/17/04/dc/73.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/17/04/dc/74.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/17/04/dc/75.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/17/04/dc/76.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/17/04/dc/77.jpg"]'::jsonb,
  '["Visit Fátima — one of the world''s most important religious sanctuaries","Explore the UNESCO-listed Batalha Monastery (late-Gothic masterpiece)","Stroll the dramatic cliffs and seafood village of Nazaré","Wander the fairy-tale medieval streets of Óbidos","Small group tour with max 8 people for a personal experience","Comfortable air-conditioned minivan with local guide","Four iconic Portuguese destinations in a single day"]'::jsonb,
  '["Local guide throughout the day","Hotel pickup and drop-off in Lisbon","Transport by air-conditioned minivan"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  108,
  'Lisbon',
  true,
  44,
  'https://www.viator.com/en-GB/tours/Lisbon/Faith-and-Heritage-Fatima-Batalha-Nazare-and-Obidos-Small-Group-Tour/d538-6999P16',
  'Viator'
);
