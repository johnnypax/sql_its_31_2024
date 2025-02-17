-- DDL
DROP DATABASE IF EXISTS its_31_05_scuola;
CREATE DATABASE its_31_05_scuola;
USE its_31_05_scuola;

CREATE TABLE Studente(
	studenteID INTEGER AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL,
    cognome VARCHAR(250) NOT NULL,
    matricola VARCHAR(10) NOT NULL,
    PRIMARY KEY(studenteID),
    UNIQUE(matricola)
);

-- DML 
INSERT INTO Studente (nome, cognome, matricola) VALUES ('Mario', 'Rossi', '12345');
INSERT INTO Studente (nome, cognome, matricola) VALUES ('Luigi', 'Verdi', '67890');
INSERT INTO Studente (nome, cognome, matricola) VALUES ('Anna', 'Bianchi', '13579');
INSERT INTO Studente (nome, cognome, matricola) VALUES ('Francesca', 'Neri', '24680');
INSERT INTO Studente (nome, cognome, matricola) VALUES ('Giovanni', 'Gialli', '98765');
INSERT INTO Studente (nome, cognome, matricola) VALUES ('Elena', 'Blu', '54321');
INSERT INTO Studente (nome, cognome, matricola) VALUES ('Marco', 'Viola', '01234');
INSERT INTO Studente (nome, cognome, matricola) VALUES ('Giulia', 'Arancioni', '56789');
INSERT INTO Studente (nome, cognome, matricola) VALUES ('Antonio', 'Marrone', '90123');
INSERT INTO Studente (nome, cognome, matricola) VALUES ('Laura', 'Celeste', '45678');

DELETE FROM Studente WHERE matricola = "01234";
UPDATE Studente SET nome = "ciccio", cognome = "pasticcio" WHERE studenteID = 100;

-- QL
SELECT * FROM Studente;