-- =============================================
-- PROJECT   : Super Store Analysis
-- DATABASE  : SQL Server
-- AUTHOR    : Gautam
-- DATE      : 2026
-- TOOLS     : Microsoft SQL Server, ChatGPT, Google Gemini, Claude (Anthropic)
-- =============================================

-- CREATE DATABASE
CREATE DATABASE Super_store;
USE Super_store;

-- =============================================
-- DATA CLEANING
-- =============================================

PRINT 'LOOKING FOR NULL VALUES';
SELECT *
FROM [Super store Analysis]
WHERE product_name IS NULL
   OR order_date IS NULL
   OR ship_date IS NULL
   OR customer_name IS NULL
   OR ship_mode IS NULL
   OR segment IS NULL
   OR state IS NULL
   OR country IS NULL
   OR market IS NULL
   OR region IS NULL
   OR category IS NULL
   OR sales IS NULL
   OR quantity IS NULL
   OR profit IS NULL
   OR shipping_cost IS NULL
   OR order_priority IS NULL;

PRINT 'DUPLICATE RECORDS IN THE DATASET';
SELECT
    product_name,
    order_date,
    ship_date,
    customer_name,
    order_priority,
    category,
    quantity,
    COUNT(*) AS duplicate_count
FROM [Super store Analysis]
GROUP BY product_name, order_date, ship_date, customer_name, order_priority, category, quantity
HAVING COUNT(*) > 1;

PRINT 'REMOVING DUPLICATES FROM THE DATASET';
WITH CTE AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY product_name, order_date, ship_date, customer_name, order_priority, category, quantity
            ORDER BY product_name
        ) AS rn
    FROM [Super store Analysis]
)
DELETE FROM CTE WHERE rn > 1;

SELECT * FROM [Super store Analysis];

-- =============================================
-- SALES ANALYSIS
-- =============================================

PRINT 'SALES PRICE FOR EACH PRODUCT';
SELECT product_name, SUM(sales) AS total_sales
FROM [Super store Analysis]
GROUP BY product_name;

PRINT 'TOTAL SALES GENERATED';
SELECT SUM(sales) AS total_sales
FROM [Super store Analysis];

PRINT 'TOTAL PROFIT GENERATED';
SELECT SUM(profit) AS total_profit
FROM [Super store Analysis];

PRINT 'TOTAL SALES BY CATEGORY';
SELECT category, SUM(sales) AS total_sales
FROM [Super store Analysis]
GROUP BY category;

PRINT 'TOTAL PROFIT BY CATEGORY';
SELECT category, SUM(profit) AS total_profit
FROM [Super store Analysis]
GROUP BY category;

PRINT 'OVERALL PROFIT MARGIN';
SELECT (SUM(profit) / SUM(sales)) * 100 AS profit_margin
FROM [Super store Analysis];

PRINT 'TOP 10 HIGHEST REVENUE PRODUCTS';
SELECT TOP 10 product_name, SUM(sales) AS revenue
FROM [Super store Analysis]
GROUP BY product_name
ORDER BY revenue DESC;

PRINT 'TOP 5 HIGHEST SELLING PRODUCTS IN EACH REGION';
SELECT *
FROM (
    SELECT region, product_name, SUM(sales) AS total_sales,
        ROW_NUMBER() OVER (PARTITION BY region ORDER BY SUM(sales) DESC) AS rank_num
    FROM [Super store Analysis]
    GROUP BY region, product_name
) t
WHERE rank_num <= 5;

PRINT 'YEAR BY YEAR SALES GROWTH (2011 - 2014)';
SELECT YEAR(order_date) AS year, SUM(sales) AS total_sales
FROM [Super store Analysis]
WHERE YEAR(order_date) BETWEEN 2011 AND 2014
GROUP BY YEAR(order_date)
ORDER BY year;

PRINT 'HIGHEST SALES CATEGORY BY YEAR';
SELECT FORMAT(order_date, 'yyyy') AS year, category, SUM(sales) AS total_sales
FROM [Super store Analysis]
GROUP BY FORMAT(order_date, 'yyyy'), category
ORDER BY year;

PRINT 'TOTAL SALES BY COUNTRY';
SELECT country, SUM(sales) AS total_sales
FROM [Super store Analysis]
GROUP BY country;

-- =============================================
-- CUSTOMER ANALYSIS
-- =============================================

PRINT 'TOP 10 CUSTOMERS BY PURCHASE VALUE';
SELECT TOP 10 customer_name, SUM(sales) AS total_purchase
FROM [Super store Analysis]
GROUP BY customer_name
ORDER BY total_purchase DESC;

-- =============================================
-- SHIPPING ANALYSIS
-- =============================================

PRINT 'AVERAGE SHIPPING COST BY PRIORITY';
SELECT order_priority, AVG(shipping_cost) AS avg_shipping_cost
FROM [Super store Analysis]
GROUP BY order_priority;

PRINT 'BEST SELLING PRODUCT BY REGION';
SELECT region, product_name, SUM(sales) AS total_sales
FROM [Super store Analysis]
GROUP BY region, product_name
ORDER BY region, total_sales DESC;
