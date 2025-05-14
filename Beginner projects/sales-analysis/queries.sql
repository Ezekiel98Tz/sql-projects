//Total Sales Amount

SELECT SUM(total_amount) AS total_sales FROM orders;

//Total Number of Customers

SELECT COUNT(*) AS total_customers FROM customers;

//Best-Selling Products

SELECT 
    p.name AS product,
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC;

//Top Customers by Total Spend

SELECT 
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

//Sales by Date

SELECT 
    order_date,
    SUM(total_amount) AS daily_sales
FROM orders
GROUP BY order_date
ORDER BY order_date;

//Revenue by Product Category

SELECT 
    p.category,
    SUM(oi.quantity * oi.price) AS category_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

