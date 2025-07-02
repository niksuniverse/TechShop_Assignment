use techshop;
--------------
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone CHAR(15),
    Address VARCHAR(100)
);

-- 2. Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2)
);

-- 3. Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 4. OrderDetail Table
CREATE TABLE OrderDetail (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 5. Inventory Table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- -------------------------------
-- DATA INSERTION SECTION
-- -------------------------------

-- 1. Insert into Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES
(1,'Ahana','Sri','ahanasree@gmail.com','9876543234','12A,Manuvakkadu city,Rasipuram'),
(2,'Bindu','Priya','bindupri23@gmail.com','9897167264','10S,Alumpatty city,Namakkal'),
(3,'Loganathan','Perumal','logan.perumal@gmail.com','9876543244','13J, Nehru Street, Vellore'),
(4,'Meena','Thiru','meena.thiru@gmail.com','9876543245','14K, VOC Colony, Theni'),
(5,'Nandhini','Arun','nandhini.arun@gmail.com','9876543246','15L, Anna Nagar, Dharmapuri'),
(6,'Chandru','Velan','chandru.velan@gmail.com','9876543235','4A, Valluvar Street, Salem'),
(7,'Zara','Goutham','zara.ngn@gmail.com','9876543116','5B, M.G.R Nagar, Erode'),
(8,'Elango','Selvam','elango.selvam@gmail.com','9876543237','6C, Gandhi Road, Tiruppur'),
(9,'Loganathan','Perumal','logan.peruma@gmail.com','9876543044','13J, Nehru Street, Vellore'),
(10,'Nikitha','Zahh','Zah.niki21@gmail.com','9876511245','14K, VOC Colony, Madurai'),
(11,'Varshini','Yathra','varsyath45@gmail.com','8787895645','34p,yuthi street,Coimbatore');

-- 2. Insert into Products
-- Main and variant products
INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES
(1, 'Bluetooth Speaker', 'Portable speaker with 10 hours battery life', 2198.90),
(2, 'Smartphone', '5G-enabled Android smartphone with 128GB storage', 15999.00),
(3, 'Laptop', '14-inch laptop with Intel i5 and 8GB RAM', 44999.00),
(4, 'Smartwatch', 'Fitness tracking and notification-enabled smartwatch', 5498.90),
(5, 'Wireless Mouse', 'Ergonomic mouse with USB receiver', 878.90),
(6, 'Tablet', '10.1-inch Android tablet with 64GB storage', 10999.00),
(7, 'Power Bank', '10000mAh fast-charging power bank', 1299.00),
(8, 'Earbuds', 'Bluetooth earbuds with noise cancellation', 2748.90),
(9, 'Portable Fan', 'USB-powered mini portable fan', 399.00),
(10, 'Gaming Headset', 'Over-ear gaming headset with mic', 2999.00),
-- Variants
(11, 'Bluetooth Speaker', 'Compact speaker with LED lights', 1499.00),
(12, 'Bluetooth Speaker', 'Waterproof speaker with bass boost', 2499.00),
(13, 'Bluetooth Speaker', 'High-power speaker with 360° sound', 2999.00),
(14, 'Smartphone', 'Budget Android smartphone, 64GB storage', 9999.00),
(15, 'Smartphone', 'Flagship 5G phone with AMOLED display', 34999.00),
(16, 'Smartphone', 'Mid-range phone with 108MP camera', 21999.00),
(17, 'Laptop', '15.6-inch i3 laptop with SSD', 36999.00),
(18, 'Laptop', 'Gaming laptop with RTX graphics', 69999.00),
(19, 'Laptop', 'Ultra-thin laptop with M.2 SSD', 54999.00),
(20, 'Smartwatch', 'Basic fitness band with heart-rate monitor', 1999.00),
(21, 'Smartwatch', 'Premium watch with AMOLED screen', 5999.00),
(22, 'Smartwatch', 'Kids smartwatch with GPS', 3999.00),
(23, 'Wireless Mouse', 'Slim mouse with silent clicks', 599.00),
(24, 'Wireless Mouse', 'Rechargeable ergonomic mouse', 999.00),
(25, 'Wireless Mouse', 'Gaming mouse with RGB lighting', 1499.00),
(26, 'Tablet', '8-inch budget tablet with 32GB', 6999.00),
(27, 'Tablet', 'Android tablet with stylus support', 13999.00),
(28, 'Tablet', 'High-performance tablet for work', 18999.00),
(29, 'Power Bank', '5000mAh slim model', 699.00),
(30, 'Power Bank', '20000mAh fast charge power bank', 1999.00),
(31, 'Power Bank', 'Solar power bank for outdoor use', 1599.00),
(32, 'Earbuds', 'TWS earbuds with long battery life', 1799.00),
(33, 'Earbuds', 'ANC earbuds with touch controls', 2999.00),
(34, 'Earbuds', 'Gaming earbuds with low latency', 2299.00),
(35, 'Portable Fan', 'Neck fan with dual blades', 899.00),
(36, 'Portable Fan', 'Mini fan with clip-on feature', 499.00),
(37, 'Portable Fan', 'Rechargeable fan with stand', 699.00),
(38, 'Gaming Headset', 'Wired headset with surround sound', 1999.00),
(39, 'Gaming Headset', 'Wireless headset with mic mute', 3499.00),
(40, 'Gaming Headset', 'RGB headset with 7.1 audio', 3999.00);


-- 3. Insert into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2025-06-01', 4500.00),
(102, 2, '2025-06-02', 7500.50),
(103, 3, '2025-06-03', 12000.00),
(104, 4, '2025-06-04', 6800.75),
(105, 5, '2025-06-05', 9800.00),
(106, 6, '2025-06-06', 3400.00),
(107, 7, '2025-06-07', 15600.00),
(108, 8, '2025-06-08', 2300.00),
(109, 9, '2025-06-11', 8700.00),
(110, 10, '2025-06-10', 15000.00),
(111, 11, '2025-06-11', 12350.00),
(112, 2, '2025-06-12', 8700.00),
(113, 3, '2025-06-13', 10400.50),
(114, 4, '2025-06-14', 5900.00),
(115, 5, '2025-06-15', 9800.25),
(116, 6, '2025-06-16', 4100.75),
(117, 7, '2025-06-17', 15000.00),
(118, 8, '2025-06-18', 2200.00),
(119, 9, '2025-06-19', 8600.00),
(120, 2, '2025-06-20', 7600.00),
(121, 3, '2025-06-21', 11500.00),
(122, 4, '2025-06-22', 6100.10),
(123, 5, '2025-06-23', 9300.00),
(124, 6, '2025-06-24', 3700.00),
(125, 7, '2025-06-25', 16200.00),
(126, 8, '2025-06-26', 2400.00),
(127, 9, '2025-06-27', 8750.00),
(128, 2, '2025-06-28', 8100.60),
(129, 3, '2025-06-29', 11800.00),
(130, 4, '2025-06-30', 6450.00),
(131, 5, '2025-07-01', 9650.00);

SELECT * FROM Orders;

-- Add values for orderdetails

INSERT INTO OrderDetail (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 101, 1, 2),     
(2, 102, 2, 1),     
(3, 103, 3, 1),     
(4, 104, 4, 2),     
(5, 105, 6, 1),     
(6, 106, 5, 3),     
(7, 107, 10, 2),    
(8, 108, 9, 4),     
(9, 109, 8, 3),     
(10, 110, 2, 1),  
(201, 112, 1, 3),
(202, 113, 2, 5),
(203, 114, 3, 2),
(204, 115, 4, 4),
(205, 116, 5, 1),
(206, 117, 6, 6),
(207, 118, 2, 2),
(208, 119, 7, 3),
(209, 120, 3, 4),
(210, 121, 8, 5),
(211, 122, 4, 2),
(212, 123, 9, 3),
(213, 124, 5, 1),
(214, 125, 1, 7),
(215, 126, 6, 2),
(216, 127, 7, 4),
(217, 128, 8, 2),
(218, 129, 9, 3),
(219, 130, 10, 1),
(220, 131, 2, 6);

select * from orderdetail;

-- 5) INSERT VALUE FOR Inventory

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 1, 120, '2025-06-10'),   -- Bluetooth Speaker
(2, 2, 80, '2025-06-09'),    -- Smartphone
(3, 3, 45, '2025-06-08'),    -- Laptop
(4, 4, 100, '2025-06-11'),   -- Smartwatch
(5, 5, 200, '2025-06-07'),   -- Wireless Mouse
(6, 6, 60, '2025-06-06'),    -- Tablet
(7, 7, 150, '2025-06-12'),   -- Power Bank
(8, 8, 90, '2025-06-10'),    -- Earbuds
(9, 9, 300, '2025-06-05'),   -- Portable Fan
(10, 10, 70, '2025-06-11');  -- Gaming Headset

