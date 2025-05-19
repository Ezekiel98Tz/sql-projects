--1. Find available flights between two cities on a given date

SELECT 
    f.flight_number,
    f.departure_time,
    f.arrival_time,
    f.base_price,
    a1.airport_name AS departure_airport,
    a2.airport_name AS arrival_airport,
    a.airline_name AS airline
FROM flights f
JOIN airports a1 ON f.departure_airport_id = a1.airport_id
JOIN airports a2 ON f.arrival_airport_id = a2.airport_id
JOIN airlines a ON f.airline_id = a.airline_id
WHERE a1.city = 'Dar es Salaam' 
  AND a2.city = 'Nairobi'
  AND DATE(f.departure_time) = '2025-06-15'
  AND f.status = 'scheduled';


--2. Total bookings and revenue by airline (monthly trend)

SELECT 
    al.airline_name AS airline,
    DATE_FORMAT(b.booking_date, '%Y-%m') AS month,
    COUNT(*) AS total_bookings,
    SUM(b.total_amount) AS total_revenue
FROM bookings b
JOIN flights f ON b.booking_id = f.flight_id
JOIN airlines al ON f.airline_id = al.airline_id
GROUP BY al.airline_name, month
ORDER BY month;


--3. Top 5 frequent flyers (most flights booked)

SELECT 
    p.full_name,
    p.email,
    COUNT(*) AS total_flights
FROM bookings b
JOIN passengers p ON b.passenger_id = p.passenger_id
GROUP BY p.passenger_id
ORDER BY total_flights DESC
LIMIT 5;


--4. Most popular destination cities

SELECT 
    a.city AS destination_city,
    COUNT(*) AS number_of_arrivals
FROM flights f
JOIN airports a ON f.arrival_airport_id = a.airport_id
WHERE f.status = 'scheduled'
GROUP BY a.city
ORDER BY number_of_arrivals DESC
LIMIT 10;


--5. Flight delays overview

SELECT 
    f.flight_number,
    a1.city AS from_city,
    a2.city AS to_city,
    f.departure_time,
    f.arrival_time,
    f.status
FROM flights f
JOIN airports a1 ON f.departure_airport_id = a1.airport_id
JOIN airports a2 ON f.arrival_airport_id = a2.airport_id
WHERE f.status = 'delayed'
ORDER BY f.departure_time DESC;


--6. Booking cancellation rate per month

SELECT 
    DATE_FORMAT(booking_date, '%Y-%m') AS month,
    COUNT(CASE WHEN status = 'cancelled' THEN 1 END) AS cancelled,
    COUNT(*) AS total_bookings,
    ROUND(
        COUNT(CASE WHEN status = 'cancelled' THEN 1 END) / COUNT(*) * 100, 2
    ) AS cancellation_rate
FROM bookings
GROUP BY month
ORDER BY month;


--7. Seat availability per flight

SELECT 
    f.flight_number,
    a1.city AS from_city,
    a2.city AS to_city,
    f.departure_time,
    f.capacity - COUNT(b.booking_id) AS seats_available
FROM flights f
LEFT JOIN bookings b 
    ON f.flight_id = b.passenger_id AND b.status = 'confirmed'
JOIN airports a1 ON f.departure_airport_id = a1.airport_id
JOIN airports a2 ON f.arrival_airport_id = a2.airport_id
GROUP BY f.flight_id, f.flight_number, a1.city, a2.city, f.departure_time, f.capacity;
