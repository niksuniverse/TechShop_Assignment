from entity.orders import Order

class OrderDAO:
    def __init__(self, conn):
        self.conn = conn
        self.cursor = conn.cursor()
        self.cursor.execute('''CREATE TABLE IF NOT EXISTS orders (
            order_id INTEGER PRIMARY KEY,
            customer_id INTEGER,
            order_date TEXT,
            total_amount REAL,
            status TEXT)''')
        self.conn.commit()

    def add_order(self, order):
        self.cursor.execute("INSERT INTO orders VALUES (?, ?, ?, ?, ?)",
                            (order.order_id, order.customer_id, order.order_date, order.total_amount, order.status))
        self.conn.commit()

    def update_order_status(self, order_id, new_status):
        self.cursor.execute("UPDATE orders SET status=? WHERE order_id=?", (new_status, order_id))
        self.conn.commit()

    def get_all_orders(self):
        self.cursor.execute("SELECT * FROM orders")
        return self.cursor.fetchall()

