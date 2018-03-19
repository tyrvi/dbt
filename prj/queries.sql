-------------------------------------------------------------------------------
-- Query to find what entities people who have committed misdemeanors have 
-- made a financial transaction with
-------------------------------------------------------------------------------
-- SELECT * FROM Transaction_Entities
-- INNER JOIN Financial_Transactions ON 
-- Transaction_Entities.entity_id = Financial_Transactions.transaction_entity_id;

-- -- gets ids of people who have committed misdemeanors
-- SELECT * FROM Crime_Participants
-- INNER JOIN Crimes ON Crime_Participants.crime_id = Crimes.crime_id
--     AND Crimes.crime_degree = 'misdemeanor';

-- SOLUTION
-- SELECT DISTINCT entity_name FROM (
--     SELECT * FROM Transaction_Entities
--     INNER JOIN Financial_Transactions ON
--     Transaction_Entities.entity_id = Financial_Transactions.transaction_entity_id
-- ) AS Entities
-- INNER JOIN (
--     SELECT person_id FROM Crime_Participants
--     INNER JOIN Crimes ON Crime_Participants.crime_id = Crimes.crime_id
--     AND Crimes.crime_degree = 'misdemeanor'
-- ) AS Misdemeanor
-- ON Entities.person_id = Misdemeanor.person_id;

-------------------------------------------------------------------------------
-- Query to find the average age of people who have committed felonies
-- gets all felonies
-------------------------------------------------------------------------------
-- SELECT * FROM Crime_Participants
-- INNER JOIN Crimes ON Crime_Participants.crime_id = Crimes.crime_id 
--     AND Crimes.crime_degree = 'felony';

-------------------------------------------------------------------------------
-- Query to find the average transaction value of people who are unemployed.
-------------------------------------------------------------------------------
-- SELECT AVG(amount) AS average_unemployed_transaction 
-- FROM Financial_Transactions
--     INNER JOIN (
--         SELECT * FROM Persons
--             WHERE employment = 0
--     ) AS Unemployed
--     ON Financial_Transactions.person_id = Unemployed.person_id;

-------------------------------------------------------------------------------
-- Query to find the person and their crimes who has spent the most money in 
-- financial transactions.
-------------------------------------------------------------------------------
-- -- SELECT Persons.person_id, first_name, last_name FROM Persons
-- --     INNER JOIN Crime_Participants
-- --     ON Persons.person_id = Crime_participants.person_id;

-- SELECT MAX(Totals.total) AS max FROM (
--     SELECT person_id, SUM(AMOUNT) AS total FROM Financial_Transactions
--         GROUP BY person_id
-- ) AS Totals; 

-- -- find how much each person has spent
-- SELECT person_id, SUM(amount) AS total FROM Financial_Transactions
--     GROUP BY person_id
--     ORDER BY total DESC;

-- SOLUTION
-- SELECT Crimes_committed.crime_id, Persons.person_id, first_name, last_name 
-- FROM Persons
--     INNER JOIN (
--         SELECT Crimes.crime_id, Crime_participants.person_id FROM Crimes
--             INNER JOIN Crime_Participants
--             ON Crimes.crime_id = Crime_Participants.crime_id
--     ) AS Crimes_committed
--     ON Persons.person_id = Crimes_committed.person_id;

-- SELECT Persons.person_id, first_name, last_name FROM
-- FROM (
--         SELECT Crimes_committed.crime_id, Persons.person_id, first_name, last_name 
--         FROM Persons
--         INNER JOIN (
--             SELECT Crimes.crime_id, Crime_participants.person_id FROM Crimes
--                 INNER JOIN Crime_Participants
--                 ON Crimes.crime_id = Crime_Participants.crime_id
--         ) AS Crimes_committed
--         ON Persons.person_id = Crimes_committed.person_id
--     ) INNER 

-------------------------------------------------------------------------------
-- Query to find all persons who have committed an infraction and a felony.
-------------------------------------------------------------------------------
-- -- Get everyone who has committed a infractions
-- SELECT * FROM Persons 
--     INNER JOIN (
--         SELECT Crimes.crime_id, Crime_participants.person_id, Crimes.crime_degree
--          FROM Crimes
--         INNER JOIN Crime_Participants
--         ON Crimes.crime_id = Crime_Participants.crime_id
--     ) AS Crimes_Committed
--     ON Persons.person_id = Crimes_Committed.person_id
--     WHERE Crimes_committed.crime_degree = 'infractions';


-- -- Get everyone who has committed a felony
-- SELECT * FROM Persons 
--     INNER JOIN (
--         SELECT Crimes.crime_id, Crime_participants.person_id, Crimes.crime_degree
--          FROM Crimes
--         INNER JOIN Crime_Participants
--         ON Crimes.crime_id = Crime_Participants.crime_id
--     ) AS Crimes_Committed
--     ON Persons.person_id = Crimes_Committed.person_id
--     WHERE Crimes_committed.crime_degree = 'felony';

