class OrderDetail:
    def __init__(self, order_detail_id, order_id, product_id, quantity, product_price):
        self.order_detail_id = order_detail_id
        self.order_id = order_id
        self.product_id = product_id
        self.quantity = quantity
        self.product_price = product_price
        self.subtotal = self.calculate_subtotal()

    def calculate_subtotal(self):
        return self.product_price * self.quantity