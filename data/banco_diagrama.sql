CREATE DATABASE IF NOT EXISTS sistema_gestao
  DEFAULT CHARACTER SET utf8mb4;

USE sistema_gestao;

CREATE TABLE cliente (
  Id     INT AUTO_INCREMENT PRIMARY KEY,
  Nome   VARCHAR(150) NOT NULL,
  Email  VARCHAR(150),
  Cpf    VARCHAR(11)  NOT NULL,
  Ativo  BOOLEAN      NOT NULL DEFAULT TRUE
);

CREATE TABLE produtos (
  id       INT AUTO_INCREMENT PRIMARY KEY,
  nome     VARCHAR(150)  NOT NULL,
  preco    DECIMAL(10,2) NOT NULL,
  estoque  INT           NOT NULL DEFAULT 0,
  ativo    BOOLEAN       NOT NULL DEFAULT TRUE
);

CREATE TABLE vendas (
  id_venda     INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente   INT           NOT NULL,
  id_produto   INT           NOT NULL,
  valor_final  DECIMAL(10,2) NOT NULL,
  data_venda   DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  quantidade   INT           NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente (Id),
  FOREIGN KEY (id_produto) REFERENCES produtos (id),
  INDEX ix_vendas_data (data_venda)
);

CREATE TABLE fornecedores (
  id_fornecedor  INT AUTO_INCREMENT PRIMARY KEY,
  id_produto     INT          NOT NULL,
  cnpj           VARCHAR(14)  NOT NULL,
  data_cadastro  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  email          VARCHAR(150),
  telefone       VARCHAR(20),
  ativo          BOOLEAN      NOT NULL DEFAULT TRUE,
  nome           VARCHAR(150) NOT NULL,
  FOREIGN KEY (id_produto) REFERENCES produtos (id)
);

CREATE TABLE funcionario (
  id_funcionario  INT AUTO_INCREMENT PRIMARY KEY,
  nome            VARCHAR(150) NOT NULL,
  data_inicio     DATE         NOT NULL,
  ativo           BOOLEAN      NOT NULL DEFAULT TRUE
);

CREATE TABLE departamento (
  id_departamento  INT AUTO_INCREMENT PRIMARY KEY,
  id_funcionario   INT          NOT NULL,
  nome             VARCHAR(100) NOT NULL,
  descricao        VARCHAR(255),
  status           BOOLEAN      NOT NULL DEFAULT TRUE,
  FOREIGN KEY (id_funcionario) REFERENCES funcionario (id_funcionario)
);

CREATE TABLE usuarios (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  nome        VARCHAR(150) NOT NULL,
  email       VARCHAR(150) NOT NULL UNIQUE,
  senha_hash  VARCHAR(255) NOT NULL,
  ativo       BOOLEAN      NOT NULL DEFAULT TRUE
);
