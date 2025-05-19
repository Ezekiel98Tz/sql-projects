-- Airlines
INSERT INTO airlines (airline_name, country, iata_code)
VALUES 
  ('SkyJet Airways', 'USA', 'SJ'),
  ('TanzAir Express', 'Tanzania', 'TZ'),
  ('EuroWings', 'Germany', 'EW');

-- Airports
INSERT INTO airports (airport_name, city, country, iata_code)
VALUES
  ('Julius Nyerere International Airport', 'Dar es Salaam', 'Tanzania', 'DAR'),
  ('Kilimanjaro International Airport', 'Arusha', 'Tanzania', 'JRO'),
  ('Heathrow Airport', 'London', 'UK', 'LHR'),
  ('JFK International Airport', 'New York', 'USA', 'JFK'),
  ('Frankfurt Airport', 'Frankfurt', 'Germany', 'FRA');

-- Flights
INSERT INTO flights 
(airline_id, flight_number, departure_airport_id, arrival_airport_id, departure_time, arrival_time, status, base_price, capacity)
VALUES
(1, 'UA101', 1, 2, '2025-06-01 08:00:00', '2025-06-01 11:00:00', 'scheduled', 250.00, 180),
(2, 'DL205', 2, 3, '2025-06-02 14:30:00', '2025-06-02 17:15:00', 'on time', 320.00, 200),
(3, 'AA333', 3, 1, '2025-06-03 07:45:00', '2025-06-03 10:30:00', 'delayed', 280.00, 170);


-- Passengers
INSERT INTO passengers (full_name, email, phone, nationality, passport_number)
VALUES
  ('John Doe', 'john@example.com', '+255711000001', 'Tanzania', 'TZ123456'),
  ('Anna Schmidt', 'anna@domain.de', '+4915112345678', 'Germany', 'DE998877'),
  ('Grace Mushi', 'grace.mushi@mail.com', '+255762345678', 'Tanzania', 'TZ654321');

-- Bookings
INSERT INTO bookings (passenger_id, booking_reference, total_amount, status)
VALUES
  (1, 'REF12345', 450.00, 'confirmed'),
  (2, 'REF98765', 300.00, 'confirmed'),
  (3, 'REF56789', 120.00, 'confirmed');

-- Tickets
INSERT INTO tickets (booking_id, flight_id, seat_number, travel_class, ticket_price)
VALUES
  (1, 1, '12A', 'economy', 450.00),
  (2, 3, '5B', 'business', 300.00),
  (3, 2, '8C', 'economy', 120.00);

-- Payments
INSERT INTO payments (booking_id, amount_paid, payment_method, payment_status)
VALUES
  (1, 450.00, 'credit_card', 'successful'),
  (2, 300.00, 'paypal', 'successful'),
  (3, 120.00, 'mobile_money', 'successful');

-- Flight Status Logs
INSERT INTO flight_status_logs (flight_id, old_status, new_status, changed_at)
VALUES
  (1, 'scheduled', 'on time', '2025-05-18 08:00:00'),
  (2, 'on time', 'departed', '2025-05-19 12:30:00'),
  (2, 'departed', 'landed', '2025-05-19 14:05:00');
