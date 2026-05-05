CREATE TABLE IF NOT EXISTS message_ai_delegations (
    conversation_id UUID PRIMARY KEY REFERENCES conversations(id) ON DELETE CASCADE,
    client_id UUID REFERENCES users(id) ON DELETE CASCADE,
    employee_id UUID REFERENCES users(id) ON DELETE SET NULL,
    enabled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_message_ai_delegations_client_id
ON message_ai_delegations(client_id);

CREATE INDEX IF NOT EXISTS idx_message_ai_delegations_enabled
ON message_ai_delegations(enabled);
