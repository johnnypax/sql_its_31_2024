DROP DATABASE IF EXISTS its_31_08_mtm_scuola;
CREATE DATABASE its_31_08_mtm_scuola;
USE its_31_08_mtm_scuola;

CREATE TABLE Studente(
	studenteID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nominativo VARCHAR(250) NOT NULL,
    matricola VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE Esame(
	esameID INTEGER PRIMARY KEY AUTO_INCREMENT,
    titolo VARCHAR(250) NOT NULL,
    data_esame DATE NOT NULL
);

CREATE TABLE Studente_Esame(
	studenteRIF INTEGER NOT NULL,
    esameRIF INTEGER NOT NULL,
    FOREIGN KEY (studenteRIF) REFERENCES Studente(studenteID) ON DELETE CASCADE,
    FOREIGN KEY (esameRIF) REFERENCES Esame(esameID) ON DELETE CASCADE
);

INSERT INTO Studente(studenteID, nominativo, matricola) VALUES
(1, "Giovanni", "AB12345"),
(2, "Valeria", "AB12346"),
(3, "Mario", "AB12347"),
(4, "Marika", "AB12348");

INSERT INTO Esame(esameID, titolo, data_esame) VALUES
(1, "Analisi 1", "2025-01-01"),
(2, "Analisi 1", "2025-01-02"),
(3, "Analisi 1", "2025-01-03"),
(4, "Fisica", "2025-02-01"),
(5, "Fisica", "2025-03-01"),
(6, "Programmazione", "2025-03-03");

INSERT INTO Studente_Esame(studenteRIF, esameRIF) VALUES
(1,	1),
(1,	4),
(1,	6),
(2,	1),
(3,	5);

-- Tutti gli esami a cui è iscritto Giovanni Pace
SELECT nominativo, matricola, titolo, data_esame
	FROM Studente
    JOIN Studente_Esame ON Studente.studenteID = Studente_Esame.studenteRIF
    JOIN Esame ON Studente_Esame.esameRIF = Esame.esameID
    WHERE nominativo = "Giovanni";
    
SELECT *
	FROM Esame
    JOIN Studente_Esame ON Esame.esameID = Studente_Esame.esameRIF
    JOIN Studente ON Studente_Esame.studenteRIF = Studente.studenteID
    WHERE titolo = "Programmazione";
