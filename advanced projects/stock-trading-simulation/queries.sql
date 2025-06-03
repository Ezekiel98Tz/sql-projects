
--1. Show each user’s portfolio summary (cash + holdings value)

SELECT 
    u.full_name,
    p.cash_balance,
    COALESCE(SUM(ph.quantity * s.current_price), 0) AS holdings_value,
    (p.cash_balance + COALESCE(SUM(ph.quantity * s.current_price), 0)) AS total_portfolio_value
FROM Users u
JOIN Portfolios p ON u.user_id = p.user_id
LEFT JOIN PortfolioHoldings ph ON p.portfolio_id = ph.portfolio_id
LEFT JOIN Stocks s ON ph.stock_id = s.stock_id
GROUP BY u.user_id, p.cash_balance;

--2. Top 3 most actively traded stocks (by transaction count)

SELECT 
    s.ticker_symbol,
    s.company_name,
    COUNT(t.transaction_id) AS total_trades
FROM Transactions t
JOIN Stocks s ON t.stock_id = s.stock_id
GROUP BY s.stock_id
ORDER BY total_trades DESC
LIMIT 3;

--3. Detailed trade history for a user (e.g., Ezekiel)

SELECT 
    u.full_name,
    s.ticker_symbol,
    t.transaction_type,
    t.quantity,
    t.price_per_stock,
    t.total_amount,
    t.transaction_date
FROM Transactions t
JOIN Portfolios p ON t.portfolio_id = p.portfolio_id
JOIN Users u ON p.user_id = u.user_id
JOIN Stocks s ON t.stock_id = s.stock_id
WHERE u.full_name = 'Ezekiel K.'
ORDER BY t.transaction_date DESC;

--4. Real-time unrealized profit/loss per holding

SELECT 
    u.full_name,
    s.ticker_symbol,
    ph.quantity,
    ph.average_price,
    s.current_price,
    ROUND((s.current_price - ph.average_price) * ph.quantity, 2) AS unrealized_profit_loss
FROM PortfolioHoldings ph
JOIN Portfolios p ON ph.portfolio_id = p.portfolio_id
JOIN Users u ON p.user_id = u.user_id
JOIN Stocks s ON ph.stock_id = s.stock_id;

--5. Users who watch a stock but haven’t bought it

SELECT 
    u.full_name,
    s.ticker_symbol,
    s.company_name
FROM Watchlists w
JOIN Users u ON w.user_id = u.user_id
JOIN Stocks s ON w.stock_id = s.stock_id
WHERE NOT EXISTS (
    SELECT 1
    FROM PortfolioHoldings ph
    JOIN Portfolios p ON ph.portfolio_id = p.portfolio_id
    WHERE p.user_id = u.user_id AND ph.stock_id = s.stock_id
);

--6.Total buy vs sell volume per stock

SELECT 
    s.ticker_symbol,
    SUM(CASE WHEN t.transaction_type = 'BUY' THEN t.quantity ELSE 0 END) AS total_bought,
    SUM(CASE WHEN t.transaction_type = 'SELL' THEN t.quantity ELSE 0 END) AS total_sold
FROM Transactions t
JOIN Stocks s ON t.stock_id = s.stock_id
GROUP BY s.stock_id;