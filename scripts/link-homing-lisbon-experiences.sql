-- ============================================
-- Link all Lisboa experiences to Homing hotel
-- Domain: homing.boredtourist.com
-- Run in: Supabase Dashboard → SQL Editor
-- ============================================
-- Matches experiences where city OR location contains 'lisbon' or 'lisboa'
-- This mirrors exactly the city-filter logic in the dashboard SiteSettingsView
-- ============================================

INSERT INTO hotel_experiences (hotel_id, experience_id, is_active, display_order)
SELECT
  'homing'       AS hotel_id,
  id             AS experience_id,
  true           AS is_active,
  display_order  AS display_order
FROM experiences
WHERE
  is_active = true
  AND (
    LOWER(city)     LIKE '%lisbon%' OR
    LOWER(city)     LIKE '%lisboa%' OR
    LOWER(location) LIKE '%lisbon%' OR
    LOWER(location) LIKE '%lisboa%'
  )
ON CONFLICT (hotel_id, experience_id) DO NOTHING;

-- Verification: should match 109 rows
SELECT COUNT(*) AS linked_to_homing
FROM hotel_experiences
WHERE hotel_id = 'homing';
