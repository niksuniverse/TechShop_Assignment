from entity.inventory import Inventory
class InventoryDAO:
    def __init__(self, conn):
        self.conn = conn
        self.cursor = conn.cursor()
        self.cursor.execute('''CREATE TABLE IF NOT EXISTS inventory (
            inventory_id INTEGER PRIMARY KEY,
            product_id INTEGER,
            quantity_in_stock INTEGER,
            last_stock_update TEXT)''')
        self.conn.commit()

    def update_inventory(self, inventory):
        self.cursor.execute("UPDATE inventory SET quantity_in_stock=?, last_stock_update=? WHERE product_id=?",
                            (inventory.quantity_in_stock, inventory.last_stock_update, inventory.product_id))
        self.conn.commit()

    def get_all_inventory(self):
        self.cursor.execute("SELECT * FROM inventory")
        return self.cursor.fetchall()
