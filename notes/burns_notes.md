# Building the Agile Database - Notes

### Chapter 3 - Agile Data Management

PRISM - 5 principles of data management
1. Performance and ease of use
2. Reusability
3. Integrity
4. Security
5. Maintainability

Truly agile approach to data management:
- stakeholder-based
- customer-focused
- business centered
- loosely-coupled
- multi-tier


### Chapter 4 - Data Management Roles and Responsibilities

**Key points**
- Data management is the art of turning data into business value
- Data management must support effective processes that enable new information flows
- Data professionals act as intermediaries between data owners, and data consumers


### Chapter 6 - Agile Data Design

**The Cost of Losing Focus**
- Need for distinction between logical (requirements) and physical (implementation)
- Creating a data model is NOT the same as creating a database design
- Blurring line between logical and physical tightly-couples view of data to a set of application requirements or technical constraints
  - Resonable to expect changes in outside conditions to change applications and data. NOT reasonable to expect changes to applications
    to alter definitions of data.
  - Makes refactoring during application development more difficult
- DO NOT remove the distinction between requirements and implementation (logical and physical viewpoints)

**Key points**
- The purpose of data design is to isolate the business data requirements from the general (functional) requirements
- Logical data desgin is business-area focused, implementation-independent and application-neutral
- Logical data model changes oonly as a result of new or changed business requirements
- Data design artifacts are intended to be reusable
- The purpose of normalization in logical design is to make sure that the business data requirements
  have been fully captured and understood


### Chapter 7 - Agile Database Design

**Key points**
- Physical design involves mapping the business data requirements to an intelligent choice of 
  implementation, architecture and technology
- Physical design decisions should be discussed with and approved by the development team
- The purpose of normalization is to create database objects that are highly cohesive, loosely-coupled and reusable. 
  Denoralization is okay in some cases and not in others. Denormalization can be done in the Virtual Data Layer.
- The database schema and related database objects should be auto-generated as much as possible from the 
  physical design model


### Chapter 8 - Agile Modeling

**Key points**
- Models are collectively owned and created collaboratively
- Agile models are created quickly and incrementally
- Models created to satisfy only immediate project needs may be temporary
- The logical data model can be considered an Agile model
- The physical data model can also be considered an Agile model
- Documentation can be considered Agile if it has a clear benefit and target audience, is kept
  up-to-date, focuses on information that is likely to change, is quickly and easily accessible
  and does not contain trivial or redundant information.
