<div align="center">
  <image height="32em" src="https://img.shields.io/badge/nestjs-E0234E?style=for-the-badge&logo=nestjs&logoColor=white" />
  <image height="32em" src="https://img.shields.io/badge/Prisma-3982CE?style=for-the-badge&logo=Prisma&logoColor=white"/>
  <image height="32em" src="https://img.shields.io/badge/Vite-646CFF?style=for-the-badge&logo=Vite&logoColor=white" />
  <image height="32em" src="https://shields.io/badge/react-black?logo=react&style=for-the-badge" />
  <image height="32em" src="https://img.shields.io/badge/Tailwind_CSS-grey?style=for-the-badge&logo=tailwind-css&logoColor=38B2AC" />
</div>


💰 **Fincheck** is a full-stack personal finance management application that helps users track income, expenses and bank accounts through a clean and intuitive interface.
Built to simulate real-world financial workflows while applying modern full-stack architecture and best practices.

<img width="49%" alt="login" src="https://github.com/user-attachments/assets/518ad5a1-c0a0-43c4-8095-69f8ed65c890" />
<img width="49%" alt="dashboard" src="https://github.com/user-attachments/assets/2d792aae-3bc4-4863-bbb1-680460561a80" />

---

## ✨ Features

* Income and expense management
* Transaction categorization
* Advanced filters by period, category and type
* Financial dashboard overview
* Multiple bank accounts support
* Real-time balance tracking
* JWT authentication
* User-isolated data

---

## 🚀 Technologies

### Backend (API)

* NestJS
* Prisma
* PostgreSQL
* JWT

### Frontend

* React
* TypeScript
* Vite
* React Query
* Tailwind CSS
* shadcn/ui

### DevOps

* Docker
* Docker Compose

---

## 🏗️ Architecture

<img width="100%" alt="arc" src="https://github.com/user-attachments/assets/2e8666f5-5a24-41a3-95f8-a75bd0443c2f" />

### Repositories

This is a **monorepo** that centralizes orchestration. The code is maintained in separate repositories using **Git Submodules**:

* **fincheck_api** – Backend (REST API)
* **fincheck_frontend** – Frontend (SPA)

For more details, see `docs/architecture.md`.

---

## 🚀 Running Locally

### Requirements

* Docker
* Docker Compose
* Git

### Installation

```bash
git clone --recurse-submodules https://github.com/renanholler/fincheck.git
cd fincheck

docker-compose up -d
```

After startup:

* Frontend: [http://localhost:5173](http://localhost:5173)
* API: [http://localhost:3000](http://localhost:3000)
* PostgreSQL: localhost:5432

---

## 🛠 Useful Commands

```bash
make help
make up
make down
make logs
make clean
make prisma-studio
```

---

## 📁 Project Structure

```
fincheck/
├── api/
├── frontend/
├── docs/
├── scripts/
├── docker-compose.yml
├── Makefile
├── .env.example
└── README.md
```
