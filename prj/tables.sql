CREATE TABLE Persons
(
    person_id INTEGER IDENTITY(1, 1) NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    date_of_birth DATE,
    gender VARCHAR(1),
    address VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(2),
    zip VARCHAR(5),
    country VARCHAR(3),
    country_of_origin VARCHAR(3),
    ethnicity VARCHAR(20),
    employment BIT,
    CONSTRAINT PK_Persons_person_id PRIMARY KEY (person_id)
);

CREATE TABLE Transaction_Entities
(
    entity_id INTEGER IDENTITY(1, 1) NOT NULL,
    entity_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Transaction_Entities_entity_id PRIMARY KEY (entity_id)
);

CREATE TABLE Financial_Transactions
(
    transaction_id INTEGER IDENTITY(1, 1) NOT NULL,
    person_id INTEGER NOT NULL,
    transaction_type VARCHAR(10),
    transaction_method VARCHAR(10),
    amount FLOAT,
    time_stamp DATETIME,
    transaction_entity_id INTEGER,
    CONSTRAINT PK_Financial_Transactions_transaction_id PRIMARY KEY (transaction_id),
    CONSTRAINT FK_Financial_Transactions_person_id FOREIGN KEY (person_id)
      REFERENCES Persons(person_id),
    CONSTRAINT FK_Financial_Transactions_transaction_entity_id 
      FOREIGN KEY (transaction_entity_id)
      REFERENCES Transaction_Entities(entity_id)
);

CREATE TABLE Communications
(
    communication_id INTEGER IDENTITY(1, 1) NOT NULL,
    person_id1 INTEGER,
    person_id2 INTEGER,
    communication_method VARCHAR(10),
    duration TIME,
    time_stamp DATETIME,
    CONSTRAINT PK_Communications_communication_id PRIMARY KEY (communication_id),
    CONSTRAINT FK_Communications_person_id1 FOREIGN KEY (person_id1)
      REFERENCES Persons(person_id),
    CONSTRAINT FK_Communications_person_id2 FOREIGN KEY (person_id2)
      REFERENCES Persons(person_id)
);

CREATE TABLE Crimes
(
    crime_id INTEGER IDENTITY(1, 1) NOT NULL,
    crime_degree VARCHAR(20),
    crime_type VARCHAR(20),
    report VARCHAR(max),
    report_date DATE CONSTRAINT PK_Crimes_crime_id PRIMARY KEY (crime_id)
);

CREATE TABLE Crime_Participants
(
    crime_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL CONSTRAINT PK_Crime_Participants_crime_id PRIMARY KEY (crime_id, person_id),
    CONSTRAINT FK_Crime_Participants_crime_id FOREIGN KEY (crime_id)
      REFERENCES Crimes(crime_id),
    CONSTRAINT FK_Crime_Participants_person_id FOREIGN KEY (person_id)
      REFERENCES Persons(person_id)
);