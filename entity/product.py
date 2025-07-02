class Product:
    def __init__(self, product_id, name, description, price):
        self.product_id = product_id
        self.name = name
        self.description = description
        self.price = price

    def update_product_info(self, description, price):
        if price < 0:
            raise ValueError("Price cannot be negative")
        self.description = description
        self.price = price

    def get_product_details(self):
        return f"ProductID: {self.product_id}, Name: {self.name}, Description: {self.description}, Price: {self.price}"

