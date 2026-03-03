-- ============================================
-- Link Lisbon Tickets (212–217) to hotels:
--   lisbon-hostel
--   editory-riverside-lisboa
-- Run AFTER add-lisbon-tickets-batch-1.sql
-- ============================================

INSERT INTO hotel_experiences (hotel_id, experience_id, display_order, is_active)
SELECT 'lisbon-hostel', id, display_order, true
FROM experiences
WHERE display_order BETWEEN 212 AND 217
ON CONFLICT DO NOTHING;

INSERT INTO hotel_experiences (hotel_id, experience_id, display_order, is_active)
SELECT 'editory-riverside-lisboa', id, display_order, true
FROM experiences
WHERE display_order BETWEEN 212 AND 217
ON CONFLICT DO NOTHING;
