CREATE DATABASE its_31_09_anagrafe;
USE its_31_09_anagrafe;

CREATE TABLE Persona(
	personaID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nominativo VARCHAR(500) NOT NULL
);

CREATE TABLE CartaIdentita(
	cartaID INTEGER PRIMARY KEY AUTO_INCREMENT,
    codice VARCHAR(10) NOT NULL UNIQUE,
    scadenza DATE NOT NULL,
    personaRIF INTEGER NOT NULL UNIQUE,
    FOREIGN KEY (personaRIF) REFERENCES Persona(personaID) ON DELETE CASCADE
);

INSERT INTO Persona(personaID, nominativo) VALUES
(1	,"Giovanni Pace"),
(2	,"Valeria Verdi"),
(3	,"Mario Rossi"),
(4	,"Marika Mariko");

INSERT INTO CartaIdentita(codice, scadenza, personaRIF) VALUES
("6789", "2025-01-01", 1),
("6790", "2025-01-01", 2);

SELECT * 
	FROM Persona 
    JOIN CartaIdentita ON Persona.personaID = CartaIdentita.personaRIF
	WHERE nominativo = "Giovanni Pace";