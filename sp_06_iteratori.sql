-- DDL
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- DML
INSERT INTO Employees(FirstName, LastName, Salary) VALUES
('Giovanni', 'Pace', 100000),
('Valeria', 'Verdi', 120000),
('Mario', 'Rossi', 90000);

SELECT * FROM Employees;

-- Stampare dettagli impiegato
ALTER PROCEDURE PrintEmployeeDetails
AS
BEGIN
	DECLARE @varFir NVARCHAR(50);
	DECLARE @varLat NVARCHAR(50);
	DECLARE @varSal DECIMAL(10, 2);

	-- Creo un cursore
	DECLARE EmployeeCursor CURSOR FOR
		SELECT FirstName, LastName, Salary FROM Employees;

	-- Aprire il cursore
	OPEN EmployeeCursor;

	-- Recupero le informazioni dalla prima riga
	FETCH NEXT FROM EmployeeCursor INTO @varFir, @varLat, @varSal;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT 'Dettaglio impiegato: ' + @varFir + ', ' + @varLat + 'Stipendio: ' + CAST(@varSal AS NVARCHAR(50));

		FETCH NEXT FROM EmployeeCursor INTO @varFir, @varLat, @varSal;
	END;

	-- Chiude il risultato sotto forma tabellare della SELECT
	CLOSE EmployeeCursor;
	-- Pulisce la memoria
	DEALLOCATE EmployeeCursor;
END;

EXEC PrintEmployeeDetails;