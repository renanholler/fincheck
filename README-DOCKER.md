# Fincheck - Docker Setup (Desenvolvimento)

Configuração simples do Docker para rodar o Fincheck localmente em ambiente de desenvolvimento.

## 📋 Pré-requisitos

- [Docker](https://www.docker.com/get-started) instalado
- [Docker Compose](https://docs.docker.com/compose/install/) instalado

## 🚀 Como usar

### Iniciar o projeto

```bash
# Subir todos os serviços
docker-compose up

# Ou em background
docker-compose up -d
```

Os serviços estarão disponíveis em:
- **Frontend**: http://localhost:5173
- **API**: http://localhost:3000
- **PostgreSQL**: localhost:5432

### Parar os serviços

```bash
# Parar os containers
docker-compose down

# Parar e remover volumes (apaga o banco de dados)
docker-compose down -v
```

### Reconstruir as imagens

Se você atualizou dependências no `package.json`:

```bash
docker-compose up --build
```

### Ver logs

```bash
# Todos os serviços
docker-compose logs -f

# Serviço específico
docker-compose logs -f api
docker-compose logs -f frontend
docker-compose logs -f postgres
```

## 🏗️ Serviços

### 1. PostgreSQL
- Imagem: `postgres:16-alpine`
- Porta: `5432`
- Credenciais:
  - User: `fincheck`
  - Password: `fincheck`
  - Database: `fincheck`

### 2. API (Backend)
- Framework: NestJS
- Porta: `3000`
- Hot-reload ativo ✨
- Migrations do Prisma executadas automaticamente

### 3. Frontend
- Framework: React + Vite
- Porta: `5173`
- Hot-reload ativo ✨

## 🔧 Prisma

### Migrations

As migrations são executadas automaticamente ao iniciar a API. Para executar manualmente:

```bash
# Entrar no container da API
docker-compose exec api sh

# Executar migrations
pnpm prisma migrate deploy

# Criar uma nova migration
pnpm prisma migrate dev --name nome_da_migration
```

### Prisma Studio

Para visualizar e editar os dados do banco:

```bash
# Entrar no container da API
docker-compose exec api sh

# Executar o Prisma Studio
pnpm prisma studio
```

Acesse em http://localhost:5555

## 🐛 Troubleshooting

### Porta já em uso

Modifique as portas no `docker-compose.yml`:

```yaml
ports:
  - "NOVA_PORTA:PORTA_CONTAINER"
```

### API não inicia

Verifique se o PostgreSQL está healthy:

```bash
docker-compose ps
docker-compose logs postgres
```

### Limpar tudo e recomeçar

```bash
# Remove containers, volumes e imagens
docker-compose down -v
docker-compose up --build
```

### Permissões (Linux/Mac)

```bash
sudo chown -R $USER:$USER .
```

## 📚 Comandos úteis

```bash
# Ver status dos containers
docker-compose ps

# Reiniciar um serviço
docker-compose restart api

# Executar comandos no container
docker-compose exec api sh
docker-compose exec frontend sh

# Ver uso de recursos
docker stats

# Limpar containers não utilizados
docker system prune -a
```

## 💡 Dicas

- Os volumes estão configurados para refletir mudanças no código instantaneamente
- O `node_modules` de cada serviço fica isolado no container
- O banco de dados persiste entre restarts (use `down -v` para resetar)
- Para instalar novas dependências, reconstrua a imagem com `--build`
