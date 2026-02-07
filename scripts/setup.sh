#!/bin/bash

# Fincheck initial setup script

set -e

echo "🚀 Fincheck - Initial Setup"
echo "=============================="
echo ""

# Check Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker not found. Please install Docker first:"
    echo "   https://www.docker.com/get-started"
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose not found. Please install Docker Compose."
    exit 1
fi

echo "✅ Docker and Docker Compose detected"
echo ""

# Check submodules
echo "📦 Checking submodules..."
if [ ! -d "api/.git" ] || [ ! -d "frontend/.git" ]; then
    echo "⚠️  Submodules not initialized. Initializing..."
    git submodule update --init --recursive
else
    echo "✅ Submodules already initialized"
fi
echo ""

# Create .env file if not exists
if [ ! -f ".env" ]; then
    echo "📝 Creating .env file..."
    cp .env.example .env
    echo "✅ .env file created. Update it with your environment variables."
else
    echo "✅ .env file already exists"
fi
echo ""

# Create API .env if not exists
if [ ! -f "api/.env" ]; then
    echo "📝 Creating API .env file..."
    if [ -f "api/.env.example" ]; then
        cp api/.env.example api/.env
        echo "✅ api/.env file created"
    else
        echo "⚠️  api/.env.example not found. Please create api/.env manually."
    fi
else
    echo "✅ api/.env file already exists"
fi
echo ""

# Start containers
echo "🐳 Starting Docker containers..."
docker-compose up -d

echo ""
echo "⏳ Waiting for services to start..."
sleep 5

echo ""
echo "✅ Setup completed!"
echo ""
echo "🎉 Application available at:"
echo "   Frontend: http://localhost:5173"
echo "   API: http://localhost:3000"
echo "   PostgreSQL: localhost:5432"
echo ""
echo "📋 Useful commands:"
echo "   docker-compose logs -f       # View logs"
echo "   docker-compose ps            # Container status"
echo "   docker-compose down          # Stop containers"
echo "   docker-compose down -v       # Stop and reset database"
echo ""
