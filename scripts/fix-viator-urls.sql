-- ============================================
-- FIX: Viator affiliate URLs missing /en-GB/ locale prefix
-- Viator changed their URL format to require locale in path
-- Old: https://www.viator.com/tours/...
-- New: https://www.viator.com/en-GB/tours/...
-- Run in: Supabase Dashboard → SQL Editor
-- ============================================

UPDATE experiences
SET affiliate_url = REPLACE(
  affiliate_url,
  'https://www.viator.com/tours/',
  'https://www.viator.com/en-GB/tours/'
)
WHERE affiliate_provider = 'Viator'
  AND affiliate_url LIKE '%viator.com/tours/%';

-- Verify the fix
SELECT display_order, city, title, affiliate_url
FROM experiences
WHERE affiliate_provider = 'Viator'
ORDER BY display_order;
