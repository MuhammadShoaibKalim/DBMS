# DBMS

## SQL_Syntax
- [Basic_Syntax.sql](./SQL_Syntax/Basic_Syntax.sql)
- [Advanced_Syntax.sql](./SQL_Syntax/Advanced_Syntax.sql)
- [Joins.sql](./SQL_Syntax/Joins.sql)
- [Subqueries.sql](./SQL_Syntax/Subqueries.sql)
- [Indexes.sql](./SQL_Syntax/Indexes.sql)
- [Transactions.sql](./SQL_Syntax/Transactions.sql)
- [Views.sql](./SQL_Syntax/Views.sql)
- [Stored_Procedures.sql](./SQL_Syntax/Stored_Procedures.sql)
- [Triggers.sql](./SQL_Syntax/Triggers.sql)
- [Functions.sql](./SQL_Syntax/Functions.sql)

## Projects
- [Employee_Management_System](./Projects/Employee_Management_System)
- [Online_Retail_Database](./Projects/Online_Retail_Database)
- [Library_Management_System](./Projects/Library_Management_System)
- [Hospital_Management_System](./Projects/Hospital_Management_System)

 ## Creating, Dropping, and Altering Tables

 ### 1. How to create DB
 ```sql
 CREATE DATABASE database_name;
```

 **2. Using DB**

 ```
 USE database_name;
```
 **example**
 ```
USE my_database;
 ```

**3. Drop a DB**
```
DROP DATABASE database_name;
```
 **example**
 ```
DROP DATABASE my_database;
```

**4. Creating Table**
```
CREATE TABLE table_name (
    column1 datatype PRIMARY KEY (optional),
    column2 datatype,
    column3 datatype,
   ....
);
```
**Example**
```
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2)
);
```
**5. Dropping Table**
```
DROP TABLE table_name;
```
**Example**
```
DROP TABLE employees;
```
**6. Altering Tables**
```
ALTER TABLE table_name
ADD column_name datatype;

ALTER TABLE table_name
DROP COLUMN column_name;

ALTER TABLE table_name
MODIFY COLUMN column_name datatype;
```
**Example**
```
ALTER TABLE employees
ADD birthdate DATE;

ALTER TABLE employees
DROP COLUMN birthdate;

ALTER TABLE employees
MODIFY COLUMN name VARCHAR(150);
```

# Basic Data Operations

**7. Inserting Data**

```
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```
**Example**
```
INSERT INTO employees (id, name, position, salary)
VALUES (1, 'John Doe', 'Manager', 75000.00);
```
**8. Selecting Data**
```
SELECT column1, column2, ...
FROM table_name
WHERE condition;

SELECT * FROM table_name;
```
**Example**
```
SELECT name, salary
FROM employees
WHERE position = 'Manager';

SELECT * FROM employees;
```
**9. Updating Data**
```
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```
**Example**
```
UPDATE employees
SET salary = 80000.00
WHERE id = 1;
```

**9. Deleting Data**
```
DELETE FROM table_name
WHERE condition;
```
**Example**
```
DELETE FROM employees
WHERE id = 1;
```

# Advanced SQL Syntax

### Joins

**10. Inner Join**
```
SELECT columns
FROM table1
INNER JOIN table2
ON table1.column = table2.column;
```
**Example**
```
SELECT employees.name, departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.id;
```
**11. Left Join**
```
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;
```
**Example**
```
SELECT employees.name, departments.department_name
FROM employees
LEFT JOIN departments
ON employees.department_id = departments.id;
```
**12. Right Join**
```
SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.column = table2.column;
```
**Example**
```
SELECT employees.name, departments.department_name
FROM employees
RIGHT JOIN departments
ON employees.department_id = departments.id;
```

**13. FULL OUTER JOIN Join**
```
SELECT columns
FROM table1
FULL OUTER JOIN table2
ON table1.column = table2.column;
```
**Example**
```
SELECT employees.name, departments.department_name
FROM employees
FULL OUTER JOIN departments
ON employees.department_id = departments.id;
```

**14. Sub Queries** 
```
SELECT column1
FROM table_name
WHERE column2 = (SELECT column2
                 FROM table_name
                 WHERE condition);
```
**Example**
```
SELECT name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
```
**Index**

**15. Create Index**
```
CREATE INDEX index_name
ON table_name (column1, column2, ...);
```
**Example**
```
CREATE INDEX idx_salary
ON employees (salary);
```
**16. Droppig Index**
```
DROP INDEX index_name;
```
**Example**
```
DROP INDEX idx_salary;
```
**Transaction**

**17. Make Transaction**
```
BEGIN TRANSACTION;

-- SQL statements

COMMIT;

-- or if something goes wrong

ROLLBACK;
```
**Example**
```
BEGIN TRANSACTION;

UPDATE employees
SET salary = salary * 1.1
WHERE department_id = 2;

COMMIT;

-- or if something goes wrong

ROLLBACK;
```
**VIEW**

