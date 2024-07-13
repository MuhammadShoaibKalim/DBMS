# DBMS

│
├── SQL_Syntax
│   ├── Basic_Syntax.sql

│   ├── Advanced_Syntax.sql

│   ├── Joins.sql

│   ├── Subqueries.sql

│   ├── Indexes.sql

│   ├── Transactions.sql

│   ├── Views.sql

│   ├── Stored_Procedures.sql

│   ├── Triggers.sql

│   └── Functions.sql

│
├── Projects

│   ├── Employee_Management_System

│   │   ├── README.md

│   │   ├── Schema.sql

│   │   ├── Queries.sql

│   │   ├── Stored_Procedures.sql

│   │   └── Functions.sql

│   │

│   ├── Online_Retail_Database

│   │   ├── README.md

│   │   ├── Schema.sql

│   │   ├── Queries.sql

│   │   ├── Stored_Procedures.sql

│   │   └── Functions.sql

│   │

│   ├── Library_Management_System

│   │   ├── README.md

│   │   ├── Schema.sql

│   │   ├── Queries.sql

│   │   ├── Stored_Procedures.sql

│   │   └── Functions.sql

│   │

│   └── Hospital_Management_System
│       ├── README.md
│       ├── Schema.sql
│       ├── Queries.sql
│       ├── Stored_Procedures.sql
│       └── Functions.sql


 **1. How to create DB**
 ```
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

### Basic Data Operations

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
