# DBMS
 This repository is dedicated to practicing and solving various topics and concepts in Database Management Systems (DBMS).

# Introduction to DBMS
 ```
❖ Data
 
⚫ Data is a collection of a distinct small unit of information. It can be used
   in various forms like text, numbers, media, bytes, etc., stored in paper or electronic memory, etc.

⚫ Word 'Data' is originated from the word 'datum' which means 'single piece
   of information.' It is the plural of the word datum.  

⚫ In computing, Data is information that can be translated into a form for
    efficient movement and processing. Data is interchangeable.

```

```
❖ Database

⚫ A database is an organized collection of data so that it can be easily
    accessed and managed.

⚫ You can organize data into tables, rows, and columns, and index it to make it
    easier to find relevant information.

⚫ Database handlers create a database in such a way that only one set of
   software program provides access to data to all the users.

⚫ The main purpose of the database is to operate a large amount of
    information by storing, retrieving, and managing data.

⚫ There are many dynamic websites on the World Wide Web nowadays that are handled
   through databases. For example, a model that checks the availability of rooms
   in a hotel. It is an example of a dynamic website that uses a database.

⚫ There are many databases available like MySQL, Sybase, Oracle, MongoDB, Informix,
    PostgreSQL, SQL Server, etc.

⚫ The database management system manages modern databases
    (DBMS).

⚫ SQL or Structured Query Language is used to operate on the data stored
in a database. SQL depends on relational algebra and tuple relational
calculus.

⚫ A cylindrical structure is used to display the image of a database. 

```

![image](https://github.com/MuhammadShoaibKalim/DBMS/assets/120046632/93a26ab1-557a-4ee1-a4b8-deeb0bb46b05)


**DBMS (Data Base Management System)**
```
  Database management System is software used to store and retrieve the database. For example, Oracle, MySQL, etc.;
    are some popular DBMS tools. 
   •	DBMS provides the interface to perform various operations like creation, deletion, modification, etc. 
   •	DBMS allows the user to create their databases as per their requirement. 
   •	DBMS accepts the request from the application and provides specific data through the operating system. 
   •	DBMS contains a group of programs that act according to the user instructions. 
   •	It provides security to the database.

 ➢ Advantage of DBMS

   ◆	Controls redundancy: It stores all the data in a single database file to control data redundancy. 
   ◆	Data sharing: An authorized user can share the data among multiple users. 
   ◆	Backup: It provides a backup and recovery subsystem. This recovery system creates automatic data from system failure and
      restores data if required.
   ◆	Multiple user interfaces: It provides a different type of user interfaces like GUI, and application interfaces.

 ➢ Disadvantage of DBMS

   ◆	Size: It occupies large disk space and large memory to run efficiently. 
   ◆	Cost: DBMS requires a high-speed data processor and larger memory to run DBMS software, so it is costly. 
   ◆	Complexity: DBMS creates additional complexity and requirements. 

```
  **Types of Databases**
  ![image](https://github.com/MuhammadShoaibKalim/DBMS/assets/120046632/12608202-03f7-4c27-9b50-6df05e967b10)
  
```
1- Centralized database

   ⚫ It is the type of database that stores data in a centralized database 
   ⚫	 It comforts the users to access the stored data from different locations through several applications.  
   ⚫	 These applications contain the authentication process to let users access data securely.  
   ⚫	 An example of a Centralized database can be a Central Library that carries a central database of each library in 
       a college/university.

 Advantages:

    ◆ It has decreased the risk of data management, i.e., manipulation of data will not affect the core data.
    ◆ Data consistency is maintained as it manages data in a central repository. 
    ◆ It provides better data quality, which enables organizations to establish data standards.
    ◆ It is less costly because fewer vendors are required to handle the data sets.

 Disadvantages :

    ◆ The size of the centralized database is large, which increases the response time for fetching the data.
    ◆ It is not easy to update such an extensive database system.
    ◆ If any server failure occurs, entire data will be lost, which could be a huge loss.

```

``` 
  2- Distributed Database

   ⚫	Unlike a centralized database system, in distributed systems, data is distributed among different database
      systems of an organization.  
   ⚫	These database systems are connected via communication links. Such links help the end-users to access
      the data easily.  
   ⚫	Examples of the Distributed database are Apache Cassandra, HBase, Ignite, etc. 
      We can further divide a distributed database system into:

     1.	Homogeneous DDB: Those database systems that execute on the same operating system and use the same 
        application process and carry the same hardware devices. 
     2.	Heterogeneous DDB: Those database systems that execute on different operating systems under different 
        application procedures and carry different hardware devices.

     Advantages of Distributed Database 
    	⚫ Modular development is possible in a distributed database, i.e., the system can be expanded by including 
        new computers and connecting them to the distributed system. 
     ⚫	One server failure will not affect the entire data set. 

```

```
   3- Relational Database

     ⚫	This database is based on the relational data model, which stores data in the form of rows(tuples) and
         columns(attributes), and together forms a table(relation).  
     ⚫	A relational database uses SQL for storing, manipulating, as well as maintaining the data. E.F. Codd
         invented the database in 1970.  
     ⚫	Each table in the database carries a key that makes the data unique from others.  
     ⚫	Examples of Relational databases are MySQL, Microsoft SQL Server, Oracle, etc.

    Properties of Relational Database 
      There are following four commonly known properties of a relational model known as ACID properties, where: 
      ➢	A means Atomicity: This ensures the data operation will be complete either with success or with failure.
         It follows the 'all or nothing' strategy. For example, a transaction will either be committed or will abort. 
      ➢	C means Consistency: If we perform any operation over the data, its value before and after the operation 
         should be preserved. For example, the account balance before and after the transaction should be correct, 
         i.e., it should remain conserved. 
      ➢	I mean Isolation: There can be concurrent users accessing data at the same time from the database. Thus,
         isolation between the data should remain isolated. For example, when multiple transactions occur at the same time,
          one transaction's effects should not be visible to the other transactions in the database. 
      ➢	D means Durability: It ensures that once it completes the operation and commits the data, data changes should
         remain permanent. 
 
    4- NoSQL Database 

      ⚫	Non-SQL/Not Only SQL is a type of database that is used for storing a wide range of data sets.  
      ⚫	It is not a relational database as it stores data not only in tabular form but in several different ways.  
      ⚫	It came into existence when the demand for building modern applications increased. Thus, NoSQL presented
        a wide variety of database technologies in response to the demands.  
      ⚫	We can further divide a NoSQL database into the following four types: 
```
