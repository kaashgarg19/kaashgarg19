-- Bike Sales SQL Analysis
-- Dataset: Customers.csv, Orders.csv, Products.csv
-- These queries match the CSV structure stored in this repository.
--
-- BikeStores reference:
-- https://www.sqlservertutorial.net/getting-started/sql-server-sample-database/
--
-- Expected tables after importing the CSV files:
-- Customers(customer_id, first_name, last_name, ...)
-- Orders(order_id, customer_id, product_id, quantity, price, order_date)
-- Products(product_id, product_name, model_year, price)
--
-- Revenue calculation used here: quantity * price
-- No discount column is present in Orders.csv.

-- 1. Find each customer's name and the product they purchased.
SELECT
    c.first_name,
    c.last_name,
    p.product_name
FROM Customers AS c
JOIN Orders AS o
    ON c.customer_id = o.customer_id
JOIN Products AS p
    ON o.product_id = p.product_id
ORDER BY
    c.last_name,
    c.first_name,
    p.product_name;

-- 2. Find the top 5 products by revenue.
SELECT TOP 5
    p.product_name,
    SUM(o.quantity * o.price) AS revenue
FROM Orders AS o
JOIN Products AS p
    ON o.product_id = p.product_id
GROUP BY
    p.product_name
ORDER BY
    revenue DESC;

-- 3. Find the top 5 customers by total number of orders.
SELECT TOP 5
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders
FROM Customers AS c
JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    total_orders DESC;