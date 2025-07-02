import sqlite3
from entity.Customer import Customer

class CustomerDAO:
    def __init__(self, conn):
        self.conn = conn
        self.cursor = conn.cursor()
        self.cursor.execute('''CREATE TABLE IF NOT EXISTS customers (
            customer_id INTEGER PRIMARY KEY,
            first_name TEXT,
            last_name TEXT,
            email TEXT,
            phone TEXT,
            address TEXT)''')
        self.conn.commit()

    def add_customer(self, customer):
        self.cursor.execute("INSERT INTO customers VALUES (?, ?, ?, ?, ?, ?)",
                            (customer.customer_id, customer.first_name, customer.last_name,
                             customer.email, customer.phone, customer.address))
        self.conn.commit()

    def get_all_customers(self):
        self.cursor.execute("SELECT * FROM customers")
        rows = self.cursor.fetchall()
        return [Customer(*row) for row in rows]

    def update_customer(self, customer):
        self.cursor.execute("UPDATE customers SET email=?, phone=?, address=? WHERE customer_id=?",
                            (customer.email, customer.phone, customer.address, customer.customer_id))
        self.conn.commit()

    def delete_customer(self, customer_id):
        self.cursor.execute("DELETE FROM customers WHERE customer_id=?", (customer_id,))
        self.conn.commit()