**18. Create View**
```
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```
**Example**
```
CREATE VIEW high_salary_employees AS
SELECT name, salary
FROM employees
WHERE salary > 50000;
```
**19. Drop View**
```
DROP VIEW view_name;
```
**Example**
```
DROP VIEW high_salary_employees;
```
**Stored Procedures**

**20. Create  Stored Procedures**
```
CREATE PROCEDURE procedure_name
AS
BEGIN
    -- SQL statements
END;
```
**Example**
```
CREATE PROCEDURE raise_salary
AS
BEGIN
    UPDATE employees
    SET salary = salary * 1.1;
END;
```

**21. Executing Stored Procedures**
```
EXEC procedure_name;
```
**Example**
```
EXEC raise_salary;
```
**22. Dropping Stored Procedures**
```
DROP PROCEDURE procedure_name;
```
**Example**
```
DROP PROCEDURE raise_salary;
```

# Function

**23. Create Function**
```
CREATE FUNCTION function_name (@param1 datatype, @param2 datatype, ...)
RETURNS return_datatype
AS
BEGIN
    -- SQL statements
    RETURN return_value;
END;
```
**Example**
```
CREATE FUNCTION calculate_bonus (@salary DECIMAL)
RETURNS DECIMAL
AS
BEGIN
    RETURN @salary * 0.1;
END;
```
**24. Execution Function**
```
SELECT function_name(param1, param2, ...);
```
**Example**
```
SELECT calculate_bonus(salary)
FROM employees;
```
**25. Dropping Function**
```
DROP FUNCTION function_name;
```
**Example**
```
DROP FUNCTION calculate_bonus;
```

**Trigers**

**26. Create Triggers**
```
CREATE TRIGGER trigger_name
ON table_name
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- SQL statements
END;
```
**Example**
```
CREATE TRIGGER trg_after_insert
ON employees
AFTER INSERT
AS
BEGIN
    PRINT 'A new employee record has been inserted.';
END;
```
**27. Dropping Trigger**
```
DROP TRIGGER trigger_name;
```
**Example**
```
DROP TRIGGER trg_after_insert;
```
# Using AND, OR, NOT, BETWEEN, and IN

**28. AND**
```
SELECT name, salary
FROM Employees
WHERE position = 'Manager' AND salary > 70000;
```
**Example**
```
SELECT name, salary
FROM employees
WHERE position = 'Manager' AND salary > 70000;
```

**29. OR**
```
SELECT name, salary
FROM Employees
WHERE position = 'Manager' OR position = 'Developer';
```
**Example**
```
SELECT name, salary
FROM employees
WHERE position = 'Manager' OR position = 'Developer';
```
**30. NOT**
```
SELECT name, salary
FROM Employees
WHERE NOT position = 'Manager';
```

**Example**
```
SELECT name, salary
FROM employees
WHERE NOT position = 'Manager';
```
**31. BETWEEN**
```
SELECT name, salary
FROM Employees
WHERE salary BETWEEN 50000 AND 80000;
```
**Example**
```
SELECT name, salary
FROM employees
WHERE salary BETWEEN 50000 AND 80000;
```
**32. IN**
```
SELECT name, salary
FROM Employees
WHERE position IN ('Manager', 'Developer');
```
**Example**
```
SELECT name, salary
FROM employees
WHERE position IN ('Manager', 'Developer');
```

**33. IS NULL**
```
SELECT column1, column2, ...
FROM table_name
WHERE column_name IS NULL;
```
**Example**
```
SELECT name, salary
FROM employees
WHERE salary IS NULL;
```
**34. IS NOT NULL**
```
SELECT column1, column2, ...
FROM table_name
WHERE column_name IS NOT NULL;
```
**Example**
```
SELECT column1, column2, ...
FROM table_name
WHERE column_name IS NOT NULL;
```
**35. Using COALESCE**
```
SELECT COALESCE(column1, column2, ...) AS alias_name
FROM table_name;
```
**Example**
```
SELECT name, COALESCE(bonus, 0) AS bonus
FROM employees;
```
**36.Using LIKE with Wildcards**
```
SELECT column1, column2, ...
FROM table_name
WHERE column_name LIKE pattern;
```
**Note:** 
The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

**Example : %**
```
-- Find all employees whose names start with 'J'
SELECT name
FROM employees
WHERE name LIKE 'J%';
```
**Example with: _**
```
-- Find all employees whose names have 'o' as the second character
SELECT name
FROM employees
WHERE name LIKE '_o%';
```
**Combining Both: % _**
```
-- Find all employees whose names start with 'J' and have 'n' as the third character
SELECT name
FROM employees
WHERE name LIKE 'J_n%';
```
**Note:** The COALESCE function returns the first non-NULL value in a list of arguments.

**37. Sorting Data with ORDER BY**

