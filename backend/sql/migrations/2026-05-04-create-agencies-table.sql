-- Migration: create agencies table
CREATE TABLE IF NOT EXISTS agencies (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  address TEXT,
  phone TEXT,
  lat DOUBLE PRECISION,
  lng DOUBLE PRECISION,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Add simple index on lat/lng for spatial queries (not PostGIS)
CREATE INDEX IF NOT EXISTS idx_agencies_lat_lng ON agencies (lat, lng);
