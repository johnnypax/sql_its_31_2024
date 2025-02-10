-- Prima Lezione
/*
Tipologie di linguaggio:
DDL - Data Definition Language
DML - Data Manipulation Language
QL - Querying Language
*/

-- DDL
-- DROP DATABASE IF EXISTS its_31_01_rubrica;
CREATE DATABASE its_31_01_rubrica;
USE its_31_01_rubrica;

-- DROP TABLE IF EXISTS Contatto;
CREATE TABLE Contatto(
	nome VARCHAR(250) NOT NULL,
    cognome VARCHAR(250) NOT NULL,
    cod_fis CHAR(16) NOT NULL UNIQUE,
    email VARCHAR(250),
    telefono VARCHAR(250)
);

ALTER TABLE Contatto ADD COLUMN indirizzo VARCHAR(500);
ALTER TABLE Contatto ADD COLUMN prova VARCHAR(500) NOT NULL;
ALTER TABLE Contatto DROP COLUMN prova;
ALTER TABLE Contatto MODIFY COLUMN indirizzo TEXT;

-- DML
INSERT INTO Contatto(nome, cognome, cod_fis, telefono) VALUES
("Giovanni", "Pace", "PCAGNN", "1234");

INSERT INTO Contatto(nome, cod_fis) VALUES
("Gamer", "CCOGMR");

INSERT INTO Contatto(nome, cognome, cod_fis, email, telefono) VALUES
("Valeria", "Verdi", "VLRVRD", "val@ver.com", "3216");

INSERT INTO Contatto(telefono, email, cod_fis, nome, cognome) VALUES
("8569", "mar@ros.com", "MRRRSS", "Mario", "Rossi");

-- QL
SELECT * FROM Contatto;


