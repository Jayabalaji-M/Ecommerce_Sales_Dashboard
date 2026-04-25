create database ecommerce_project
 
 use ecommerce_project
 
 SELECT * FROM ecommerce_orders;
 
 SELECT Customer_name, product, price FROM ecommerce_orders;
 
  
 SELECT * FROM ecommerce_orders
 WHERE region='south'AND price > 500;
 
 --- Aggregate function ---
 
 SELECT COUNT(*) FROM ecommerce_orders;
 
 SELECT SUM(price * quantity) AS total_price FROM ecommerce_orders;
 
 SELECT AVG(price) AS avg_price FROM ecommerce_orders;
 
-- GROUP BY (for category wise checking) ---
SELECT region, SUM(price * quantity) AS total_revenue
FROM ecommerce_orders
GROUP BY region

SELECT order_id, customer_name, price
FROM ecommerce_orders
ORDER BY price DESC
LIMIT 5;

SELECT 
    YEAR(order_date) AS order_year,
    order_date
FROM 
    ecommerce_orders;
    
    SELECT 
    order_date,
    REPLACE(order_date, '/', '-') AS replaced_date
FROM ecommerce_orders;

SELECT 
    YEAR(order_date) AS Year,
    SUM(sales) AS Total_Sales
FROM your_table
GROUP BY YEAR(order_date)
ORDER BY Year;

-- JOINS --
use customers
CREATE TABLE customers(
customer_name TEXT,
email TEXT, 
city TEXT
);

SELECT o.order_id, o.customer_name, c.email, o.price
FROM ecommerce_orders as o
JOIN ecommerce_customers as c
ON o.customer_name = c.customer_name;

-- price category --
SELECT order_id, price,
CASE 
	WHEN price > 1000 THEN 'Premium'
	WHEN price BETWEEN 500 AND 1000 THEN 'Mid_Range'
	ELSE 'Buget'
END AS price_category
FROM ecommerce_orders;

--- subquery ---
SELECT * FROM ecommerce_orders
	WHERE price > (
	SELECT AVG(price) FROM ecommerce_orders
);

-- region --
SELECT region, SUM(quantity)  AS total_items_sold
FROM ecommerce_orders
GROUP BY region
ORDER BY total_items_sold DESC;

-- to find montly date column --
SELECT
	DATE_FORMAT(order_date, '%y-%m') AS month,
    SUM(quantity * price) AS total_revenue
FROM ecommerce_orders
GROUP BY month
ORDER BY month;   

-- Top 5 products --	
SELECT product,
	   SUM(quantity) AS total_quantity
FROM ecommerce_orders
GROUP BY product
ORDER BY total_quantity DESC
LIMIT 5;

-- revenue by category --
SELECT category,
	SUM(quantity * price) AS revenue
FROM ecommerce_orders
GROUP BY category;

-- revenue by city --
SELECT c.city,
	SUM(o.quantity * o.price) AS revenue
FROM ecommerce_orders as o  
JOIN 
	ecommerce_customers as c
    ON o.customer_name = c.customer_name
GROUP BY city
ORDER BY revenue DESC


 