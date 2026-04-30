-- Migration: add file_url and file_type columns to messages table
-- Safe to run multiple times (uses IF NOT EXISTS checks where possible)
DO $$
BEGIN
    -- Add file_url column if missing
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name='messages' AND column_name='file_url'
    ) THEN
        ALTER TABLE messages ADD COLUMN file_url TEXT;
    END IF;

    -- Add file_type column if missing
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name='messages' AND column_name='file_type'
    ) THEN
        ALTER TABLE messages ADD COLUMN file_type TEXT;
    END IF;
END
$$;

-- Optional: create index on file_url for faster retrieval if needed
CREATE INDEX IF NOT EXISTS idx_messages_file_url ON messages(file_url);
