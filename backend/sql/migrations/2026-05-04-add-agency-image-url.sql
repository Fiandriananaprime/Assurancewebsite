-- Migration: add image_url column to agencies table
ALTER TABLE agencies
  ADD COLUMN IF NOT EXISTS image_url TEXT;

-- Optionally populate new column for existing rows with a placeholder
-- UPDATE agencies SET image_url = 'https://picsum.photos/seed/' || id || '/400/300' WHERE image_url IS NULL;
