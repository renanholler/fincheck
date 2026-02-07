# 🚀 Quick Start - Fincheck

Guia rápido para começar a usar o Fincheck em menos de 5 minutos!

## ⚡ Início Rápido (Docker)

```bash
# 1. Clone o repositório
git clone --recurse-submodules https://github.com/renanholler/fincheck.git
cd fincheck

# 2. Execute o script de setup
./scripts/setup.sh

# 3. Pronto! Acesse:
# http://localhost:5173 (Frontend)
# http://localhost:3000 (API)
```

## 🛠️ Setup Manual

Se preferir fazer passo a passo:

```bash
# 1. Clone com submodules
git clone --recurse-submodules https://github.com/renanholler/fincheck.git
cd fincheck

# 2. Inicie o Docker Compose
docker-compose up -d

# 3. Aguarde ~1 minuto para os serviços iniciarem
docker-compose logs -f
```

## 📱 Primeiro Acesso

1. Abra http://localhost:5173
2. Clique em "Criar conta"
3. Preencha seus dados
4. Faça login
5. Comece a gerenciar suas finanças!

## 🔧 Comandos Úteis

```bash
# Ver logs em tempo real
docker-compose logs -f

# Parar aplicação
docker-compose down

# Resetar banco de dados
docker-compose down -v && docker-compose up -d

# Ver status dos serviços
docker-compose ps

# Atualizar submodules
./scripts/update-submodules.sh
```

## 🐛 Problemas Comuns

### Porta já em uso

```bash
# Verifique o que está usando a porta
lsof -i :5173  # Frontend
lsof -i :3000  # API
lsof -i :5432  # PostgreSQL

# Ou altere as portas no docker-compose.yml
```

### Submodules vazios

```bash
git submodule update --init --recursive
```

### Containers não iniciam

```bash
# Limpe tudo e comece do zero
docker-compose down -v
docker system prune -a
docker-compose up --build
```

## 📚 Próximos Passos

- Leia o [README completo](./README.md)
- Veja a [Arquitetura do projeto](./docs/architecture.md)
- Confira o [Guia de contribuição](./docs/contributing.md)
- Explore o [Guia Docker detalhado](./README-DOCKER.md)

## 💬 Ajuda

Encontrou algum problema? 

- Abra uma [issue no GitHub](https://github.com/renanholler/fincheck/issues)
- Consulte a [documentação completa](./README.md)

---

**Bom uso! 🎉**
