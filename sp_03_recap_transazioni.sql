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

BEGIN TRANSACTION
	INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary) VALUES
	(1, 'John', 'Doe', 50000);
	INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary) VALUES
	(2, 'Jane', 'Smith', 60000);
	INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary) VALUES
	(3, 'Emily', 'Jones', 70000);
COMMIT TRANSACTION;