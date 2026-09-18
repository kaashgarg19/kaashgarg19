/*
===============================================================================
SQL Capstone Project - Velocity Bikes Ltd. Schema & Business Analytics
Author: Aman Gupta (Junior Data Analyst)
File Name: AmanGupta_Velocity_Bikes_FullyCommented.sql
Dataset: Relational Bike Sales Database
===============================================================================
*/

-- ============================================================================
-- SECTION 1: DATA DEFINITION LANGUAGE (DDL) - DATABASE SCHEMA CREATION
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Table 1: stores
-- Purpose: Holds physical store location details and contact information.
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS stores (
    store_id INT PRIMARY KEY,              -- Unique identifier for each store
    store_name VARCHAR(255) NOT NULL,      -- Full commercial name of the store location
    phone VARCHAR(25),                     -- Primary phone contact number
    email VARCHAR(255),                    -- Official store email address
    street VARCHAR(255),                   -- Physical street address
    city VARCHAR(255),                     -- City location
    state VARCHAR(10),                     -- Two-letter state abbreviation
    zip_code VARCHAR(10)                   -- Postal zip code
);

-- ----------------------------------------------------------------------------
-- Table 2: staffs
-- Purpose: Contains store employee organizational data, contacts, and managers.
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS staffs (
    staff_id INT PRIMARY KEY,              -- Unique staff member identifier
    first_name VARCHAR(255) NOT NULL,      -- Staff member first name
    last_name VARCHAR(255) NOT NULL,       -- Staff member last name
    email VARCHAR(255) UNIQUE NOT NULL,    -- Individual work email address
    phone VARCHAR(25),                     -- Staff phone contact
    active INT NOT NULL,                   -- Employment status (1 = Active, 0 = Inactive)
    store_id INT NOT NULL,                 -- Assigned store location ID
    manager_id INT,                        -- Reporting manager's staff ID (Self-referencing FK)
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

-- ----------------------------------------------------------------------------
-- Table 3: brands
-- Purpose: Catalogue of bike manufacturers and brand names.
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS brands (
    brand_id INT PRIMARY KEY,              -- Unique brand identifier
    brand_name VARCHAR(255) NOT NULL       -- Name of the brand (e.g., Trek, Surly, Electra)
);

-- ----------------------------------------------------------------------------
-- Table 4: categories
-- Purpose: Holds product category groupings (e.g., Mountain, Road, Electric).
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS categories (
    category_id INT PRIMARY KEY,           -- Unique product category identifier
    category_name VARCHAR(255) NOT NULL    -- Category name description
);

-- ----------------------------------------------------------------------------
-- Table 5: customers
-- Purpose: Stores customer profile details and geographic mailing addresses.
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,           -- Unique customer identifier
    first_name VARCHAR(255) NOT NULL,      -- Customer first name
    last_name VARCHAR(255) NOT NULL,       -- Customer last name
    phone VARCHAR(25),                     -- Customer contact number
    email VARCHAR(255),                    -- Customer email address
    street VARCHAR(255),                   -- Delivery street address
    city VARCHAR(255),                     -- Delivery city
    state VARCHAR(10),                     -- State abbreviation
    zip_code VARCHAR(10)                   -- Postal code
);

-- ----------------------------------------------------------------------------
-- Table 6: products
-- Purpose: Master catalog of all bicycle models, prices, and specifications.
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,            -- Unique product catalog identifier
    product_name VARCHAR(255) NOT NULL,    -- Commercial model name
    brand_id INT NOT NULL,                 -- Reference to brands table
    category_id INT NOT NULL,              -- Reference to categories table
    model_year INT NOT NULL,               -- Year model was released
    list_price DECIMAL(10, 2) NOT NULL,    -- Base MSRP retail price
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- ----------------------------------------------------------------------------
-- Table 7: stocks
-- Purpose: Tracks current inventory counts for each product at every store.
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS stocks (
    store_id INT NOT NULL,                 -- Reference to stores table
    product_id INT NOT NULL,               -- Reference to products table
    quantity INT DEFAULT 0,                -- On-hand units available in warehouse
    PRIMARY KEY (store_id, product_id),    -- Composite key ensuring unique store-product pairs
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ----------------------------------------------------------------------------
-- Table 8: orders
-- Purpose: Records purchase transactions, timestamps, customer, and store details.
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,              -- Unique order invoice identifier
    customer_id INT NOT NULL,              -- Purchasing customer ID
    order_status INT NOT NULL,             -- Status code (1=Pending, 2=Processing, 3=Rejected, 4=Completed)
    order_date DATE NOT NULL,              -- Date order was placed
    required_date DATE NOT NULL,           -- Target delivery date
    shipped_date DATE,                     -- Actual fulfillment date
    store_id INT NOT NULL,                 -- Store where order was processed
    staff_id INT NOT NULL,                 -- Sales representative who handled order
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (staff_id) REFERENCES staffs(staff_id)
);

