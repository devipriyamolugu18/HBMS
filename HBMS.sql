-- project on hotel booking management system
-- tables 
-- Customers -- Stores guest information.
-- Hotels -- Stores hotel details.
-- Room types -- Defines types of rooms.
-- Rooms -- Stores individual room details.
-- Bookings -- Tracks booking information.
-- Booking rooms -- Handles multiple rooms per booking.
-- Payments -- Stores payment details.
-- Staff -- Hotel staff information.
-- Services -- Extra services offered by hotel.
-- Booking services -- Services used during a booking.
  
  create database HBMS;
  use HBMS;
  
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    id_proof VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Customers 
(customer_id, customer_name, email, phone, id_proof, created_at)
VALUES
(1, "Arun Kumar", "arun.kumar11@gmail.com", "9876543210", "Aadhar", CURRENT_TIMESTAMP),
(2, "Priya Sharma", "priya.sharma11@gmail.com", "9898765432", "PAN", CURRENT_TIMESTAMP),
(3, "Ravi Teja", "ravi.teja11@gmail.com", "9123456780", "Aadhar", CURRENT_TIMESTAMP),
(4, "Sneha Reddy", "sneha.reddy11@gmail.com", "9988776655", "Passport", CURRENT_TIMESTAMP),
(5, "Vikram Singh", "vikram.singh11@gmail.com", "9876501234", "Driving License", CURRENT_TIMESTAMP),
(6, "Anita Verma", "anita.verma11@gmail.com", "9797979797", "PAN", CURRENT_TIMESTAMP),
(7, "Suresh Babu", "suresh.babu11@gmail.com", "9012345678", "Aadhar", CURRENT_TIMESTAMP),
(8, "Neha Gupta", "neha.gupta11@gmail.com", "9090909090", "Passport", CURRENT_TIMESTAMP),
(9, "Karthik Raja", "karthik.raja11@gmail.com", "9845612345", "Driving License", CURRENT_TIMESTAMP),
(10, "Pooja Mehta", "pooja.mehta11@gmail.com", "9888123456", "PAN", CURRENT_TIMESTAMP),
(11, "Rahul Das", "rahul.das11@gmail.com", "9001234567", "Aadhar", CURRENT_TIMESTAMP),
(12, "Divya Nair", "divya.nair11@gmail.com", "9023456789", "passport", CURRENT_TIMESTAMP),
(13, "Manoj Patel", "manoj.patel11@gmail.com", "9876012345", "PAN", CURRENT_TIMESTAMP),
(14, "Aishwarya Iyer", "aishwarya.iyer11@gmail.com", "9944556677", "Aadhar", CURRENT_TIMESTAMP),
(15, "Nitin Joshi", "nitin.joshi11@gmail.com", "9567890123", "Driving License", CURRENT_TIMESTAMP),
(16, "Keerthi Mohan", "keerthi.mohan11@gmail.com", "9877766554", "Passport", CURRENT_TIMESTAMP),
(17, "Amit Choudhary", "amit.choudhary11@gmail.com", "9998887776", "PAN", CURRENT_TIMESTAMP),
(18, "Swathi Rao", "swathi.rao11@gmail.com", "9112233445", "Aadhar", CURRENT_TIMESTAMP),
(19, "Deepak Malhotra", "deepak.malhotra11@gmail.com", "9887766554", "Driving License", CURRENT_TIMESTAMP),
(20, "Lavanya Krishnan", "lavanya.krishnan11@gmail.com", "9009988776", "Passport", CURRENT_TIMESTAMP),
(21, "Rohit Agarwal", "rohit.agarwal11@gmail.com", "9877332211", "PAN", CURRENT_TIMESTAMP),
(22, "Meena Kumari", "meena.kumari11@gmail.com", "9123987654", "Aadhar", CURRENT_TIMESTAMP),
(23, "Sanjay Mishra", "sanjay.mishra11@gmail.com", "9011223344", "Driving License", CURRENT_TIMESTAMP),
(24, "Bhavya Jain", "bhavya.jain11@gmail.com", "9888997766", "Passport", CURRENT_TIMESTAMP),
(25, "Harish Venkatesh", "harish.venkatesh11@gmail.com", "9345678123", "Aadhar", CURRENT_TIMESTAMP);


CREATE TABLE Hotels (
    hotel_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    rating DECIMAL(2,1),
    total_rooms INT
);

