-- Migration: add reactions, removed_for, deleted flag and reply_to to messages
DO $$
BEGIN
    -- reactions JSONB array
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name='messages' AND column_name='reactions'
    ) THEN
        ALTER TABLE messages ADD COLUMN reactions JSONB DEFAULT '[]'::jsonb;
    END IF;

    -- removed_for JSONB array of user ids
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name='messages' AND column_name='removed_for'
    ) THEN
        ALTER TABLE messages ADD COLUMN removed_for JSONB DEFAULT '[]'::jsonb;
    END IF;

    -- deleted flag (logical delete for everyone)
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name='messages' AND column_name='deleted'
    ) THEN
        ALTER TABLE messages ADD COLUMN deleted BOOLEAN DEFAULT FALSE;
    END IF;

    -- reply_to references messages.id
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name='messages' AND column_name='reply_to'
    ) THEN
        ALTER TABLE messages ADD COLUMN reply_to UUID REFERENCES messages(id) ON DELETE SET NULL;
    END IF;
END
$$;

CREATE INDEX IF NOT EXISTS idx_messages_reactions ON messages USING gin (reactions);
CREATE INDEX IF NOT EXISTS idx_messages_removed_for ON messages USING gin (removed_for);
