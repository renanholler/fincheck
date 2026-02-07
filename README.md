# 💰 Fincheck

**Fincheck** é uma aplicação completa de controle financeiro pessoal, permitindo que usuários gerenciem suas receitas, despesas, contas bancárias e cartões de crédito de forma simples e intuitiva.

<div align="center">
  
[![API](https://img.shields.io/badge/API-NestJS-E0234E?logo=nestjs)](https://github.com/renanholler/fincheck_api)
[![Frontend](https://img.shields.io/badge/Frontend-React-61DAFB?logo=react)](https://github.com/renanholler/fincheck_frontend)
[![Database](https://img.shields.io/badge/Database-PostgreSQL-316192?logo=postgresql)](https://www.postgresql.org/)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker)](./docker-compose.yml)

</div>

---

## 📋 Índice

- [Sobre o Projeto](#-sobre-o-projeto)
- [Funcionalidades](#-funcionalidades)
- [Tecnologias](#-tecnologias)
- [Arquitetura](#-arquitetura)
- [Começando](#-começando)
- [Desenvolvimento](#-desenvolvimento)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Documentação](#-documentação)
- [Contribuindo](#-contribuindo)
- [Licença](#-licença)

---

## 🎯 Sobre o Projeto

O Fincheck é uma solução moderna para gestão financeira pessoal, desenvolvida com as melhores práticas e tecnologias atuais do mercado. O projeto foi construído com foco em:

- **Segurança**: Autenticação JWT, validação de dados e proteção contra vulnerabilidades
- **Performance**: Otimizações de queries, cache e carregamento lazy
- **Experiência do Usuário**: Interface moderna, responsiva e intuitiva
- **Escalabilidade**: Arquitetura modular e containerizada

---

## ✨ Funcionalidades

### Gestão Financeira
- ✅ Cadastro e gerenciamento de receitas e despesas
- ✅ Categorização de transações
- ✅ Filtros avançados por período, categoria e tipo
- ✅ Dashboard com visão geral das finanças

### Contas Bancárias
- ✅ Cadastro de múltiplas contas (conta corrente, poupança, investimentos)
- ✅ Acompanhamento de saldo em tempo real
- ✅ Histórico de transações por conta

### Autenticação e Segurança
- ✅ Sistema de cadastro e login
- ✅ Autenticação JWT
- ✅ Proteção de rotas
- ✅ Dados isolados por usuário

---

## 🚀 Tecnologias

### Backend (API)
- **[NestJS](https://nestjs.com/)** - Framework Node.js progressivo
- **[Prisma](https://www.prisma.io/)** - ORM moderno para TypeScript
- **[PostgreSQL](https://www.postgresql.org/)** - Banco de dados relacional
- **[JWT](https://jwt.io/)** - Autenticação stateless
- **[Bcrypt](https://github.com/kelektiv/node.bcrypt.js)** - Hash de senhas
- **[Class Validator](https://github.com/typestack/class-validator)** - Validação de dados

### Frontend
- **[React](https://react.dev/)** - Biblioteca para interfaces
- **[TypeScript](https://www.typescriptlang.org/)** - Superset JavaScript com tipagem
- **[Vite](https://vitejs.dev/)** - Build tool moderna e rápida
- **[React Query](https://tanstack.com/query)** - Gerenciamento de estado server
- **[React Hook Form](https://react-hook-form.com/)** - Formulários performáticos
- **[Tailwind CSS](https://tailwindcss.com/)** - Framework CSS utility-first
- **[Radix UI](https://www.radix-ui.com/)** - Componentes acessíveis

### DevOps & Infraestrutura
- **[Docker](https://www.docker.com/)** - Containerização
- **[Docker Compose](https://docs.docker.com/compose/)** - Orquestração local
- **[pnpm](https://pnpm.io/)** - Gerenciador de pacotes eficiente

---

## 🏗️ Arquitetura

O Fincheck segue uma arquitetura **Client-Server** com separação clara de responsabilidades:

```
┌─────────────────────────────────────────────────────────────┐
│                         Frontend                             │
│                     (React + Vite)                          │
│                      Port: 5173                             │
└────────────────────┬────────────────────────────────────────┘
                     │ HTTP/REST
                     │
┌────────────────────▼────────────────────────────────────────┐
│                          API                                 │
│                    (NestJS + Prisma)                        │
│                      Port: 3000                             │
└────────────────────┬────────────────────────────────────────┘
                     │ Prisma ORM
                     │
┌────────────────────▼────────────────────────────────────────┐
│                      PostgreSQL                              │
│                      Port: 5432                             │
└─────────────────────────────────────────────────────────────┘
```

### Repositórios

Este é um **monorepo** que centraliza a documentação e orquestração, com os códigos mantidos em repositórios separados:

- **[fincheck_api](https://github.com/renanholler/fincheck_api)** - Backend (API REST)
- **[fincheck_frontend](https://github.com/renanholler/fincheck_frontend)** - Frontend (SPA)

Os repositórios são incluídos como **Git Submodules**, permitindo desenvolvimento independente enquanto mantém a sincronização.

---

## 🚀 Começando

### Pré-requisitos

- [Docker](https://www.docker.com/get-started) >= 20.10
- [Docker Compose](https://docs.docker.com/compose/install/) >= 2.0
- [Git](https://git-scm.com/) >= 2.30

### Instalação Rápida

```bash
# Clone o repositório com os submodules
git clone --recurse-submodules https://github.com/renanholler/fincheck.git
cd fincheck

# Ou se já clonou sem os submodules
git submodule update --init --recursive

# Inicie os containers
docker-compose up -d

# Aguarde os serviços iniciarem (pode levar 1-2 minutos na primeira vez)
```

Pronto! A aplicação estará disponível em:
- 🎨 **Frontend**: http://localhost:5173
- 🔌 **API**: http://localhost:3000
- 🗄️ **PostgreSQL**: localhost:5432

### Verificar Status

```bash
# Ver logs dos serviços
docker-compose logs -f

# Ver status dos containers
docker-compose ps
```

---

## 💻 Desenvolvimento

### Estrutura de Pastas

```
fincheck/
├── api/                  # Backend (Git Submodule)
├── frontend/             # Frontend (Git Submodule)
├── docs/                 # Documentação técnica
├── scripts/              # Scripts de automação
├── .github/              # GitHub Actions (CI/CD)
├── docker-compose.yml    # Orquestração Docker
├── README.md            # Este arquivo
└── README-DOCKER.md     # Guia Docker detalhado
```

### Comandos Úteis

#### Docker

```bash
# Iniciar em modo desenvolvimento (com logs)
docker-compose up

# Iniciar em background
docker-compose up -d

# Parar containers
docker-compose down

# Resetar banco de dados
docker-compose down -v

# Reconstruir imagens
docker-compose up --build

# Ver logs específicos
docker-compose logs -f api
docker-compose logs -f frontend
```

#### Submodules

```bash
# Atualizar todos os submodules para o último commit
git submodule update --remote

# Entrar em um submodule para fazer commits
cd api
git checkout main
# ... fazer alterações ...
git add . && git commit -m "feat: nova feature"
git push

# Voltar ao monorepo e atualizar a referência
cd ..
git add api
git commit -m "chore: update api submodule"
```

#### Desenvolvimento Local (sem Docker)

Se preferir rodar localmente sem Docker, consulte os READMEs específicos:
- [API - Setup Local](./api/README.md)
- [Frontend - Setup Local](./frontend/README.md)

---

## 📁 Estrutura do Projeto

### Backend (API)

```
api/
├── prisma/              # Schema e migrations do banco
├── src/
│   ├── modules/         # Módulos da aplicação
│   │   ├── auth/        # Autenticação e autorização
│   │   ├── users/       # Gestão de usuários
│   │   ├── categories/  # Categorias de transações
│   │   ├── bank-accounts/ # Contas bancárias
│   │   └── transactions/  # Receitas e despesas
│   ├── shared/          # Código compartilhado
│   └── main.ts         # Entry point
└── package.json
```

### Frontend

```
frontend/
├── public/             # Assets estáticos
├── src/
│   ├── app/           # Rotas e páginas
│   ├── view/          # Componentes de UI
│   │   ├── components/ # Componentes reutilizáveis
│   │   └── pages/     # Páginas da aplicação
│   ├── lib/           # Utilitários e configurações
│   └── main.tsx       # Entry point
└── package.json
```

---

## 📚 Documentação

Para documentação mais detalhada, consulte:

- **[Guia Docker](./README-DOCKER.md)** - Setup e troubleshooting do Docker
- **[Documentação da API](./docs/api.md)** - Endpoints e contratos (em breve)
- **[Guia de Contribuição](./docs/contributing.md)** - Como contribuir (em breve)
- **[Arquitetura](./docs/architecture.md)** - Decisões técnicas (em breve)

---

## 🤝 Contribuindo

Contribuições são bem-vindas! Para contribuir:

1. Fork o repositório
2. Crie uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'feat: adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abra um Pull Request

### Convenções de Commit

Seguimos o padrão [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` Nova funcionalidade
- `fix:` Correção de bug
- `docs:` Documentação
- `style:` Formatação (não afeta lógica)
- `refactor:` Refatoração de código
- `test:` Testes
- `chore:` Tarefas de build/config

---

## 📄 Licença

Este projeto é para fins educacionais e de portfólio.

---

## 👤 Autor

**Renan Holler**

- GitHub: [@renanholler](https://github.com/renanholler)
- LinkedIn: [Renan Holler](https://www.linkedin.com/in/renanholler)

---

## 🙏 Agradecimentos

Projeto desenvolvido durante o bootcamp da [JStack](https://jstack.com.br/).

---

<div align="center">
  Feito com ❤️ por Renan Holler
</div>
