-- ------------------------------------------------------------------------------
-- 							Database : AIRLINE123								|
-- ------------------------------------------------------------------------------

-- Create the airline database if it does not exist
CREATE DATABASE IF NOT EXISTS airline123;

-- Switch to the AIRLINE123 database
USE airline123;

-- ------------------------------------------------------------------------------
-- 							Table 1 : FLIGHTS									|
-- ------------------------------------------------------------------------------

CREATE TABLE flights(
	flight_id INT PRIMARY KEY,										-- Unique identifier for each flight
    flight_number VARCHAR(10) NOT NULL,								-- Number of the flight, cannot be NULL
    departure_airport VARCHAR(100) NOT NULL,						-- Name of the departure airport, cannot be NULL
    arrival_airport VARCHAR(100) NOT NULL,							-- Name of the arrival airport, cannot be NULL
    departure_time DATETIME NOT NULL,								-- Departure time of the flight, cannot be NULL
    arrival_time DATETIME NOT NULL,									-- Arrival time of the flight, cannot be NULL
    flight_duration INT NOT NULL,									-- Duration of the flight in minutes, cannot be NULL
    seats_available INT NOT NULL CHECK (seats_available >= 0),		-- Number of available seats, cannot be NULL and must be positive
    aircraft_type VARCHAR(50) NOT NULL,								-- Type of aircraft used for the flight, cannot be NULL
    status ENUM('On Time', 'Delayed', 'Cancelled') 
		NOT NULL DEFAULT 'On Time'									-- Current status of the flight, cannot be NULL and DEFAULT is 'On Time'
);