-- SOLUTION
-- SELECT DISTINCT Infractions.person_id, Infractions.first_name, Infractions.last_name
-- FROM (
--     -- all people that have committed infractions
--     SELECT Persons.person_id, first_name, last_name FROM Persons 
--         INNER JOIN (
--             SELECT Crimes.crime_id, Crime_participants.person_id, Crimes.crime_degree,
--             Crimes.crime_type, Crimes.report
--             FROM Crimes
--             INNER JOIN Crime_Participants
--             ON Crimes.crime_id = Crime_Participants.crime_id
--         ) AS Crimes_Committed
--         ON Persons.person_id = Crimes_Committed.person_id
--         WHERE Crimes_committed.crime_degree = 'infractions'
--     ) AS Infractions
-- INNER JOIN ( -- all people that have committed felonies
--     SELECT Persons.person_id,first_name, last_name FROM Persons 
--         INNER JOIN (
--             SELECT Crimes.crime_id, Crime_participants.person_id, Crimes.crime_degree,
--             Crimes.crime_type, Crimes.report
--             FROM Crimes
--             INNER JOIN Crime_Participants
--             ON Crimes.crime_id = Crime_Participants.crime_id
--         ) AS Crimes_Committed
--         ON Persons.person_id = Crimes_Committed.person_id
--         WHERE Crimes_committed.crime_degree = 'felony'
--     ) AS Felonies
-- ON Infractions.person_id = Felonies.person_id;


-------------------------------------------------------------------------------
-- Query to find how many people were involved with each crime.
-------------------------------------------------------------------------------
-- SELECT Crimes.crime_id, COUNT(*) AS num_participants FROM Crimes
--     INNER JOIN Crime_Participants
--     ON Crimes.crime_id = Crime_Participants.crime_id
--     GROUP BY Crimes.crime_id;


-- SELECT *, num_participants = (
--     SELECT COUNT(*) AS num_participants FROM Crimes
--     INNER JOIN Crime_Participants
--     ON Crimes.crime_id = Crime_Participants.crime_id
--     GROUP BY Crimes.crime_id
--     ORDER BY num_participants DESC
-- ) FROM Crimes;

-- SELECT Crimes.crime_id, num_participants, crime_degree, crime_type FROM Crimes
--     INNER JOIN (
--         SELECT Crimes.crime_id, COUNT(*) AS num_participants FROM Crimes
--             INNER JOIN Crime_Participants
--             ON Crimes.crime_id = Crime_Participants.crime_id
--             GROUP BY Crimes.crime_id
--     ) AS Participants ON Participants.crime_id = Crimes.crime_id
--     ORDER BY Participants.num_participants DESC;


-------------------------------------------------------------------------------
-- Query to find people who have committed no crimes.
-------------------------------------------------------------------------------
-- SELECT Persons.person_id, first_name, last_name FROM Persons
--     WHERE Persons.person_id NOT IN (
--         SELECT Crime_Participants.person_id FROM Crime_Participants
--     );


-------------------------------------------------------------------------------
-- Query to find the longest call of a person who is unemployed.
-------------------------------------------------------------------------------
-- SELECT MAX(duration) AS longest_call FROM Persons
--     INNER JOIN Communications
--     ON Communications.person_id1 = Persons.person_id 
--     OR Communications.person_id2 = Persons.person_id
--     WHERE Persons.employment = 0 
--     AND Communications.communication_method = 'call';



-------------------------------------------------------------------------------
-- Query to find the the number of crimes that involved males.
-------------------------------------------------------------------------------
-- SELECT COUNT(DISTINCT Crimes.crime_id) AS num_crimes_committed_by_males FROM Crimes
--     INNER JOIN (
--         SELECT crime_id FROM Crime_Participants
--             INNER JOIN Persons
--             ON Crime_Participants.person_id = Persons.person_id
--             WHERE Persons.gender = 'M'
--     ) AS Male_Participants
--     ON Crimes.crime_id = Male_Participants.crime_id;

-------------------------------------------------------------------------------
-- Query to identify unemployed persons who have not committed crimes but who 
-- have communicated with people who have committed crimes.
-------------------------------------------------------------------------------
-- gets people who are unemployed but have not committed crimes
SELECT * FROM Persons
    WHERE Persons.employment = 0
    AND person_id NOT IN (
        SELECT Crime_participants.person_id FROM Crime_Participants
    );

-- gets people who have committed crimes
SELECT * FROM Persons
    WHERE person_id IN (
        SELECT Crime_participants.person_id FROM Crime_Participants
    );

SELECT * FROM Persons
    INNER JOIN Communications

SELECT * FROM Communications
    INNER JOIN (
        SELECT * FROM Persons
            WHERE Persons.employment = 0
            AND person_id NOT IN (
                SELECT Crime_participants.person_id FROM Crime_Participants
            )
    ) AS noncriminals
    ON Communications.person_id1 = noncriminals.person_id
    WHERE EXISTS (
        SELECT * FROM Persons
            WHERE person_id IN (
                SELECT Crime_participants.person_id FROM Crime_Participants
            )
    )



SELECT Persons.person_id, Persons.date_of_birth, Persons.gender, Persons.address, Persons.city, Persons.state, Persons.country, Persons.country_of_origin, Persons.ethnicity, Persons.employment
FROM Persons
    INNER JOIN (
    SELECT person_id FROM Persons
        WHERE person_id IN (
            SELECT person_id2 FROM Communications
                WHERE person_id1 IN (
                    SELECT DISTINCT person_id FROM Crime_Participants
                ) AS Criminals AND person_id2 NOT IN Criminals
        )
    OR IN
    (
    SELECT person_id1
FROM Communications
WHERE person_id2 IN (
      SELECT DISTINCT person_id
FROM Crime_Participants
    )
AS Criminals
    AND person_id1 NOT IN Criminals
  )
) AS NonCriminalCommunicatorsWithCriminals
ON Person.person_id=NonCriminalCommunicatorsWithCriminals.person_id
WHERE Persons.employment=0;
