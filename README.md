# DBMS

This repository is dedicated to practicing and solving various topics and concepts in Database Management Systems (DBMS).

## Introduction to DBMS

### Data

- Data is a collection of distinct small units of information. It can be used in various forms like text, numbers, media, bytes, etc., stored in paper or electronic memory, etc.
- The word 'Data' is originated from the word 'datum' which means 'single piece of information.' It is the plural of the word datum.
- In computing, Data is information that can be translated into a form for efficient movement and processing. Data is interchangeable.

Additional resource: [Introduction to DBMS](https://drive.google.com/file/d/1lNtUlDnDwHwhv8QHFaarsoX4CFK8Ty92/view)

### Database

- A database is an organized collection of data so that it can be easily accessed and managed.
- You can organize data into tables, rows, and columns, and index it to make it easier to find relevant information.
- Database handlers create a database in such a way that only one set of software program provides access to data to all the users.
- The main purpose of the database is to operate a large amount of information by storing, retrieving, and managing data.
- There are many dynamic websites on the World Wide Web nowadays that are handled through databases. For example, a model that checks the availability of rooms in a hotel. It is an example of a dynamic website that uses a database.
- There are many databases available like MySQL, Sybase, Oracle, MongoDB, Informix, PostgreSQL, SQL Server, etc.
- The database management system manages modern databases (DBMS).
- SQL or Structured Query Language is used to operate on the data stored in a database. SQL depends on relational algebra and tuple relational calculus.
- A cylindrical structure is used to display the image of a database.

![image](https://github.com/MuhammadShoaibKalim/DBMS/assets/120046632/93a26ab1-557a-4ee1-a4b8-deeb0bb46b05)

### DBMS (Database Management System)

**Definition:**

- A DBMS is software that provides an interface to interact with databases for creating, retrieving, updating, and managing data.

**Advantages of DBMS:**

- Controls redundancy: It stores all the data in a single database file to control data redundancy.
- Data sharing: An authorized user can share the data among multiple users.
- Backup: It provides a backup and recovery subsystem. This recovery system creates automatic data from system failure and restores data if required.
- Multiple user interfaces: It provides a different type of user interfaces like GUI, and application interfaces.

**Disadvantages of DBMS:**

- Size: It occupies large disk space and large memory to run efficiently.
- Cost: DBMS requires a high-speed data processor and larger memory to run DBMS software, so it is costly.
- Complexity: DBMS creates additional complexity and requirements.

### Types of Databases

#### 1. Centralized database

- It is the type of database that stores data in a centralized database.
- It comforts the users to access the stored data from different locations through several applications.
- These applications contain the authentication process to let users access data securely.
- An example of a Centralized database can be a Central Library that carries a central database of each library in a college/university.

**Advantages:**

- It has decreased the risk of data management, i.e., manipulation of data will not affect the core data.
- Data consistency is maintained as it manages data in a central repository.
- It provides better data quality, which enables organizations to establish data standards.
- It is less costly because fewer vendors are required to handle the data sets.

**Disadvantages:**

- The size of the centralized database is large, which increases the response time for fetching the data.
- It is not easy to update such an extensive database system.
- If any server failure occurs, entire data will be lost, which could be a huge loss.

#### 2. Distributed Database

- Unlike a centralized database system, in distributed systems, data is distributed among different database systems of an organization.
- These database systems are connected via communication links. Such links help the end-users to access the data easily.
- Examples of the Distributed database are Apache Cassandra, HBase, Ignite, etc.

**Types of Distributed Database Systems:**

1. Homogeneous DDB: Those database systems that execute on the same operating system and use the same application process and carry the same hardware devices.
2. Heterogeneous DDB: Those database systems that execute on different operating systems under different application procedures and carry different hardware devices.

**Advantages of Distributed Database:**

- Modular development is possible in a distributed database, i.e., the system can be expanded by including new computers and connecting them to the distributed system.
- One server failure will not affect the entire data set.

#### 3. Relational Database

- This database is based on the relational data model, which stores data in the form of rows (tuples) and columns (attributes), and together forms a table (relation).
- A relational database uses SQL for storing, manipulating, as well as maintaining the data. E.F. Codd invented the database in 1970.
- Each table in the database carries a key that makes the data unique from others.
- Examples of Relational databases are MySQL, Microsoft SQL Server, Oracle, etc.

**Properties of Relational Database:**

There are four commonly known properties of a relational model known as ACID properties, where:
- **A** means Atomicity: This ensures the data operation will be complete either with success or with failure. It follows the 'all or nothing' strategy. For example, a transaction will either be committed or will abort.
- **C** means Consistency: If we perform any operation over the data, its value before and after the operation should be preserved. For example, the account balance before and after the transaction should be correct, i.e., it should remain conserved.
- **I** means Isolation: There can be concurrent users accessing data at the same time from the database. Thus, isolation between the data should remain isolated. For example, when multiple transactions occur at the same time, one transaction's effects should not be visible to the other transactions in the database.
- **D** means Durability: It ensures that once it completes the operation and commits the data, data changes should remain permanent.

#### 4. NoSQL Database

- Non-SQL/Not Only SQL is a type of database that is used for storing a wide range of data sets.
- It is not a relational database as it stores data not only in tabular form but in several different ways.
- It came into existence when the demand for building modern applications increased. Thus, NoSQL presented a wide variety of database technologies in response to the demands.

**Types of NoSQL Database:**

1. Key-value storage: It is the simplest type of database storage where it stores every single item as a key (or attribute name) holding its value, together.
2. Document-oriented Database: A type of database used to store data as JSON-like documents. It helps developers in storing data by using the same document-model format as used in the application code.
3. Graph Databases: It is used for storing vast amounts of data in a graph-like structure. Most commonly, social networking websites use the graph database.
4. Wide-column stores: It is similar to the data represented in relational databases. Here, data is stored in large columns together, instead of stored in rows.

**Advantages of NoSQL Database:**

- It enables good productivity in application development as it is not required to store data in a structured format.
- It is a better option for managing and handling large data sets.
- It provides high scalability.
- Users can quickly access data from the database through key-value.

#### 5. Cloud Database

- A type of database where data is stored in a virtual environment and executes over the cloud computing platform.
- It provides users with various cloud computing services (SaaS, PaaS, IaaS, etc.) for accessing the database.
- There are numerous cloud platforms, but the best options are:

  - Amazon Web Services (AWS)
  - Microsoft Azure
  - Kamatera
  - PhonixNAP
  - ScienceSoft
  - Google Cloud SQL, etc.

#### 6. Object-oriented Databases

- The type of database that uses the object-based data model approach for storing data in the database system.
- The data is represented and stored as objects that are similar to the objects used in the object-oriented programming language.

#### 7. Hierarchical Databases

- It is the type of database that stores data in the form of parent-children relationship nodes.
- Here, it organizes data in a tree-like structure.
- Data gets stored in the form of records that are connected via links. Each child record in the tree will contain only one parent. On the other hand, each parent record can have multiple child records.

#### 8. Network Databases

- It is the database that typically follows the network data model.
- Here, the representation of data is in the form of nodes connected via links between them.
- Unlike the hierarchical database, it allows each record to have multiple children and parent nodes to form a generalized graph structure.

#### 9. Personal Database

- Collecting and storing data on the user's system defines a Personal Database.
- This database is basically designed for a single user.

**Advantages of Personal Database:**

- It is simple and easy to handle.
- It occupies less storage space as it is small in size.

#### 10. Operational Database

- The type of database which creates and updates the database in real-time.
- The operational database stores data related to operations in an organization.

#### 11. Enterprise Database

- Enterprise Database is the type of database that is used in enterprises.
- It manages and accesses data in a large-scale organization.
- Here, thousands of users can access and share the data simultaneously across the globe.

#### 12. Data Warehouses

- A type of database used for data analysis. It performs queries and analysis on the historical data.
- Data in the data warehouse is collected from multiple sources and stored in the database.
- Here, the end-users can access data through the Business Intelligence (BI) tools, SQL clients, and spreadsheets.

### Levels of Abstraction in a DBMS

#### 1. Physical Level

- This is the lowest level of data abstraction. It describes how data is stored in the database.
- The complex low-level data structures in detail are described at this level.
- The physical level is also known as the internal level.

#### 2. Logical Level

- It is the middle level of data abstraction that describes what data is stored in the database, and what the relationships among those data are.
- It describes the entire database structure of the database.
- This level is also known as the conceptual level.
- The Database Administrator (DBA) and the developers work at this level of abstraction.

#### 3. View Level

- It is the highest level of data abstraction that describes only part of the entire database.
- Even though the view level is the highest level, it is usually the one that is most used.
- The end-users usually work at this level of abstraction.

### Schema in DBMS

- A database schema defines how the data is organized and how the relations among them are associated. It formulates all the constraints that are to be applied to the data.
- A database schema defines its entities and the relationship among them.
- A database schema is of three types: Logical Schema, Physical Schema, and View Schema.
- The database is divided into three levels which are the internal schema, conceptual schema, and external schema.

**1. Physical Schema:**

- It describes the database's physical storage details. It is hidden below the logical schema and can typically only be accessed by the DBMS and rarely by database administrators.

**2. Logical Schema:**

- It describes the structure of the database at the logical level. Programmers and database administrators usually use it. It is mostly used to understand data and relationships.

**3. View Schema:**

- It describes the database at the user level. This schema generally describes end-user interaction with database systems. It hides the details of the internal and logical levels and presents only the required data to the user.

### Keys in DBMS

- Keys play an important role in Database Management System (DBMS). It is used to identify the record uniquely.
- A Key is an attribute or set of attributes that can identify each record uniquely.
- Keys are also used to establish and identify relationships between tables.

**Types of Keys:**

1. **Primary Key:**
    - A primary key is used to uniquely identify each record in a table. It must contain unique values and cannot contain null values. There can be only one primary key in a table.
    
2. **Super Key:**
    - A super key is a set of one or more columns (attributes) to uniquely identify rows in a table. A super key may have additional attributes that are not necessary for unique identification.
    
3. **Candidate Key:**
    - A candidate key is a set of attributes that uniquely identify tuples in a table. A table can have multiple candidate keys.
    
4. **Alternate Key:**
    - Alternate keys are the candidate keys that are not selected as the primary key of the table.
    
5. **Foreign Key:**
    - A foreign key is an attribute or set of attributes in one table that references the primary key of another table. It acts as a cross-reference between tables.
    
6. **Composite Key:**
    - A composite key is a combination of two or more columns that uniquely identify rows in a table. Each column in a composite key can individually allow duplicate values, but when combined, they uniquely identify each record.

### ER Model (Entity-Relationship Model)

- The Entity-Relationship (ER) model is a high-level conceptual data model that defines the data elements and their relationships for a specified system.
- It is used to develop a conceptual design for the database.
- The ER model is based on real-world entities and relationships among them.
- An entity is a real-world object with a distinct existence. Each entity has attributes which represent properties of the entity.
- Relationships are associations between entities.

**Components of ER Diagram:**

1. **Entity:**
    - An entity is an object that exists. It can be a person, place, event, or any object that has a distinct existence in the real world. Entities are represented by rectangles in ER diagrams.
    
2. **Attribute:**
    - An attribute describes the property of an entity. Attributes are represented by ovals in ER diagrams.
    
3. **Relationship:**
    - A relationship describes how entities interact. Relationships are represented by diamonds in ER diagrams.

**Types of Attributes:**

1. **Simple Attribute:**
    - Simple attributes are atomic values that cannot be divided further. For example, a student's roll number or a person's age.
    
2. **Composite Attribute:**
    - Composite attributes are attributes that can be divided into smaller sub-parts, each of which represents a more basic attribute with an independent meaning. For example, a person's name (which can be divided into first name, middle name, and last name).
    
3. **Derived Attribute:**
    - Derived attributes are attributes whose values can be calculated from related attribute values. For example, age can be derived from the date of birth.
    
4. **Multi-valued Attribute:**
    - Multi-valued attributes are attributes that can have multiple values. For example, a person can have multiple phone numbers or email addresses.

### Normalization in DBMS

- Normalization is the process of organizing data to minimize redundancy. It is also used to remove insert, update, and delete
