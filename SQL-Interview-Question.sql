-- Repository Name: SQL_Syntax_Examples

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

-- Insert values into Worker table
INSERT INTO Worker (First_name, Last_name, Salary, Joining_Date, Department) VALUES
('Ali', 'Khan', 850000, '2023-10-19', 'HR'),
('Sara', 'Ahmed', 900000, '2023-11-10', 'IT'),
('John', 'Doe', 750000, '2023-09-15', 'Finance'),
('Jane', 'Smith', 820000, '2023-08-20', 'Marketing'),
('Michael', 'Brown', 870000, '2023-07-30', 'Sales'),
('Emily', 'Davis', 880000, '2023-06-25', 'Admin'),
('David', 'Wilson', 860000, '2023-05-18', 'R&D');

-- Create Bonus table
CREATE TABLE Bonus (
    Worker_id_ref INT,
    Bonus_amount DECIMAL(10, 2),
    Bonus_date DATE,
    FOREIGN KEY (Worker_id_ref) REFERENCES Worker(Worker_id)
    ON DELETE CASCADE
);

-- Insert values into Bonus table
INSERT INTO Bonus (Worker_id_ref, Bonus_amount, Bonus_date) VALUES
(1, 5000.00, '2023-12-10'),
(2, 4500.00, '2023-12-12'),
(3, 4000.00, '2023-12-14'),
(4, 5500.00, '2023-12-16'),
(5, 4700.00, '2023-12-18'),
(6, 5300.00, '2023-12-20'),
(7, 4800.00, '2023-12-22');

-- Create Title table
CREATE TABLE Title (
    Worker_id_ref INT,
    Worker_title CHAR(25),
    Affected_from DATE,
    FOREIGN KEY (Worker_id_ref) REFERENCES Worker(Worker_id)
    ON DELETE CASCADE
);

-- Insert values into Title table
INSERT INTO Title (Worker_id_ref, Worker_title, Affected_from) VALUES
(1, 'Manager', '2022-01-01'),
(2, 'Assistant', '2022-02-01'),
(3, 'Clerk', '2022-03-01'),
(4, 'Supervisor', '2022-04-01'),
(5, 'Technician', '2022-05-01'),
(6, 'Executive', '2022-06-01'),
(7, 'HR', '2022-07-01');
