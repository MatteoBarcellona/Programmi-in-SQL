CREATE DATABASE Negozio;
USE Negozio;

CREATE TABLE Prodotti (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    nome VARCHAR(100) NOT NULL,      
    descrizione TEXT,                   
    prezzo DECIMAL(10, 2) NOT NULL,     
    quantità INT NOT NULL              
);

INSERT INTO Prodotti (nome, descrizione, prezzo, quantità) VALUES
('Telefono', 'Telefono cellulare di ultima generazione', 299.99, 50),
('Laptop', 'Laptop con 16GB di RAM e 512GB SSD', 899.99, 30),
('Cuffie', 'Cuffie wireless con cancellazione del rumore', 129.99, 100),
('Smartwatch', 'Orologio intelligente con monitoraggio attività', 199.99, 20);

SELECT * FROM Prodotti WHERE quantità > 30;
