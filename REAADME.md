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
