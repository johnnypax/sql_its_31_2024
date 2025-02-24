CREATE DATABASE its_31_08_mtm_recap;
USE its_31_08_mtm_recap;

CREATE TABLE Cliente(
	clienteID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL,
    cognome VARCHAR(250) NOT NULL,
    indirizzo VARCHAR(500) NOT NULL,
    cod_fis CHAR(16) NOT NULL UNIQUE
);

CREATE TABLE Conto(
	contoID INTEGER PRIMARY KEY AUTO_INCREMENT,
    iban VARCHAR(250) NOT NULL UNIQUE,
    saldo DECIMAL(5, 2) DEFAULT 0
);

CREATE TABLE Cliente_Conto(
	clienteRIF INTEGER NOT NULL,
    contoRIF INTEGER NOT NULL,
    FOREIGN KEY (clienteRIF) REFERENCES Cliente(clienteID) ON DELETE CASCADE,
    FOREIGN KEY (contoRIF) REFERENCES Conto(contoID) ON DELETE CASCADE,
    PRIMARY KEY (clienteRIF, contoRIF)
);

CREATE TABLE Carta(
	cartaID INTEGER PRIMARY KEY AUTO_INCREMENT,
    numero INTEGER(16) NOT NULL UNIQUE,
    scadenza DATE, -- CHECK (scadenza > SELECT CURRENT_TIMESTAMP),
    clienteRIF INTEGER NOT NULL,
    contoRIF INTEGER NOT NULL,
    FOREIGN KEY (clienteRIF) REFERENCES Cliente(clienteID) ON DELETE CASCADE,
    FOREIGN KEY (contoRIF) REFERENCES Conto(contoID) ON DELETE CASCADE
);

ALTER TABLE Carta MODIFY COLUMN numero BIGINT NOT NULL UNIQUE;

INSERT INTO Cliente (nome, cognome, indirizzo, cod_fis) VALUES
('Mario', 'Rossi', 'Via Roma 1, Milano', 'RSSMRA80A01L219X'),
('Laura', 'Bianchi', 'Piazza Garibaldi 2, Roma', 'BNCLRA85B02M320Y'),
('Giuseppe', 'Verdi', 'Corso Italia 3, Napoli', 'VRDGPP90C03N431Z'),
('Anna', 'Neri', 'Via Veneto 4, Firenze', 'NRINNA95D04O542W'),
('Luca', 'Gialli', 'Viale Dante 5, Torino', 'GLLLCA00E05P653V'),
('Sofia', 'Marrone', 'Via Montenapoleone 6, Venezia', 'MRNSFA05F06Q764U'),
('Davide', 'Blu', 'Piazza Duomo 7, Palermo', 'BLUDVD10G07R875T'),
('Elena', 'Rosa', 'Corso Buenos Aires 8, Bologna', 'ROSLNA15H08S986S'),
('Roberto', 'Viola', 'Via Cavour 9, Genova', 'VILRRT20I09T097R'),
('Francesca', 'Arancio', 'Viale Monza 10, Bari', 'RNCFNC25J10U108Q'),
('Alessio', 'Grigio', 'Via Torino 11, Catania', 'GRGLSS30K11V119P'),
('Valentina', 'Verde', 'Piazza Castello 12, Cagliari', 'VRDVLT35L12W120O');

INSERT INTO Conto (iban, saldo) VALUES
('IT60X0300203280000000000001', 100.50),
('IT60Y0300203280000000000002', 500.25),
('IT60Z0300203280000000000003', 200.00),
('IT60A0300203280000000000004', 750.75),
('IT60B0300203280000000000005', 150.30),
('IT60C0300203280000000000006', 300.10),
('IT60D0300203280000000000007', 800.90),
('IT60E0300203280000000000008', 120.40),
('IT60F0300203280000000000009', 250.60),
('IT60G0300203280000000000010', 900.80),
('IT60H0300203280000000000011', 180.20),
('IT60I0300203280000000000012', 600.70);

INSERT INTO Cliente_Conto (clienteRIF, contoRIF) VALUES
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
(2, 3),
(3, 4);

INSERT INTO Carta (numero, scadenza, clienteRIF, contoRIF) VALUES
(1234567890123456, '2025-12-31', 1, 1),
(2345678901234567, '2026-01-31', 2, 2),
(3456789012345678, '2027-02-28', 3, 3),
(4567890123456789, '2028-03-31', 4, 4),
(5678901234567890, '2029-04-30', 5, 5),
(6789012345678901, '2030-05-31', 6, 6),
(7890123456789012, '2031-06-30', 7, 7),
(8901234567890123, '2032-07-31', 8, 8),
(9012345678901234, '2033-08-31', 9, 9),
(1234567890123457, '2034-09-30', 10, 10),
(2345678901234568, '2035-10-31', 11, 11),
(3456789012345679, '2036-11-30', 12, 12);

-- Dato il codice fiscale di un cliente, restituire tutte le carte di credito possedute
SELECT nome, cognome, numero, scadenza
	FROM Cliente
    JOIN Carta ON Cliente.clienteID = Carta.clienteRIF
    WHERE cod_fis = "RSSMRA80A01L219X";

-- Dato il codice fiscale di un cliente, restituire tutte l'elenco dei conti bancari posseduti

SELECT nome, cognome, iban, saldo
	FROM Cliente
    JOIN Cliente_Conto ON Cliente.clienteID = Cliente_Conto.clienteRIF
    JOIN Conto ON Cliente_Conto.contoRIF = Conto.contoID
    WHERE cod_fis = "RSSMRA80A01L219X";
    
-- Dato il codice fiscale di un cliente, restituire tutte l'elenco delle carte di credito possedute e relativo conto bancario associato.
SELECT *
	FROM Cliente
    JOIN Carta ON Cliente.clienteID = Carta.clienteRIF
    JOIN Conto ON Carta.contoRIF = Conto.contoID
    WHERE cod_fis = "RSSMRA80A01L219X";
    
-- Ordinare i conti correnti a seconda del saldo
SELECT * 
	FROM Conto
    ORDER BY saldo DESC; -- ASC;

-- Recuperare il conto corrente con più soldi
SELECT * 
	FROM Conto
    ORDER BY saldo DESC
    LIMIT 1;
    
SELECT MAX(saldo) AS "Massimo"
	FROM Conto;
    
SELECT MIN(saldo) AS "Minimo"
	FROM Conto;
    
SELECT AVG(saldo) AS "Media"
	FROM Conto;