-- ============================================
-- Batch GYG-1: Add 1 GetYourGuide experience to Supabase
-- Product: t529377 (Lisbon Tandem Paragliding Flight)
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Lisboa: Tandem Paragliding Flight (t529377)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon: Tandem Paragliding Flight',
  'Experience the thrill of paragliding, the simplest and most exciting way to fly, and feel the joy of soaring high above Praia das Bicas, near Meco, Fonte da Telha, in the magnificent Serra da Arrábida or the city of Sesimbra. The Tandem flight is a paragliding experience where the passenger is accompanied by a certified instructor who guides the paraglider, allowing the passenger to enjoy the thrilling sensation of flying without any prior training. Soar over stunning Portuguese coastal landscapes from a unique vantage point in the sky. Depending on the day, you can enjoy a smooth flight at about 30 to 100 metres above the ground or use the strong thermals to climb up to the clouds! During the flight, radical acrobatic manoeuvres can be performed or you can simply calmly enjoy the wonderful views. The pilot specialises in paragliding flights with extremely fast and manoeuvrable acrobatic wings and is involved in developing and testing new equipment. With over 2,000 tandem flights performed and experience as an F-16 fighter pilot in the Portuguese Air Force, safety is always guaranteed. Photos and high-quality videos are taken using a GoPro and made available via cloud link.',
  'Experience the thrill of tandem paragliding near Lisbon — soar above Praia das Bicas with a certified instructor, no experience needed. GoPro video included.',
  'Praia das Bicas, Sesimbra',
  'Praia das Bicas, 2970-000, Portugal',
  38.4627,
  -9.1918,
  110,
  'EUR',
  '30min',
  NULL,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/9a459d420d06820d.jpeg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/9a459d420d06820d.jpeg/145.jpg","https://cdn.getyourguide.com/img/tour/5af6676221b83ce9.jpeg/145.jpg","https://cdn.getyourguide.com/img/tour/97b70896b8dd00d1.jpeg/145.jpg","https://cdn.getyourguide.com/img/tour/04b59bbabb6543c2.jpeg/145.jpg","https://cdn.getyourguide.com/img/tour/e3636ee3b1b41187.jpeg/145.jpg"]'::jsonb,
  '["Experience the thrill of tandem paragliding with a certified instructor","Fly over stunning coastal landscapes near Lisbon","Choose between acrobatic manoeuvres or calm sightseeing flight","Pilot is a former F-16 fighter pilot with 2,000+ tandem flights","GoPro photos and 5K video included via cloud link","No prior experience or training needed","Multiple flight locations: Praia das Bicas, Arrábida, Sesimbra"]'::jsonb,
  '["Tandem paragliding flight equipment","Helmet","Jacket","GoPro video and photos"]'::jsonb,
  '["Portuguese","English"]'::jsonb,
  'Free cancellation up to 24h before',
  4.9,
  77,
  'Lisbon',
  true,
  68,
  'https://www.getyourguide.com/sesimbra-l4957/lisbon-tandem-paragliding-flight-t529377/?partner_id=BONZK5E',
  'GetYourGuide'
);
