# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**鸣沙管理平台** (Mingsha Management Platform) is an enterprise management system forked from RuoYi. It is a front-end/back-end separated architecture with Spring Boot 4 + Vue 2.

- Backend: Java 17, Spring Boot 4.0.5, MyBatis 4.x, MySQL 8, Redis 7.4, JWT
- Frontend: Vue 2.6.12, Element UI 2.15.14, Vuex 3.6.0, Axios

## Common Commands

### Backend (Maven)

```bash
# Run tests
make test

# Build for a specific environment (local, dev, prod)
make package ENV=dev

# Skip tests during build
make package ENV=prod SKIP_TEST=true

# Clean build artifacts
make clean

# Decompress the built tar.gz package
make package.uncompress
```

### Frontend

```bash
cd ui

# Start development server (port 8000)
npm run dev

# Production build
npm run build:prod

# Staging build
npm run build:stage

# Lint
npm run lint

# Preview production build locally
npm run preview
```

### Docker & Helm

```bash
# Build and run Docker container
make docker.run ENV=prod

# Stop/remove container
make docker.stop
make docker.remove

# Helm deploy/upgrade
make helm.upgrade ENV=test
make helm.uninstall
```

## Architecture

### Backend: Maven Multi-Module

```
app/ (parent POM)
├── app/common/    # Shared utils, constants, exceptions, annotations, middleware
├── app/dal/       # Data Access Layer: entities, mappers (XML), DAO interfaces
├── app/biz/       # Business logic: services, DTOs, VOs, security, configs, aspectj, quartz tasks
└── app/web/       # REST controllers: HTTP endpoints, Swagger docs

boot/              # Spring Boot entry point (MingshaApplication.java)
```

Key packages under `site.mingsha`:
- `core/` — BaseController, GlobalExceptionHandler, DynamicDataSource
- `security/` — JWT filter, authentication entry point, permission context
- `aspectj/` — DataScope, DataSource, RateLimiter, Log AOP aspects
- `task/quartz/` — Quartz job execution and scheduling

Configuration lives in `/config/{env}/application-*.yml` (datasource, redis, security, logging, jasypt).

### Frontend: Vue 2 + Vuex

```
ui/src/
├── api/           # Axios API modules grouped by domain (system/, monitor/, tool/)
├── store/modules/ # Vuex: user.js (auth), permission.js, tagsView, dict, app, settings
├── router/        # Vue Router with dynamic route loading from backend
├── views/         # Page components: dashboard/, system/, monitor/, tool/, login/
├── components/    # Reusable: Pagination, Editor, FileUpload, ImageUpload, SizeSelect
├── directive/     # Custom Vue directives
├── layout/        # Layout components (Sidebar, TagsView, Navbar)
├── utils/         # Auth token, request/response interceptors, permission check
├── permission.js  # Route guard: JWT validation, role loading, dynamic menus
└── main.js        # App bootstrap: Element UI, Vuex, Axios, router
```

Frontend config: `ui/.env.development` / `.env.production` / `.env.staging` for API base URL and proxy.

## Configuration

- `config/app.properties` — App name, port (8001), version, Docker/Helm metadata. **Used by Makefile** to inject values into deployment scripts.
- `config/{env}/application-datasource.yml` — DB connection (MySQL 8)
- `config/{env}/application-redis.yml` — Redis connection
- `config/{env}/application-security.yml` — JWT secret, token expiry, CORS
- `config/{env}/application-logging.yml` — Log level and appender config
- `config/{env}/application-jasypt.yml` — Jasypt encryption (see `docs/07-配置加密.md`)

Maven profiles (`local`, `dev`, `prod`) are activated with `-P {env}`.

## Development Conventions

- **Backend tests**: Place under `app/*/src/test/java/`; run with `mvn test` or `make test`.
- **Frontend lint**: ESLint with `lint-staged` + `husky` pre-commit hook; auto-fix on commit.
- **JWT auth**: Token stored in `localStorage`, sent as `Authorization: Bearer {token}` header. Frontend request interceptor attaches it; response interceptor handles 401/403.
- **Dynamic menus**: Routes loaded from backend via `/getRouters` API and merged into Vue Router at login.
- **Data scope**: Backend `DataScopeAspect` filters queries by user's dept permissions. Frontend `dict.js` Vuex module caches data dictionaries.
- **Code generation**: Backend `GenTableService` + Velocity templates generate CRUD code; frontend `ui/src/api/tool/gen.js` calls the gen API.
- **Quartz jobs**: Defined in `app/biz/task/quartz/`; scheduled jobs persisted in DB, dev profile activates Quartz auto-configuration.

## Deployment

- `deploy/docker/Dockerfile-boot` — Multi-stage build, Alpine + Dragonwell 17 base image.
- `deploy/helm-chart/` — Helm chart for Kubernetes, image/tag from `app.properties`.
- `Jenkinsfile` / `Jenkinsfile.sonar` — CI/CD pipeline: build, extract, archive, optional SonarQube scan.
- `docs/03-部署指南.md` and `docs/04-部署脚本说明.md` cover full deployment workflow.
