import os
import pyodbc
from dotenv import load_dotenv  

load_dotenv()

def get_db_connection():
    server = os.getenv("DB_SERVER")
    database = os.getenv("DB_NAME")
    username = os.getenv("DB_LOGIN")
    password = os.getenv("DB_PASSWORD")
    #ODBC Driver 18 for sql server can only be used in synchronous mode
    connection_string = f"DRIVER={{ODBC Driver 18 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password};Encrypt=Yes;TrustServerCertificate=Yes;ConnectionTimeout=30;"
    return pyodbc.connect(connection_string)

