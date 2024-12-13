CREATE DATABASE GestioneSitoWeb;
USE GestioneSitoWeb;

-- Creazione delle tabelle
CREATE TABLE Utenti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    data_registrazione DATE DEFAULT CURRENT_DATE,
    stato ENUM('attivo', 'sospeso', 'cancellato') DEFAULT 'attivo'
);

CREATE TABLE Post (
    id INT AUTO_INCREMENT PRIMARY KEY,
    autore_id INT,
    titolo VARCHAR(200) NOT NULL,
    contenuto TEXT NOT NULL,
    data_pubblicazione DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (autore_id) REFERENCES Utenti(id)
);

CREATE TABLE Commenti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    autore_id INT,
    contenuto TEXT NOT NULL,
    data_pubblicazione DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Post(id),
    FOREIGN KEY (autore_id) REFERENCES Utenti(id)
);

CREATE TABLE Reazioni (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('like', 'dislike', 'cuore') NOT NULL,
    utente_id INT,
    post_id INT,
    FOREIGN KEY (utente_id) REFERENCES Utenti(id),
    FOREIGN KEY (post_id) REFERENCES Post(id)
);

-- Inserimento di dati di esempio
INSERT INTO Utenti (nome, email) VALUES
('Mario Rossi', 'mario.rossi@example.com'),
('Anna Verdi', 'anna.verdi@example.com'),
('Luca Bianchi', 'luca.bianchi@example.com');

INSERT INTO Post (autore_id, titolo, contenuto) VALUES
(1, 'Benvenuti sul mio blog', 'Questo è il mio primo post. Spero vi piaccia!'),
(2, 'Ricetta della torta al cioccolato', 'Ecco come preparare una torta al cioccolato deliziosa.'),
(3, 'Viaggio in Giappone', 'Condivisione della mia esperienza di viaggio.');

INSERT INTO Commenti (post_id, autore_id, contenuto) VALUES
(1, 2, 'Ottimo post! Continua così!'),
(2, 3, 'Adoro questa ricetta, la proverò subito!'),
(3, 1, 'Bellissime foto, voglio visitare il Giappone anch\'io!');

INSERT INTO Reazioni (tipo, utente_id, post_id) VALUES
('like', 2, 1),
('cuore', 3, 1),
('like', 1, 3),
('dislike', 2, 3);

-- Query 1: Trovare tutti i post di un determinato utente (esempio: Mario Rossi)
SELECT p.titolo, p.contenuto, p.data_pubblicazione
FROM Post p
JOIN Utenti u ON p.autore_id = u.id
WHERE u.nome = 'Mario Rossi';

-- Query 2: Contare il numero di commenti per ogni post
SELECT 
    p.titolo AS Post,
    COUNT(c.id) AS NumeroCommenti
FROM Post p
LEFT JOIN Commenti c ON p.id = c.post_id
GROUP BY p.titolo;

-- Query 3: Trovare i post con il maggior numero di reazioni
SELECT 
    p.titolo AS Post,
    COUNT(r.id) AS NumeroReazioni
FROM Post p
LEFT JOIN Reazioni r ON p.id = r.post_id
GROUP BY p.titolo
ORDER BY NumeroReazioni DESC;

-- Query 4: Trovare i dettagli di tutte le reazioni di un utente specifico (esempio: Anna Verdi)
SELECT 
    r.tipo AS Reazione,
    p.titolo AS Post,
    u.nome AS Utente
FROM Reazioni r
JOIN Post p ON r.post_id = p.id
JOIN Utenti u ON r.utente_id = u.id
WHERE u.nome = 'Anna Verdi';