-- ----------------------------------------------------------------------------
-- Table 9: order_items
-- Purpose: Itemized line details for each order including quantities and discounts.
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS order_items (
    order_id INT NOT NULL,                 -- Associated order invoice ID
    item_id INT NOT NULL,                  -- Sequential line item number within order
    product_id INT NOT NULL,               -- Product purchased
    quantity INT NOT NULL,                 -- Units ordered
    list_price DECIMAL(10, 2) NOT NULL,    -- Selling price at purchase time
    discount DECIMAL(4, 2) DEFAULT 0,      -- Promotional discount percentage applied (0.00 to 1.00)
    PRIMARY KEY (order_id, item_id),       -- Composite primary key for line item uniqueness
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- ============================================================================
-- SECTION 2: BUSINESS INSIGHTS & ANALYTICAL QUERIES
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Query 1: Why Are Some Products Selling Better Than Others?
-- Purpose: Analyzes total net revenue and unit movement across product models,
-- joining brands and categories to identify core profitability drivers.
-- ----------------------------------------------------------------------------
SELECT 
    p.product_id,                                              -- Catalog product ID
    p.product_name,                                            -- Model name
    b.brand_name,                                              -- Associated brand manufacturer
    c.category_name,                                           -- Product classification category
    p.model_year,                                              -- Release year
    p.list_price,                                              -- Retail unit MSRP
    SUM(oi.quantity) AS total_units_sold,                       -- Aggregate units purchased across orders
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_net_revenue -- Net sales revenue after discounts
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id             -- Join line items to get sales history
JOIN brands b ON p.brand_id = b.brand_id                       -- Join brands for manufacturer details
JOIN categories c ON p.category_id = c.category_id             -- Join categories for classification
GROUP BY p.product_id, p.product_name, b.brand_name, c.category_name, p.model_year, p.list_price
ORDER BY total_net_revenue DESC;                               -- Highest grossing products first


-- ----------------------------------------------------------------------------
-- Query 2: VIP Loyalty Programme Qualification Analysis
-- Purpose: Identifies repeat purchasers (4+ completed orders) and segments them
-- into loyalty tiers based on lifetime spend.
-- ----------------------------------------------------------------------------
SELECT 
    cust.customer_id,                                           -- Customer account ID
    cust.first_name,                                           -- First name
    cust.last_name,                                            -- Last name
    cust.email,                                                -- Primary email
    cust.state,                                                -- Residence state
    COUNT(DISTINCT o.order_id) AS total_orders,                -- Distinct order count
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_spend, -- Lifetime dollar volume
    CASE 
        WHEN SUM(oi.quantity * oi.list_price * (1 - oi.discount)) >= 20000 THEN 'VIP Gold'   -- Top tier spenders
        WHEN SUM(oi.quantity * oi.list_price * (1 - oi.discount)) >= 10000 THEN 'VIP Silver' -- High tier spenders
        ELSE 'Member'                                          -- Standard loyalty entry
    END AS loyalty_tier
FROM customers cust
JOIN orders o ON cust.customer_id = o.customer_id              -- Join customer orders
JOIN order_items oi ON o.order_id = oi.order_id                -- Join invoice line items
GROUP BY cust.customer_id, cust.first_name, cust.last_name, cust.email, cust.state
HAVING COUNT(DISTINCT o.order_id) >= 4                         -- Filter for repeat customers with 4+ orders
ORDER BY total_spend DESC;                                     -- Rank top spenders first


-- ----------------------------------------------------------------------------
-- Query 3: Regional Disparity Analysis (State Customer Base vs Monetization)
-- Purpose: Compares customer counts per state with total revenue to identify 
-- markets with high customer volume but low average monetization.
-- ----------------------------------------------------------------------------
SELECT 
    cust.state,                                                -- Territory state code
    COUNT(DISTINCT cust.customer_id) AS total_customers,       -- Total registered customers in state
    COUNT(DISTINCT o.order_id) AS total_orders,                -- Total orders placed from state
    COALESCE(SUM(oi.quantity * oi.list_price * (1 - oi.discount)), 0) AS total_revenue, -- Total state revenue
    ROUND(COALESCE(SUM(oi.quantity * oi.list_price * (1 - oi.discount)), 0) / NULLIF(COUNT(DISTINCT cust.customer_id), 0), 2) AS revenue_per_customer -- Average spend per customer
FROM customers cust
LEFT JOIN orders o ON cust.customer_id = o.customer_id          -- Outer join to include non-buying customers
LEFT JOIN order_items oi ON o.order_id = oi.order_id            -- Outer join to line items
GROUP BY cust.state
ORDER BY total_customers DESC;                                 -- Sort by largest market customer base


-- ----------------------------------------------------------------------------
-- Query 4: Inventory Action Strategy (Marketing vs Clearance / Discontinue)
-- Purpose: Flags low-selling inventory (<5 units) to determine appropriate 
-- strategic action (Boost Marketing, Clearance Discount, or Discontinue).
-- ----------------------------------------------------------------------------
SELECT 
    p.product_id,                                              -- Product catalog ID
    p.product_name,                                            -- Model name
    b.brand_name,                                              -- Brand manufacturer
    p.model_year,                                              -- Model year
    p.list_price,                                              -- Unit price
    COALESCE(SUM(oi.quantity), 0) AS total_units_sold,         -- Total unit sales
    CASE 
        WHEN COALESCE(SUM(oi.quantity), 0) = 0 THEN 'Discontinue'                             -- Zero sales movement
        WHEN COALESCE(SUM(oi.quantity), 0) < 5 AND p.list_price > 1500 THEN 'Boost Marketing' -- High value, needs promotion
        WHEN COALESCE(SUM(oi.quantity), 0) < 5 AND p.model_year <= 2017 THEN 'Clearance Discount' -- Legacy stock clearance
        ELSE 'Maintain Strategy'                                                               -- Performing well
    END AS product_action
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id        -- Left join to catch 0-sales items
JOIN brands b ON p.brand_id = b.brand_id                       -- Join manufacturer name
GROUP BY p.product_id, p.product_name, b.brand_name, p.model_year, p.list_price
ORDER BY total_units_sold ASC;                                 -- Focus on lowest performers first


-- ----------------------------------------------------------------------------
-- Query 5: Model Year Performance (New vs. Legacy Models)
-- Purpose: Evaluates sales distribution across release model years to prove 
-- customer preference for newer bicycle technologies.
-- ----------------------------------------------------------------------------
SELECT 
    p.model_year,                                              -- Bicycle model year
    COUNT(DISTINCT p.product_id) AS total_products,           -- Count of distinct products in catalog
    SUM(oi.quantity) AS total_units_sold,                      -- Aggregate units sold
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_revenue, -- Total net sales revenue
    ROUND(AVG(oi.quantity * oi.list_price * (1 - oi.discount)), 2) AS avg_item_revenue -- Average revenue per line
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id             -- Join line item transactions
GROUP BY p.model_year
ORDER BY p.model_year DESC;                                    -- Sort chronologically descending


-- ----------------------------------------------------------------------------
-- Query 6: Multi-Table Store Performance & Inventory Utilization
-- Purpose: Joins stores, staffs, orders, order_items, and stocks to assess 
-- physical store revenue output versus current inventory on hand.
-- ----------------------------------------------------------------------------
SELECT 
    s.store_id,                                                -- Store identifier
    s.store_name,                                              -- Store location name
    s.city,                                                    -- City
    s.state,                                                   -- State
    COUNT(DISTINCT st.staff_id) AS staff_count,                -- Number of assigned employees
    COUNT(DISTINCT o.order_id) AS total_orders,                -- Order volume processed
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales, -- Total store net sales
    COALESCE(SUM(stk.quantity), 0) AS current_stock_units      -- Total stock inventory currently held
FROM stores s
LEFT JOIN staffs st ON s.store_id = st.store_id                -- Join staff directory
LEFT JOIN orders o ON s.store_id = o.store_id                  -- Join store transactions
LEFT JOIN order_items oi ON o.order_id = oi.order_id            -- Join line item values
LEFT JOIN stocks stk ON s.store_id = stk.store_id              -- Join store inventory levels
GROUP BY s.store_id, s.store_name, s.city, s.state
ORDER BY total_sales DESC;                                     -- Rank top-performing stores first
