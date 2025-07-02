import sqlite3
from entity.product import Product

class ProductDAO:
    def __init__(self, conn):
        self.conn = conn
        self.cursor = conn.cursor()
        self.cursor.execute('''CREATE TABLE IF NOT EXISTS products (
            product_id INTEGER PRIMARY KEY,
            name TEXT,
            description TEXT,
            price REAL)''')
        self.conn.commit()

    def add_product(self, product):
        self.cursor.execute("INSERT INTO products VALUES (?, ?, ?, ?)",
                            (product.product_id, product.name, product.description, product.price))
        self.conn.commit()

    def get_all_products(self):
        self.cursor.execute("SELECT * FROM products")
        rows = self.cursor.fetchall()
        return [Product(*row) for row in rows]

    def update_product(self, product):
        self.cursor.execute("UPDATE products SET description=?, price=? WHERE product_id=?",
                            (product.description, product.price, product.product_id))
        self.conn.commit()

