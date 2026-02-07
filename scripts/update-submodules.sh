#!/bin/bash

# Script para atualizar todos os submodules

set -e

echo "🔄 Atualizando submodules..."
echo ""

# Atualizar API
echo "📦 Atualizando API..."
cd api
git checkout main
git pull origin main
cd ..
echo "✅ API atualizada"
echo ""

# Atualizar Frontend
echo "📦 Atualizando Frontend..."
cd frontend
git checkout main
git pull origin main
cd ..
echo "✅ Frontend atualizado"
echo ""

# Atualizar referências no monorepo
echo "📝 Atualizando referências no monorepo..."
git add api frontend
git status

echo ""
echo "✅ Submodules atualizados!"
echo ""
echo "💡 Para commitar as atualizações:"
echo "   git commit -m 'chore: update submodules'"
echo "   git push"
echo ""
