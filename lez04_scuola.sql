-- DDL
DROP DATABASE IF EXISTS its_31_04_scuola;
CREATE DATABASE its_31_04_scuola;
USE its_31_04_scuola;

CREATE TABLE Studente(
	studenteID INTEGER AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL,
    cognome VARCHAR(250) NOT NULL,
    matricola VARCHAR(10) NOT NULL,
    PRIMARY KEY(studenteID),
    UNIQUE(matricola)
);

INSERT INTO Studente (nome, cognome, matricola) VALUES 
('Mario', 'Rossi', '12345'),
('Anna', 'Bianchi', '12345'),
('Luigi', 'Verdi', '67890');

SELECT * FROM Studente;

-- INSERT INTO Studente (nome, cognome, matricola) VALUES ('Mario', 'Rossi', '12345');
-- INSERT INTO Studente (nome, cognome, matricola) VALUES ('Anna', 'Bianchi', '12345');
-- INSERT INTO Studente (nome, cognome, matricola) VALUES ('Luigi', 'Verdi', '67890');