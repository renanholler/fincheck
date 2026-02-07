.PHONY: help setup up down clean logs build update-submodules

# Colors for output
GREEN  := \033[0;32m
YELLOW := \033[0;33m
NC     := \033[0m # No Color

help: ## Mostra esta ajuda
	@echo "$(GREEN)Fincheck - Comandos Disponíveis$(NC)"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-20s$(NC) %s\n", $$1, $$2}'

setup: ## Setup inicial do projeto
	@echo "$(GREEN)Executando setup inicial...$(NC)"
	@./scripts/setup.sh

up: ## Inicia os containers em foreground
	@echo "$(GREEN)Iniciando containers...$(NC)"
	@docker-compose up

up-d: ## Inicia os containers em background
	@echo "$(GREEN)Iniciando containers em background...$(NC)"
	@docker-compose up -d

down: ## Para os containers
	@echo "$(YELLOW)Parando containers...$(NC)"
	@docker-compose down

clean: ## Para containers e remove volumes (RESETA O BANCO!)
	@echo "$(YELLOW)⚠️  Removendo containers e volumes...$(NC)"
	@docker-compose down -v

build: ## Reconstrói as imagens
	@echo "$(GREEN)Reconstruindo imagens...$(NC)"
	@docker-compose up --build

rebuild: ## Limpa tudo e reconstrói do zero
	@echo "$(YELLOW)Limpando e reconstruindo...$(NC)"
	@docker-compose down -v
	@docker-compose up --build

logs: ## Mostra logs de todos os serviços
	@docker-compose logs -f

logs-api: ## Mostra logs da API
	@docker-compose logs -f api

logs-frontend: ## Mostra logs do Frontend
	@docker-compose logs -f frontend

logs-db: ## Mostra logs do PostgreSQL
	@docker-compose logs -f postgres

ps: ## Status dos containers
	@docker-compose ps

update-submodules: ## Atualiza os submodules
	@echo "$(GREEN)Atualizando submodules...$(NC)"
	@./scripts/update-submodules.sh

shell-api: ## Acessa o shell do container da API
	@docker-compose exec api sh

shell-frontend: ## Acessa o shell do container do Frontend
	@docker-compose exec frontend sh

shell-db: ## Acessa o shell do PostgreSQL
	@docker-compose exec postgres psql -U fincheck -d fincheck

prisma-studio: ## Abre o Prisma Studio
	@docker-compose exec api pnpm prisma studio

prisma-migrate: ## Executa as migrations do Prisma
	@docker-compose exec api pnpm prisma migrate deploy

install: ## Instala as dependências localmente (sem Docker)
	@echo "$(GREEN)Instalando dependências...$(NC)"
	@cd api && pnpm install
	@cd frontend && pnpm install

dev-api: ## Roda a API localmente (sem Docker)
	@cd api && pnpm run start:dev

dev-frontend: ## Roda o Frontend localmente (sem Docker)
	@cd frontend && pnpm run dev
