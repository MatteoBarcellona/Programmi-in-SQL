-- Creazione del database
CREATE DATABASE Biblioteca;

-- Selezione del database
USE Biblioteca;

-- Creazione della tabella "Libri"
CREATE TABLE Libri (
    id INT AUTO_INCREMENT PRIMARY KEY,       -- ID univoco per ogni libro
    titolo VARCHAR(255) NOT NULL,            -- Titolo del libro
    autore VARCHAR(255) NOT NULL,            -- Autore del libro
    anno_pubblicazione INT,                  -- Anno di pubblicazione
    genere VARCHAR(100),                     -- Genere del libro (es. Romanzo, Saggio)
    disponibile BOOLEAN DEFAULT TRUE         -- Disponibilità del libro (TRUE = disponibile)
);

-- Inserimento di alcuni libri di esempio
INSERT INTO Libri (titolo, autore, anno_pubblicazione, genere, disponibile) VALUES
('Il Nome della Rosa', 'Umberto Eco', 1980, 'Romanzo', TRUE),
('La Divina Commedia', 'Dante Alighieri', 1320, 'Poesia', FALSE),
('1984', 'George Orwell', 1949, 'Distopia', TRUE),
('Orgoglio e Pregiudizio', 'Jane Austen', 1813, 'Romanzo', TRUE),
('I Promessi Sposi', 'Alessandro Manzoni', 1827, 'Romanzo', FALSE);

-- Query 1: Selezionare tutti i libri disponibili
SELECT * 
FROM Libri 
WHERE disponibile = TRUE;

-- Query 2: Selezionare tutti i libri di un determinato autore (ad esempio 'Umberto Eco')
SELECT * 
FROM Libri 
WHERE autore = 'Umberto Eco';
