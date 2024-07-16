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

---------------------------------------------------07 DDL-----------------------------------------------------------------------
 ## Creating, Dropping, and Altering Table(DDL)

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
# Alter Operations

**6. Altering Tables**

**6.0 Drop**
```
ALTER TABLE employees
DROP COLUMN salary;
```
**6.1 Modify**
```
ALTER TABLE table_name
MODIFY COLUMN column_name datatype [constraints];
```
**Example**
```
ALTER TABLE employees
MODIFY COLUMN salary DECIMAL(15, 2);
```

**6.2 Add column**
```
ALTER TABLE table_name
ADD COLUMN column_name datatype [constraints];
```
**Example**
```
ALTER TABLE employees
ADD COLUMN hire_date DATE;
```
**6.3 Rename**
```
ALTER TABLE table_name
RENAME COLUMN old_column_name TO new_column_name;
```
**Example**
```
ALTER TABLE table_name
RENAME COLUMN old_column_name TO new_column_name;
```
**6.4 Add Constraints**
```
ALTER TABLE table_name
ADD CONSTRAINT constraint_name constraint_type (column_name);
```
**Example**
```
ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);
```
**6.5 DESC Command**
```
DESC table_name;
-- or
DESCRIBE table_name;
```
**Example**
```
DESC employees;
```
**6.6 CHANGE Command**
```
ALTER TABLE table_name
CHANGE COLUMN old_column_name new_column_name column_definition;
```

**Note:**

1. The `DESC` (or DESCRIBE) command is used to display the structure of a table, including the column names, **data types**, and any constraints. This command helps you understand the schema of a table, including details about each column.
2. The `CHANGE` command is used in MySQL to modify the definition of an existing column in a table. This command allows you to **rename** a column, change its data type, and modify its constraints.

     **Parameter**
      1. table_name: The name of the table containing the column to be changed.
      2. old_column_name: The current name of the column.
      3. new_column_name: The new name for the column.
      4. column_definition: The new data type and constraints for the column.

       
        1. Change Column Name and Data Type
   
         ALTER TABLE employees
         CHANGE COLUMN name name VARCHAR(150) NOT NULL;
         
       2. Change Column Data Type and Add Constraints
         
         ALTER TABLE employees
         CHANGE COLUMN salary monthly_salary DECIMAL(15, 2);

---------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------08 DML---------------------------------------------------------------------
# Basic Data Operations (DML)

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

**9.0 Deleting Data**
```
DELETE FROM table_name
WHERE condition;
```
**Example**
```
DELETE FROM employees
WHERE id = 1;
```
---------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------09 On Delete, on Delete Cascade-------------------------------------
**9.1 On Delete Cascade**
```
ALTER TABLE child_table
ADD CONSTRAINT fk_constraint_name
FOREIGN KEY (column_name) REFERENCES parent_table (column_name)
ON DELETE CASCADE;
```
**Example**
```
ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id) REFERENCES departments(department_id)
ON DELETE CASCADE;
```
**9.1 On Delete Set NULL**
```
ALTER TABLE child_table
ADD CONSTRAINT fk_constraint_name
FOREIGN KEY (column_name) REFERENCES parent_table (column_name)
ON DELETE SET NULL;
```
**Example**
```
ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id) REFERENCES departments(department_id)
ON DELETE SET NULL;
```
**Note:**

**ON DELETE CASCADE:** Deletes all related child records. Use this for the complete removal of dependent data.

**ON DELETE SET NULL:** Sets foreign key to NULL. Use this to keep child records but indicate the parent data is gone.
---------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------11 Replace, Update-----------------------------------------------------
**9.2 REPLACE**
```
REPLACE INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```
**Example**
```
REPLACE INTO employees (id, name, salary, department_id)
VALUES (2, 'Bob', 65000, 1);
```
**Use Case:** 
When you need to ensure that a row with a specific key is present in the table, either by inserting a new row or 
updating an existing one.

**Benefits:** 
Simplifies the logic for upsert (insert or update) operations by handling both insertion and updating in a single command.

**Note:**
1. `Replace` is used if data is already present. 
2. `Update` is used if data is not present.
3. If a row is not present `replace` will add a row and `update` will do nothing.
   ---------------------------------------------------------------------------------------------------------------------------

   --------------------------------------------------------------12 JOIN -----------------------------------------------------
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
   
### Outer Join

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
**10.0 Using Aliases (AS) with INNERLEFT/RIGHT JOIN**
```
SELECT columns
FROM table1 AS alias1
INNER JOIN table2 AS alias2
ON alias1.column = alias2.column;
```
**Example**
```
SELECT e.name, d.department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.id;
```

