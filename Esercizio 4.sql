-- Creazione del database
CREATE DATABASE Azienda;

-- Selezione del database
USE Azienda;

-- Creazione della tabella "Dipendenti"
CREATE TABLE Dipendenti (
    id INT AUTO_INCREMENT PRIMARY KEY,   -- ID univoco per ogni dipendente
    nome VARCHAR(100) NOT NULL,          -- Nome del dipendente
    cognome VARCHAR(100) NOT NULL,       -- Cognome del dipendente
    posizione VARCHAR(50) NOT NULL,      -- Posizione lavorativa del dipendente
    stipendio DECIMAL(10, 2) NOT NULL,   -- Stipendio del dipendente
    data_assunzione DATE NOT NULL        -- Data di assunzione del dipendente
);

-- Inserimento di alcuni dipendenti di esempio
INSERT INTO Dipendenti (nome, cognome, posizione, stipendio, data_assunzione) VALUES
('Marco', 'Rossi', 'Manager', 4000.00, '2020-05-10'),
('Luca', 'Bianchi', 'Sviluppatore', 3000.00, '2021-03-15'),
('Giulia', 'Verdi', 'Designer', 2500.00, '2019-08-01'),
('Anna', 'Gialli', 'Sviluppatore', 3200.00, '2022-01-20');

-- Query per selezionare i dipendenti con uno stipendio superiore a 3000
SELECT * 
FROM Dipendenti 
WHERE stipendio > 3000;
