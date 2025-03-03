CREATE DATABASE its_31_14_alberghi;
USE its_31_14_alberghi;

CREATE TABLE Albergo(
	albergoID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL,
    indirizzo VARCHAR(500) NOT NULL,
    stelle INTEGER DEFAULT 0 CHECK(stelle >= 0 AND stelle <= 5),
    UNIQUE(nome, indirizzo)
);

CREATE TABLE Camera(
	cameraID INTEGER PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(10) NOT NULL,
    albergoRIF INTEGER NOT NULL,
    FOREIGN KEY (albergoRIF) REFERENCES Albergo(albergoID) ON DELETE CASCADE,
    UNIQUE (numero, albergoRIF)
);

CREATE TABLE Cliente(
	clienteID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL,
    cognome VARCHAR(250) NOT NULL,
    email VARCHAR(250) NOT NULL UNIQUE
);

CREATE TABLE Prenotazione(
	data_ingresso DATE NOT NULL,
    data_uscita DATE NOT NULL,
    check_in DATE,
    check_out DATE,
    cameraRIF INTEGER NOT NULL,
    clienteRIF INTEGER NOT NULL,
	FOREIGN KEY (cameraRIF) REFERENCES Camera(cameraID) ON DELETE CASCADE,
	FOREIGN KEY (clienteRIF) REFERENCES Cliente(clienteID) ON DELETE CASCADE
);

INSERT INTO Albergo (nome, indirizzo, stelle) VALUES
('Hotel Riviera', 'Via Lungomare 1, Rimini', 4),
('Grand Hotel Italia', 'Piazza Repubblica 5, Milano', 5),
('Albergo Sole', 'Via Roma 10, Firenze', 3),
('Hotel Monte Bianco', 'Via Alpina 20, Courmayeur', 4),
('Hotel Venezia', 'Calle del Paradiso 15, Venezia', 5),
('Hotel Napoli Centrale', 'Piazza Garibaldi 30, Napoli', 3),
('Hotel Palermo Mare', 'Via Cristoforo Colombo 45, Palermo', 4),
('Hotel Bologna Fiera', 'Viale della Fiera 100, Bologna', 4),
('Hotel Torino Centro', 'Via Roma 25, Torino', 3),
('Hotel Genova Porto', 'Via Gramsci 50, Genova', 4);

INSERT INTO Camera (numero, albergoRIF) VALUES
('101', 1), ('102', 1), ('201', 2), ('202', 2), ('301', 3),
('302', 3), ('401', 4), ('402', 4), ('501', 5), ('502', 5),
('601', 6), ('602', 6), ('701', 7), ('702', 7), ('801', 8),
('802', 8), ('901', 9), ('902', 9), ('1001',10),('1002',10);

INSERT INTO Cliente (nome, cognome, email) VALUES
('Mario', 'Rossi', 'mario.rossi@email.com'),
('Laura', 'Verdi', 'laura.verdi@email.com'),
('Giovanni', 'Bianchi', 'giovanni.bianchi@email.com'),
('Anna', 'Neri', 'anna.neri@email.com'),
('Luca', 'Gialli', 'luca.gialli@email.com'),
('Sofia', 'Marrone', 'sofia.marrone@email.com'),
('Marco', 'Viola', 'marco.viola@email.com'),
('Elena', 'Arancio', 'elena.arancio@email.com'),
('Davide', 'Blu', 'davide.blu@email.com'),
('Chiara', 'Grigio', 'chiara.grigio@email.com');

INSERT INTO Prenotazione (data_ingresso, data_uscita, check_in, check_out, cameraRIF, clienteRIF) VALUES
('2023-10-20', '2023-10-25', '2023-10-20', '2023-10-25', 1, 1),
('2023-11-10', '2023-11-15', '2023-11-10', '2023-11-15', 2, 2),
('2023-12-01', '2023-12-05', '2023-12-01', '2023-12-05', 3, 3),
('2024-01-15', '2024-01-20', '2024-01-15', '2024-01-20', 4, 4),
('2024-02-28', '2024-03-03', '2024-02-28', '2024-03-03', 5, 5),
('2024-03-10', '2024-03-17', '2024-03-10', '2024-03-17', 6, 6),
('2024-04-05', '2024-04-10', '2024-04-05', '2024-04-10', 7, 7),
('2024-05-20', '2024-05-25', '2024-05-20', '2024-05-25', 8, 8),
('2024-06-12', '2024-06-18', '2024-06-12', '2024-06-18', 9, 9),
('2024-07-01', '2024-07-07', '2024-07-01', '2024-07-07', 10, 10),
('2024-08-01', '2024-08-05', '2024-08-01', '2024-08-05', 11, 1),
('2024-08-05', '2024-08-10', '2024-08-05', '2024-08-10', 12, 2),
('2024-09-01', '2024-09-08', '2024-09-01', '2024-09-08', 13, 3),
('2024-09-15', '2024-09-22', '2024-09-15', '2024-09-22', 14, 4),
('2024-10-01', '2024-10-03', '2024-10-01', '2024-10-03', 15, 5);

-- Elenca i dettagli di tutte le prenotazioni ed i relativi alberghi (e camere) del cliente Mario Rossi
SELECT Cliente.nome, cognome, email, data_ingresso, data_uscita, check_in, check_out, numero, Albergo.nome AS "Nome albergo", indirizzo, stelle
	FROM Cliente
    JOIN Prenotazione ON Cliente.clienteID = Prenotazione.clienteRIF
    JOIN Camera ON Prenotazione.cameraRIF = Camera.cameraID
    JOIN Albergo ON Camera.albergoRIF = Albergo.albergoID;
    -- WHERE Cliente.nome = "Mario" AND cognome = "Rossi";
    
-- Creazione vista
CREATE VIEW RiepilogoPrenotazioni AS
	SELECT Cliente.nome, cognome, email, data_ingresso, data_uscita, check_in, check_out, numero, Albergo.nome AS "Nome albergo", indirizzo, stelle
	FROM Cliente
    JOIN Prenotazione ON Cliente.clienteID = Prenotazione.clienteRIF
    JOIN Camera ON Prenotazione.cameraRIF = Camera.cameraID
    JOIN Albergo ON Camera.albergoRIF = Albergo.albergoID;
    
DROP VIEW     RiepilogoPrenotazioni;

SELECT * FROM RiepilogoPrenotazioni WHERE nome = "Mario" AND cognome = "Rossi";