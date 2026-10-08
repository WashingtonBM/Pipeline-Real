-- SQL de inicializacao do banco de dados.
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    country VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    balance NUMERIC(15,2),
    status VARCHAR(20)
);

CREATE TABLE cards (
    card_id SERIAL PRIMARY KEY,
    account_id INT REFERENCES accounts(account_id),
    card_brand VARCHAR(50),
    is_active BOOLEAN
);

CREATE TABLE merchants (
    merchant_id SERIAL PRIMARY KEY,
    merchant_name VARCHAR(100),
    category VARCHAR(50)
);

CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    card_id INT REFERENCES cards(card_id),
    merchant_id INT REFERENCES merchants(merchant_id),
    amount NUMERIC(15,2),
    transaction_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO customers (name, email, country) VALUES
('Ana Silva', 'ana@email.com', 'BR'),
('Carlos Souza', 'carlos@email.com', 'BR'),
('Mariana Lima', 'mariana@email.com', 'PT');

INSERT INTO accounts (customer_id, balance, status) VALUES
(1, 5000.00, 'ACTIVE'),
(2, 3500.50, 'ACTIVE'),
(3, 12000.00, 'ACTIVE');

INSERT INTO cards (account_id, card_brand, is_active) VALUES
(1, 'Visa', TRUE),
(2, 'Mastercard', TRUE),
(3, 'Elo', TRUE);

INSERT INTO merchants (merchant_name, category) VALUES
('Supermercado Extra', 'Retail'),
('Posto Shell', 'Fuel'),
('Tech Store', 'Electronics');