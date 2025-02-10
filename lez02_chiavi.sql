-- DDL
CREATE DATABASE its_31_02_rubrica_chiavi;
USE its_31_02_rubrica_chiavi;

CREATE TABLE Contatto(
	contattoID INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(250) NOT NULL,
    cognome VARCHAR(250) NOT NULL,
    cod_fis CHAR(16) NOT NULL UNIQUE,
    email VARCHAR(250),
    telefono VARCHAR(250)
);

-- DML
INSERT INTO Contatto(nome, cognome, cod_fis, telefono) VALUES
("Giovanni", "Pace", "PCAGNN", "12345"),
("Valeria", "Verdi", "VLRVRD", "12346");

INSERT INTO Contatto(contattoID, nome, cognome, cod_fis, telefono) VALUES
(85, "Mario", "Rossi", "MRRRSS", "12347");

INSERT INTO Contatto(nome, cognome, cod_fis, telefono) VALUES
("Marika", "Mariko", "MRKMRK", "12348");

DELETE FROM Contatto WHERE cod_fis = "MRRRSS";
DELETE FROM Contatto WHERE contattoID = 86;

UPDATE Contatto SET email = "mrk@mrk.com", telefono = "9998" WHERE cod_fis = "MRKMRK";

-- QL
SELECT nome, cognome, cod_fis, telefono FROM Contatto;

-- Alias
SELECT 
	nome AS Nome, 
    cognome AS Cognome, 
    cod_fis AS "Codice Fiscale", 
    telefono AS Telefono
		FROM Contatto;

