SELECT * FROM Supply_chain;

COPY supply_chain
FROM 'C:\Program Files\PostgreSQL\18\Supply chain analyst.csv'
DELIMITER ','
CSV HEADER;

--Data Exploration:
1) Numbers of rows:
SELECT COUNT(*) 
FROM supply_chain;

2) Number of Region
SELECT DISTINCT order_region
FROM supply_chain;

3) Number of Shipping mode:
SELECT DISTINCT shipping_mode
FROM supply_chain;

-- Sales Analysis
1) Top Sales by Region
SELECT order_region, SUM(Sales)
FROM supply_chain
GROUP BY order_region
ORDER BY SUM(Sales) DESC;

2) Top Sales by Category
SELECT category_name, SUM(Sales)
FROM supply_chain
GROUP BY category_name
ORDER BY SUM(Sales) DESC;

3) Top Sales by Product
SELECT product_name, SUM(Sales)
FROM supply_chain
GROUP BY product_name
ORDER BY SUM(sales) DESC;

4) Top sales by department
SELECT department_name, SUM(Sales)
FROM supply_chain
GROUP BY department_name
ORDER BY SUM(sales) DESC;


--Logitics Analysis
1) Count of delivery Status
SELECT delivery_status, COUNT(*)
FROM supply_chain
GROUP BY delivery_status;

2) Count of shipping mode
SELECT shipping_mode, COUNT(*)
FROM supply_chain
GROUP BY shipping_mode;

--Profit Analysis
1) Top Profit by region
SELECT order_region, SUM(order_profit_per_order)
FROM supply_chain
GROUP BY order_region
ORDER BY SUM(order_profit_per_order) DESC;

2) Top Profit by category
SELECT category_name, SUM(order_profit_per_order)
FROM supply_chain
GROUP BY category_name
ORDER BY SUM(order_profit_per_order) DESC;

3) Top Profit by product
SELECT product_name, SUM(order_profit_per_order)
FROM supply_chain
GROUP BY product_name
ORDER BY SUM(order_profit_per_order) DESC;

4) Top Profit by department
SELECT department_name, SUM(order_profit_per_order)
FROM supply_chain
GROUP BY department_name
ORDER BY SUM(order_profit_per_order)
DESC;


-- Customer Analysis
1) Top 10 City
SELECT customer_city,
SUM(sales)
FROM supply_chain
GROUP BY customer_city
ORDER BY SUM(sales) DESC
LIMIT 10;

-- Monthly Sale Trend
1) Highest sale by month:
SELECT 
DATE_TRUNC('month', order_date) AS month,
SUM(sales) AS total_sales
FROM supply_chain
GROUP BY month
ORDER BY month;

2) Top 5 Most Profitable Products
SELECT 
product_name,
SUM(order_profit_per_order) AS Total_Profit
FROM supply_chain
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 5;

2) Average Order Value by Region
SELECT
order_region,
AVG(sales) AS Avg_order
FROM supply_chain
GROUP BY order_region

3) Late Delivery Analysis
-- Region_wise
SELECT 
order_region,
COUNT(*) AS late_orders
FROM supply_chain
WHERE delivery_status = 'Late delivery'
GROUP BY order_region
ORDER BY late_orders DESC;

4) Customer with highest purchase:
SELECT 
customer_fname,
SUM(sales) AS total_purchase
FROM supply_chain
GROUP BY customer_fname
ORDER BY total_purchase DESC
LIMIT 10;

5) Shipping Mode Profit:
SELECT
shipping_mode,
SUM(order_Profit_per_order) AS Shipping_mode_profit
FROM supply_chain
GROUP BY shipping_mode
ORDER BY shipping_mode_profit DESC;


-- Advance Analysis:
1)Top city for each region
SELECT * FROM (
SELECT 
order_region,
customer_city,
SUM(sales) AS total_sales,
RANK() OVER(PARTITION BY order_region ORDER BY SUM(sales) DESC) AS rank
FROM supply_chain
GROUP BY order_region, customer_city
) t
WHERE rank = 1;

2) Top Product in each category
SELECT * FROM (
SELECT
product_name,
category_name,
SUM(Sales) AS total_sales,
RANK() OVER(PARTITION BY product_name ORDER BY SUM(sales) DESC) AS rank
FROM supply_chain
GROUP BY product_name, category_name
) t
WHERE rank = 1;

3) Sales Contribution by Region (%)
SELECT 
order_region,
SUM(sales) AS total_sales,
ROUND(SUM(sales) * 100.0 / SUM(SUM(sales)) OVER (),2) AS sales_percentage
FROM supply_chain
GROUP BY order_region
ORDER BY total_sales DESC;

4) Average Shipping Delay
SELECT 
AVG(days_shipping_real - days_shipping_scheduled) AS avg_delay_days
FROM supply_chain;

5) Region with Highest late Deliveries
SELECT 
order_region,
COUNT(*) AS late_orders
FROM supply_chain
WHERE delivery_status = 'Late delivery'
GROUP BY order_region
ORDER BY late_orders DESC;

6) profit margin by category
SELECT 
category_name,
SUM(order_profit_per_order) AS total_profit,
SUM(sales) AS total_sales,
ROUND((SUM(order_profit_per_order) / SUM(sales)) * 100) AS profit_margin_percent
FROM supply_chain
GROUP BY category_name
ORDER BY profit_margin_percent DESC;

7) Cities generating highesh profit
SELECT 
order_City,
SUM(order_profit_per_order) AS Total_Profit
FROM supply_chain
GROUP BY order_city
ORDER BY Total_Profit DESC;

8) Orders by Weekday
SELECT 
TO_CHAR(order_date,'Day') AS weekday,
COUNT(*) AS total_orders
FROM supply_chain
GROUP BY weekday
ORDER BY total_orders DESC;




































