CREATE TABLE Employee(
	employeeID INT PRIMARY KEY IDENTITY(1,1),
	firstName VARCHAR(250) NOT NULL,
	lastName VARCHAR(250) NOT NULL,
	email VARCHAR(250),
	jobTitle VARCHAR(250) NOT NULL,
	department VARCHAR(250),
	startDate DATE
);

INSERT INTO Employee (firstName, lastName, email, jobTitle, department, startDate) VALUES
('Alice', 'Smith', 'alice.smith@example.com', 'Software Engineer', 'Engineering', '2022-01-15'),
('Bob', 'Johnson', 'bob.johnson@example.com', 'Data Analyst', 'Data Science', '2022-02-20'),
('Charlie', 'Williams', 'charlie.williams@example.com', 'Project Manager', 'Project Management', '2022-03-25'),
('David', 'Brown', 'david.brown@example.com', 'Marketing Specialist', 'Marketing', '2022-04-30'),
('Eve', 'Davis', 'eve.davis@example.com', 'Sales Representative', 'Sales', '2022-05-05'),
('Frank', 'Miller', 'frank.miller@example.com', 'HR Manager', 'Human Resources', '2022-06-10'),
('Grace', 'Wilson', 'grace.wilson@example.com', 'Financial Analyst', 'Finance', '2022-07-15'),
('Henry', 'Moore', 'henry.moore@example.com', 'UX Designer', 'Design', '2022-08-20'),
('Ivy', 'Taylor', 'ivy.taylor@example.com', 'Network Administrator', 'IT', '2022-09-25'),
('Jack', 'Anderson', 'jack.anderson@example.com', 'Customer Support', 'Support', '2022-10-30'),
('Karen', 'Thomas', 'karen.thomas@example.com', 'Software Developer', 'Engineering', '2023-01-05'),
('Liam', 'Jackson', 'liam.jackson@example.com', 'Data Scientist', 'Data Science', '2023-02-10'),
('Mia', 'White', 'mia.white@example.com', 'Product Manager', 'Project Management', '2023-03-15'),
('Noah', 'Harris', 'noah.harris@example.com', 'Digital Marketer', 'Marketing', '2023-04-20'),
('Olivia', 'Martin', 'olivia.martin@example.com', 'Account Executive', 'Sales', '2023-05-25'),
('Peter', 'Thompson', 'peter.thompson@example.com', 'Recruiter', 'Human Resources', '2023-06-30'),
('Quinn', 'Garcia', 'quinn.garcia@example.com', 'Budget Analyst', 'Finance', '2023-07-05'),
('Ryan', 'Martinez', 'ryan.martinez@example.com', 'UI Designer', 'Design', '2023-08-10'),
('Sophia', 'Robinson', 'sophia.robinson@example.com', 'Systems Engineer', 'IT', '2023-09-15'),
('Tyler', 'Clark', 'tyler.clark@example.com', 'Technical Support', 'Support', '2023-10-20');

SELECT * FROM Employee;

CREATE VIEW DepartmentEngineering AS
	SELECT * FROM Employee WHERE department = 'engineering';

SELECT * FROM DepartmentEngineering WHERE startDate > '2023-01-01'; 
-- STORED PROCEDURES ---------------------------------------------------------
-- Dichiarazione
CREATE PROCEDURE GetAllEngineers AS
BEGIN
	SELECT * FROM Employee WHERE department = 'engineering';
END;

-- Invocazione
EXEC GetAllEngineers;

-- Eliminazione SP
DROP PROCEDURE if exists GetAllEngineers;

-- Modifica SP
ALTER PROCEDURE GetAllEngineers AS 
BEGIN
	SELECT * FROM Employee WHERE department = 'engineering' AND startDate > '2023-01-01';
END;