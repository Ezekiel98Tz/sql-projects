-- Users table: storing basic user info
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL, -- for security, storing hashed password
    signup_date DATE DEFAULT CURRENT_DATE,
    status ENUM('active', 'inactive', 'banned') DEFAULT 'active'
);

-- Movies table: core metadata about movies
CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    release_year YEAR,
    duration_minutes INT,
    rating_avg DECIMAL(3,2) DEFAULT NULL, -- average user rating, updated dynamically
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Genres table: separate genre list to avoid repetition
CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) UNIQUE NOT NULL
);

-- Movie Genres: many-to-many relation between movies and genres
CREATE TABLE movie_genres (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id) ON DELETE CASCADE
);

-- Watch History: tracks which user watched which movie and when
CREATE TABLE watch_history (
    watch_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    movie_id INT,
    watched_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    progress_percent INT DEFAULT 0, -- How much of the movie watched (0-100)
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE CASCADE
);

-- Ratings table: users rate movies (1 to 5 stars)
CREATE TABLE ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    movie_id INT,
    rating TINYINT CHECK (rating BETWEEN 1 AND 5),
    rated_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE CASCADE
);

-- Reviews: optional textual reviews tied to ratings
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    rating_id INT,
    review_text TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (rating_id) REFERENCES ratings(rating_id) ON DELETE CASCADE
);

-- Subscriptions: different plans users can subscribe to
CREATE TABLE subscription_plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(100) UNIQUE NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    duration_days INT NOT NULL -- length of subscription
);

-- User Subscriptions: links users to their current subscriptions
CREATE TABLE user_subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    plan_id INT,
    start_date DATE,
    end_date DATE,
    status ENUM('active', 'expired', 'cancelled') DEFAULT 'active',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (plan_id) REFERENCES subscription_plans(plan_id)
);

