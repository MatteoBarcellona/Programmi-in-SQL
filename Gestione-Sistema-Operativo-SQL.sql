-- Creazione del database
CREATE DATABASE GestioneSistemiOperativi;

-- Selezione del database
USE GestioneSistemiOperativi;

-- Creazione delle tabelle
CREATE TABLE Produttori (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    paese VARCHAR(50)
);

CREATE TABLE SistemiOperativi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    produttore_id INT,
    tipo VARCHAR(50), -- Es. Desktop, Mobile, Server
    FOREIGN KEY (produttore_id) REFERENCES Produttori(id)
);

CREATE TABLE Versioni (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sistema_id INT,
    numero_versione VARCHAR(20) NOT NULL,
    data_rilascio DATE,
    supportato BOOLEAN DEFAULT TRUE, -- Indica se la versione è ancora supportata
    FOREIGN KEY (sistema_id) REFERENCES SistemiOperativi(id)
);

CREATE TABLE Dispositivi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50), -- Es. Smartphone, Laptop, Server
    sistema_id INT,
    versione_id INT,
    FOREIGN KEY (sistema_id) REFERENCES SistemiOperativi(id),
    FOREIGN KEY (versione_id) REFERENCES Versioni(id)
);

-- Inserimento di dati di esempio
INSERT INTO Produttori (nome, paese) VALUES
('Microsoft', 'USA'),
('Apple', 'USA'),
('Canonical', 'Regno Unito');

INSERT INTO SistemiOperativi (nome, produttore_id, tipo) VALUES
('Windows', 1, 'Desktop'),
('macOS', 2, 'Desktop'),
('Ubuntu', 3, 'Server');

INSERT INTO Versioni (sistema_id, numero_versione, data_rilascio, supportato) VALUES
(1, '10', '2015-07-29', TRUE),
(1, '11', '2021-10-05', TRUE),
(2, 'Ventura', '2022-10-24', TRUE),
(2, 'Monterey', '2021-10-25', TRUE),
(3, '20.04 LTS', '2020-04-23', TRUE),
(3, '22.04 LTS', '2022-04-21', TRUE);

INSERT INTO Dispositivi (nome, tipo, sistema_id, versione_id) VALUES
('Surface Laptop', 'Laptop', 1, 2),
('iMac', 'Desktop', 2, 3),
('Dell PowerEdge', 'Server', 3, 6);

-- Query 1: Trovare tutti i sistemi operativi sviluppati da un determinato produttore (es. "Microsoft")
SELECT so.nome AS SistemaOperativo, p.nome AS Produttore, so.tipo
FROM SistemiOperativi so
JOIN Produttori p ON so.produttore_id = p.id
WHERE p.nome = 'Microsoft';

-- Query 2: Calcolare il numero di versioni disponibili per ciascun sistema operativo
SELECT 
    so.nome AS SistemaOperativo,
    COUNT(v.id) AS NumeroVersioni
FROM SistemiOperativi so
JOIN Versioni v ON so.id = v.sistema_id
GROUP BY so.nome;

-- Query 3: Trovare i dispositivi compatibili con una specifica versione di un sistema operativo (es. Windows 11)
SELECT 
    d.nome AS Dispositivo,
    d.tipo AS Tipo,
    so.nome AS SistemaOperativo,
    v.numero_versione AS Versione
FROM Dispositivi d
JOIN SistemiOperativi so ON d.sistema_id = so.id
JOIN Versioni v ON d.versione_id = v.id
WHERE so.nome = 'Windows' AND v.numero_versione = '11';
