📊 Retail Business Insights – SQL Project

This project analyzes a real retail dataset containing 5,000+ transactions, extracted from the Online Retail Dataset (UCI Machine Learning Repository).

Using MySQL, I cleaned, explored, and analyzed purchase patterns, customer behavior, and revenue trends.

🔧 Tech Stack

SQL (MySQL Workbench)

JOINs, CTEs, Aggregations, Window Functions

Data Cleaning & Data Modeling

CSV Import (MySQL Table Import Wizard)

📁 Dataset Structure

The dataset was cleaned and transformed into 4 relational tables:

1. customers
Column	Type
customer_id	INT
country	VARCHAR
2. products
Column	Type
product_id	VARCHAR
product_name	VARCHAR
price	DECIMAL
3. orders
Column	Type
order_id	VARCHAR
customer_id	INT
order_date	DATETIME
4. order_details
Column	Type
order_detail_id	INT
order_id	VARCHAR
product_id	VARCHAR
quantity	INT
📌 Key SQL Queries & Insights
🔹 1. Top Countries by Revenue
SELECT c.country, 
       SUM(od.quantity * p.price) AS revenue
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON od.product_id = p.product_id
GROUP BY c.country
ORDER BY revenue DESC;

🔹 2. Top 10 Best-Selling Products
SELECT p.product_name,
       SUM(od.quantity) AS total_sold
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 10;

🔹 3. Total Revenue Generated
SELECT SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN products p ON od.product_id = p.product_id;

📈 Business Insights Extracted

Identified top revenue-generating countries

Found best-selling products based on quantity

Analyzed order trends and purchasing behavior

Calculated total revenue and customer purchase patterns

Built a complete retail transactional SQL model
