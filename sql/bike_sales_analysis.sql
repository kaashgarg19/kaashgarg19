-- Bike Sales SQL Analysis
-- Tasks:
-- 1. Find each customer's name and the product they purchased.
-- 2. Find the top 5 products by revenue.
-- 3. Find the top 5 customers by total number of orders.

-- 1. Customer name and product purchased
SELECT
    c.first_name,
    c.last_name,
    p.product_name
FROM sales.customers AS c
JOIN sales.orders AS o
    ON c.customer_id = o.customer_id
JOIN sales.order_items AS oi
    ON o.order_id = oi.order_id
JOIN production.products AS p
    ON oi.product_id = p.product_id
ORDER BY
    c.last_name,
    c.first_name,
    p.product_name;


-- 2. Top 5 products by revenue
SELECT TOP 5
    p.product_name,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS revenue
FROM sales.order_items AS oi
JOIN production.products AS p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_name
ORDER BY
    revenue DESC;


-- 3. Top 5 customers by total number of orders
SELECT TOP 5
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders
FROM sales.customers AS c
JOIN sales.orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    total_orders DESC;
