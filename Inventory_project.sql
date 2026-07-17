CREATE DATABASE Inventory_db;

USE inventory_db;

SET GLOBAL local_infile = 1;

SHOW VARIABLES LIKE 'local_infile';

CREATE TABLE retail_inventory_sales (
    date DATE,
    store_id VARCHAR(10),
    product_id VARCHAR(10),
    category VARCHAR(50),
    region VARCHAR(50),
    inventory_level INT,
    units_sold INT,
    units_ordered INT,
    demand_forecast DECIMAL(10,2),
    price DECIMAL(10,2),
    discount DECIMAL(5,2),
    weather_condition VARCHAR(30),
    holiday_promotion VARCHAR(10),
    competitor_pricing DECIMAL(10,2),
    seasonality VARCHAR(20),
    final_price DECIMAL(10,2),
    revenue DECIMAL(15,2),
    inventory_remaining INT,
    price_difference DECIMAL(10,2),
    price_difference_percentage DECIMAL(6,2)
)

-- View records
SELECT * 
FROM retail_inventory_sales
LIMIT 5;

-- Count total number of records
SELECT COUNT(*) AS total_records
FROM retail_inventory_sales;

-- Display unique product categories
SELECT DISTINCT category
FROM retail_inventory_sales;

-- Display unique regions
SELECT DISTINCT region
FROM retail_inventory_sales;

-- Find total revenue
SELECT SUM(revenue) AS total_revenue
FROM retail_inventory_sales;

-- Find average product price
SELECT ROUND(AVG(price),2) AS average_price
FROM retail_inventory_sales;

-- Find highest and lowest price
SELECT
MAX(price) AS highest_price,
MIN(price) AS lowest_price
FROM retail_inventory_sales;

-- Top 10 products with highest revenue
SELECT product_id,
SUM(revenue) AS total_revenue
FROM retail_inventory_sales
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Total revenue by category
SELECT category,
SUM(revenue) AS total_revenue
FROM retail_inventory_sales
GROUP BY category
ORDER BY total_revenue DESC;

-- Total revenue by region
SELECT region,
SUM(revenue) AS total_revenue
FROM retail_inventory_sales
GROUP BY region
ORDER BY total_revenue DESC;

-- Average inventory level by category
SELECT category,
ROUND(AVG(inventory_level),2) AS avg_inventory
FROM retail_inventory_sales
GROUP BY category;

-- Find products with low inventory
SELECT product_id,
inventory_level
FROM retail_inventory_sales
WHERE inventory_level < 50
ORDER BY inventory_level;

-- Top 10 most sold products
SELECT product_id,
SUM(units_sold) AS total_units_sold
FROM retail_inventory_sales
GROUP BY product_id
ORDER BY total_units_sold DESC
LIMIT 10;

-- Compare units sold vs units ordered
SELECT
SUM(units_sold) AS total_units_sold,
SUM(units_ordered) AS total_units_ordered
FROM retail_inventory_sales;

-- Average discount by category
SELECT category,
ROUND(AVG(discount),2) AS avg_discount
FROM retail_inventory_sales
GROUP BY category;

-- Revenue generated during promotions
SELECT holiday_promotion,
SUM(revenue) AS total_revenue
FROM retail_inventory_sales
GROUP BY holiday_promotion;

-- Revenue by weather condition
SELECT weather_condition,
SUM(revenue) AS total_revenue
FROM retail_inventory_sales
GROUP BY weather_condition
ORDER BY total_revenue DESC;

-- Monthly revenue trend
SELECT
YEAR(date) AS year,
MONTH(date) AS month,
SUM(revenue) AS monthly_revenue
FROM retail_inventory_sales
GROUP BY YEAR(date), MONTH(date)
ORDER BY year, month;

-- Top 5 stores by revenue
SELECT store_id,
SUM(revenue) AS total_revenue
FROM retail_inventory_sales
GROUP BY store_id
ORDER BY total_revenue DESC
LIMIT 5;

-- Top 10 highest revenue transactions
SELECT *
FROM retail_inventory_sales
ORDER BY revenue DESC
LIMIT 10;
