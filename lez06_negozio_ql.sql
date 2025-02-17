CREATE DATABASE its_31_06_negozio;
USE its_31_06_negozio;

CREATE TABLE Prodotto(
	prodottoID INTEGER PRIMARY KEY AUTO_INCREMENT,
	codice VARCHAR(25) NOT NULL UNIQUE,
	nome VARCHAR(250) NOT NULL,
	descrizione TEXT,
	prezzo FLOAT DEFAULT 0.1 CHECK (prezzo >= 0),
	quantita INTEGER DEFAULT 1 CHECK (quantita >= 0),
	data_inserimento DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Prodotto (codice, nome, descrizione, prezzo, quantita) VALUES ('ABC-123', 'Maglietta Cotone', 'Maglietta 100% cotone, taglia M', 15.99, 100);
INSERT INTO Prodotto (codice, nome, descrizione, prezzo, quantita) VALUES ('XYZ-789', 'Jeans Denim', 'Jeans in denim, taglia 32', 49.99, 50);
INSERT INTO Prodotto (codice, nome, descrizione, prezzo, quantita) VALUES ('DEF-456', 'Scarpe Sportive', 'Scarpe da corsa, numero 42', 79.99, 25);
INSERT INTO Prodotto (codice, nome, descrizione, prezzo, quantita) VALUES ('GHI-012', 'Felpa con Cappuccio', 'Felpa in pile, taglia L', 39.99, 75);
INSERT INTO Prodotto (codice, nome, descrizione, prezzo, quantita) VALUES ('JKL-345', 'Cappello Lana', 'Cappello in lana, taglia unica', 19.99, 120);
INSERT INTO Prodotto (codice, nome, descrizione, prezzo, quantita) VALUES ('MNO-678', 'Guanti Pelle', 'Guanti in pelle, taglia M', 29.99, 60);
INSERT INTO Prodotto (codice, nome, descrizione, prezzo, quantita) VALUES ('PQR-901', 'Cintura Pelle', 'Cintura in pelle, taglia 44', 24.99, 90);
INSERT INTO Prodotto (codice, nome, descrizione, prezzo, quantita) VALUES ('STU-234', 'Calzini Cotone', 'Calzini in cotone, taglia 40-45', 9.99, 200);
INSERT INTO Prodotto (codice, nome, descrizione, prezzo, quantita) VALUES ('VWX-567', 'Sciarpa Seta', 'Sciarpa in seta, taglia unica', 34.99, 40);
INSERT INTO Prodotto (codice, nome, descrizione, prezzo, quantita) VALUES ('YZA-890', 'Borsa Pelle', 'Borsa in pelle, taglia media', 99.99, 15);

-- QL

-- SELECT codice, nome, descrizione, prezzo FROM Prodotto WHERE prezzo > 20;

-- Select per prezzo
SELECT * 
	FROM Prodotto 
    WHERE prezzo > 20 AND prezzo < 40;
    
-- Select per nome
SELECT *
	FROM Prodotto
    WHERE nome = "maglietta cotone";
    
-- Cerca tutti i prodotti che iniziano per "ma"
SELECT *
	FROM Prodotto
    WHERE nome LIKE "sc%";
    
-- Cerca tutti i prodotti che finiscono per "ia"
SELECT *
	FROM Prodotto
    WHERE nome LIKE "%a";
    
-- Contiene "io"
SELECT *
	FROM Prodotto
    WHERE nome LIKE "%o%";
    
-- Ricerca specifica
SELECT * 
	FROM Prodotto
	WHERE nome LIKE "Calzin_ Cotone";
    
-- Logica Booleana

-- prezzo > 20 AND prezzo < 40;
-- 		FALSE  AND TRUE			= FALSE
--			0	x	1			= 0
SELECT * 
	FROM Prodotto 
    WHERE prezzo > 20 AND prezzo < 40;
    
    
-- codice = "ABC-123" OR codice = "DEF-456";
-- 		TRUE		   +    FALSE				= TRUE
--		1			   +	0					= 1

-- 		0			   +    0					= FALSE
SELECT * 
	FROM Prodotto
	WHERE codice = "ABC-123" OR codice = "DEF-456";
    
SELECT * 
	FROM Prodotto
	WHERE codice IN ("ABC-123", "DEF-456");