SELECT * FROM Inventory;

-- TASK 2

-- 1)  to retrieve the names and emails of all customers. 
SELECT CONCAT(FirstName, ' ' ,LastName) as FullName,Email FROM Customers ;

-- 2)   to list all orders with their order dates and corresponding customer names.
SELECT o.OrderID,CONCAT(FirstName, ' ' ,LastName) as FullName , OrderDate 
FROM customers c JOIN Orders o
WHERE c.CustomerID=o.CustomerID;

-- 3)  to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address
INSERT INTO Customers(CustomerID,FirstName,LastName,Email,Phone,Address)
VALUES(11,'Varshini','Yathra','varsyath45@gmail.com',8787895645,'34p,yuthi street,Coimbatore');

-- 4. to update the prices of all electronic gadgets in the "Products" table by  increasing them by 10%. 
UPDATE Products SET Price=Price*1.10 WHERE ProductID in (1,4,5,8);

SELECT * FROM products;

-- 5.  to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter. 

DELETE od, o
FROM Orders o
JOIN OrderDetail od ON o.OrderID = od.OrderID
WHERE o.OrderID = 107;

-- 6.   to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.

INSERT INTO orders(OrderID,CustomerID,OrderDate,TotalAmount) 
VALUES (111,11,'2025-06-11',12350.00);

