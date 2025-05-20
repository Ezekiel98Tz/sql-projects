#  Flight Booking System

A realistic SQL project that simulates the backend data structures of a flight booking platform, capturing airlines, flights, passengers, bookings, payments, and airport logistics.

##  Project Structure

- `schema.sql` – Full SQL schema with all table definitions.
- `seed_data.sql` – Sample data to simulate a real-world dataset.
- `queries.sql` – Important analytical and operational queries.

##  Features

- Tracks flights operated by different airlines between airports.
- Manages bookings and payments from registered passengers.
- Supports real-time flight statuses: scheduled, delayed, cancelled, etc.
- Captures operational data like seat availability and revenue.

##  Key SQL Queries

- List all scheduled flights and routes.
- Count of passengers per flight.
- Revenue generated per airline.
- Average flight duration by airline.
- Bookings grouped by departure date.
- Available seats on each flight (calculated using bookings).

##  Tables

- `airlines`
- `airports`
- `flights`
- `passengers`
- `bookings`
- `payments`

##  Notes

- Assumes base price per flight; payments may vary.
- Designed for advanced SQL learning (joins, aggregates, filtering, real-world modeling).
