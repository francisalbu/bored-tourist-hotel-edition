-- ============================================
-- Fix image_url (Jerónimos was dark interior)
-- + add multiple images to all 6 Lisbon tickets
-- Run in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Jerónimos Monastery — swap to exterior shot, add 3 images
UPDATE experiences SET
  image_url = 'https://cdn.getyourguide.com/img/tour/5e788fe0d6863c61.jpeg/145.jpg',
  images = '[
    "https://cdn.getyourguide.com/img/tour/5e788fe0d6863c61.jpeg/145.jpg",
    "https://cdn.getyourguide.com/img/tour/8a0273832a78dbc9.jpeg/145.jpg",
    "https://cdn.getyourguide.com/img/tour/685dd4b34762205c.jpeg/145.jpg"
  ]'::jsonb
WHERE display_order = 212;

-- 2) Lisbon Card — 3 images
UPDATE experiences SET
  images = '[
    "https://cdn.getyourguide.com/img/tour/b72d9ff047051d5a.jpeg/145.jpg",
    "https://cdn.getyourguide.com/img/tour/ebb2fff023b3ce78.jpeg/145.jpg",
    "https://cdn.getyourguide.com/img/tour/f8f018caeb2a8889.jpeg/145.jpg"
  ]'::jsonb
WHERE display_order = 213;

-- 3) Lisbon Cathedral — 3 images
UPDATE experiences SET
  images = '[
    "https://cdn.getyourguide.com/img/tour/6412f35874f55.jpeg/145.jpg",
    "https://cdn.getyourguide.com/img/tour/6412f35cebd9b.jpeg/145.jpg",
    "https://cdn.getyourguide.com/img/tour/6412f357a035c.jpeg/145.jpg"
  ]'::jsonb
WHERE display_order = 214;

-- 4) National Palace of Ajuda — 3 images
UPDATE experiences SET
  images = '[
    "https://cdn.getyourguide.com/img/tour/d3ecb19bbcd93bbc.jpeg/145.jpg",
    "https://cdn.getyourguide.com/img/tour/865dffcc8ea7e398.jpeg/145.jpg",
    "https://cdn.getyourguide.com/img/tour/96c84e4b726fa632.jpeg/145.jpg"
  ]'::jsonb
WHERE display_order = 215;

-- 5) Sintra Quinta da Regaleira — 3 images
UPDATE experiences SET
  images = '[
    "https://cdn.getyourguide.com/img/tour/7f48ccff7af3a77a.jpeg/145.jpg",
    "https://cdn.getyourguide.com/img/tour/a6d95c79c3a9bfba.jpeg/145.jpg",
    "https://cdn.getyourguide.com/img/tour/7734c308dc8d0ba2.jpeg/145.jpg"
  ]'::jsonb
WHERE display_order = 216;

-- 6) Oceanário de Lisboa — 3 images
UPDATE experiences SET
  images = '[
    "https://cdn.getyourguide.com/img/tour/52ebec56dceb8676.jpeg/145.jpg",
    "https://cdn.getyourguide.com/img/tour/9df774648925b13a.jpeg/145.jpg",
    "https://cdn.getyourguide.com/img/tour/3d3c70e408407227.jpeg/145.jpg"
  ]'::jsonb
WHERE display_order = 217;
