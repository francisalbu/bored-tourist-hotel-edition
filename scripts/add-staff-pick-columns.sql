-- Migration: Add staff pick fields to experiences table
-- This allows us to track which staff member recommended each experience

ALTER TABLE experiences
ADD COLUMN IF NOT EXISTS staff_pick TEXT,
ADD COLUMN IF NOT EXISTS staff_member TEXT;

-- Add index for better query performance when filtering by Hotel Picks
CREATE INDEX IF NOT EXISTS idx_experiences_category ON experiences(category);

-- Add some comments for documentation
COMMENT ON COLUMN experiences.staff_pick IS 'Name of the staff member who recommended this (Clara, Joel, Gale, etc.)';
COMMENT ON COLUMN experiences.staff_member IS 'Job title of the staff member (Concierge, Front Desk Manager, Guest Relations)';
