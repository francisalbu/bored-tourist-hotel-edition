-- User Memories Table
-- This stores guest profiles and memories built from interactions

CREATE TABLE IF NOT EXISTS user_memories (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id TEXT NOT NULL UNIQUE, -- Can be session ID, email, or custom identifier
  name TEXT,
  relationship_status TEXT,
  interests TEXT[], -- Array of interests extracted from conversations
  summary TEXT, -- AI-generated summary of the guest's profile
  memories TEXT[] DEFAULT '{}', -- Array of specific memories/facts
  conversation_count INTEGER DEFAULT 0,
  last_interaction TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index for faster lookups
CREATE INDEX IF NOT EXISTS idx_user_memories_user_id ON user_memories(user_id);
CREATE INDEX IF NOT EXISTS idx_user_memories_updated_at ON user_memories(updated_at DESC);

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_user_memories_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to automatically update updated_at
DROP TRIGGER IF EXISTS update_user_memories_timestamp ON user_memories;
CREATE TRIGGER update_user_memories_timestamp
BEFORE UPDATE ON user_memories
FOR EACH ROW
EXECUTE FUNCTION update_user_memories_timestamp();

-- Sample data (optional - remove if not needed)
INSERT INTO user_memories (user_id, name, relationship_status, interests, summary, memories, conversation_count)
VALUES (
  'demo-user-1',
  'Francisco Albuquerque',
  'In a relationship (has girlfriend)',
  ARRAY['date spots', 'romantic venues', 'cocktail bars', 'couple experiences'],
  'Francisco Albuquerque is a direct communicator in a relationship who seeks romantic experiences for dates with his girlfriend. He''s interested in date spots, cocktail bars, and unique couple experiences.',
  ARRAY[
    'Name: Francisco Albuquerque',
    'In a relationship (has girlfriend)',
    'Interested in: date spots, romantic venues, cocktail bars, couple experiences'
  ],
  3
)
ON CONFLICT (user_id) DO NOTHING;
