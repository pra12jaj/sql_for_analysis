
-- MySQL Data Extraction and Analysis Queries
-- Database: sales_db

-- 1. View all records
SELECT * FROM sales;

-- 2. Filter records
SELECT order_id, customer_id, total_amount
FROM sales
WHERE total_amount > 5000;

-- 3. Sort data
SELECT *
FROM sales
ORDER BY total_amount DESC;

-- 4. Aggregation: Total sales by product
SELECT product_name, SUM(total_amount) AS total_sales
FROM sales
GROUP BY product_name;

-- 5. Count orders by payment mode
SELECT payment_mode, COUNT(*) AS orders_count
FROM sales
GROUP BY payment_mode;

-- 6. Monthly sales analysis
SELECT MONTH(order_date) AS month, SUM(total_amount) AS monthly_sales
FROM sales
GROUP BY MONTH(order_date)
ORDER BY month;

-- 7. Join customers and sales
SELECT c.customer_name, s.order_id, s.total_amount
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id;

-- 8. Top 5 customers by spending
SELECT customer_id, SUM(total_amount) AS total_spent
FROM sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;
