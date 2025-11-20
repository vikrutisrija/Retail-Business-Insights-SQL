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


📈 Business Insights Extracted

Identified top revenue-generating countries

Found best-selling products based on quantity

Analyzed order trends and purchasing behavior

Calculated total revenue and customer purchase patterns

Built a complete retail transactional SQL model