INSERT INTO Hotels (hotel_name, location, rating, total_rooms) VALUES
("Taj Coromandel", "Chennai", 4.8, 200),
("ITC Grand Chola", "Chennai", 4.7, 600),
("The Leela Palace", "Bengaluru", 4.9, 300),
("Oberoi Udaivilas", "Udaipur", 5.0, 90),
("Taj Mahal Palace", "Mumbai", 4.9, 285),
("ITC Maurya", "Delhi", 4.7, 438),
("Hyatt Regency", "Delhi", 4.6, 500),
("Radisson Blu", "Hyderabad", 4.5, 220),
("Novotel", "Pune", 4.4, 250),
("Marriott", "Goa", 4.8, 280);

CREATE TABLE Room_types (
    room_type_id INT PRIMARY KEY AUTO_INCREMENT,
    room_type_name VARCHAR(100),
    description TEXT,
    price_per_night DECIMAL(10,2)
);
INSERT INTO Room_types (room_type_name, description, price_per_night) VALUES
("Standard", "Basic room with essential amenities", 3000),
("Deluxe", "Spacious room with city view", 4500),
("Executive", "Premium room with work space", 6000),
("Suite", "Luxury suite with living area", 9000),
("Presidential Suite", "Ultra luxury suite", 15000),
("Single", "Single bed room", 2500),
("Double", "Double bed room", 4000),
("Twin", "Two single beds", 4200),
("Family", "Family-friendly room", 7000),
("Villa", "Private villa accommodation", 12000);


CREATE TABLE Rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_id INT,
    room_type_id INT,
    room_number VARCHAR(20),
    status VARCHAR(50) DEFAULT 'Available',
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id),
    FOREIGN KEY (room_type_id) REFERENCES Room_types(room_type_id)
);

INSERT INTO Rooms (hotel_id, room_type_id, room_number, status) VALUES
(1, 1, "101", "Available"),
(1, 2, "102", "Available"),
(2, 3, "201", "Occupied"),
(2, 4, "202", "Available"),
(3, 2, "301", "Available"),
(4, 5, "401", "Occupied"),
(5, 4, "501", "Available"),
(6, 1, "601", "Available"),
(7, 3, "701", "Occupied"),
(8, 2, "801", "Available");

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    hotel_id INT,
    check_in DATE,
    check_out DATE,
    booking_status VARCHAR(50),
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)
);

INSERT INTO Bookings (customer_id, hotel_id, check_in, check_out, booking_status) VALUES
(1, 1, "2026-01-10", "2026-01-12", "Confirmed"),
(2, 2, "2026-01-15", "2026-01-18", "Confirmed"),
(3, 3, "2026-01-20", "2026-01-22", "Cancelled"),
(4, 4, "2026-02-01", "2026-02-05", "Confirmed"),
(5, 5, "2026-02-10", "2026-02-12", "Completed"),
(6, 6, "2026-02-15", "2026-02-17", "Confirmed"),
(7, 7, "2026-03-01", "2026-03-03", "Completed");

CREATE TABLE Booking_rooms (
    booking_room_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    room_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

INSERT INTO Booking_rooms (booking_id, room_id, price) VALUES
(1, 1, 3000),
(2, 2, 4500),
(3, 3, 6000),
(4, 4, 9000),
(5, 5, 4500),
(6, 6, 15000),
(7, 7, 9000);


CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

INSERT INTO Payments (booking_id, amount, payment_method, payment_status) VALUES
(1, 6000, "Card", "Paid"),
(2, 13500, "UPI", "Pending"),
(3, 6000, "Card", "Refunded"),
(4, 36000, "Net Banking", "Paid"),
(5, 9000, "Cash", "Paid"),
(6, 12000, "UPI", "Pending"),
(7, 6000, "Card", "Paid");


CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_id INT,
    staff_name VARCHAR(50),
    role VARCHAR(50),
    phone VARCHAR(15),
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)
);

INSERT INTO Staff (hotel_id, staff_name, role, phone) VALUES
(1, "Ramesh", "Manager", "9000011111"),
(2, "Suresh", "Receptionist", "9000011112"),
(3, "Anita", "Housekeeping", "9000011113"),
(4, "Vikram", "Chef", "9000011114"),
(5, "Neha", "HR", "9000011115"),
(6, "Arjun", "Security", "9000011116"),
(7, "Kiran", "Front Desk", "9000011117"),
(8, "Pooja", "Cleaner", "9000011118"),
(9, "Rahul", "Manager", "9000011119"),
(10, "Meena", "Receptionist", "9000011120");

CREATE TABLE Services (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    service_name VARCHAR(100),
    service_price DECIMAL(10,2)
);


