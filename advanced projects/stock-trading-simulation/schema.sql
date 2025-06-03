-- USERS (Traders / Investors)
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- STOCKS
CREATE TABLE Stocks (
    stock_id SERIAL PRIMARY KEY,
    ticker_symbol VARCHAR(10) UNIQUE NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    market_sector VARCHAR(50),
    current_price DECIMAL(10,2) NOT NULL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PORTFOLIOS (Each user has a virtual wallet)
CREATE TABLE Portfolios (
    portfolio_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    cash_balance DECIMAL(12,2) DEFAULT 10000.00, -- Initial virtual cash
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PORTFOLIO HOLDINGS (Stocks user currently owns)
CREATE TABLE PortfolioHoldings (
    holding_id SERIAL PRIMARY KEY,
    portfolio_id INT REFERENCES Portfolios(portfolio_id) ON DELETE CASCADE,
    stock_id INT REFERENCES Stocks(stock_id),
    quantity INT NOT NULL CHECK (quantity >= 0),
    average_price DECIMAL(10,2) NOT NULL
);

-- TRANSACTIONS (Buy / Sell Orders History)
CREATE TABLE Transactions (
    transaction_id SERIAL PRIMARY KEY,
    portfolio_id INT REFERENCES Portfolios(portfolio_id) ON DELETE CASCADE,
    stock_id INT REFERENCES Stocks(stock_id),
    transaction_type ENUM('BUY', 'SELL') NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price_per_stock DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(12,2) GENERATED ALWAYS AS (quantity * price_per_stock) STORED,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- WATCHLISTS (User is watching certain stocks)
CREATE TABLE Watchlists (
    watchlist_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    stock_id INT REFERENCES Stocks(stock_id),
    added_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, stock_id)
);
