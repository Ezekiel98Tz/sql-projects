-- FACT TABLE: Sales transactions
CREATE TABLE sales_fact (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    time_id INT,
    location_id INT,
    quantity_sold INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(12,2) GENERATED ALWAYS AS (quantity_sold * unit_price) STORED,
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_products(product_id),
    FOREIGN KEY (time_id) REFERENCES dim_time(time_id),
    FOREIGN KEY (location_id) REFERENCES dim_locations(location_id)
);

-- DIMENSION TABLE: Customers
CREATE TABLE dim_customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150),
    gender ENUM('Male', 'Female', 'Other'),
    birth_date DATE,
    email VARCHAR(100) UNIQUE,
    join_date DATE
);

-- DIMENSION TABLE: Products
CREATE TABLE dim_products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(200),
    category VARCHAR(100),
    brand VARCHAR(100),
    price DECIMAL(10,2)
);

-- DIMENSION TABLE: Time
CREATE TABLE dim_time (
    time_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    day INT,
    month INT,
    quarter INT,
    year INT
);

-- DIMENSION TABLE: Locations
CREATE TABLE dim_locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(100),
    state VARCHAR(100),
    city VARCHAR(100)
);