INSERT INTO Services (service_name, service_price) VALUES
("Room Cleaning", 500),
("Laundry", 300),
("Spa", 2000),
("Airport Pickup", 1500),
("Breakfast", 800),
("Gym Access", 400),
("Swimming Pool", 600),
("WiFi", 200),
("Mini Bar", 1000),
("Tour Guide", 2500);

CREATE TABLE Booking_services (
    booking_service_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    service_id INT,
    quantity INT,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

INSERT INTO Booking_services (booking_id, service_id, quantity) VALUES
(1, 1, 1),
(2, 5, 2),
(3, 2, 1),
(4, 3, 1),
(5, 4, 1),
(6, 6, 2),
(7, 7, 1);


------------------
-- Queries
------------------
use hbms;
--  Find all customers

SELECT * FROM Customers;

--  Find all hotels with rating above 4.5

SELECT hotel_name, location, rating
FROM Hotels
WHERE rating > 4.5;

--  Find all available rooms

SELECT * 
FROM Rooms
WHERE status = "Available";

--  Show all room types with price per night

SELECT room_type_name, price_per_night
FROM Room_types;

--  JOIN QUERIES
-- Customers with their bookings

SELECT c.customer_name, b.booking_id, b.booking_status
FROM Customers c
JOIN Bookings b ON c.customer_id = b.customer_id;

--  Booking details with hotel name

SELECT b.booking_id, h.hotel_name, b.check_in, b.check_out
FROM Bookings b
JOIN Hotels h ON b.hotel_id = h.hotel_id;

--  Rooms with room type and hotel

SELECT r.room_number, rt.room_type_name, h.hotel_name
FROM Rooms r
JOIN Room_types rt ON r.room_type_id = rt.room_type_id
JOIN Hotels h ON r.hotel_id = h.hotel_id;

--  Payments with customer name

SELECT c.customer_name, p.amount, p.payment_status
FROM Payments p
JOIN Bookings b ON p.booking_id = b.booking_id
JOIN Customers c ON b.customer_id = c.customer_id;

-- AGGREGATE QUERIES
-- Total bookings per hotel

SELECT h.hotel_name, COUNT(b.booking_id) AS total_bookings
FROM Hotels h
LEFT JOIN Bookings b ON h.hotel_id = b.hotel_id
GROUP BY h.hotel_name;

-- Total revenue from payments

SELECT SUM(amount) AS total_revenue
FROM Payments
WHERE payment_status = "Paid";

--  Average room price by room type

SELECT room_type_name, AVG(price_per_night) AS avg_price
FROM Room_types
GROUP BY room_type_name;

-- FILTER & DATE QUERIES
--  Bookings made in 2026

SELECT *
FROM Bookings
WHERE YEAR(check_in) = 2026;

-- Customers who booked hotels in Chennai

SELECT DISTINCT c.customer_name
FROM Customers c
JOIN Bookings b ON c.customer_id = b.customer_id
JOIN Hotels h ON b.hotel_id = h.hotel_id
WHERE h.location = "Chennai";

--  SUBQUERIES
-- Customers who made more than 1 booking

SELECT customer_id, COUNT(*) AS booking_count
FROM Bookings
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Most expensive room type

SELECT room_type_name, price_per_night
FROM Room_types
WHERE price_per_night = (SELECT MAX(price_per_night) FROM Room_types);

-- ADVANCED QUERIES
-- Hotel occupancy (occupied rooms count)

SELECT h.hotel_name, COUNT(r.room_id) AS occupied_rooms
FROM Hotels h
JOIN Rooms r ON h.hotel_id = r.hotel_id
WHERE r.status = "Occupied"
GROUP BY h.hotel_name;

-- Total amount paid per booking

SELECT booking_id, SUM(amount) AS total_paid
FROM Payments
GROUP BY booking_id;

-- Services used per booking

SELECT b.booking_id, s.service_name, bs.quantity
FROM Booking_services bs
JOIN Services s ON bs.service_id = s.service_id
JOIN Bookings b ON bs.booking_id = b.booking_id;

-- Customers who never made a booking

SELECT c.customer_name
FROM Customers c
LEFT JOIN Bookings b ON c.customer_id = b.customer_id
WHERE b.booking_id IS NULL;

-- Highest paying customer

SELECT c.customer_name, SUM(p.amount) AS total_spent
FROM Customers c
JOIN Bookings b ON c.customer_id = b.customer_id
JOIN Payments p ON b.booking_id = p.booking_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 1;


-- Rank hotels by rating (highest first)

SELECT hotel_name, location, rating,
       RANK() OVER (ORDER BY rating DESC) AS rating_rank
FROM Hotels;

-- Row number of bookings per customer (booking history)

SELECT customer_id, booking_id, booking_date,
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY booking_date) AS booking_no
FROM Bookings;

