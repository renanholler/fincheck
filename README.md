# 💰 Fincheck

**Fincheck** é uma aplicação completa de controle financeiro pessoal, permitindo que usuários gerenciem suas receitas, despesas e contas bancárias de forma simples e intuitiva.

<img width="49%" alt="login" src="https://github.com/user-attachments/assets/518ad5a1-c0a0-43c4-8095-69f8ed65c890" />
<img width="49%" alt="dashboard" src="https://github.com/user-attachments/assets/2d792aae-3bc4-4863-bbb1-680460561a80" />


---

## ✨ Funcionalidades

- ✅ Cadastro e gerenciamento de receitas e despesas
- ✅ Categorização de transações
- ✅ Filtros avançados por período, categoria e tipo
- ✅ Dashboard com visão geral das finanças
- ✅ Cadastro de múltiplas contas bancárias
- ✅ Acompanhamento de saldo em tempo real
- ✅ Sistema de autenticação JWT
- ✅ Dados isolados por usuário

---

## 🚀 Tecnologias

### Backend (API)

- **[NestJS](https://nestjs.com/)** - Framework Node.js opinado e modular
- **[Prisma](https://www.prisma.io/)** - ORM moderno para TypeScript
- **[PostgreSQL](https://www.postgresql.org/)** - Banco de dados relacional
- **[JWT](https://jwt.io/)** - Autenticação stateless

### Frontend

- **[React](https://react.dev/)** - Biblioteca para interfaces
- **[TypeScript](https://www.typescriptlang.org/)** - JavaScript com tipagem
- **[Vite](https://vitejs.dev/)** - Build tool moderna
- **[React Query](https://tanstack.com/query)** - Gerenciamento de estado
- **[Tailwind CSS](https://tailwindcss.com/)** - Framework CSS utility-first
- **[shadcn/ui](https://ui.shadcn.com/)** - Componentes reutilizáveis

### DevOps

- **[Docker](https://www.docker.com/)** - Containerização
- **[Docker Compose](https://docs.docker.com/compose/)** - Orquestração

---

## 🏗️ Arquitetura

<img width="100%" alt="arc" src="https://github.com/user-attachments/assets/2e8666f5-5a24-41a3-95f8-a75bd0443c2f" />


### Repositórios

Este é um **monorepo** que centraliza a orquestração. Os códigos são mantidos em repositórios separados com **Git Submodules**:

- **[fincheck_api](https://github.com/renanholler/fincheck_api)** - Backend (API REST)
- **[fincheck_frontend](https://github.com/renanholler/fincheck_frontend)** - Frontend (SPA)

Para mais detalhes sobre a arquitetura, veja [docs/architecture.md](./docs/architecture.md).

---

## 🚀 Como Executar

### Pré-requisitos

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Git](https://git-scm.com/)

### Instalação

```bash
# Clone o repositório com os submodules
git clone --recurse-submodules https://github.com/renanholler/fincheck.git
cd fincheck

# Inicie os containers
docker-compose up -d

# Aguarde ~1 minuto para os serviços iniciarem
```

Pronto! A aplicação estará disponível em:

- 🎨 **Frontend**: http://localhost:5173
- 🔌 **API**: http://localhost:3000
- 🗄️ **PostgreSQL**: localhost:5432

---

## 💻 Comandos Úteis

### Makefile

```bash
make help              # Ver todos os comandos
make up                # Iniciar containers
make down              # Parar containers
make logs              # Ver logs
make clean             # Resetar banco de dados
make prisma-studio     # Abrir Prisma Studio
```

---

## 📁 Estrutura do Projeto

```
fincheck/
├── api/                  # Backend (Git Submodule)
├── frontend/             # Frontend (Git Submodule)
├── docs/                 # Documentação
│   └── architecture.md   # Arquitetura técnica
├── scripts/              # Scripts de automação
│   └── setup.sh          # Setup inicial
├── docker-compose.yml    # Orquestração Docker
├── Makefile              # Comandos úteis
├── .env.example          # Template de variáveis
└── README.md             # Este arquivo
```

