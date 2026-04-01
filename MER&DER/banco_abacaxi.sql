-- SQL Script para o Projeto Pineapple Party
-- Focado em Performance e IA (PostgreSQL)

-- 1. Tabela de Locais
CREATE TABLE locais (
    id_local SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco TEXT NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    capacidade_total INTEGER NOT NULL
);

-- 2. Tabela de Usuários
CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha_hash TEXT NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_nascimento DATE NOT NULL,
    genero VARCHAR(20),
    foto_biometria TEXT, -- URL ou Path da imagem
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Tabela de Eventos
CREATE TABLE eventos (
    id_evento SERIAL PRIMARY KEY,
    id_local INTEGER REFERENCES locais(id_local),
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_evento DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    status VARCHAR(20) DEFAULT 'ativo' -- ativo, encerrado, cancelado
);

-- 4. Tabela de DJs
CREATE TABLE djs (
    id_dj SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    genero_musical VARCHAR(50),
    redes_sociais JSONB, -- Armazena links como objeto JSON
    status VARCHAR(20) DEFAULT 'ativo'
);

-- 5. Tabela de Escalação (Lineup) - Relacionamento N:M
CREATE TABLE escalacao (
    id_escalacao SERIAL PRIMARY KEY,
    id_evento INTEGER REFERENCES eventos(id_evento) ON DELETE CASCADE,
    id_dj INTEGER REFERENCES djs(id_dj),
    hora_entrada TIME,
    hora_saida TIME,
    palco VARCHAR(50)
);

-- 6. Tabela de Pedidos (Transações)
CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_usuario INTEGER REFERENCES usuarios(id_usuario),
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10, 2) NOT NULL,
    status_pagamento VARCHAR(20) DEFAULT 'pendente' -- pendente, aprovado, recusado
);

-- 7. Tabela de Ingressos
CREATE TABLE ingressos (
    id_ingresso SERIAL PRIMARY KEY,
    id_pedido INTEGER REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    id_evento INTEGER REFERENCES eventos(id_evento),
    tipo_ingresso VARCHAR(30) NOT NULL, -- pista, vip, backstage
    preco_unitario DECIMAL(10, 2) NOT NULL,
    qr_code_hash VARCHAR(255) UNIQUE NOT NULL,
    status_uso VARCHAR(20) DEFAULT 'nao_utilizado'
);

-- 8. Tabela de Pagamentos e Tokens
CREATE TABLE pagamentos (
    id_pagamento SERIAL PRIMARY KEY,
    id_pedido INTEGER REFERENCES pedidos(id_pedido),
    metodo_pagamento VARCHAR(30) NOT NULL, -- pix, cartao_credito
    transaction_id VARCHAR(100), -- ID gerado pela API Gateway
    token_cartao VARCHAR(255), -- Somente o Token PCI-DSS
    nome_titular_cartao VARCHAR(100),
    data_vencimento_cartao VARCHAR(7) -- MM/YYYY
);
