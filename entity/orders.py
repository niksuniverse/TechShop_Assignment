from datetime import datetime

class Order:
    def __init__(self, order_id, customer_id, order_date=None, total_amount=0.0):
        self.order_id = order_id
        self.customer_id = customer_id
        self.order_date = order_date if order_date else datetime.now().strftime('%Y-%m-%d')
        self.total_amount = total_amount
        self.status = 'Processing'

    def calculate_total_amount(self, order_details):
        self.total_amount = sum([od.subtotal for od in order_details])

    def update_order_status(self, status):
        self.status = status

    def get_order_details(self):
        return f"OrderID: {self.order_id}, CustomerID: {self.customer_id}, Date: {self.order_date}, Status: {self.status}, Total: {self.total_amount}"

