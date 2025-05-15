--Top 5 Most Watched Movies

SELECT 
    m.title,
    COUNT(w.watch_id) AS total_views
FROM watch_history w
JOIN movies m ON w.movie_id = m.movie_id
GROUP BY w.movie_id
ORDER BY total_views DESC
LIMIT 5;

--Most Active Users by Watch Count

SELECT 
    u.username,
    COUNT(w.watch_id) AS total_watched
FROM watch_history w
JOIN users u ON w.user_id = u.user_id
GROUP BY w.user_id
ORDER BY total_watched DESC
LIMIT 5;

--Average Rating for Each Movie

SELECT 
    m.title,
    ROUND(AVG(r.rating), 2) AS avg_rating,
    COUNT(r.rating_id) AS num_ratings
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
GROUP BY r.movie_id
ORDER BY avg_rating DESC;


--Genre Popularity (Based on Total Views)

SELECT 
    g.genre_name,
    COUNT(w.watch_id) AS total_views
FROM watch_history w
JOIN movie_genres mg ON w.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
GROUP BY g.genre_id
ORDER BY total_views DESC;


--Top 3 Subscription Plans by Active Users

SELECT 
    sp.plan_name,
    COUNT(us.subscription_id) AS active_users
FROM user_subscriptions us
JOIN subscription_plans sp ON us.plan_id = sp.plan_id
WHERE us.status = 'active'
GROUP BY us.plan_id
ORDER BY active_users DESC
LIMIT 3;