# Supply Chain Analysis (SQL + Power BI)

Analyzed sales, profit, shipping, and late deliveries for a supply chain dataset (2015 to 2017). SQL (PostgreSQL) was used for the analysis, and Power BI for the dashboard.

## Dashboard (2 pages)

![Sales and Logistics](1_sales_logistics.png)
![Profitability](2_profitability.png)

## What I did
- SQL (PostgreSQL): analyzed sales and profit by region, category, product, department, and city, plus late-delivery counts and average shipping delay, using GROUP BY aggregations, date functions, and window functions (RANK OVER, SUM OVER for sales contribution %)
- Power BI: built a 2-page dashboard (Sales & Logistics, Profitability) with KPIs, slicers (Region, Category, Shipping Mode), and DAX measures for profit margin % and average profit per order

## Key findings
- Total sales of 37M and profit of 4M from 66K orders (10.78% profit margin, average profit per order of 60.34)
- Standard Class shipping drives about 60% of sales and profit
- Caguas alone contributes about 14M in sales (roughly 38% of total) and 1.5M in profit
- Western Europe and Central America are the top regions (5.9M and 5.7M in sales)
- Sales and profit were stable from 2015 to 2017; 2018 is excluded because only 33K of sales data is available for that year

## Data
The analysis uses a public supply chain dataset, included in this repository as a CSV file. The SQL file loads it into a PostgreSQL table named `supply_chain`.

## Files
- `supply_chain_analysis.sql`: SQL queries
- `Supply_chain_analysis.pbix`: Power BI file
- `1_sales_logistics.png`, `2_profitability.png`: dashboard pages
- Raw dataset (CSV)

## Tools
PostgreSQL, SQL, Power BI, DAX
