-- Creazione del database
CREATE DATABASE LibreriaVideogiochi;

-- Selezione del database
USE LibreriaVideogiochi;

-- Creazione delle tabelle
CREATE TABLE Sviluppatori (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    paese VARCHAR(50)
);

CREATE TABLE Generi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Videogiochi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titolo VARCHAR(100) NOT NULL,
    sviluppatore_id INT,
    genere_id INT,
    data_rilascio DATE,
    prezzo DECIMAL(10, 2),
    FOREIGN KEY (sviluppatore_id) REFERENCES Sviluppatori(id),
    FOREIGN KEY (genere_id) REFERENCES Generi(id)
);

CREATE TABLE Recensioni (
    id INT AUTO_INCREMENT PRIMARY KEY,
    gioco_id INT,
    utente VARCHAR(100),
    valutazione INT CHECK (valutazione BETWEEN 1 AND 10),
    commento TEXT,
    FOREIGN KEY (gioco_id) REFERENCES Videogiochi(id)
);

-- Inserimento di dati di esempio
INSERT INTO Sviluppatori (nome, paese) VALUES
('Nintendo', 'Giappone'),
('Ubisoft', 'Francia'),
('CD Projekt Red', 'Polonia');

INSERT INTO Generi (nome) VALUES
('Azione'),
('RPG'),
('Avventura'),
('Sport');

INSERT INTO Videogiochi (titolo, sviluppatore_id, genere_id, data_rilascio, prezzo) VALUES
('The Legend of Zelda: Breath of the Wild', 1, 3, '2017-03-03', 59.99),
('Assassin\'s Creed Valhalla', 2, 1, '2020-11-10', 49.99),
('Cyberpunk 2077', 3, 2, '2020-12-10', 39.99);

INSERT INTO Recensioni (gioco_id, utente, valutazione, commento) VALUES
(1, 'Giovanni', 10, 'Capolavoro assoluto!'),
(1, 'Luca', 9, 'Incredibile gameplay e grafica.'),
(2, 'Marco', 8, 'Ottima trama ma un po\' ripetitivo.'),
(3, 'Alice', 7, 'Buona storia, ma tanti bug.'),
(3, 'Sara', 6, 'Promettente, ma deludente alla fine.');

-- Query 1: Trovare tutti i giochi di un certo genere (esempio: RPG)
SELECT v.titolo AS Gioco, g.nome AS Genere, s.nome AS Sviluppatore
FROM Videogiochi v
JOIN Generi g ON v.genere_id = g.id
JOIN Sviluppatori s ON v.sviluppatore_id = s.id
WHERE g.nome = 'RPG';

-- Query 2: Calcolare la valutazione media per ogni gioco
SELECT 
    v.titolo AS Gioco,
    AVG(r.valutazione) AS ValutazioneMedia
FROM Videogiochi v
LEFT JOIN Recensioni r ON v.id = r.gioco_id
GROUP BY v.titolo;

-- Query 3: Trovare giochi con valutazioni superiori a una certa soglia (esempio: 8)
SELECT 
    v.titolo AS Gioco,
    AVG(r.valutazione) AS ValutazioneMedia
FROM Videogiochi v
LEFT JOIN Recensioni r ON v.id = r.gioco_id
GROUP BY v.titolo
HAVING ValutazioneMedia > 8;
