#!/bin/bash

# Assurance MAMA Backend Setup Script
# This script helps set up the backend environment

echo "🚀 Assurance MAMA Backend Setup"
echo "================================"

# Check if .env exists
if [ ! -f .env ]; then
    echo "📝 Creating .env file from .env.example..."
    cp .env.example .env
    echo "✅ .env file created. Please update the database credentials in .env file."
else
    echo "✅ .env file already exists."
fi

# Create necessary directories
echo "📁 Creating directories..."
mkdir -p uploads
mkdir -p logs
echo "✅ Directories created."

# Install dependencies
echo "📦 Installing dependencies..."
npm install
echo "✅ Dependencies installed."

# Database setup instructions
echo ""
echo "🗄️  Database Setup Instructions:"
echo "--------------------------------"
echo "1. Create PostgreSQL database:"
echo "   createdb assurance_mama"
echo ""
echo "2. Run the database initialization script:"
echo "   psql -U postgres -d assurance_mama -f database/init.sql"
echo ""
echo "   Or manually run the SQL commands in database/init.sql"
echo ""

# Check if database is set up
read -p "Have you set up the database? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    echo "🎉 Setup complete!"
    echo ""
    echo "To start the server:"
    echo "  npm run dev    (development mode)"
    echo "  npm start      (production mode)"
    echo ""
    echo "Default admin credentials:"
    echo "  Email: admin@assurance-mama.com"
    echo "  Password: password123"
    echo ""
    echo "⚠️  Please change the admin password after first login!"
else
    echo "Please set up the database first before starting the server."
    exit 1
fi