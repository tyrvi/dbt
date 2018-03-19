import pandas as pd
import sqlalchemy as sqla
import pyodbc

connection_string = "Driver={ODBC Driver 17 for SQL Server};Server=tcp:dbt-group-prj.database.windows.net,1433;Database=dbt-group-prj;Uid=thais@dbt-group-prj;Pwd=BlackLaptop18!;Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;"
engine = sqla.create_engine("mssql+pyodbc://thais:BlackLaptop18!@dbt")

def insert(file, table, engine):
    df = pd.read_csv(file, header=0)
    df.to_sql(table, engine, index=False, if_exists='append')