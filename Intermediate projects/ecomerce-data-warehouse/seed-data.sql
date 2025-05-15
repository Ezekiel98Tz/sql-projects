-- DIMENSION TABLE: Customers
INSERT INTO dim_customers (full_name, gender, birth_date, email, join_date)
VALUES 
('Alice Johnson', 'Female', '1990-03-12', 'alice.johnson@example.com', '2022-01-15'),
('Bob Smith', 'Male', '1985-07-23', 'bob.smith@example.com', '2021-11-03'),
('Carol Lee', 'Female', '1992-09-30', 'carol.lee@example.com', '2023-05-22');

-- DIMENSION TABLE: Products
INSERT INTO dim_products (product_name, category, brand, price)
VALUES 
('Smartphone X', 'Electronics', 'TechBrand', 699.99),
('Wireless Headphones', 'Accessories', 'SoundMax', 149.99),
('Air Fryer', 'Home Appliances', 'KitchenPro', 89.50);

-- DIMENSION TABLE: Time
INSERT INTO dim_time (date, day, month, quarter, year)
VALUES 
('2024-05-01', 1, 5, 2, 2024),
('2024-05-02', 2, 5, 2, 2024),
('2024-05-03', 3, 5, 2, 2024);

-- DIMENSION TABLE: Locations
INSERT INTO dim_locations (country, state, city)
VALUES 
('USA', 'California', 'Los Angeles'),
('Canada', 'Ontario', 'Toronto'),
('UK', 'England', 'London');

-- FACT TABLE: Sales
INSERT INTO sales_fact (customer_id, product_id, time_id, location_id, quantity_sold, unit_price)
VALUES 
(1, 1, 1, 1, 1, 699.99),
(2, 2, 2, 2, 2, 149.99),
(3, 3, 3, 3, 1, 89.50);
