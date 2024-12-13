-- Creazione del database
CREATE DATABASE NegozioOrdini;
USE NegozioOrdini;

-- Creazione della tabella "Clienti"
CREATE TABLE Clienti (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID univoco per ogni cliente
    nome VARCHAR(100) NOT NULL,         -- Nome del cliente
    cognome VARCHAR(100) NOT NULL,      -- Cognome del cliente
    email VARCHAR(100) UNIQUE           -- Email del cliente
);

-- Creazione della tabella "Ordini"
CREATE TABLE Ordini (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID univoco per ogni ordine
    cliente_id INT,                     -- Riferimento al cliente che ha effettuato l'ordine
    data_ordine DATE NOT NULL,          -- Data in cui l'ordine è stato effettuato
    totale DECIMAL(10, 2) NOT NULL,     -- Totale dell'ordine
    FOREIGN KEY (cliente_id) REFERENCES Clienti(id)
);

-- Creazione della tabella "DettagliOrdine"
CREATE TABLE DettagliOrdine (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID univoco per ogni dettaglio
    ordine_id INT,                      -- Riferimento all'ordine
    prodotto VARCHAR(100) NOT NULL,      -- Nome del prodotto
    quantità INT NOT NULL,               -- Quantità del prodotto ordinato
    prezzo DECIMAL(10, 2) NOT NULL,      -- Prezzo del prodotto
    FOREIGN KEY (ordine_id) REFERENCES Ordini(id)
);

-- Inserimento di alcuni clienti
INSERT INTO Clienti (nome, cognome, email) VALUES
('Giuseppe', 'Rossi', 'giuseppe.rossi@email.com'),
('Anna', 'Bianchi', 'anna.bianchi@email.com');

-- Inserimento di un ordine per il cliente 1 (Giuseppe)
INSERT INTO Ordini (cliente_id, data_ordine, totale) VALUES
(1, '2024-12-10', 499.97);

-- Inserimento dei dettagli dell'ordine (prodotti acquistati)
INSERT INTO DettagliOrdine (ordine_id, prodotto, quantità, prezzo) VALUES
(1, 'Telefono', 1, 299.99),
(1, 'Cuffie', 2, 129.99);

-- Inserimento di un altro ordine per il cliente 2 (Anna)
INSERT INTO Ordini (cliente_id, data_ordine, totale) VALUES
(2, '2024-12-11', 399.98);

-- Inserimento dei dettagli dell'ordine (prodotti acquistati)
INSERT INTO DettagliOrdine (ordine_id, prodotto, quantità, prezzo) VALUES
(2, 'Laptop', 1, 399.98);

-- Query per ottenere gli ordini con il totale
SELECT o.id AS ordine_id, c.nome AS nome_cliente, c.cognome AS cognome_cliente, o.data_ordine, o.totale
FROM Ordini o
JOIN Clienti c ON o.cliente_id = c.id;
