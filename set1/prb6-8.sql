CREATE TABLE BOOK (
  Book_id varchar(17) NOT NULL, -- ISBN 13
  Title varchar(100) NOT NULL,
  Publisher_name varchar(20) NOT NULL,
  PRIMARY KEY Book_id
  FOREIGN KEY Publisher_name REFERENCES PUBLISHER
);

CREATE TABLE BOOK_AUTHORS (
  Book_id varchar(17) NOT NULL, -- ISBN 13
  Author_name varchar(50) NOT NULL,
  PRIMARY KEY (Book_id, Author_name),
  FOREIGN KEY (Book_id) REFERENCES BOOK (Book_id)
);

CREATE TABLE PUBLISHER (
  Name varchar(20) NOT NULL,
  Address varchar(100) NOT NULL,
  Phone varchar(15) NOT NULL,
  PRIMARY KEY Name
);

CREATE TABLE BOOK_COPIES (
  Book_id varchar(17) NOT NULL, -- ISBN 13
  Branch_id varchar(20) NOT NULL,
  No_of_copies int NOT NULL,
  PRIMARY KEY (Book_id, Branch_id),
  FOREIGN KEY (Branch_id) REFERENCES LIBRARY_BRANCH (Branch_id),
  FOREIGN KEY (Book_id) REFERENCES BOOK (Book_id)
);

CREATE TABLE BOOK_LOANS (
  Book_id varchar(17) NOT NULL, -- ISBN 13
  Branch_id varchar(20) NOT NULL,
  Card_no int NOT NULL,
  Date_out date NOT NULL,
  Due_date data NOT NULL,
  PRIMARY KEY (Book_id, Branch_id, Card_no),
  FOREIGN KEY (Book_id) REFERENCES BOOK (Book_id),
  FOREIGN KEY (Branch_id) REFERENCES LIBRARY_BRANCH (Branch_id),
  FOREIGN KEY (Card_no) REFERENCES BORROWER (Card_no)
);

CREATE TABLE LIBRARY_BRANCH (
  Branch_id varchar(20) NOT NULL,
  Branch_name varchar(20) NOT NULL,
  Address varchar(100) NOT NULL,
  PRIMARY KEY (Branch_id)
);

CREATE TABLE BORROWER (
  Card_no int NOT NULL,
  Name varchar(50) NOT NULL,
  Address varchar(100) NOT NULL,
  Phone varchar(15) NOT NULL,
  PRIMARY KEY Card_no,
);