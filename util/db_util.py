
import sqlite3

def get_connection(db_name="techshop.db"):
    try:
        conn = sqlite3.connect(db_name)
        print("Connected to DB")
        return conn
    except sqlite3.Error as e:
        print("Database connection error:", e)
        return None