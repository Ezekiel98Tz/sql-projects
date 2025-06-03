-- USERS
INSERT INTO Users (full_name, email, password_hash)
VALUES 
('Ezekiel K.', 'ezekiel@demo.com', 'hashedpassword123'),
('Alice Trader', 'alice@example.com', 'securehash456'),
('Bob Investor', 'bob@example.com', 'hashme789');

-- STOCKS
INSERT INTO Stocks (ticker_symbol, company_name, market_sector, current_price)
VALUES
('AAPL', 'Apple Inc.', 'Technology', 192.32),
('TSLA', 'Tesla Inc.', 'Automotive', 172.45),
('AMZN', 'Amazon.com Inc.', 'E-commerce', 127.88),
('GOOGL', 'Alphabet Inc.', 'Technology', 148.12),
('MSFT', 'Microsoft Corp.', 'Technology', 318.75);

-- PORTFOLIOS
INSERT INTO Portfolios (user_id, cash_balance)
VALUES
(1, 8000.00),
(2, 9500.00),
(3, 10200.00);

-- PORTFOLIO HOLDINGS
INSERT INTO PortfolioHoldings (portfolio_id, stock_id, quantity, average_price)
VALUES
(1, 1, 10, 180.00),  -- Ezekiel owns 10 AAPL
(1, 2, 5, 160.00),   -- Ezekiel owns 5 TSLA
(2, 3, 15, 120.00),  -- Alice owns 15 AMZN
(3, 5, 20, 300.00);  -- Bob owns 20 MSFT

-- TRANSACTIONS
INSERT INTO Transactions (portfolio_id, stock_id, transaction_type, quantity, price_per_stock)
VALUES
(1, 1, 'BUY', 10, 180.00),
(1, 2, 'BUY', 5, 160.00),
(2, 3, 'BUY', 15, 120.00),
(3, 5, 'BUY', 20, 300.00),
(2, 3, 'SELL', 5, 130.00),
(1, 2, 'SELL', 2, 170.00);

-- WATCHLISTS
INSERT INTO Watchlists (user_id, stock_id)
VALUES
(1, 3),  -- Ezekiel watching AMZN
(1, 5),  -- Ezekiel watching MSFT
(2, 1),  -- Alice watching AAPL
(3, 2);  -- Bob watching TSLA
