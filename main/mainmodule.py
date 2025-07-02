from dao.Customer_dao import CustomerDAO
from dao.product_dao import ProductDAO
from dao.orders_dao import OrderDAO
from dao.Order_Details_dao import OrderDetailDAO
from dao.inventory_dao import InventoryDAO
from entity.Customer import Customer
from entity.product import Product
from entity.orders import Order
from entity.OrderDetails import OrderDetail
from entity.inventory import Inventory
from util.db_util import get_connection
from util.validation import is_valid_name, is_valid_email, is_valid_phone
from datetime import datetime


def main():
    conn = get_connection()
    cust_dao = CustomerDAO(conn)
    prod_dao = ProductDAO(conn)
    order_dao = OrderDAO(conn)
    order_detail_dao = OrderDetailDAO(conn)
    inventory_dao = InventoryDAO(conn)

    width = 50
    while True:
        print("=" * width)
        print("\U0001F6D2 Welcome to TechShop - Main Menu \U0001F527".center(width))
        print("=" * width)

        print("[1] Register Customer")
        print("[2] Add Product")
        print("[3] Update Inventory")
        print("[4] Place Order")
        print("[5] View Customers")
        print("[6] View Products")
        print("[7] View Orders")
        print("[8] Exit Application")

        choice = input("\nEnter your choice: ")

        if choice == '1':
            while True:
                try:
                    cid = int(input("Customer ID: "))
                    break
                except:
                    print("Invalid ID")
            fname = input("First Name: ")
            if not is_valid_name(fname): print("Invalid first name")
            lname = input("Last Name: ")
            if not is_valid_name(lname): print("Invalid last name")
            email = input("Email: ")
            if not is_valid_email(email): print("Invalid email")
            phone = input("Phone: ")
            if not is_valid_phone(phone): print("Invalid phone number")
            addr = input("Address: ")
            customer = Customer(cid, fname, lname, email, phone, addr)
            cust_dao.add_customer(customer)
            print("\u2705 Customer added successfully.")

        elif choice == '2':
            pid = int(input("Product ID: "))
            name = input("Product Name: ")
            desc = input("Description: ")
            price = float(input("Price: "))
            product = Product(pid, name, desc, price)
            prod_dao.add_product(product)
            print("\u2705 Product added successfully.")

        elif choice == '3':
            iid = int(input("Inventory ID: "))
            pid = int(input("Product ID: "))
            qty = int(input("Quantity: "))
            date = datetime.now().strftime('%Y-%m-%d')
            inventory = Inventory(iid, pid, qty, date)
            inventory_dao.update_inventory(inventory)
            print("\u2705 Inventory updated.")

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
                product = [p for p in prod_dao.get_all_products() if p.product_id == pid][0]
                subtotal = product.price * qty
                od = OrderDetail(odid, oid, pid, qty, product.price)
                order_detail_dao.add_order_detail(od)
                detail_list.append(od)
                total += subtotal
                more = input("Add more products? (y/n): ")
                if more.lower() != 'y':
                    break
            order.calculate_total_amount(detail_list)
            order.total_amount = total
            order_dao.add_order(order)
            print("\u2705 Order placed successfully.")

        elif choice == '5':
            print("\n--- Customer List ---")
            for c in cust_dao.get_all_customers():
                print(c.get_customer_details())

        elif choice == '6':
            print("\n--- Product List ---")
            for p in prod_dao.get_all_products():
                print(p.get_product_details())

        elif choice == '7':
            print("\n--- Order Summary ---")
            for row in order_dao.get_all_orders():
                print(f"OrderID: {row[0]}, CustomerID: {row[1]}, Date: {row[2]}, Total: {row[3]}, Status: {row[4]}")

        elif choice == '8':
            print("\U0001F6AA Exiting TechShop. Thank you!")
            break

        else:
            print("\u26A0 Invalid choice. Try again.")


if __name__ == '__main__':
    main()
