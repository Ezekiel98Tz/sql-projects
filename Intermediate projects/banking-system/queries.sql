--1. List All Active Customers and Their Account Balances

SELECT 
    c.customer_id,
    c.full_name,
    a.account_id,
    at.type_name AS account_type,
    a.balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN account_types at ON a.type_id = at.type_id
WHERE a.status = 'active';


 --2. Transaction History for a Specific Account

SELECT 
    t.transaction_id,
    t.transaction_type,
    t.amount,
    t.note,
    t.transaction_date
FROM transactions t
WHERE t.account_id = 1
ORDER BY t.transaction_date DESC;


--3. Total Deposits and Withdrawals Per Customer
--“Go through each transaction. If it's a deposit, take the amount. Otherwise, take 0. Then, sum up all of those values.”--

SELECT 
    c.full_name,
    SUM(CASE WHEN t.transaction_type = 'deposit' THEN t.amount ELSE 0 END) AS total_deposits,
    SUM(CASE WHEN t.transaction_type = 'withdrawal' THEN t.amount ELSE 0 END) AS total_withdrawals
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id;


--4. Loan Application Summary

SELECT 
    c.full_name,
    l.loan_amount,
    l.status,
    l.application_date
FROM loan_applications l
JOIN customers c ON l.customer_id = c.customer_id;


--5. Branch-wise Employee Count

SELECT 
    b.branch_name,
    COUNT(e.employee_id) AS employee_count
FROM branches b
LEFT JOIN employees e ON b.branch_id = e.branch_id
GROUP BY b.branch_id;


--6. List of All Cards Expiring Within the Next 6 Months

SELECT 
    c.card_id,
    c.card_number,
    c.card_type,
    c.expiration_date,
    cust.full_name
FROM cards c
JOIN accounts a ON c.account_id = a.account_id
JOIN customers cust ON a.customer_id = cust.customer_id
WHERE c.expiration_date <= DATE_ADD(CURDATE(), INTERVAL 6 MONTH);