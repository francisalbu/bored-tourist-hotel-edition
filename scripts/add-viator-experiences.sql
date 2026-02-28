-- ============================================
-- Add Viator affiliate experiences to Supabase
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- Step 1: Add affiliate columns to experiences table
ALTER TABLE experiences ADD COLUMN IF NOT EXISTS affiliate_url TEXT;
ALTER TABLE experiences ADD COLUMN IF NOT EXISTS affiliate_provider TEXT;

-- Step 2: Create a user and operator for Viator
INSERT INTO users (id, email, name, role)
VALUES (713, 'viator@viator.com', 'Viator', 'operator')
ON CONFLICT (id) DO NOTHING;

INSERT INTO operators (id, user_id, company_name, logo_url, verified, commission)
VALUES (40, 713, 'Viator', 'https://www.viator.com/favicon.ico', true, 0)
ON CONFLICT (id) DO NOTHING;

-- Step 3: Insert the two Viator experiences
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES 
(
  40,
  'Lisbon Small-Group Food Tour: Eat & Drink Like a Local',
  'Discover Lisbon''s authentic food scene on this small-group food tour through the Baixa district. With a passionate local guide, you''ll taste over 10 Portuguese specialties — from freshly baked pastéis de nata, Serra da Estrela cheese, traditional cured meats, to the famous ginjinha. The tour takes you through hidden tascas, traditional markets and century-old pastry shops that only locals know. A perfect experience for those who want to discover Lisbon through its flavours.',
  'Explore the gastronomic heart of Lisbon in the Baixa district. Taste traditional petiscos, fresh pastéis de nata, artisan cheeses and local wines — all guided by a passionate local foodie.',
  'Baixa, Lisbon',
  'Praça do Comércio, Lisbon',
  38.7083,
  -9.1368,
  61,
  'EUR',
  '3h',
  12,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/02/91/79.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/02/91/79.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/b8/1a/ec.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/c2/68/cf.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/a8/8d/7e.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/df/c2/90.jpg"]'::jsonb,
  '["Taste 10+ authentic Portuguese specialties","Local guide with deep knowledge of Lisbon''s food culture","All tastings included in the price","Small group for a personalised experience","Visit hidden tascas and century-old pastry shops"]'::jsonb,
  '["All food tastings","Wine and ginjinha tasting","Expert local guide","Small group (max. 12)"]'::jsonb,
  '["Portuguese","English","Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  56,
  'Lisbon',
  true,
  3,
  'https://www.viator.com/tours/Lisbon/Lisbon-Baixa-district-food-tour-with-a-local/d538-5560182P5',
  'Viator'
),
(
  40,
  'Winner 2025 Undiscovered Lisbon Food & Wine Tour by Eating Europe',
  'Eat your way into the heart of Lisbon and discover the local history and cuisine in two of the city''s most vibrant neighbourhoods. Escape the tourist crowds and experience the traditional taverns, shops and restaurants beloved by Lisbon locals. This is Eating Europe''s most awarded tour: winning the title of #1 food tour in Portugal, #7 best activity worldwide, and recommended by 99% of Tripadvisor users. Enjoy seven tastings at five different restaurants, from "fireman" chorizo and bifanas at a classic tavern, to bacalhau à Brás at a fado house with VIP access, Mozambican influences and the famous pastéis de nata.',
  'Explore Lisbon''s undiscovered neighbourhoods on this award-winning food tour. Step away from the tourist traps and discover traditional taverns, street art and authentic flavours through Baixa and Mouraria.',
  'Baixa & Mouraria, Lisbon',
  'Praça dos Restauradores, 1250-001 Lisbon',
  38.7157,
  -9.1415,
  104,
  'EUR',
  '3h 30min',
  12,
  'Local Cooking',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/e2/c6/2c.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/e2/c6/2c.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/96/fd/2f.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/13/4d/f4.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/13/4d/fd.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/13/4e/00.jpg"]'::jsonb,
  '["Winner 2025 — #1 food tour in Portugal","7 tastings at 5 different restaurants","Explore Baixa and Mouraria away from tourist traps","VIP access to a traditional fado house","Taste petiscos, bacalhau à Brás, bifanas and pastéis de nata","Expert local guide specialised in food and culture","Small group (max. 12 people) for an intimate experience"]'::jsonb,
  '["All food tastings (7 stops)","Beer and wine at each stop","Expert English-speaking local guide","VIP access to fado house","Small group (max. 12)"]'::jsonb,
  '["English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  6484,
  'Lisbon',
  true,
  4,
  'https://www.viator.com/tours/Lisbon/Eats-Street-Art-and-Undiscovered-Lisbon-Food-Tour/d538-156455P1',
  'Viator'
),
(
  40,
  'Sintra & Cascais Small-Group Day Trip from Lisbon',
  'Experience the natural and historical beauty of Portugal on a small-group day trip from Lisbon to Sintra and Cascais. Travel by air-conditioned minivan to the magical town of Sintra, where man and nature exist in perfect harmony. Discover the secret trails of Pena Park and admire the colourful Pena National Palace from a spectacular viewpoint. Enjoy free time to explore the historic centre of Sintra, then drive through the stunning Sintra Natural Park to Cabo da Roca — the westernmost point of mainland Europe. Continue along the Atlantic coast, passing the famous Guincho Beach and Boca do Inferno, before arriving in the charming seaside town of Cascais for a stroll along the bay.',
  'A full-day adventure from Lisbon through Sintra''s fairytale palaces, the dramatic cliffs of Cabo da Roca and the charming coastal town of Cascais — all in a small group with a local guide.',
  'Sintra & Cascais',
  'Hard Rock Cafe, Av. da Liberdade 2, 1250-144 Lisbon',
  38.7195,
  -9.1456,
  69,
  'EUR',
  '8h',
  15,
  'Culture Dive',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/63/e4/89.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/63/e4/89.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/63/e4/96.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/63/e4/94.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/63/e4/97.jpg","https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/63/e4/8a.jpg"]'::jsonb,
  '["Visit the colourful Pena National Palace and its lush park","Drive to Cabo da Roca — the westernmost point of mainland Europe","Scenic coastal drive past Guincho Beach and Boca do Inferno","Free time to explore Sintra''s historic centre","Stroll through the charming seaside town of Cascais","Small group for a more personalised experience","Comfortable air-conditioned minivan transport"]'::jsonb,
  '["Local guide","Transport by air-conditioned minivan","Entrance to Pena Palace and Park (depending on option chosen)"]'::jsonb,
  '["Portuguese","English","Spanish","French"]'::jsonb,
  'Free cancellation up to 24h before',
  4.8,
  7057,
  'Lisbon',
  true,
  5,
  'https://www.viator.com/tours/Lisbon/Sintra-and-Cascais-Small-Group-Day-Trip-from-Lisbon/d538-5383SINTRACASCAIS',
  'Viator'
);
