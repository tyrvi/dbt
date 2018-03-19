BULK INSERT Persons 
    FROM '~/Documents/school/dbt/prj/data/Persons.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        ERRORFILE = '~/Documents/school/dbt/prj/data/PersonsErrorRows.csv',
        TABLOCK
    );