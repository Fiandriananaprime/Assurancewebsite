-- Assurance MAMA Database Initialization Script
-- Run this script to create all tables and initial data

-- 1. Extensions and Enums
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE user_role AS ENUM ('client', 'employee', 'admin');
CREATE TYPE contract_type AS ENUM ('auto', 'habitation', 'sante', 'moto');
CREATE TYPE contract_status AS ENUM ('actif', 'expire', 'en_attente', 'annule');
CREATE TYPE incident_status AS ENUM ('en_cours', 'traite', 'en_attente');
CREATE TYPE incident_severity AS ENUM ('leger', 'moyen', 'eleve');
CREATE TYPE quote_status AS ENUM ('envoye', 'en_attente', 'accepte', 'refuse', 'expire');
CREATE TYPE feedback_status AS ENUM ('nouveau', 'en_cours', 'traite', 'urgent');
CREATE TYPE content_status AS ENUM ('brouillon', 'publie', 'programme');

-- 2. Tables Utilisateurs et Profils
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    role user_role NOT NULL DEFAULT 'client',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS profiles (
    user_id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    phone TEXT,
    address TEXT,
    birth_date DATE,
    profile_image_url TEXT,
    loyalty_score INTEGER DEFAULT 50,
    risk_level TEXT DEFAULT 'medium',
    notes TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    join_date DATE DEFAULT CURRENT_DATE
);

-- 3. Gestion des Contrats et Devis
CREATE TABLE IF NOT EXISTS quotes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    reference TEXT UNIQUE NOT NULL,
    client_id UUID REFERENCES users(id),
    type contract_type NOT NULL,
    status quote_status DEFAULT 'en_attente',
    amount DECIMAL(10,2) NOT NULL,
    deductible DECIMAL(10,2),
    coverage_details TEXT,
    validity_days INTEGER DEFAULT 30,
    vehicle_details JSONB,
    property_details JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS contracts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    policy_number TEXT UNIQUE NOT NULL,
    client_id UUID NOT NULL REFERENCES users(id),
    quote_id UUID REFERENCES quotes(id),
    type contract_type NOT NULL,
    status contract_status DEFAULT 'actif',
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    annual_amount DECIMAL(10,2) NOT NULL,
    deductible DECIMAL(10,2) NOT NULL,
    coverage TEXT NOT NULL,
    payment_method TEXT DEFAULT 'mensuel',
    vehicle_info JSONB,
    property_info JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 4. Gestion des Sinistres (Incidents)
CREATE TABLE IF NOT EXISTS incidents (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    reference TEXT UNIQUE NOT NULL,
    contract_id UUID NOT NULL REFERENCES contracts(id),
    client_id UUID NOT NULL REFERENCES users(id),
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    date DATE NOT NULL,
    time TIME,
    location TEXT,
    type contract_type NOT NULL,
    severity incident_severity DEFAULT 'moyen',
    status incident_status DEFAULT 'en_cours',
    estimated_cost DECIMAL(12,2),
    assigned_employee_id UUID REFERENCES users(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 5. Documents, Feedback et Blog
CREATE TABLE IF NOT EXISTS documents (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    file_url TEXT NOT NULL,
    file_type TEXT,
    file_size TEXT,
    entity_type TEXT NOT NULL,
    entity_id UUID NOT NULL,
    uploaded_by UUID REFERENCES users(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS feedbacks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    client_id UUID REFERENCES users(id),
    subject TEXT NOT NULL,
    message TEXT NOT NULL,
    rating INTEGER CHECK (rating >= 0 AND rating <= 5),
    category TEXT,
    source TEXT,
    status feedback_status DEFAULT 'nouveau',
    is_responded BOOLEAN DEFAULT FALSE,
    public_quote BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS content (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    type TEXT NOT NULL,
    title TEXT NOT NULL,
    excerpt TEXT,
    content TEXT,
    author_id UUID REFERENCES users(id),
    category TEXT,
    image_url TEXT,
    status content_status DEFAULT 'publie',
    event_date DATE,
    location TEXT,
    read_time TEXT,
    views_count INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 6. Messagerie
CREATE TABLE IF NOT EXISTS conversations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    participant_one UUID REFERENCES users(id),
    participant_two UUID REFERENCES users(id),
    type TEXT DEFAULT 'client',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS messages (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    conversation_id UUID REFERENCES conversations(id) ON DELETE CASCADE,
    sender_id UUID REFERENCES users(id),
    content TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    file_url TEXT,
    file_type TEXT,
    reactions JSONB DEFAULT '[]'::jsonb,
    removed_for JSONB DEFAULT '[]'::jsonb,
    deleted BOOLEAN DEFAULT FALSE,
    reply_to UUID REFERENCES messages(id) ON DELETE SET NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Indexes for better performance
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);
CREATE INDEX IF NOT EXISTS idx_contracts_client_id ON contracts(client_id);
CREATE INDEX IF NOT EXISTS idx_contracts_status ON contracts(status);
CREATE INDEX IF NOT EXISTS idx_incidents_contract_id ON incidents(contract_id);
CREATE INDEX IF NOT EXISTS idx_incidents_client_id ON incidents(client_id);
CREATE INDEX IF NOT EXISTS idx_incidents_status ON incidents(status);
CREATE INDEX IF NOT EXISTS idx_quotes_client_id ON quotes(client_id);
CREATE INDEX IF NOT EXISTS idx_messages_conversation_id ON messages(conversation_id);
CREATE INDEX IF NOT EXISTS idx_messages_created_at ON messages(created_at);
CREATE INDEX IF NOT EXISTS idx_conversations_participants ON conversations(participant_one, participant_two);

-- 7. Insert default admin user (password: admin123)
INSERT INTO users (email, password_hash, role) 
VALUES (
  'admin@assurance-mama.com',
  '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj8YKFqUu2tG',
  'admin'
) ON CONFLICT (email) DO NOTHING;

INSERT INTO profiles (user_id, first_name, last_name, phone, address)
SELECT id, 'Admin', 'MAMA', '+261 34 00 000 00', 'Antananarivo, Madagascar'
FROM users WHERE email = 'admin@assurance-mama.com'
ON CONFLICT (user_id) DO NOTHING;

-- 8. Insert sample data (optional - comment out in production)
-- Sample employee
-- INSERT INTO users (email, password_hash, role) 
-- VALUES (
--   'employee@assurance-mama.com',
--   '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj8YKFqUu2tG',
--   'employee'
-- ) ON CONFLICT (email) DO NOTHING;

-- INSERT INTO profiles (user_id, first_name, last_name, phone)
-- SELECT id, 'Employee', 'MAMA', '+261 34 00 000 01'
-- FROM users WHERE email = 'employee@assurance-mama.com'
-- ON CONFLICT (user_id) DO NOTHING;

-- Note: The password hash above is for 'password123'
-- In production, users should change their passwords immediately