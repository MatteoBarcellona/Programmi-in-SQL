-- Creazione del database
CREATE DATABASE SitoForm;

-- Selezione del database
USE SitoForm;

-- Creazione della tabella utenti
CREATE TABLE Utenti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    data_registrazione TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
