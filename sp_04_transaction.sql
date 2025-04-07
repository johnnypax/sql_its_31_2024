DROP TABLE IF EXISTS  OrderDetails;
DROP TABLE IF EXISTS  Products;

-- DDL
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProdName NVARCHAR(100) NOT NULL,
	ProdCode NVARCHAR(50) NOT NULL UNIQUE,
    Quantity INT DEFAULT 1 CHECK (Quantity >= 0)
);

CREATE TABLE OrderDetails (
    OrderID INT PRIMARY KEY IDENTITY(1,1), 
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--DML
INSERT INTO Products (ProdName, ProdCode, Quantity) VALUES
('Tavolo', 'TAV01', 10),
('Sedia', 'SED01', 20),
('Lampada', 'LAM01', 30);


ALTER PROCEDURE PlaceOrder
	@pId INT,
	@pQuan INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Aggiorno l'inventario
			UPDATE Products 
				SET Quantity = Quantity - @pQuan
				WHERE ProductID = @pId;

			-- if @@ROWCOUNT = 0
			--	THROW 50001, 'Errore di codice o quantià', 1

			-- INserisco l'ordine perché la quantità esiste ed il prodotto esiste
			INSERT INTO OrderDetails (ProductID, Quantity) VALUES (@pId, @pQuan);

			PRINT 'Operazione effettuata con successo';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;

		PRINT 'Errore: Errore di codice o quantià';
	END CATCH
END;

EXEC PlaceOrder @pID = 2, @pQuan = 15;


SELECT * FROM Products;
SELECT * FROM OrderDetails;