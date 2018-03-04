# DB theory day 1 2/26/18

MS SQL express edition + visio

SQLite

### Chp. 1

DB --> A collection of related data

1-to-many --> one student can have many grades
many-to-many --> many students can have many 
many-to-one -->

data --> a value of a property of an individual object or relationship between two objects at a particular period of time

DBMS --> allows you to interact with the database

CRUD --> create, read, update, delete
Data Manipulation Language --> used to retrieve, insert, delete, and modify data
- Always selects a relatively small part of DB and copies it to main memory
- navigation DML
  - procedural (has loops/branching conditions)
  - selects record at a time
  - programmer defines WHAT (is it updating) and HOW (is it going to update)
- declarative DML
  - non-procedural
  - a programmer has to define just WHAT
  
Schema --> a model of a real system

Database Administrator (DBA)
- Data Definition Language (DDL) to describe conceptual schema
- View Definition Language (SDL) to describe internal schema

Casual end users:
- interactive declarative DML

Naive (parametric) users:
- canned transaction programs (written by programmers)

Programmers:
- interactive DML
- DML embedded into general purpose (host) programming language

Thursday 
- Read chp. 3 & 4
- 5 principles of data management
- distinction between logical and physical views of data
- agile development definition of a database (more than a place to store and retrieve data)

