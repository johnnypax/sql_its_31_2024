DROP DATABASE IF EXISTS its_31_13_ospedale;
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
    data_ingresso DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_uscite DATETIME,
    codice VARCHAR(250) NOT NULL UNIQUE,
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
    data_visita DATETIME DEFAULT CURRENT_TIMESTAMP,
    note TEXT,
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

INSERT INTO Ricovero (repartoRIF, pazienteRIF, data_ingresso, data_uscite, codice) VALUES
(1, 1, '2023-10-26 10:00:00', '2023-11-02 12:00:00', 'RCV001'),
(2, 2, '2023-10-27 11:00:00', '2023-11-03 13:00:00', 'RCV002'),
(3, 3, '2023-10-28 12:00:00', '2023-11-04 14:00:00', 'RCV003'),
(4, 4, '2023-10-29 13:00:00', '2023-11-05 15:00:00', 'RCV004'),
(5, 5, '2023-10-30 14:00:00', '2023-11-06 16:00:00', 'RCV005'),
(6, 6, '2023-10-31 15:00:00', '2023-11-07 17:00:00', 'RCV006'),
(7, 7, '2023-11-01 16:00:00', '2023-11-08 18:00:00', 'RCV007'),
(8, 8, '2023-11-02 17:00:00', '2023-11-09 19:00:00', 'RCV008'),
(9, 9, '2023-11-03 18:00:00', '2023-11-10 20:00:00', 'RCV009'),
(10, 10, '2023-11-04 19:00:00', '2023-11-11 21:00:00', 'RCV010'),
(11, 11, '2023-11-05 20:00:00', '2023-11-12 22:00:00', 'RCV011'),
(12, 12, '2023-11-06 21:00:00', '2023-11-13 23:00:00', 'RCV012'),
(1, 3, '2023-11-07 22:00:00', '2023-11-14 00:00:00', 'RCV013'),
(2, 4, '2023-11-08 23:00:00', '2023-11-15 01:00:00', 'RCV014'),
(3, 5, '2023-11-09 00:00:00', '2023-11-16 02:00:00', 'RCV015');

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

INSERT INTO Visita (pazienteRIF, medicoRIF, data_visita, note) VALUES
(1, 1, '2023-10-26 11:00:00', 'Controllo generale.'),
(2, 2, '2023-10-27 12:00:00', 'Monitoraggio parametri vitali.'),
(3, 3, '2023-10-28 13:00:00', 'Verifica stato neurologico.'),
(4, 4, '2023-10-29 14:00:00', 'Controllo crescita e sviluppo.'),
(5, 5, '2023-10-30 15:00:00', 'Monitoraggio funzione digestiva.'),
(6, 6, '2023-10-31 16:00:00', 'Controllo terapia oncologica.'),
(7, 7, '2023-11-01 17:00:00', 'Valutazione lesioni cutanee.'),
(8, 8, '2023-11-02 18:00:00', 'Esame della vista.'),
(9, 9, '2023-11-03 19:00:00', 'Controllo funzionalità renale.'),
(10, 10, '2023-11-04 20:00:00', 'Monitoraggio funzione respiratoria.'),
(11, 11, '2023-11-05 21:00:00', 'Controllo post-operatorio.'),
(12, 12, '2023-11-06 22:00:00', 'Visita di controllo generale.'),
(1, 2, '2023-11-07 10:30:00', 'Controllo post esami.'),
(1, 3, '2023-11-08 11:30:00', 'Monitoraggio terapia.'),
(2, 1, '2023-11-09 12:30:00', 'Controllo parametri.'),
(2, 3, '2023-11-10 13:30:00', 'Verifica terapia.'),
(3, 1, '2023-11-11 14:30:00', 'Controllo neurologico.'),
(3, 2, '2023-11-12 15:30:00', 'Monitoraggio parametri vitali.'),
(4, 5, '2023-11-13 16:30:00', 'Controllo crescita.'),
(4, 6, '2023-11-14 17:30:00', 'Valutazione terapia.'),
(5, 4, '2023-11-15 18:30:00', 'Controllo digestivo.'),
(5, 6, '2023-11-16 19:30:00', 'Monitoraggio funzione.'),
(6, 4, '2023-11-17 20:30:00', 'Controllo terapia.'),
(6, 5, '2023-11-18 21:30:00', 'Valutazione lesioni.'),
(7, 8, '2023-11-19 22:30:00', 'Controllo lesioni.'),
(7, 9, '2023-11-20 23:30:00', 'Verifica terapia.'),
(8, 7, '2023-11-21 00:30:00', 'Controllo vista.'),
(8, 9, '2023-11-22 01:30:00', 'Monitoraggio parametri.'),
(9, 7, '2023-11-23 02:30:00', 'Controllo renale.'),
(9, 8, '2023-11-24 03:30:00', 'Verifica terapia.');

-- QUERY

SELECT * 
	FROM Paziente 
    JOIN Visita ON Paziente.pazienteID = Visita.pazienteRIF
    JOIN Medico ON Visita.medicoRIF = Medico.medicoID
    JOIN Reparto ON Medico.repartoRIF = Reparto.repartoID
    JOIN Ricovero ON Reparto.repartoID = Ricovero.repartoRIF
    WHERE cod_fis = "VRDGPP80A01L219X";