-- Insert records into FLIGHTS TABLE
INSERT INTO flights(flight_id, flight_number, departure_airport, arrival_airport, departure_time, arrival_time, flight_duration, seats_available, aircraft_type, status)
VALUES
(1, 'AI101', 'Delhi (DEL)', 'Mumbai (BOM)', '2023-10-01 06:00:00', '2023-10-01 08:00:00', 120, 50, 'Boeing 737', 'On Time'),
(2, 'AI102', 'Mumbai (BOM)', 'Delhi (DEL)', '2023-10-01 09:00:00', '2023-10-01 11:00:00', 120, 60, 'Airbus A320', 'On Time'),
(3, 'AI103', 'Delhi (DEL)', 'Bangalore (BLR)', '2023-10-01 07:00:00', '2023-10-01 09:30:00', 150, 70, 'Boeing 737', 'On Time'),
(4, 'AI104', 'Bangalore (BLR)', 'Delhi (DEL)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 80, 'Airbus A320', 'On Time'),
(5, 'AI105', 'Delhi (DEL)', 'Chennai (MAA)', '2023-10-01 08:00:00', '2023-10-01 10:30:00', 150, 40, 'Boeing 737', 'On Time'),
(6, 'AI106', 'Chennai (MAA)', 'Delhi (DEL)', '2023-10-01 11:00:00', '2023-10-01 13:30:00', 150, 50, 'Airbus A320', 'On Time'),
(7, 'AI107', 'Delhi (DEL)', 'Kolkata (CCU)', '2023-10-01 09:00:00', '2023-10-01 11:30:00', 150, 30, 'Boeing 737', 'On Time'),
(8, 'AI108', 'Kolkata (CCU)', 'Delhi (DEL)', '2023-10-01 12:00:00', '2023-10-01 14:30:00', 150, 20, 'Airbus A320', 'On Time'),
(9, 'AI109', 'Delhi (DEL)', 'Hyderabad (HYD)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 60, 'Boeing 737', 'On Time'),
(10, 'AI110', 'Hyderabad (HYD)', 'Delhi (DEL)', '2023-10-01 13:00:00', '2023-10-01 15:30:00', 150, 50, 'Airbus A320', 'On Time'),
(11, 'AI111', 'Delhi (DEL)', 'Pune (PNQ)', '2023-10-01 14:00:00', '2023-10-01 16:00:00', 120, 40, 'Boeing 737', 'On Time'),
(12, 'AI112', 'Pune (PNQ)', 'Delhi (DEL)', '2023-10-01 17:00:00', '2023-10-01 19:00:00', 120, 30, 'Airbus A320', 'On Time'),
(13, 'AI113', 'Delhi (DEL)', 'Ahmedabad (AMD)', '2023-10-01 15:00:00', '2023-10-01 17:00:00', 120, 50, 'Boeing 737', 'On Time'),
(14, 'AI114', 'Ahmedabad (AMD)', 'Delhi (DEL)', '2023-10-01 18:00:00', '2023-10-01 20:00:00', 120, 40, 'Airbus A320', 'On Time'),
(15, 'AI115', 'Delhi (DEL)', 'Jaipur (JAI)', '2023-10-01 16:00:00', '2023-10-01 17:30:00', 90,  60, 'Boeing 737', 'On Time');


-- ------------------------------------------------------------------------------
-- 						SELECT, ALTER, DELETE and UPDATE Queries	 			|
-- ------------------------------------------------------------------------------

-- ----------------------------------------------
-- 					SELECT Queries	 			|
-- ----------------------------------------------

-- Select all records from flights table
SELECT * FROM flights;

-- Select flights that are delayed
SELECT * FROM flights WHERE status = 'delayed';

-- Select distinct aircraft types used in flights
SELECT DISTINCT aircraft_type FROM flights;

-- Select all flights ordered by departure_time	[By default order is ASCENDING]
SELECT * FROM flights ORDER BY departure_time;

-- Count the number of flights per status
SELECT status, COUNT(*) AS number_of_flights FROM flights GROUP BY status;

-- Select statuses with more than 5 flights
SELECT status, COUNT(*) FROM flights GROUP BY status HAVING COUNT(*) > 5;

-- Select flights from a Specific Departure Airport
SELECT * FROM flights WHERE departure_airport = 'Delhi (DEL)';

-- Select flights with More Than 50 Seats available
SELECT * FROM flights WHERE seats_available > 50;

-- Select flights ordered by arrival time
SELECT * FROM flights ORDER BY arrival_time;

-- Select flights with a duration greater than 120 minutes
SELECT * FROM flights WHERE flight_duration > 120;

-- Select distinct aircraft types
SELECT DISTINCT aircraft_type FROM flights;

-- Select flights with arrival time after a specific date 
SELECT * FROM flights WHERE arrival_time > '2023-10-01 12:00:00';

-- Select flights with a specific flight Number
SELECT * FROM flights WHERE flight_number = 'AI101';


-- ----------------------------------------------
-- 					UPDATE Queries	 			|
-- ----------------------------------------------

-- Update the number of available seats for a specific flight
UPDATE flights
SET seats_available = 45
WHERE flight_id = '1';

-- Update the status of a flight
UPDATE flights
SET status = 'Cancelled'
WHERE flight_id = 1;

-- Update the arrival airport for a specific flight
UPDATE flights
SET arrival_airport = 'Chennai (MAA)'
WHERE flight_id = 3;

-- Update the flight duration for a specific flight
UPDATE flights
SET flight_duration = 130
WHERE flight_id = 4;

-- Update the aircraft type for a specific flight
UPDATE flights
SET aircraft_type = 'Boeing 777'
WHERE flight_id = 5;

-- Update the departure time for a specific flight
UPDATE flights
SET departure_time = '2023-10-01 07:00:00'
WHERE flight_id = 6;

-- Update multiple fields for a specific flight
UPDATE flights
SET seats_available = 60, status = 'On Time'
WHERE flight_id = 7;

-- Update status for all delayed flights
UPDATE flights
SET status = 'On Time'
WHERE status = 'Delayed';

-- Update the flight number for a specific flight
UPDATE flights
SET flight_number = 'AI201'
WHERE flight_id = 9;

-- Update the departure airport for multiple flights
UPDATE flights
SET departure_airport = 'Delhi (DEL)'
WHERE arrival_airport = 'Mumbai (BOM)'; 