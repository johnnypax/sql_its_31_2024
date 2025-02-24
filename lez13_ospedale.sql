CREATE DATABASE its_31_13_ospedale;
USE its_31_13_ospedale;

CREATE TABLE Paziente(
	pazienteID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nominativo VARCHAR(250) NOT NULL,
    cod_fis CHAR(16) NOT NULL UNIQUE
);

CREATE TABLE Esame(
	esameID INTEGER PRIMARY KEY AUTO_INCREMENT,
	esito TEXT,
    data_esame DATETIME DEFAULT CURRENT_TIMESTAMP,
    tipologia VARCHAR(250) CHECK (tipologia IN ("Urine", "Feci", "Sangue")),
    pazienteRIF INTEGER NOT NULL,
    FOREIGN KEY (pazienteRIF) REFERENCES Paziente(pazienteID) ON DELETE CASCADE
);

CREATE TABLE Reparto(
	repartoID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(25),
    posti INTEGER CHECK (posti >= 1)
);

CREATE TABLE Ricovero(
	repartoRIF INTEGER NOT NULL,
    pazienteRIF INTEGER NOT NULL,
    FOREIGN KEY (repartoRIF) REFERENCES Reparto(repartoID) ON DELETE CASCADE,
	FOREIGN KEY (pazienteRIF) REFERENCES Paziente(pazienteID) ON DELETE CASCADE,
    PRIMARY KEY (repartoRIF, pazienteRIF)
);

CREATE TABLE Medico(
	medicoID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nominativo VARCHAR(250) NOT NULL,
    identificativo VARCHAR(250) NOT NULL UNIQUE,
    repartoRIF INTEGER NOT NULL,
    FOREIGN KEY (repartoRIF) REFERENCES Reparto(repartoID) ON DELETE CASCADE
);

CREATE TABLE Visita(
	pazienteRIF INTEGER NOT NULL,
    medicoRIF INTEGER NOT NULL,
	FOREIGN KEY (pazienteRIF) REFERENCES Paziente(pazienteID) ON DELETE CASCADE,
    FOREIGN KEY (medicoRIF) REFERENCES Medico(medicoID) ON DELETE CASCADE,
    PRIMARY KEY (pazienteRIF, medicoRIF)
);

INSERT INTO Paziente (nominativo, cod_fis) VALUES
('Giuseppe Verdi', 'VRDGPP80A01L219X'),
('Maria Rossi', 'RSSMRA85B02M320Y'),
('Luca Bianchi', 'BNCLCA90C03N431Z'),
('Anna Neri', 'NRINNA95D04O542W'),
('Roberto Gialli', 'GLLRRT00E05P653V'),
('Sofia Marrone', 'MRNSFA05F06Q764U'),
('Davide Blu', 'BLUDVD10G07R875T'),
('Elena Rosa', 'ROSLNA15H08S986S'),
('Francesca Viola', 'VILFNC20I09T097R'),
('Alessio Arancio', 'RNCLSS25J10U108Q'),
('Valentina Grigio', 'GRGVLT30K11V119P'),
('Marco Verde', 'VRDMRC35L12W120O');

INSERT INTO Esame (esito, tipologia, pazienteRIF) VALUES
('Negativo', 'Sangue', 1),
('Positivo', 'Urine', 2),
('Negativo', 'Feci', 3),
('Positivo', 'Sangue', 4),
('Negativo', 'Urine', 5),
('Positivo', 'Feci', 6),
('Negativo', 'Sangue', 7),
('Positivo', 'Urine', 8),
('Negativo', 'Feci', 9),
('Positivo', 'Sangue', 10),
('Negativo', 'Urine', 11),
('Positivo', 'Feci', 12),
('In corso', 'Sangue', 1),
('In corso', 'Urine', 2),
('In corso', 'Feci', 3);

INSERT INTO Reparto (nome, posti) VALUES
('Cardiologia', 20),
('Ortopedia', 15),
('Neurologia', 10),
('Pediatria', 25),
('Gastroenterologia', 18),
('Oncologia', 12),
('Dermatologia', 8),
('Oculistica', 16),
('Urologia', 14),
('Pneumologia', 22),
('Chirurgia', 30),
('Medicina Generale', 28);

INSERT INTO Ricovero (repartoRIF, pazienteRIF) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(1, 3),
(2, 4),
(3, 5);

INSERT INTO Medico (nominativo, identificativo, repartoRIF) VALUES
('Dott. Mario Bianchi', 'MB123', 1),
('Dott.ssa Laura Neri', 'LN456', 2),
('Dott. Giuseppe Rossi', 'GR789', 3),
('Dott.ssa Anna Verdi', 'AV012', 4),
('Dott. Roberto Gialli', 'RG345', 5),
('Dott.ssa Sofia Marrone', 'SM678', 6),
('Dott. Davide Blu', 'DB901', 7),
('Dott.ssa Elena Rosa', 'ER234', 8),
('Dott. Francesca Viola', 'FV567', 9),
('Dott. Alessio Arancio', 'AA890', 10),
('Dott.ssa Valentina Grigio', 'VG1234', 11),
('Dott. Marco Verde', 'MV5678', 12);

INSERT INTO Visita (pazienteRIF, medicoRIF) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 5),
(4, 6),
(5, 4),
(5, 6),
(6, 4),
(6, 5),
(7, 8),
(7, 9),
(8, 7),
(8, 9),
(9, 7),
(9, 8),
(10, 11),
(10, 12),
(11, 10),
(11, 12),
(12, 10),
(12, 11),
(1, 12),
(2, 11),
(3, 10),
(4, 9),
(5, 8),
(6, 7),
(7, 6),
(8, 5),
(9, 4),
(10, 3),
(11, 2),
(12, 1);


