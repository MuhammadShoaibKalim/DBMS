# Database Management System (DBMS)

This repository provides a comprehensive guide to understanding Database Management Systems (DBMS). It covers fundamental concepts, SQL commands, database normalization, indexing, transactions, backup and recovery, and database security. This guide is intended to serve as a valuable resource for anyone looking to understand and master DBMS.

## Table of Contents

1. [Introduction to DBMS](#introduction-to-dbms)
2. [Data and Database](#data-and-database)
3. [Types of Databases](#types-of-databases)
4. [Levels of Abstraction in DBMS](#levels-of-abstraction-in-dbms)
5. [Database Schema](#database-schema)
6. [Keys in DBMS](#keys-in-dbms)
7. [ER Model (Entity-Relationship Model)](#er-model-entity-relationship-model)
8. [Normalization](#normalization)
9. [SQL (Structured Query Language)](#sql-structured-query-language)
10. [Indexes in DBMS](#indexes-in-dbms)
11. [Transactions in DBMS](#transactions-in-dbms)
12. [Database Backup and Recovery](#database-backup-and-recovery)
13. [Database Security](#database-security)
14. [Additional Concepts](#additional-concepts)
15. [Conclusion](#conclusion)

## Introduction to DBMS

A Database Management System (DBMS) is software that interacts with end-users, applications, and the database itself to capture and analyze data. 

### Functions of DBMS:
- Data storage, retrieval, and update
- User administration
- Data integrity and security

## Data and Database

- **Data:** Raw facts and figures without context.
- **Database:** An organized collection of data, generally stored and accessed electronically from a computer system.

## Types of Databases

1. **Hierarchical Databases**
2. **Network Databases**
3. **Relational Databases (RDBMS)**
4. **Object-Oriented Databases**
5. **NoSQL Databases**

## Levels of Abstraction in DBMS

1. **Physical Level:** How the data is stored.
2. **Logical Level:** What data is stored and the relationships among the data.
3. **View Level:** Interaction with the data, including user interfaces and application programs.

## Database Schema

- **Schema:** The structure that defines the organization of data in a database.
- **Types of Schemas:**
  - **Physical Schema**
  - **Logical Schema**
  - **View Schema**

## Keys in DBMS

1. **Primary Key:** A unique identifier for a record in a table.
2. **Foreign Key:** A field that uniquely identifies a row in another table.
3. **Candidate Key:** A set of attributes that uniquely identify a tuple.
4. **Super Key:** A set of one or more keys that can uniquely identify a tuple.
5. **Composite Key:** A primary key composed of multiple columns.

## ER Model (Entity-Relationship Model)

- **Entities:** Objects that exist and are distinguishable from other objects.
- **Attributes:** Properties or characteristics of an entity.
- **Relationships:** Associations between entities.
- **ER Diagrams:** Visual representations of entities and their relationships.

## Normalization

- **Normalization:** The process of organizing data to minimize redundancy.
- **Normal Forms:**
  1. **First Normal Form (1NF)**
  2. **Second Normal Form (2NF)**
  3. **Third Normal Form (3NF)**
  4. **Boyce-Codd Normal Form (BCNF)**
  5. **Fourth Normal Form (4NF)**
  6. **Fifth Normal Form (5NF)**

## SQL (Structured Query Language)

### SQL Commands:

1. **Data Definition Language (DDL):**
    - CREATE, ALTER, DROP
2. **Data Manipulation Language (DML):**
    - SELECT, INSERT, UPDATE, DELETE
3. **Data Control Language (DCL):**
    - GRANT, REVOKE
4. **Transaction Control Language (TCL):**
    - COMMIT, ROLLBACK, SAVEPOINT

### Examples:
```sql
-- Creating a table
CREATE TABLE table_name (
    column1 datatype PRIMARY KEY,
    column2 datatype,
    column3 datatype
);

-- Selecting data from a table
SELECT column1, column2 FROM table_name WHERE condition;

-- Inserting data into a table
INSERT INTO table_name (column1, column2) VALUES (value1, value2);

-- Updating data in a table
UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;

-- Deleting data from a table
DELETE FROM table_name WHERE condition;
```

### Indexes in DBMS #indexes-in-dbms
Indexes are special lookup tables that the database search engine can use to speed up data retrieval. They are essential for enhancing the performance of database queries.

###  Types of Indexes
1. Unique Index
A unique index ensures that the indexed column(s) do not have duplicate values. This type of index helps maintain data integrity by enforcing the uniqueness of data in the indexed column(s).

**Example:**
```-- Creating a unique index
CREATE UNIQUE INDEX idx_unique ON table_name (column_name);
```
Indexes in DBMS
Indexes are special lookup tables that the database search engine can use to speed up data retrieval. They are essential for enhancing the performance of database queries.

**Types of Indexes**
      
     **1. Unique Index**
A unique index ensures that the indexed column(s) do not have duplicate values. This type of index helps maintain data integrity by enforcing the uniqueness of data in the indexed column(s).

```
-- Creating a unique index
CREATE UNIQUE INDEX idx_unique ON table_name (column_name);
```

**Interview Focus:**

Understand scenarios where unique indexes are useful (e.g., email addresses, user IDs).
Explain how unique indexes prevent duplicate entries and help maintain data integrity.
 **2. Clustered Index**
A clustered index determines the physical order of data in a table. There can be only one clustered index per table because the data rows can be sorted in only one order. The leaf nodes of a clustered index contain the actual data pages of the table.

 **Example**
```
-- Creating a clustered index
CREATE CLUSTERED INDEX idx_clustered ON table_name (column_name);
```
**Interview Focus:**

Understand how clustered indexes affect the physical storage of data.
Discuss the performance benefits and drawbacks of using clustered indexes.
Explain the impact on INSERT, UPDATE, and DELETE operations.
 **3. Non-Clustered Index**
A non-clustered index is a separate structure from the data rows. It contains a sorted list of references to the data. A table can have multiple non-clustered indexes, and they are useful for queries that do not change the physical order of the rows.

**Example:**
```
-- Creating a non-clustered index
CREATE INDEX idx_non_clustered ON table_name (column_name);
```
**Interview Focus:**

Differentiate between clustered and non-clustered indexes.
Understand the scenarios where non-clustered indexes are more beneficial.
Discuss how non-clustered indexes can speed up SELECT queries.
**Interview Considerations for Indexes**
**Indexing Strategies: **
Know when to use unique, clustered, and non-clustered indexes.
 **Performance Impact:**
Understand how indexes can speed up read operations but may slow down write operations.
**Index Maintenance:**
Be aware of index fragmentation and the need for regular maintenance to ensure optimal performance.
**Composite Indexes:**
Understand how multi-column indexes work and when to use them.
**Covering Indexes:** 
Learn about indexes that include all columns needed for a query, avoiding the need to access the table data.
**Index Usage:** 
Use EXPLAIN or execution plans to analyze how indexes are being used in queries.
Transactions in DBMS
**Transaction:** 
A sequence of operations performed as a single logical unit of work.
**ACID Properties:**
 **-> Atomicity**
 **-> Consistency**
** -> Isolation**
**-> Durability**
  **Transaction Control Commands:**
```
-- Committing a transaction
COMMIT;

-- Rolling back a transaction
ROLLBACK;

-- Setting a savepoint
SAVEPOINT savepoint_name;

-- Setting transaction characteristics
SET TRANSACTION [READ WRITE | READ ONLY];
```
 **Database Backup and Recovery**
**Backup:**
Creating a copy of the data to protect against data loss.
**Recovery:**
Restoring the database to a correct state in the event of a failure.
**Types of Backup:**
1. Full Backup
2. Differential Backup
3. Incremental Backup
**Recovery Techniques:**
1. Log-based Recovery
2. Shadow Paging
3. Database Security
**Database Security: **
Protecting the database from unauthorized access, misuse, and threats.
****Security Measures:****
 **1. Authentication**
 **2. Authorization**
 **3. Encryption**
 **4. Auditing**
**Additional Concepts**
**Views:**
A virtual table based on the result set of an SQL statement.
```
CREATE VIEW view_name AS
SELECT column1, column2 FROM table_name WHERE condition;
```
**Stored Procedures:**
A set of SQL statements that can be stored and executed on the database.
```
CREATE PROCEDURE procedure_name
AS
BEGIN
    -- SQL Statements
END;
```
 **Triggers:**
Procedures that are automatically executed in response to certain events on a particular table or view.
```CREATE TRIGGER trigger_name
ON table_name
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- SQL Statements
END;
```
 **Joins:**
-> Combining rows from two or more tables based on a related column.
-> Types: INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN
```
SELECT a.column1, b.column2
FROM table1 a
INNER JOIN table2 b
ON a.common_column = b.common_column;
```
### Conclusion
This guide provides a foundational understanding of Database Management Systems (DBMS), covering essential topics such as types of databases, levels of abstraction, database schema, keys, ER models, normalization, SQL, indexing, transactions, backup and recovery, and security. It is designed to help individuals develop a thorough grasp of DBMS concepts and practical skills for database management.

```
This `README.md` file includes all the necessary sections and details as specified, formatted appropriately for a markdown file.
```
