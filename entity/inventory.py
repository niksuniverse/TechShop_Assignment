class Inventory:
    def __init__(self, inventory_id, product_id, quantity_in_stock, last_stock_update):
        self.inventory_id = inventory_id
        self.product_id = product_id
        self.quantity_in_stock = quantity_in_stock
        self.last_stock_update = last_stock_update

    def add_to_inventory(self, quantity):
        self.quantity_in_stock += quantity

    def remove_from_inventory(self, quantity):
        if quantity > self.quantity_in_stock:
            raise ValueError("Insufficient stock")
        self.quantity_in_stock -= quantity
