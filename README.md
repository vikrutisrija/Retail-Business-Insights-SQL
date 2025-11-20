# 📊 Retail Business Insights – SQL Project

This project analyzes a **5,000+ row retail sales dataset** sourced from the UCI Online Retail dataset. Using MySQL, the dataset was cleaned, structured into relational tables, and analyzed to derive insights about customer behavior, product performance, and revenue trends.

---

## 📁 Project Structure

/ data  
    ├── customers.csv  
    ├── products.csv  
    ├── orders.csv  
    └── order_details.csv  

/ sql  
    └── sql_queries.sql  

README.md

---

## 🚀 Getting Started

Follow these steps to run this project locally:

### 1️⃣ Clone the Repository
git clone https://github.com/vikrutisrija/Retail-Business-Insights-SQL.git  
cd Retail-Business-Insights-SQL

### 2️⃣ Open MySQL Workbench

### 3️⃣ Create the Database
CREATE DATABASE retail_db;  
USE retail_db;

### 4️⃣ Create Tables
Use the SQL schema provided in sql_queries.sql.

### 5️⃣ Import CSV Files
MySQL Workbench → retail_db → Right-click each table → Table Data Import Wizard → select CSV file (customers.csv, products.csv, orders.csv, order_details.csv)

### 6️⃣ Run SQL Queries
Use the provided sql_queries.sql file.

---

## 🧱 Database Schema

### customers
customer_id – INT  
country – VARCHAR  

### products
product_id – VARCHAR  
product_name – VARCHAR  
price – DECIMAL  

### orders
order_id – VARCHAR  
customer_id – INT  
order_date – DATETIME  

### order_details
order_detail_id – INT  
order_id – VARCHAR  
product_id – VARCHAR  
quantity – INT  

---

## 🔍 Key SQL Queries & Insights

### 1️⃣ Top Countries by Revenue
SELECT c.country, SUM(od.quantity * p.price) AS revenue  
FROM order_details od  
JOIN orders o ON od.order_id = o.order_id  
JOIN customers c ON o.customer_id = c.customer_id  
JOIN products p ON od.product_id = p.product_id  
GROUP BY c.country  
ORDER BY revenue DESC;

### 2️⃣ Best-Selling Products
SELECT p.product_name, SUM(od.quantity) AS total_sold  
FROM order_details od  
JOIN products p ON od.product_id = p.product_id  
GROUP BY p.product_name  
ORDER BY total_sold DESC  
LIMIT 10;

### 3️⃣ Total Revenue
SELECT SUM(od.quantity * p.price) AS total_revenue  
FROM order_details od  
JOIN products p ON od.product_id = p.product_id;

---

# ⭐ Key Findings

🔹 The United Kingdom generates the highest revenue.  
🔹 Some products dominate total sales and drive major revenue.  
🔹 High-revenue customers frequently place multi-product, bulk orders.

---

# 🛠 Future Work / Next Steps

✔ Build a Power BI dashboard using this SQL data  
✔ Perform RFM customer segmentation  
✔ Add stored procedures for automated reporting  
✔ Add indexing for performance improvement  
✔ Include charts and visuals in README  

---

## 📦 Files Included

customers.csv  
products.csv  
orders.csv  
order_details.csv  
sql_queries.sql  
README.md

---

## 🏁 Conclusion

This project demonstrates end-to-end SQL skills including data cleaning, relational database design, joins, CTEs, aggregations, and business analytics. It serves as a strong Data Analyst portfolio project.