```
SELECT column1, column2, ...
FROM table_name
ORDER BY column1 [ASC|DESC], column2 [ASC|DESC], ...;
```
**Ascending order**
```
-- Select all employees sorted by their salary in ascending order
SELECT name, salary
FROM employees
ORDER BY salary ASC;
```
**Descending order**
```
-- Select all employees sorted by their salary in descending order
SELECT name, salary
FROM employees
ORDER BY salary DESC;
```
**Multiple Columns**
```
-- Select all employees sorted by department and then by name within each department in ascending order
SELECT name, department_id, salary
FROM employees
ORDER BY department_id ASC, name ASC;
```
**38. Using Distinct**
```
SELECT DISTINCT column1, column2, ...
FROM table_name;
```
**Example**
```
-- Select unique positions from the employees table
SELECT DISTINCT position
FROM employees;
```
```
-- Select unique combinations of department_id and position
SELECT DISTINCT department_id, position
FROM employees;
```
# Aggregate Functions (COUNT, MAX, MIN, SUM, AVG)
**39. Count**
```
-- Count the total number of employees
SELECT COUNT(*)
FROM employees;

Output:
| COUNT(*) |
|----------|
|    10    |

```
**Exmaple**
```
-- Count the number of employees in each department
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id;
```
**40. Max**
```
-- Find the highest salary among all employees
SELECT MAX(salary)
FROM employees;
```
**Example**
```
-- Find the highest salary in each department
SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id;
```

**41. MIN**
```
-- Find the lowest salary among all employees
SELECT MIN(salary)
FROM employees;
```
```
-- Find the lowest salary in each department
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id;
```
**42. SUM**
```
-- Calculate the total salary paid to all employees
SELECT SUM(salary)
FROM employees;
```
**Exmaple**
```
-- Calculate the total salary paid in each department
SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id;
```
**43. AVG**
```
-- Calculate the average salary of all employees
SELECT AVG(salary)
FROM employees;
```
**Example**
```
-- Calculate the average salary in each department
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;
```
# GROUP BY Clause 
**Note:** It is often used with aggregate functions like COUNT, MAX, MIN, SUM, and AVG to perform operations on each data group.

**44. Count**
```
SELECT column1, aggregate_function(column2)
FROM table_name
WHERE condition
GROUP BY column1, column2, ...;
```
**Example**
```
-- Count the number of employees in each department
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id;
```
**Output**
```
| department_id | COUNT(*) |
|---------------|----------|
|       1       |     3    |
|       2       |     4    |
|       3       |     3    |
```
**45. Avg**
```
-- Calculate the average salary for each department
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;
```
**Example**
```
-- Calculate the average salary for each department
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;
```
**Output**
```
| department_id | avg_salary |
|---------------|------------|
|       1       |   60000.00 |
|       2       |   70000.00 |
|       3       |   86666.67 |
```
**46. Having**
```
-- Find departments with an average salary greater than 70000
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 70000;
```
**Output**
```
| department_id | avg_salary |
|---------------|------------|
|       2       |   70000.00 |
|       3       |   86666.67 |
```

**47. Combining GROUP BY with ORDER BY**
```
-- Count the number of employees in each department and sort by department_id
SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id
ORDER BY department_id;
```
**Output**
```
| department_id | num_employees |
|---------------|---------------|
|       1       |       3       |
|       2       |       4       |
|       3       |       3       |
```
**48. Using Multiple Columns in GROUP BY**
```
-- Count the number of employees in each department and position
SELECT department_id, position, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id, position;
```
**Output**
```
| department_id | position  | num_employees |
|---------------|-----------|---------------|
|       1       | Manager   |       1       |
|       1       | Developer |       2       |
|       2       | Manager   |       2       |
|       2       | Developer |       2       |
|       3       | Manager   |       1       |
|       3       | Developer |       2       |
```
**Point to remember:**
1. The `GROUP BY` clause is a powerful tool in SQL for organizing data into **groups** and performing aggregate calculations on those groups. While it is not an **aggregate function itself**, it is often used in **conjunction with aggregate functions** to summarize data.
2. The `WHERE` clause filters rows before any groupings are made and any aggregate functions are applied. It is used to specify conditions on individual rows in a table.
   **Example**
```
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```
**Output**
```
| id |	name	   | salary | department_id |
|----|---------|--------|---------------|
| 1	 | Alice   | 50000	 | 1             |
| 2	 | Bob	    | 60000	 | 1             | 
| 3	 | Charlie	| 70000	 | 2             |
| 4	 | David	  | 80000	 | 2             |
| 5	 | Eve	    | 90000	 | 3             |
```
**Example**
```
-- Select employees with salary greater than 60000
SELECT name, salary
FROM employees
WHERE salary > 60000;
```
**Output**
```
| name    | salary |
|---------|--------|
| Charlie | 70000  |
| David   | 80000  |
| Eve     | 90000  |
```
**HAVING Clause**
```
SELECT column1, aggregate_function(column2)
FROM table_name
GROUP BY column1
HAVING condition;
```
**Example**
```
-- Find departments with an average salary greater than 65000
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 65000;
```
**Output**
```
| department_id | avg_salary |
|---------------|------------|
|       2       |  75000.00  |
|       3       |  90000.00  |
```
This structure organizes the SQL syntax and examples into a comprehensive and easy-to-navigate `README.md` file for your repository. You can add this file to your repository and update the path paths based on your directory structure.

