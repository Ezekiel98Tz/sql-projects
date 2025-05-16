-- Seed: Account Types
INSERT INTO account_types (type_name, interest_rate) VALUES
('Savings', 3.50),
('Checking', 0.00),
('Fixed Deposit', 5.25);

-- Seed: Branches
INSERT INTO branches (branch_name, city, state) VALUES
('Central Branch', 'Dar es Salaam', 'Dar'),
('Upanga Branch', 'Dar es Salaam', 'Dar'),
('Arusha Branch', 'Arusha', 'Arusha');

-- Seed: Customers
INSERT INTO customers (full_name, email, phone_number, address) VALUES
('Alice Mwakalinga', 'alice@example.com', '+255712345678', 'Kariakoo, Dar es Salaam'),
('Bob Kimaro', 'bob@example.com', '+255713456789', 'Sakina, Arusha'),
('Chloe Msafiri', 'chloe@example.com', '+255714567890', 'Sinza, Dar es Salaam');

-- Seed: Employees
INSERT INTO employees (full_name, position, branch_id, hire_date) VALUES
('James Mwita', 'Branch Manager', 1, '2020-06-15'),
('Mariam Kweka', 'Teller', 2, '2021-03-01'),
('Thomas Mkapa', 'Customer Service', 3, '2022-01-20');

-- Seed: Accounts
INSERT INTO accounts (customer_id, type_id, balance, opened_date, status) VALUES
(1, 1, 2000000.00, '2023-05-01', 'active'),
(2, 2, 500000.00, '2023-06-10', 'active'),
(3, 1, 750000.00, '2023-07-20', 'active');

-- Seed: Transactions
INSERT INTO transactions (account_id, transaction_type, amount, note) VALUES
(1, 'deposit', 1000000.00, 'Initial deposit'),
(2, 'deposit', 500000.00, 'Opening balance'),
(1, 'withdrawal', 100000.00, 'ATM withdrawal'),
(3, 'deposit', 750000.00, 'Mobile banking deposit'),
(1, 'transfer', 150000.00, 'Sent to Bob');

-- Seed: Cards
INSERT INTO cards (account_id, card_number, card_type, expiration_date, status) VALUES
(1, '4578123412345678', 'debit', '2027-12-31', 'active'),
(2, '4212345678901234', 'debit', '2026-10-31', 'active'),
(3, '4111111111111111', 'credit', '2025-09-30', 'active');

-- Seed: Loan Applications
INSERT INTO loan_applications (customer_id, loan_amount, status) VALUES
(1, 3000000.00, 'pending'),
(2, 1500000.00, 'approved'),
(3, 1000000.00, 'rejected');
