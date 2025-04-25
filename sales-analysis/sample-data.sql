-- Insert sample products
INSERT INTO products (name, category, price) VALUES
('Laptop', 'Electronics', 1200.00),
('Smartphone', 'Electronics', 800.00),
('Desk Chair', 'Furniture', 150.00),
('Notebook', 'Stationery', 3.00),
('Pen', 'Stationery', 1.50);

-- Insert sample customers
INSERT INTO customers (first_name, last_name, email, join_date) VALUES
('Alice', 'Johnson', 'alice@example.com', '2023-01-15'),
('Bob', 'Smith', 'bob@example.com', '2023-02-10'),
('Carol', 'Williams', 'carol@example.com', '2023-03-05');

-- Insert sample orders
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2023-03-01', 1203.00),
(2, '2023-03-02', 801.50),
(3, '2023-03-10', 154.50),
(1, '2023-03-15', 4.50);

-- Insert sample order items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1200.00),  -- Laptop
(1, 4, 1, 3.00),     -- Notebook
(2, 2, 1, 800.00),   -- Smartphone
(2, 5, 1, 1.50),     -- Pen
(3, 3, 1, 150.00),   -- Desk Chair
(3, 5, 3, 1.50),     -- 3 Pens
(4, 5, 3, 1.50);     -- 3 Pens again
