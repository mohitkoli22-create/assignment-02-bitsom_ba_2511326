CREATE DATABASE ORDERS

USE ORDERS;

-- Customers
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

-- Products
CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- Sales Representatives
CREATE TABLE SalesReps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL
);

-- Orders
CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    sales_rep_id VARCHAR(10),
    order_date DATE NOT NULL,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES SalesReps(sales_rep_id)
);

-- Order Items
CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO Customers VALUES
('CUST001','Amit Shah','amit@gmail.com','Mumbai'),
('CUST002','Riya Singh','riya@gmail.com','Delhi'),
('CUST003','John Doe','john@gmail.com','Mumbai'),
('CUST004','Sara Khan','sara@gmail.com','Pune'),
('CUST005','Raj Patel','raj@gmail.com','Mumbai');

INSERT INTO Products VALUES
('P001','Laptop','Electronics',50000),
('P002','Phone','Electronics',20000),
('P003','Shoes','Fashion',3000),
('P004','Watch','Accessories',5000),
('P005','Bag','Fashion',1500);

INSERT INTO SalesReps VALUES
('S001','Rahul Mehta'),
('S002','Neha Sharma'),
('S003','Arjun Verma'),
('S004','Priya Das'),
('S005','Karan Malhotra');

INSERT INTO Orders VALUES
('ORD1','CUST001','S001','2023-01-01','delivered'),
('ORD2','CUST002','S002','2023-01-02','shipped'),
('ORD3','CUST003','S003','2023-01-03','processing'),
('ORD4','CUST004','S004','2023-01-04','delivered'),
('ORD5','CUST005','S005','2023-01-05','cancelled');

INSERT INTO OrderItems(order_id,product_id,quantity,price) VALUES
('ORD1','P001',1,50000),
('ORD2','P002',2,20000),
('ORD3','P003',3,3000),
('ORD4','P004',1,5000),
('ORD5','P005',2,1500);

SELECT * FROM Customers;