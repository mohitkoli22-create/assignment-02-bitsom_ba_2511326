CREATE database RETAIL_TRANSACTIONS

USE RETAIL_TRANSACTIONS

-- DIMENSION TABLES

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    month_name VARCHAR(20),
    day INT
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- FACT TABLE

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- INSERT CLEANED DATA

-- dim_date (standardized YYYY-MM-DD)
INSERT INTO dim_date VALUES
(1, '2024-01-01', 2024, 1, 'January', 1),
(2, '2024-01-02', 2024, 1, 'January', 2),
(3, '2024-02-01', 2024, 2, 'February', 1),
(4, '2024-02-05', 2024, 2, 'February', 5),
(5, '2024-03-01', 2024, 3, 'March', 1);

-- dim_store
INSERT INTO dim_store VALUES
(1, 'Store A', 'Mumbai', 'Maharashtra'),
(2, 'Store B', 'Pune', 'Maharashtra'),
(3, 'Store C', 'Delhi', 'Delhi');

-- dim_product (standardized category casing)
INSERT INTO dim_product VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Phone', 'Electronics'),
(3, 'Shirt', 'Clothing'),
(4, 'Shoes', 'Clothing');

-- fact_sales (NULLs handled, consistent pricing)
INSERT INTO fact_sales VALUES
(1, 1, 1, 1, 2, 50000, 100000),
(2, 1, 2, 2, 1, 30000, 30000),
(3, 2, 1, 3, 3, 1500, 4500),
(4, 2, 3, 4, 2, 2000, 4000),
(5, 3, 2, 1, 1, 52000, 52000),
(6, 3, 1, 2, 2, 28000, 56000),
(7, 4, 3, 3, 5, 1200, 6000),
(8, 4, 2, 4, 2, 2200, 4400),
(9, 5, 1, 1, 1, 51000, 51000),
(10, 5, 3, 2, 2, 29000, 58000);