-- 7. to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information.

UPDATE Customers
SET Email ='nan#aru76@gmail.com' ,
    Address = '23l,Heera street,Velur'
WHERE CustomerID =5;

-- 8.  to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.

SELECT o.OrderID,SUM(OD.Quantity*o.TotalAmount) AS Tot_amt 
FROM orders O JOIN orderdetail OD USING(OrderID) 
GROUP BY OD.OrderID;

-- 9.to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID  as a parameter.

DELETE FROM OrderDetail WHERE OrderID IN (
    SELECT OrderID FROM Orders WHERE CustomerID = 3);

SELECT * FROM orderdetail;

-- 10. to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details. 

INSERT INTO products(ProductID,ProductName,Description,Price)
VALUES(11,'Thermostat' ,'Maintain Temperature',3499.00);

-- 11.  to update the status of a specific order in the "Orders" table (e.g., from  "Pending" to "Shipped"). Allow users to input the order ID and the new status. 

ALTER TABLE Orders
ADD COLUMN Status VARCHAR(50) DEFAULT 'Pending';

UPDATE orders 
SET Status ='Shipped'
WHERE OrderID=106;

-- SELECT * FROM orders;

-- 12. to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table. 
SELECT CustomerID,count(*) As noOfOrders FROM orders GROUP BY CustomerID ;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- TASK 3
-- 1)to retrieve a list of all orders along with customer information (e.g., customer name) for each order. 

SELECT customers.CustomerID,OrderID,CONCAT(FirstName,' ',LastName) AS FullName,OrderDate ,TotalAmount 
FROM orders join customers 
WHERE customers.CustomerID=orders.CustomerID;

-- 2) to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue. 

SELECT  ProductName, SUM(Price) AS TotalRevenue
FROM products
GROUP BY ProductName;

-- 3. to list all customers who have made at least one purchase. Include their names and contact information. 

SELECT customers.CustomerID,CONCAT(FirstName,' ',LastName) AS FullName ,Email,Phone,Address,count(orders.OrderID) AS Purchase_count 
FROM customers 
JOIN orders USING(CustomerID)
GROUP BY customers.CustomerID,Email,Phone,Address 
HAVING count(orders.OrderID) >=1 
ORDER BY Purchase_count DESC;

-- 4. to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered
SELECT ProductName,SUM(od.Quantity) AS Total_Quantity_Ordered
FROM products p
JOIN orderdetail od USING(ProductID)
GROUP BY ProductName
ORDER BY Total_Quantity_Ordered DESC
LIMIT 1;

