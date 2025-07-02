from entity.OrderDetails import OrderDetail

class OrderDetailDAO:
    def __init__(self, conn):
        self.conn = conn
        self.cursor = conn.cursor()
        self.cursor.execute('''CREATE TABLE IF NOT EXISTS order_details (
            order_detail_id INTEGER PRIMARY KEY,
            order_id INTEGER,
            product_id INTEGER,
            quantity INTEGER,
            product_price REAL,
            subtotal REAL)''')
        self.conn.commit()

    def add_order_detail(self, detail):
        self.cursor.execute("INSERT INTO order_details VALUES (?, ?, ?, ?, ?, ?)",
                            (detail.order_detail_id, detail.order_id, detail.product_id,
                             detail.quantity, detail.product_price, detail.subtotal))
        self.conn.commit()