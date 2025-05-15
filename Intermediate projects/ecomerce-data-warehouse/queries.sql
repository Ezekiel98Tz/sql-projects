--1. Total Sales by Product

SELECT 
    dp.product_name,
    SUM(sf.quantity_sold) AS total_units_sold,
    SUM(sf.total_amount) AS total_sales
FROM sales_fact sf
JOIN dim_products dp ON sf.product_id = dp.product_id
GROUP BY dp.product_name
ORDER BY total_sales DESC;

--2. Top 5 Customers by Total Spend

SELECT 
    dc.full_name,
    dc.email,
    SUM(sf.total_amount) AS total_spent
FROM sales_fact sf
JOIN dim_customers dc ON sf.customer_id = dc.customer_id
GROUP BY dc.customer_id
ORDER BY total_spent DESC
LIMIT 5;

--3. Sales by Country

SELECT 
    dl.country,
    SUM(sf.total_amount) AS total_sales
FROM sales_fact sf
JOIN dim_locations dl ON sf.location_id = dl.location_id
GROUP BY dl.country
ORDER BY total_sales DESC;

--4. Monthly Sales Trend (2024)

SELECT 
    dt.month,
    dt.year,
    SUM(sf.total_amount) AS monthly_sales
FROM sales_fact sf
JOIN dim_time dt ON sf.time_id = dt.time_id
WHERE dt.year = 2024
GROUP BY dt.year, dt.month
ORDER BY dt.month;

--5. Product Category Performance

SELECT 
    dp.category,
    SUM(sf.total_amount) AS category_sales
FROM sales_fact sf
JOIN dim_products dp ON sf.product_id = dp.product_id
GROUP BY dp.category
ORDER BY category_sales DESC;