-- 5.  to retrieve a list of electronic gadgets along with their corresponding categories.
SELECT ProductName,Description
FROM Products
WHERE Description LIKE '%headset%' ;

-- 6. to calculate the average order value for each customer. Include the customer's name and their average order value.
SELECT CONCAT(FirstName,' ' , LastName) AS FullName , AVG(orders.TotalAmount) AS averageOrder 
FROM customers JOIN orders 
USING(CustomerID)
GROUP BY CustomerID ;

-- 7.  to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.
SELECT orders.OrderID,Customers.CustomerID,CONCAT(FirstName,' ' , LastName) AS FullName,Email,Phone,Address, TotalAmount
FROM orders JOIN customers USING (CustomerID)
ORDER BY orders.TotalAmount DESC
LIMIT 1;

-- 8. to list electronic gadgets and the number of times each product has been ordered.

SELECT Products.ProductID,ProductName,COUNT(orderdetail.OrderDetailID) AS TimesOrdered
FROM  Products
JOIN OrderDetail USING(ProductID)
GROUP BY ProductName,ProductID;

-- 9. to find customers who have purchased a specific electronic gadget product. 
SELECT  customers.CustomerID,CONCAT(FirstName,' ' , LastName) AS FullName ,ProductName,Description,Price
FROM customers JOIN orders USING(CustomerID)
JOIN orderdetail USING(OrderID)
JOIN products USING(ProductID)
WHERE ProductName='Portable fan';

-- 10. to calculate the total revenue generated by all orders placed within a specific time period.

SELECT orders.OrderID,OrderDate,TotalAmount,CONCAT(FirstName,' ' , LastName) AS FullName 
FROM orders JOIN customers USING(CustomerID) 
WHERE OrderDate BETWEEN '2025-06-10' AND '2025-06-20';

-- ---------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------
-- TASK 4

-- 1.to find out which customers have not placed any orders.

select * from customers
where customerid not in(select customerid from orders );
select * from products;

-- 2  to find the total number of products available for sale. 

select count(*) as totalavailableproducts
from products
where productid in (select productid from inventory where quantityinstock > 0);

-- 3  to calculate the total revenue generated by techshop. 

select sum(totalamount) as total_revenue from orders;

-- 4 to calculate the average quantity ordered for products in a specific category. 

select avg(quantity) as avg_quantity_ordered from orderdetail 
where productid in (select productid from products where  productname = 'gaming headset');

-- 5. to calculate the total revenue generated by a specific customer. 

select customerid, concat(firstname, ' ', lastname) as fullname,sum(totalamount) as total_revenue
from customers join orders using(customerid)
where customerid in (select customerid from customers where firstname = 'zara')
group by customerid;

-- 6. to find the customers who have placed the most orders. list their names and the number of orders they've placed.
select c.customerid,concat(c.firstname, ' ', c.lastname) as fullname,count(o.orderid) as orders_placed
from customers c join orders o using(CustomerID)
group by c.customerid
order by orders_placed desc limit 1;

-- 7. find the most popular product category, which is the one with the highest total quantity ordered across all orders.
select p.productname,sum(od.quantity) as totalquantityordered
from orderdetail od
join products p using(ProductID)
group by p.productname
order by totalquantityordered desc limit 1; 
-- using limit to get highest one

-- 8.  to find the customer who has spent the most money (highest total revenue) on electronic gadgets. 
-- List their name and total spending.

select c.customerid,concat(c.firstname, ' ', c.lastname) as fullname,sum(od.quantity * o.totalamount) as total_spending from customers c 
join orders o using(customerid)
join orderdetail od using(orderid) 
join products p using(productid)
where p.productname = 'portable fan' group by c.customerid  order by total_spending desc limit 1;


-- 9. to calculate the average order value (total revenue divided by the number of orders) for all customers.

select c.customerid,concat(c.firstname, ' ', c.lastname) as fullname,sum(o.totalamount) / count(o.orderid) as average_order
from customers c join orders o using(customerid) group by c.customerid;

-- 10. to find the total number of orders placed by each customer and list their names along with the order count.

select c.customerid,concat(c.firstname, ' ', c.lastname) as fullname,count(o.orderid) as order_count
from customers c left join orders o using(CustomerID) group by c.customerid order by order_count desc;
use techshop;