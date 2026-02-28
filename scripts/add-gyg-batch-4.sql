-- ============================================
-- Batch GYG-4: DreamFly Indoor Skydiving
-- Partner ID: BONZK5E
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Lisbon/Sintra: Indoor Skydiving Experience (t750663)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Lisbon/Sintra: Indoor Skydiving Experience',
  'Discover Indoor Skydiving at DreamFly, one of the largest open-air recirculation wind tunnels in Europe. Feel 100% adrenaline and fun in a controlled and safe environment — suitable for adults and children (4+). Professional flight instructors will guide you through the entire experience, from training to your flights. At the end, receive your well-deserved diploma for stepping out of your comfort zone!',
  'Feel the adrenaline of skydiving in a safe wind tunnel at DreamFly — one of the largest in Europe. Suitable for all ages 4+.',
  'Lisbon',
  'Alegro Sintra, R. Alto do Forte IC 19, 2635-018 Rio de Mouro, Portugal',
  38.7762079,
  -9.3396295,
  54.0,
  'EUR',
  '1h 30min',
  NULL,
  'Micro Adventures',
  'https://cdn.getyourguide.com/img/tour/6240fe39f31927779ebdcfa07d66bc3a95a9fb1a298a4777dac657f254fd9dee.jpg/145.jpg',
  '["https://cdn.getyourguide.com/img/tour/6240fe39f31927779ebdcfa07d66bc3a95a9fb1a298a4777dac657f254fd9dee.jpg/145.jpg", "https://cdn.getyourguide.com/img/tour/306a7437dbeae9883ede661a5b57203ee5a2eb50a86af8885bfd057041ce6054.jpg/145.jpg", "https://cdn.getyourguide.com/img/tour/e0f54a61507a316b580cc9c060a7206a85423bbb815be16bf9603c6dbd3a1387.jpg/145.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Dreamfly/dreamfly1.mp4',
  '["Feel the adrenaline of indoor skydiving in a safe environment", "Defy gravity with skill, style and courage", "A unique and unforgettable experience with DreamFly", "Experience the thrill of skydiving without the dangers of a real jump", "Anyone can learn to fly at DreamFly — ages 4 to unlimited"]'::jsonb,
  '["2 standard flights (2 x 1 minute of flight)", "Full training before the session", "Equipment rental (helmet, flight suit, earplugs, goggles, shoes if needed)", "Locker for your belongings", "Professional flight instructor assistance", "Instructor flight demonstration", "Flight diploma"]'::jsonb,
  '["English", "Portuguese", "Spanish"]'::jsonb,
  'Free cancellation up to 24h before',
  4.7,
  29,
  'Lisbon',
  true,
  86,
  'https://www.getyourguide.com/en-gb/sintra-l99/lisbonsintra-indoor-skydiving-experience-t750663/?partner_id=BONZK5E',
  'GetYourGuide'
);
