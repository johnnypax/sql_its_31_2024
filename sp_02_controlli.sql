DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
	Code NVARCHAR(50) DEFAULT NEWID() UNIQUE,
    Salary DECIMAL(10, 2)				-- 123456769.11
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary) VALUES
(1, 'John', 'Doe', 50000),
(2, 'Jane', 'Smith', 60000),
(3, 'Emily', 'Jones', 70000);

UPDATE Employees 
			SET Salary = '80000'
			WHERE Code = 'E3264305-C27E-40A2-BBF9-5AC2EFF78C3C'


SELECT * FROM Employees;

-- Aggiorna il salario con id impiegato
ALTER PROCEDURE UpdateSalaryByCode 
	@EmplCode NVARCHAR(50),
	@EmplSala DECIMAL(10, 2)
AS
BEGIN
	BEGIN TRY
		-- Aggiorna salario
		UPDATE Employees 
			SET Salary = @EmplSala
			WHERE Code = @EmplCode

		IF @@ROWCOUNT = 0
			THROW 50001, 'Impiegato non trovato', 1

		PRINT 'Operazione effettuata con successo'
	END TRY
	BEGIN CATCH
		PRINT 'Errore: ' + ERROR_MESSAGE()
	END CATCH
END;

-- Invocazione
EXEC UpdateSalaryByCode @EmplCode = '4B4AE466-DDCE-4AF2-B672-83AA2171FA6F', @EmplSala = 80000;