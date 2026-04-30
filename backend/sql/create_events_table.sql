-- Run this SQL in your Postgres database to create the events table used by the backend Event model

CREATE TABLE IF NOT EXISTS events (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  excerpt TEXT,
  content TEXT,
  -- author_id kept as integer to avoid FK errors during initial migrations; link to users can be enforced later
  author_id INTEGER,
  category VARCHAR(100),
  image_url TEXT,
  status VARCHAR(50) DEFAULT 'publie',
  event_date DATE,
  time VARCHAR(16),
  organizer TEXT,
  attendees INTEGER DEFAULT 0,
  external_url TEXT,
  location TEXT,
  read_time VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Optional: index for event_date and status
CREATE INDEX IF NOT EXISTS idx_events_event_date ON events(event_date);
CREATE INDEX IF NOT EXISTS idx_events_status ON events(status);

-- If table already exists, ensure new columns are present (safe alter)
ALTER TABLE events ADD COLUMN IF NOT EXISTS time VARCHAR(16);
ALTER TABLE events ADD COLUMN IF NOT EXISTS organizer TEXT;
ALTER TABLE events ADD COLUMN IF NOT EXISTS attendees INTEGER DEFAULT 0;
ALTER TABLE events ADD COLUMN IF NOT EXISTS external_url TEXT;
