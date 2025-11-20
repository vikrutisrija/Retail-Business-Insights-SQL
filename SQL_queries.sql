-- ============================================================
-- SQL PROJECT: RETAIL BUSINESS INSIGHTS
-- Database: retail_db
-- Author: Vikruti Srija
-- ============================================================

CREATE DATABASE IF NOT EXISTS retail_db;
USE retail_db;

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    country VARCHAR(255)
);

-- Products Table
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10, 2)
);

-- Orders Table
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Details Table
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id VARCHAR(50),
    product_id VARCHAR(50),
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Total Revenue
SELECT SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN products p ON od.product_id = p.product_id;

-- Top 10 Best-Selling Products
SELECT p.product_name,
       SUM(od.quantity) AS total_sold
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 10;

-- Revenue by Country
SELECT c.country,
       SUM(od.quantity * p.price) AS revenue
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON od.product_id = p.product_id
GROUP BY c.country
ORDER BY revenue DESC;

-- Monthly Revenue Trend
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       SUM(od.quantity * p.price) AS revenue
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY month
ORDER BY month;

-- Most Active Customers
SELECT c.customer_id,
       c.country,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.country
ORDER BY total_orders DESC
LIMIT 10;

-- Highest Revenue Products
SELECT p.product_name,
       SUM(od.quantity * p.price) AS revenue_generated
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue_generated DESC
LIMIT 10;

-- Low-Selling Products
SELECT p.product_name,
       SUM(od.quantity) AS units_sold
FROM products p
LEFT JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY units_sold ASC
LIMIT 10;

-- Average Order Value
SELECT AVG(order_total) AS avg_order_value
FROM (
    SELECT o.order_id,
           SUM(od.quantity * p.price) AS order_total
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY o.order_id
) AS t;

-- Customer Revenue Contribution
SELECT c.customer_id,
       SUM(od.quantity * p.price) AS customer_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY c.customer_id
ORDER BY customer_revenue DESC
LIMIT 10;

-- Frequently Bought Together
SELECT od1.product_id AS product_a,
       od2.product_id AS product_b,
       COUNT(*) AS times_bought_together
FROM order_details od1
JOIN order_details od2 ON od1.order_id = od2.order_id
WHERE od1.product_id <> od2.product_id
GROUP BY product_a, product_b
ORDER BY times_bought_together DESC
LIMIT 10;

-- ============================================================
-- END OF FILE
-- ============================================================