--  Total amount paid per booking (window SUM)

SELECT booking_id, amount,
       SUM(amount) OVER (PARTITION BY booking_id) AS total_paid
FROM Payments;

-- Running revenue (cumulative revenue over time)

SELECT payment_date, amount,
       SUM(amount) OVER (ORDER BY payment_date) AS running_revenue
FROM Payments
WHERE payment_status = 'Paid';

-- Average room price vs each room price

SELECT room_type_name, price_per_night,
       AVG(price_per_night) OVER () AS avg_price
FROM Room_types;

-- Highest spending customer

SELECT customer_name, total_spent
FROM (
    SELECT c.customer_name,
           SUM(p.amount) AS total_spent,
           DENSE_RANK() OVER (ORDER BY SUM(p.amount) DESC) AS rnk
    FROM Customers c
    JOIN Bookings b ON c.customer_id = b.customer_id
    JOIN Payments p ON b.booking_id = p.booking_id
    GROUP BY c.customer_name
) total
WHERE rnk = 1;

-- Occupied vs available rooms per hotel

SELECT h.hotel_name,
       COUNT(*) OVER (PARTITION BY h.hotel_id) AS total_rooms,
       SUM(CASE WHEN r.status="Occupied" THEN 1 ELSE 0 END)
           OVER (PARTITION BY h.hotel_id) AS occupied_rooms
FROM Hotels h
JOIN Rooms r ON h.hotel_id = r.hotel_id;

-- VIEWS
-- View: Booking full details

CREATE VIEW vw_booking_details AS
SELECT b.booking_id, c.customer_name, h.hotel_name,
       b.check_in, b.check_out, b.booking_status
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Hotels h ON b.hotel_id = h.hotel_id;


-- Usage:

SELECT * FROM vw_booking_details;

--  View: Payment summary

CREATE VIEW vw_payment_summary AS
SELECT b.booking_id, SUM(p.amount) AS total_amount
FROM Bookings b
JOIN Payments p ON b.booking_id = p.booking_id
GROUP BY b.booking_id;

use hbms

--  Calculate total bill for a booking
DELIMITER //

CREATE PROCEDURE GetBookingTotal(IN b_id INT)
BEGIN
    SELECT SUM(amount) AS total_bill
    FROM Payments
    WHERE booking_id = b_id;
END //

DELIMITER ;

--  Add a new booking

DELIMITER //

CREATE PROCEDURE AddBooking(
    IN cust_id INT,
    IN hotel_id INT,
    IN cin DATE,
    IN cout DATE
)
BEGIN
    INSERT INTO Bookings(customer_id, hotel_id, check_in, check_out, booking_status)
    VALUES (cust_id, hotel_id, cin, cout, "Confirmed");
END //

DELIMITER ;

-- TRIGGERS
--  Mark room as Occupied after booking

DELIMITER //

CREATE TRIGGER trg_room_occupied
AFTER INSERT ON Booking_rooms
FOR EACH ROW
BEGIN
    UPDATE Rooms
    SET status = "Occupied"
    WHERE room_id = NEW.room_id;
END //

DELIMITER ;

-- Auto-cancel booking if payment fails

DELIMITER $$

CREATE TRIGGER trg_payment_failed
AFTER INSERT ON Payments
FOR EACH ROW
BEGIN
    IF NEW.payment_status = "Failed" THEN
        UPDATE Bookings
        SET booking_status = "Cancelled"
        WHERE booking_id = NEW.booking_id;
    END IF;
END $$

DELIMITER ;


--  Find customers who stayed more than once

SELECT customer_id, COUNT(*) AS stay_count
FROM Bookings
GROUP BY customer_id
HAVING COUNT(*) > 1;

--  Find hotels with no bookings

SELECT h.hotel_name
FROM Hotels h
LEFT JOIN Bookings b ON h.hotel_id = b.hotel_id
WHERE b.booking_id IS NULL;


--  Most popular service

SELECT s.service_name, SUM(bs.quantity) AS usage_count
FROM Booking_services bs
JOIN Services s ON bs.service_id = s.service_id
GROUP BY s.service_name
ORDER BY usage_count DESC
LIMIT 1;

