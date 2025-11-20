1. Top Countries by Revenue
  
SELECT c.country, 
       SUM(od.quantity * p.price) AS revenue
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON od.product_id = p.product_id
GROUP BY c.country
ORDER BY revenue DESC;


2. Top 10 Best-Selling Products
  
SELECT p.product_name,
       SUM(od.quantity) AS total_sold
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 10;


3. Total Revenue Generated
  
SELECT SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN products p ON od.product_id = p.product_id;


