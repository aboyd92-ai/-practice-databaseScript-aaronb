-- Premier Events --

CREATE DATABASE IF NOT EXISTS premier_events_db;
USE premier_events_db;

START TRANSACTION;

-- drop tables (child first)
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS venues;

-- venues
CREATE TABLE venues (
    venue_id INT AUTO_INCREMENT PRIMARY KEY,
    venue_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    max_capacity INT NOT NULL
);

-- customers
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100)
);

-- events (each event happens at one venue)
CREATE TABLE events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    venue_id INT NOT NULL,
    event_name VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,

    FOREIGN KEY (venue_id) REFERENCES venues(venue_id)
);

-- tickets (ticket purchases for an event)
CREATE TABLE tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    customer_id INT NOT NULL,
    ticket_price DECIMAL(10,2) NOT NULL,
    purchase_date DATETIME NOT NULL,

    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- sample data
INSERT INTO venues (venue_name, city, max_capacity)
VALUES
('Gateway Center', 'St. Louis', 5000),
('Riverfront Hall', 'St. Louis', 1200);

INSERT INTO customers (first_name, last_name, email)
VALUES
('Aaron', 'Boyd', 'aaron@example.com'),
('Shobi', 'C', 'shobi@example.com');

INSERT INTO events (venue_id, event_name, event_date)
VALUES
(1, 'Tech Conference', '2026-04-10'),
(2, 'Wedding Expo', '2026-05-01');

INSERT INTO tickets (event_id, customer_id, ticket_price, purchase_date)
VALUES
(1, 1, 75.00, '2026-02-21 20:30:00'),
(1, 2, 75.00, '2026-02-21 20:35:00'),
(2, 1, 20.00, '2026-02-22 09:15:00');

COMMIT;