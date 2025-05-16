-- Customers: stores client details
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Account Types: defines account categories (e.g., savings, current)
CREATE TABLE account_types (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) UNIQUE NOT NULL,  -- e.g., 'savings', 'checking'
    interest_rate DECIMAL(5,2) DEFAULT 0.00
);

-- Accounts: links customers to specific bank accounts
CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    type_id INT,
    balance DECIMAL(15,2) DEFAULT 0.00,
    opened_date DATE DEFAULT CURRENT_DATE,
    status ENUM('active', 'closed', 'suspended') DEFAULT 'active',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (type_id) REFERENCES account_types(type_id)
);

-- Branches: bank branches info
CREATE TABLE branches (
    branch_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100)
);

-- Employees: employees working at branches
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150),
    position VARCHAR(100),
    branch_id INT,
    hire_date DATE,
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

-- Transactions: records deposits, withdrawals, transfers
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    transaction_type ENUM('deposit', 'withdrawal', 'transfer') NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    note TEXT,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- Cards: debit or credit cards linked to accounts
CREATE TABLE cards (
    card_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    card_number VARCHAR(16) UNIQUE NOT NULL,
    card_type ENUM('debit', 'credit') NOT NULL,
    expiration_date DATE,
    status ENUM('active', 'blocked', 'expired') DEFAULT 'active',
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- Loan Applications: optional feature
CREATE TABLE loan_applications (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    loan_amount DECIMAL(15,2),
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    application_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
