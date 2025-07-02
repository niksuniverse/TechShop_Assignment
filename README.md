
# 🛒 TechShop - Electronic Gadget Store Management

**TechShop** is a Python-based console application developed using Object-Oriented Programming (OOP) principles. It manages customers, products, and orders for an electronic gadget store with integration to a SQLite database.

## 💼 Features

Register and Login

View & Update Profile

Browse Products

Search by Product Name or Category

``` bash
TechShop/
├── dao/
├── entity/
├── util/
├── exception/
├── main/
├── test/
├── DB/
└── README.md
```


---

## 🧾 Database Tables

### 📌 Customer Table

| Field        | Description                     |
|--------------|----------------------------------|
| customer_id  | Primary Key (Auto-increment)     |
| name         | Customer full name               |
| email        | Email address                    |
| phone        | 10-digit phone number            |
| address      | Customer address                 |
| username     | Unique login username            |
| password     | Password                         |

### 📦 Product Table

| Field        | Description                     |
|--------------|----------------------------------|
| product_id   | Primary Key (Auto-increment)     |
| name         | Product name                     |
| category     | Product category                 |
| price        | Price per unit                   |
| stock_qty    | Quantity available in stock      |

### 🧾 Order Table

| Field        | Description                              |
|--------------|-------------------------------------------|
| order_id     | Primary Key (Auto-increment)              |
| customer_id  | Foreign Key - linked to Customer table    |
| order_date   | Date the order was placed                 |
| total_amount | Total order price                         |

---

## ✅ Input Validations

| Field     | Rule                              |
|-----------|-----------------------------------|
| Name      | Only alphabets allowed            |
| Email     | Must be a valid email format      |
| Phone     | Must be exactly 10 digits         |
| Username  | Must be unique                    |
| Password  | Must include special characters   |

---

## ▶️ How to Run

1. Make sure Python 3 is installed.
2. Navigate to the project directory.
3. Run the application:
   ```bash
   python main/mainmodule.py
   ```

## Technologies Used
Language: Python 3

Database: SQLite

IDE: VS Code / PyCharm

Architecture: Modular (DAO, Entity, Util, Exception, Main)

Testing: unittest

Version Control: Git & GitHub

##  Acknowledgements
This project was developed during the Python foundational training at Hexavarsity (Hexaware Technologies).

Special thanks to Mr. Munna Pandey for his guidance and support.

