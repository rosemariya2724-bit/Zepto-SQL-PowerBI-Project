USE analytics_project;

-- 1️⃣ Total Revenue
SELECT SUM(total_amount) AS total_revenue
FROM orders;

-- 2️⃣ Revenue by Month
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       SUM(total_amount) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

-- 3️⃣ Top Selling Products
SELECT p.name,
       SUM(oi.quantity * oi.unit_price) AS product_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY product_revenue DESC;

-- 4️⃣ Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 5️⃣ Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 6️⃣ Revenue by City
SELECT c.city,
       SUM(o.total_amount) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;

-- 7️⃣ Revenue by Category
SELECT p.category,
       SUM(oi.quantity * oi.unit_price) AS category_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

-- 8️⃣ Repeat Customers
SELECT COUNT(*) AS repeat_customers
FROM (
  SELECT customer_id, COUNT(*) AS order_count
  FROM orders
  GROUP BY customer_id
  HAVING order_count > 1
) AS t;

-- 9️⃣ Orders by Month
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       COUNT(*) AS order_count
FROM orders
GROUP BY month
ORDER BY month;

