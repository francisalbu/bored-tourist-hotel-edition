-- ============================================
-- Batch Viator-19: Paragliding near Lisbon (FlyWith)
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 1) Paragliding near Lisbon with Instructor (375146P2)
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, video_url, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  'Paragliding near Lisbon — No Experience Required',
  'Soar above the stunning Lisbon coastline on a tandem paragliding flight with a certified instructor. No experience required — just a passion for adventure! After a quick safety briefing and gear-up, take off from a coastal hilltop and glide through the skies with breathtaking views of the Atlantic Ocean, golden beaches, and the Serra da Arrábida. Your passionate instructor handles everything while you enjoy the flight of a lifetime.',
  'Tandem paragliding over the Lisbon coast — no experience needed, certified instructor, stunning views.',
  'Lisbon',
  'Lisbon Coast (meet outside CTT post office)',
  38.6350,
  -9.2050,
  150.0,
  'EUR',
  '30min',
  NULL,
  'Micro Adventures',
  'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/de/39/c6.jpg',
  '["https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/de/39/c6.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/de/3a/0f.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/de/39/73.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/de/39/a0.jpg", "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/de/39/eb.jpg"]'::jsonb,
  'https://storage.googleapis.com/bored_tourist_media/images/gallery/Flywith/pradigm.mp4',
  '["Tandem paragliding flight — no experience required", "Certified instructor handles everything", "Breathtaking views of the Atlantic coast and beaches", "Safety briefing, helmet and knee/elbow pads included", "An unforgettable, once-in-a-lifetime adventure"]'::jsonb,
  '["Safety briefing", "Helmet and knee/elbow pads", "Tandem flight with certified instructor"]'::jsonb,
  '["English", "Portuguese", "French", "Spanish", "German", "Polish", "Russian", "Ukrainian"]'::jsonb,
  'Free cancellation up to 24h before',
  5.0,
  11,
  'Lisbon',
  true,
  104,
  'https://www.viator.com/en-GB/tours/Lisbon/Paragliding-near-Lisbon-with-instructor-No-experience-requiered/d538-375146P2?pid=P00285354&mcid=42383&medium=link',
  'Viator'
);