**Note:**
   1. Aliases in SQL are used to give a table or a column a temporary name. This is often useful to make your SQL queries more readable
   and manageable, especially when dealing with joins.
   2. MySQL does not directly support FULL OUTER JOIN. You can achieve the same result using a UNION of LEFT JOIN and RIGHT JOIN.
 ```
SELECT columns
FROM table1 AS alias1
LEFT JOIN table2 AS alias2
ON alias1.column = alias2.column
UNION
SELECT columns
FROM table1 AS alias1
RIGHT JOIN table2 AS alias2
ON alias1.column = alias2.column;
```
 **Example**
 ```
SELECT e.name, d.department_name
FROM employees AS e
LEFT JOIN departments AS d
ON e.department_id = d.id
UNION
SELECT e.name, d.department_name
FROM employees AS e
RIGHT JOIN departments AS d
ON e.department_id = d.id;
```

(*) `employees` table is aliased as `e`.

(*) `departments` table is aliased as `d`.

(*) `e.name` refers to the `name` column from the `employees` table.

(*) `d.department_name` refers to the `department_name` column from the `departments` table.

(*) `ON` clause uses the aliases to refer to the `department_id` in the `employees` table and the `id` in the `departments` table.


**Note:**
1. To apply to `join`, there should be at least common attributes in both tables.
2. In `left join` all data of the left table but also added matching data of the right table is called left join.
3. In `right join` all data of the left table but also added matching data of the left table is called right join.


 ----------------------------------------------------------------------------------------------------------------------------

 -------------------------------------------------14 Sub Queries-------------------------------------------------------------
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
 ------------------------------16 Index---------------------------------------------------------------------------------------------
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
**16. Dropping Index**
```
DROP INDEX index_name;
```
**Example**
```
DROP INDEX idx_salary;
```
---------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------13 Set-----------------------------------------------------------------
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
---------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------15 View------------------------------------------------------------------
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
 ------------------------------06---------------------------------------------------------------------------------------------
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
 ------------------------------01----------------------------------------------------------------------------------------
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
---------------------------------------------------------------------------------------------------------------------------

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
------------------------------------02--------------------------------------------------------------------------------------
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

---------------------------------------------------------------------------------------------------------------------------

----------------------------------03---------------------------------------------------------------------------------------
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
 ---------------------------------------------------------------------------------------------------------------------------

 --------------------------------------04------------------------------------------------------------------------------------
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
 ---------------------------------------------------------------------------------------------------------------------------

 -------------------------------------------------04-------------------------------------------------------------------------
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

-----------------------------------------------------05 HAVING ---------------------------------------------------------------------
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
---------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------03---------------------------------------------------------------------------
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
| id  | name    | salary | department_id |
|-----|---------|--------|---------------|
| 1   | Alice   | 50000  | 1             |
| 2   | Bob     | 60000  | 1             |
| 3   | Charlie | 70000  | 2             |
| 4   | David   | 80000  | 2             |
| 5   | Eve     | 90000  | 3             |
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
---------------------------------------------------------------------------------------------------------------------------

-------------------------------------------06 UNIQUE, CHECK, DEFAULT -------------------------------------------------------------------------------
# Check and Unique constraints in Table

**49. Check Constraint**
```
CREATE TABLE table_name (
    column1 datatype CHECK (condition),
    column2 datatype,
    ...
);
```
**Example**
```
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2) CHECK (salary > 30000),
    department_id INT
);
```
**50. Unique Constraint**
```
CREATE TABLE table_name (
    column1 datatype UNIQUE,
    column2 datatype,
    ...
);
```
**Example**
```
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10, 2),
    department_id INT
);
```
**51. Default Constraint**
```
CREATE TABLE table_name (
    column1 datatype DEFAULT default_value,
    column2 datatype,
    ...
);
```
**Example**
```
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2) DEFAULT 40000,
    department_id INT
);
```
**Note:**

1. The `UNIQUE constraint` ensures that all values in a column are different. It helps to ensure that no duplicate values are entered in a column.
2. The `CHECK constraint` is used to limit the range of values that can be placed in a column. It ensures that all values in a column satisfy certain conditions.
3. The `DEFAULT constraint` provides a default value for a column when no value is specified during the insertion of a record. This is useful for ensuring that columns have meaningful default values.
 ------------------------------01.3---------------------------------------------------------------------------------------------


This structure organizes the SQL syntax and examples into a comprehensive and easy-to-navigate `README.md` file for your repository. You can add this file to your repository and update the path paths based on your directory structure.

