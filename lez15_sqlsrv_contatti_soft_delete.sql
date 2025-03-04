CREATE TABLE Cliente(
	clienteID INTEGER PRIMARY KEY IDENTITY(1,1),	-- AUTO_INCREMENT
	nome VARCHAR(250) NOT NULL,
	cognome VARCHAR(250) NOT NULL,
	email VARCHAR(250),
	telefono VARCHAR(250),
	creato_il DATETIME DEFAULT CURRENT_TIMESTAMP,
	cancellato TINYINT DEFAULT 0 CHECK (cancellato IN (1, 0))
);

INSERT INTO Cliente (nome, cognome, email, telefono) VALUES ('Mario', 'Rossi', 'mario.rossi@email.com', '3331234567');
INSERT INTO Cliente (nome, cognome, email, telefono) VALUES ('Laura', 'Bianchi', 'laura.bianchi@email.com', '3349876543');
INSERT INTO Cliente (nome, cognome, email, telefono) VALUES ('Giuseppe', 'Verdi', 'giuseppe.verdi@email.com', '3351122334');
INSERT INTO Cliente (nome, cognome, email, telefono) VALUES ('Anna', 'Neri', 'anna.neri@email.com', '3364455667');
INSERT INTO Cliente (nome, cognome, email, telefono) VALUES ('Roberto', 'Gialli', 'roberto.gialli@email.com', '3378899001');
INSERT INTO Cliente (nome, cognome, email, telefono) VALUES ('Francesca', 'Blu', 'francesca.blu@email.com', '3382233445');
INSERT INTO Cliente (nome, cognome, email, telefono) VALUES ('Paolo', 'Viola', 'paolo.viola@email.com', '3395566778');
INSERT INTO Cliente (nome, cognome, email, telefono) VALUES ('Elena', 'Arancio', 'elena.arancio@email.com', '3408899002');
INSERT INTO Cliente (nome, cognome, email, telefono) VALUES ('Marco', 'Marrone', 'marco.marrone@email.com', '3412233446');
INSERT INTO Cliente (nome, cognome, email, telefono) VALUES ('Sara', 'Rosa', 'sara.rosa@email.com', '3425566779');

-- Query che tiene conto del SOFT DELETE
SELECT * FROM Cliente WHERE cancellato = 0;

-- Cancellazione tramite SOFT DELETE
UPDATE Cliente SET cancellato = 1 WHERE clienteID = 3;

DROP VIEW IF EXISTS ClientiAttivi;
CREATE VIEW ClientiAttivi 
AS
	SELECT nome, cognome, email, telefono, creato_il
	FROM Cliente WHERE cancellato = 0;

SELECT * FROM ClientiAttivi;