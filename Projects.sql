CREATE DATABASE ORG;

-- Show DATABASES;

USE ORG;


CREATE TABLE Worker (
    Worker_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    First_name CHAR(25),
    Last_name CHAR(25),
    Salary INT,
    Joining_Date DATE,
    Department CHAR(25)
);

-- Enable IDENTITY_INSERT for the Worker table
SET IDENTITY_INSERT Worker ON;


-- Insert values into the Worker table
INSERT INTO Worker (Worker_id, First_name, Last_name, Salary, Joining_Date, Department)
VALUES 
(1, 'Ali', 'Khan', 850000, '2023-10-19', 'HR'),
(2, 'Sara', 'Ali', 700000, '2023-11-01', 'Finance'),
(3, 'John', 'Doe', 950000, '2023-09-15', 'IT'),
(4, 'Jane', 'Smith', 780000, '2023-08-25', 'Marketing'),
(5, 'Mike', 'Jones', 620000, '2023-12-05', 'HR'),
(6, 'Emily', 'Clark', 670000, '2023-07-20', 'Finance'),
(7, 'David', 'Brown', 900000, '2023-05-30', 'IT');


-- Disable IDENTITY_INSERT for the Worker table
SET IDENTITY_INSERT Worker OFF;

      
Select * FROM Worker;



CREATE TABLE Bonus (
    Worker_id_ref INT ,
    Bonus_amount DECIMAL(10, 2),
    Bonus_date DATE,
    FOREIGN KEY (Worker_id_ref) REFERENCES Worker(Worker_id)
	ON DELETE CASCADE
);

	INSERT INTO Bonus (Worker_id_ref, Bonus_amount, Bonus_date) VALUES
(1, 5000.00, '2023-07-01'),
(2, 6000.00, '2023-07-15'),
(3, 7000.00, '2023-08-01'),
(4, 8000.00, '2023-08-15'),
(5, 9000.00, '2023-09-01'),
(6, 10000.00, '2023-09-15'),
(7, 11000.00, '2023-10-01');
  
  CREATE TABLE Title (
    Worker_id_ref INT ,
    Worker_title char(25),
    Affected_from DATE,
    FOREIGN KEY (Worker_id_ref) REFERENCES Worker(Worker_id)
	ON DELETE CASCADE
);




INSERT INTO Title (Worker_id_ref, Worker_title, Affected_from) VALUES 
(1, 'Manager', '2022-01-01'),
(2, 'Assistant', '2022-02-01'),
(3, 'Clerk', '2022-03-01'),
(4, 'Supervisor', '2022-04-01'),
(5, 'Technician', '2022-05-01'),
(6, 'Executive', '2022-06-01'),
(7, 'HR', '2022-07-01');


SELECT * from Title;
