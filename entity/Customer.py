class Customer:
    def __init__(self, customer_id, first_name, last_name, email, phone, address):
        self.customer_id = customer_id
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.phone = phone
        self.address = address

    def get_customer_details(self):
        return f"{self.first_name} {self.last_name} - Email: {self.email}, Phone: {self.phone}, Address: {self.address}"

    def update_customer_info(self, email, phone, address):
        if "@" not in email:
            raise ValueError("Invalid email address")
        if not phone.isdigit() or len(phone) != 10:
            raise ValueError("Invalid phone number")
        self.email = email
        self.phone = phone
        self.address = address
