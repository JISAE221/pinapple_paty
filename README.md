# Pineapple 🍍

[![Rust](https://img.shields.io/badge/Rust-000000?style=for-the-badge&logo=rust&logoColor=white)](https://www.rust-lang.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)](https://reactjs.org/)

Plataforma de gestão de eventos e venda de ingressos focada na cena eletrônica (Raves), especificamente para a festa **Pineapple Party**. Este projeto é um laboratório prático para estudos de **Engenharia de Software** e **Inteligência Artificial**.

## 🚀 O Projeto

O **Pineapple Party** nasceu para facilitar a compra de ingressos e a gestão de line-ups em eventos de grande escala. O foco técnico está na **segurança de dados sensíveis**, **alta performance** (usando Rust) e **escalabilidade** para futuras implementações de IA (análise preditiva de vendas e biometria facial).

### 🛠️ Tecnologias
- **Backend:** [Rust](file:///c:/Users/dania/OneDrive/Área de Trabalho/pineapple/apps/backend) (Performance & Safety)
- **Frontend:** [React + TS](file:///c:/Users/dania/OneDrive/Área de Trabalho/pineapple/apps/frontend) (Interatividade & UX)
- **Banco de Dados:** PostgreSQL (Relacional)
- **Infra:** Docker & Docker Compose (Padronização)

## 📊 Modelagem e Arquitetura

A modelagem de dados foi pensada para suportar grandes fluxos e análise de dados posterior:
- [Modelo Entidade-Relacionamento (MER)](file:///c:/Users/dania/OneDrive/Área de Trabalho/pineapple/MER%26DER/planta_projeto.md)
- [Diagrama Visual (DBML)](file:///c:/Users/dania/OneDrive/Área de Trabalho/pineapple/MER%26DER/der_projeto.dbml)
- [Script SQL do Banco](file:///c:/Users/dania/OneDrive/Área de Trabalho/pineapple/MER%26DER/banco_abacaxi.sql)

## 📦 Como Rodar o Projeto

### Pré-requisitos
- [Docker](https://www.docker.com/get-started)
- [Git](https://git-scm.com/)

### Passo a Passo

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/JISAE221/pinapple_paty.git
   ```

2. **Configure as Variáveis de Ambiente:**
   Crie um arquivo `.env` na raiz do projeto com os seguintes campos:
   ```env
   DB_USER=postgres
   DB_PASSWORD=sua_senha_secreta
   DB_NAME=pineapple_party
   ```

3. **Suba o Servidor de Banco de Dados:**
   ```bash
   docker-compose up -d
   ```

4. **Prepare o Banco:**
   Conecte ao banco (localhost:5432) e execute o script `MER&DER/banco_abacaxi.sql`.

## 🧠 Contexto e Evolução
Este projeto faz parte de uma jornada de aprendizado contínuo. Você pode acompanhar as decisões de arquitetura e progresso no arquivo [context.md](file:///c:/Users/dania/OneDrive/Área de Trabalho/pineapple/context.md).

---
Desenvolvido por **Daniboy** 🍍🦾
