#!/bin/bash

# Script para setup inicial do projeto Fincheck

set -e

echo "🚀 Fincheck - Setup Inicial"
echo "=============================="
echo ""

# Verificar Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker não encontrado. Por favor, instale o Docker primeiro."
    echo "   https://www.docker.com/get-started"
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose não encontrado. Por favor, instale o Docker Compose."
    exit 1
fi

echo "✅ Docker e Docker Compose encontrados"
echo ""

# Verificar submodules
echo "📦 Verificando submodules..."
if [ ! -d "api/.git" ] || [ ! -d "frontend/.git" ]; then
    echo "⚠️  Submodules não inicializados. Inicializando..."
    git submodule update --init --recursive
else
    echo "✅ Submodules já inicializados"
fi
echo ""

# Criar arquivo .env se não existir
if [ ! -f ".env" ]; then
    echo "📝 Criando arquivo .env..."
    cp .env.example .env
    echo "✅ Arquivo .env criado. Edite-o com suas configurações."
else
    echo "✅ Arquivo .env já existe"
fi
echo ""

# Criar arquivo .env na API se não existir
if [ ! -f "api/.env" ]; then
    echo "📝 Criando arquivo .env na API..."
    if [ -f "api/.env.example" ]; then
        cp api/.env.example api/.env
        echo "✅ Arquivo api/.env criado"
    else
        echo "⚠️  api/.env.example não encontrado. Crie manualmente o arquivo api/.env"
    fi
else
    echo "✅ Arquivo api/.env já existe"
fi
echo ""

# Iniciar containers
echo "🐳 Iniciando containers Docker..."
docker-compose up -d

echo ""
echo "⏳ Aguardando serviços iniciarem..."
sleep 5

echo ""
echo "✅ Setup completo!"
echo ""
echo "🎉 Aplicação disponível em:"
echo "   Frontend: http://localhost:5173"
echo "   API: http://localhost:3000"
echo "   PostgreSQL: localhost:5432"
echo ""
echo "📋 Comandos úteis:"
echo "   docker-compose logs -f       # Ver logs"
echo "   docker-compose ps            # Status dos containers"
echo "   docker-compose down          # Parar containers"
echo "   docker-compose down -v       # Parar e resetar banco"
echo ""
