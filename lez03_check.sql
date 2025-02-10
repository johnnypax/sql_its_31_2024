	-- DDL
    DROP DATABASE IF EXISTS its_31_03_negozio;
    CREATE DATABASE its_31_03_negozio;
    USE its_31_03_negozio;
    
    CREATE TABLE Prodotto(
		prodottoID INTEGER PRIMARY KEY AUTO_INCREMENT,
        codice VARCHAR(25) NOT NULL UNIQUE,
        nome VARCHAR(250) NOT NULL,
        descrizione TEXT,
        prezzo FLOAT DEFAULT 0.1 CHECK (prezzo >= 0),
        quantita INTEGER DEFAULT 1 CHECK (quantita >= 0),
        data_inserimento DATETIME DEFAULT CURRENT_TIMESTAMP
    );
    
    -- DML
    INSERT INTO Prodotto(codice, nome, descrizione, prezzo) VALUES
    ("AB1234", "Cacciavite", "Che vitaccia, disse...", 12.5);
    
    UPDATE Prodotto SET quantita = -98 WHERE codice = "AB1234";
    
    -- QL
    SELECT * FROM Prodotto;