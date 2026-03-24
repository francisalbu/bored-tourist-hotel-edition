-- ============================================================
-- Affiliate Click Log
-- Tracks every "Book" click per hotel so we can:
--   1. Know which hotel originated each Viator/GYG booking
--   2. Pay commissions correctly to each hotel partner
--   3. Cross-reference with Viator affiliate dashboard by mcid
--
-- Run in: Supabase Dashboard → SQL Editor
-- ============================================================

CREATE TABLE IF NOT EXISTS affiliate_click_log (
  id          bigserial PRIMARY KEY,
  hotel_id    text        NOT NULL,
  exp_id      text,                       -- experience ID that was clicked
  mcid        text        NOT NULL,       -- Viator campaign ID used (= hotel identifier)
  destination text,                       -- clean destination URL (first 500 chars)
  clicked_at  timestamptz NOT NULL DEFAULT now()
);

-- Index for querying by hotel and date range
CREATE INDEX IF NOT EXISTS idx_acl_hotel_date ON affiliate_click_log (hotel_id, clicked_at DESC);
CREATE INDEX IF NOT EXISTS idx_acl_mcid       ON affiliate_click_log (mcid);

-- Enable RLS (read-only for authenticated, insert for service role)
ALTER TABLE affiliate_click_log ENABLE ROW LEVEL SECURITY;

-- Service role can do everything (used by api/viator-redirect)
CREATE POLICY "service role full access"
  ON affiliate_click_log
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- ── Useful queries ──────────────────────────────────────────
-- Clicks per hotel last 30 days:
--   SELECT hotel_id, mcid, COUNT(*) AS clicks
--   FROM affiliate_click_log
--   WHERE clicked_at > now() - interval '30 days'
--   GROUP BY hotel_id, mcid ORDER BY clicks DESC;
--
-- Clicks per experience:
--   SELECT exp_id, hotel_id, COUNT(*) AS clicks
--   FROM affiliate_click_log
--   GROUP BY exp_id, hotel_id ORDER BY clicks DESC LIMIT 20;
-- ────────────────────────────────────────────────────────────
