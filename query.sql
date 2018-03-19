CREATE TABLE TEST (
  Book_id varchar(17) NOT NULL PRIMARY KEY, -- ISBN 13
  Title varchar(100) NOT NULL,
  Publisher_name varchar(20) NOT NULL,
  --PRIMARY KEY Book_id
  );

INSERT INTO TEST (Book_id, Title, Publisher_name)
VALUES('abcd', 'Computers', 'penguin');

SELECT * FROM TEST;