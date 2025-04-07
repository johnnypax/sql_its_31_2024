-- DDL
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Salary DECIMAL(10, 2)
);

CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeRIF INT,
    SaleDate DATE,
    SalesAmount DECIMAL(10, 2),
	FOREIGN KEY (EmployeeRIF) REFERENCES Employees(EmployeeID) ON DELETE CASCADE
);

--DML
INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary) VALUES
(1, 'John', 'Doe', 50000),
(2, 'Jane', 'Smith', 60000),
(3, 'Emily', 'Jones', 70000);

INSERT INTO Sales (EmployeeRIF, SaleDate, SalesAmount) VALUES
(1, '2024-03-01', 1200.00),
(1, '2024-03-02', 1500.00),
(2, '2024-03-01', 800.00),
(3, '2024-03-03', 2300.00),
(2, '2024-03-04', 400.00),
(3, '2024-03-02', 1600.00);

ALTER PROCEDURE CalculateTotalSales
	@eId INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			CREATE TABLE #TotalSales(
				Sale DECIMAL(10, 2)
			);

			INSERT INTO #TotalSales(Sale)
				SELECT SalesAmount FROM Sales WHERE EmployeeRIF = @eId;

			SELECT SUM(Sale) AS 'Totale Vendite' FROM #TotalSales;

			DROP TABLE #TotalSales;

			PRINT 'Stappooooooooo'
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;

		PRINT 'errore';
	END CATCH
END;

EXEC CalculateTotalSales @eId = 3;