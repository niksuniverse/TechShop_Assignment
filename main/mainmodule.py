from dao.Customer_dao import CustomerDAO

from entity.Customer import Customer
from dao.product_dao import ProductDAO
from entity.product import Product
from dao.orders_dao import OrderDAO
from dao.Order_Details_dao import OrderDetailDAO
from dao.inventory_dao import InventoryDAO
from entity.orders import Order
from entity.OrderDetails import OrderDetail
from entity.inventory import Inventory
from util.db_util import get_connection
from datetime import datetime

conn = get_connection()
cust_dao = CustomerDAO(conn)
prod_dao = ProductDAO(conn)
order_dao = OrderDAO(conn)
order_detail_dao = OrderDetailDAO(conn)
inventory_dao = InventoryDAO(conn)

def menu():
    while True:
        print("\n1. Add Customer\n2. Add Product\n3. Add Inventory\n4. Place Order\n5. View Customers\n6. View Products\n7. View Orders\n8. Exit")
        choice = input("Enter choice: ")

        if choice == '1':
            cid = int(input("Customer ID: "))
            fn = input("First Name: ")
            ln = input("Last Name: ")
            em = input("Email: ")
            ph = input("Phone: ")
            ad = input("Address: ")
            customer = Customer(cid, fn, ln, em, ph, ad)
            cust_dao.add_customer(customer)
            print("Customer Added!!")

        elif choice == '2':
            pid = int(input("Product ID: "))
            name = input("Product Name: ")
            desc = input("Description: ")
            price = float(input("Price: "))
            product = Product(pid, name, desc, price)
            prod_dao.add_product(product)
            print("Products added!!")

        elif choice == '3':
            iid = int(input("Inventory ID: "))
            pid = int(input("Product ID: "))
            qty = int(input("Quantity: "))
            date = datetime.now().strftime('%Y-%m-%d')
            inventory = Inventory(iid, pid, qty, date)
            inventory_dao.update_inventory(inventory)

        elif choice == '4':
            oid = int(input("Order ID: "))
            cid = int(input("Customer ID: "))
            order = Order(oid, cid)

            total = 0.0
            detail_list = []
            while True:
                odid = int(input("Order Detail ID: "))
                pid = int(input("Product ID: "))
                qty = int(input("Quantity: "))
                prod = [p for p in prod_dao.get_all_products() if p.product_id == pid][0]
                subtotal = prod.price * qty
                od = OrderDetail(odid, oid, pid, qty, prod.price)
                order_detail_dao.add_order_detail(od)
                detail_list.append(od)
                total += subtotal
                more = input("Add more products? (y/n): ")
                if more.lower() != 'y':
                    break
            order.calculate_total_amount(detail_list)
            order.total_amount = total
            order_dao.add_order(order)

        elif choice == '5':
            for c in cust_dao.get_all_customers():
                print(c.get_customer_details())

        elif choice == '6':
            for p in prod_dao.get_all_products():
                print(p.get_product_details())

        elif choice == '7':
            for row in order_dao.get_all_orders():
                print(f"OrderID: {row[0]}, CustomerID: {row[1]}, Date: {row[2]}, Total: {row[3]}, Status: {row[4]}")

        elif choice == '8':
            print("Exiting application.")
            break

        else:
            print("Invalid choice. Try again.")

if __name__ == "__main__":
    menu()
