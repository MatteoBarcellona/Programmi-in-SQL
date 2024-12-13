CREATE DATABASE Scuola;
USE Scuola;

CREATE TABLE Studenti (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    nome VARCHAR(100) NOT NULL,        
    cognome VARCHAR(100) NOT NULL,    
    data_nascita DATE,               
    email VARCHAR(100) UNIQUE         
);

INSERT INTO Studenti (nome, cognome, data_nascita, email) VALUES
('Giuseppe', 'Rossi', '2005-05-10', 'giuseppe.rossi@email.com'),
('Anna', 'Bianchi', '2004-08-15', 'anna.bianchi@email.com'),
('Luca', 'Verdi', '2006-02-25', 'luca.verdi@email.com');

SELECT * FROM Studenti;