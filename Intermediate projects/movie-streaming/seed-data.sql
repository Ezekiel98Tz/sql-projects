-- ================================================
-- SEEDING DATA: IMPORTANT NOTES
-- ================================================
-- ⚠️ Order matters due to FOREIGN KEY constraints.
-- Always insert data into independent tables first
-- before inserting into dependent tables.
--
-- ✅ Recommended Insert Order:
-- 1. users
-- 2. movies
-- 3. genres
-- 4. subscription_plans
-- 5. movie_genres
-- 6. ratings
-- 7. watch_history
-- 8. user_subscriptions
-- 9. reviews
--
-- 💡 Tip: If you run into foreign key errors,
-- try inserting table data one section at a time.
-- ================================================



-- Optional: Clear tables in correct order to avoid foreign key errors
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS user_subscriptions;
DROP TABLE IF EXISTS subscription_plans;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS watch_history;
DROP TABLE IF EXISTS movie_genres;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS users;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- USERS
-- ----------------------------
INSERT INTO users (username, email, password_hash, signup_date, status) VALUES
('alice123', 'alice@example.com', 'hashed_pass_1', '2023-01-10', 'active'),
('bob456', 'bob@example.com', 'hashed_pass_2', '2023-02-15', 'active'),
('charlie789', 'charlie@example.com', 'hashed_pass_3', '2023-03-05', 'inactive');

-- ----------------------------
-- MOVIES
-- ----------------------------
INSERT INTO movies (title, description, release_year, duration_minutes, rating_avg) VALUES
('The Matrix', 'A hacker discovers reality is a simulation.', 1999, 136, 4.7),
('Inception', 'A thief steals information through dreams.', 2010, 148, 4.6),
('Interstellar', 'Explorers travel through a wormhole in space.', 2014, 169, 4.8);

-- ----------------------------
-- GENRES
-- ----------------------------
INSERT INTO genres (genre_name) VALUES
('Sci-Fi'),
('Action'),
('Drama');

-- ----------------------------
-- MOVIE-GENRES (many-to-many)
-- ----------------------------
INSERT INTO movie_genres (movie_id, genre_id) VALUES
(1, 1), -- Matrix - Sci-Fi
(1, 2), -- Matrix - Action
(2, 1), -- Inception - Sci-Fi
(2, 2), -- Inception - Action
(3, 1), -- Interstellar - Sci-Fi
(3, 3); -- Interstellar - Drama

-- ----------------------------
-- WATCH HISTORY
-- ----------------------------
INSERT INTO watch_history (user_id, movie_id, watched_on, progress_percent) VALUES
(1, 1, '2024-01-01 12:00:00', 100),
(2, 2, '2024-01-03 15:30:00', 90),
(3, 3, '2024-01-05 20:00:00', 70);

-- ----------------------------
-- RATINGS
-- ----------------------------
INSERT INTO ratings (user_id, movie_id, rating, rated_on) VALUES
(1, 1, 5, '2024-01-01 13:00:00'),
(2, 2, 4, '2024-01-03 16:00:00'),
(3, 3, 5, '2024-01-05 21:00:00');

-- ----------------------------
-- REVIEWS (tied to ratings)
-- ----------------------------
INSERT INTO reviews (rating_id, review_text) VALUES
(1, 'Mind-blowing! Loved the concept.'),
(2, 'Great movie, a bit complex.'),
(3, 'Emotional and beautiful story.');

-- ----------------------------
-- SUBSCRIPTION PLANS
-- ----------------------------
INSERT INTO subscription_plans (plan_name, price, duration_days) VALUES
('Basic Plan', 9.99, 30),
('Premium Plan', 19.99, 30),
('Annual Plan', 99.99, 365);

-- ----------------------------
-- USER SUBSCRIPTIONS
-- ----------------------------
INSERT INTO user_subscriptions (user_id, plan_id, start_date, end_date, status) VALUES
(1, 2, '2024-01-01', '2024-01-31', 'active'),
(2, 1, '2024-02-01', '2024-03-02', 'expired'),
(3, 3, '2023-12-01', '2024-11-30', 'active');


