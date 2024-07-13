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
