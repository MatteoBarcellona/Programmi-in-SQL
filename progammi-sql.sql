-- Creazione del database
CREATE DATABASE AnalisiVendite;

-- Selezione del database
USE AnalisiVendite;

-- Creazione delle tabelle
CREATE TABLE Prodotti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    prezzo DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Ordini (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL
);

CREATE TABLE DettagliOrdine (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ordine_id INT NOT NULL,
    prodotto_id INT NOT NULL,
    quantità INT NOT NULL,
    FOREIGN KEY (ordine_id) REFERENCES Ordini(id),
    FOREIGN KEY (prodotto_id) REFERENCES Prodotti(id)
);

-- Inserimento dei dati
INSERT INTO Prodotti (nome, prezzo) VALUES
('Telefono', 299.99),
('Laptop', 899.99),
('Cuffie', 129.99);

INSERT INTO Ordini (data) VALUES
('2024-12-10'),
('2024-12-11');

INSERT INTO DettagliOrdine (ordine_id, prodotto_id, quantità) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 1, 1),
(2, 3, 3);

-- Query per calcolare le vendite totali per ogni prodotto
SELECT 
    p.nome AS Prodotto,
    SUM(d.quantità * p.prezzo) AS TotaleVendite
FROM DettagliOrdine d
JOIN Prodotti p ON d.prodotto_id = p.id
GROUP BY p.nome
HAVING TotaleVendite > 300;
