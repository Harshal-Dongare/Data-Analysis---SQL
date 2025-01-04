
-- ----------------------------------------------------------
-- 						Clauses and Alias					|
-- ----------------------------------------------------------

-- Create the airline database if it does not already exist
CREATE DATABASE IF NOT EXISTS airline1234;

-- Switch to airline1234 database
USE airline1234;

-- ----------------------------------
-- 			Table 1: FLIGHTS		|
-- ----------------------------------

-- Create FLIGHTS table
CREATE TABLE flights(
	flight_id INT PRIMARY KEY,									-- Unique identifier for each flight (Primary Key)
    flight_number VARCHAR(10) NOT NULL,							-- Flight Number, cannot be NULL
    departure_airport VARCHAR(100) NOT NULL,					-- Name of the departure airport, cannot be NULL
    arrival_airport VARCHAR(100) NOT NULL,						-- Name of the arrival airport, cannot be NULL
    departure_time DATETIME NOT NULL,							-- Schedule departure time, cannot be NULL
    arrival_time DATETIME NOT NULL,								-- Schedule arrival time, cannot be NULL
    flight_duration INT NOT NULL,								-- Duration of the flight in minutes, cannot be NULL
    seats_available INT NOT NULL CHECK (seats_available >= 0), 	-- Number of available seats, must be postive and cannot be NULL
    aircraft_type VARCHAR(50) NOT NULL,							-- Type of the aircraft used for flight, cannot be NULL
    status ENUM('On Time', 'Delayed', 'Cancelled') 				
		NOT NULL DEFAULT 'On Time'								-- Current status of the flight, cannot be NULL and DEFAULT status is 'On Time'
);

-- Insert records into FLIGHTS table
INSERT INTO flights(flight_id, flight_number, departure_airport, arrival_airport, departure_time, arrival_time, flight_duration, seats_available, aircraft_type, status)
VALUES(1, 'AI101', 'Delhi (DEL)', 'Mumbai (BOM)', '2023-10-01 06:00:00', '2023-10-01 08:00:00', 120, 50, 'Boeing 737', 'On Time'),
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


-- --------------------------------------------------------------
-- 						SELECT Query 							|
-- --------------------------------------------------------------

-- SELECT all records from FLIGHTS table
SELECT * FROM flights;

-- Select flights that are delayed
SELECT * FROM flights 
WHERE status = 'Delayed';

-- Select DISTINCT aircraft types used in flights
SELECT DISTINCT aircraft_type FROM flights;

-- Select all flights ordered by Departure_Time
SELECT * FROM flights 
ORDER BY departure_time;

-- Count the number of flights per status
SELECT status, COUNT(*) AS number_of_flights 
FROM flights 
GROUP BY status;

-- Select statuses with more than 5 flights
SELECT status, COUNT(*) AS number_of_flights 
FROM flights 
GROUP BY status 
HAVING COUNT(*) > 5;

-- Select flights from a Specific Departure Airport
SELECT * FROM flights
WHERE departure_airport = 'Delhi (Del)';

-- Select flights with More Than 50 Seats Available
SELECT * FROM flights
WHERE seats_available > 50;

-- Select flights ORDERED BY Arrival Time
SELECT * FROM flights
ORDER BY arrival_time;

-- Select flights with a Duration Greater Than 120 Minutes
SELECT * FROM flights
WHERE flight_duration > 120;

-- Select flights with Arrival Time After a Specific Date
SELECT * FROM flights
WHERE arrival_time > '2023-10-01 12:00:00';

-- Select flights with a Specific Flight Number
SELECT * FROM flights
WHERE flight_number = 'AI101';

-- --------------------------------------------------------------
-- 						UPDATE Query 							|
-- --------------------------------------------------------------

-- Update the number of available seats for a specific flight
UPDATE flights
SET seats_available = 45
WHERE flight_id = 1;

-- Update the Status of a flight
UPDATE flights
SET status = 'Cancelled'
WHERE flight_id = 1;

-- Update the Arrival Airport for a Specific flight
UPDATE flights
SET arrival_airport = 'Chennai (MAA)'
WHERE flight_id = 3;

-- Update the Flight Duration for a Specific flight
UPDATE flights
SET flight_duration = 130
WHERE flight_id = 4;

-- Update the Aircraft Type for a Specific flight
UPDATE flights
SET aircraft_type = 'Boeing 777'
WHERE flight_id = 5;

-- Update the Departure Time for a Specific flight
UPDATE flights
SET departure_time = '2023-10-01 07:00:00'
WHERE flight_id = 6;

-- Update Multiple Fields for a Specific flight
UPDATE flights
SET seats_available = 60, status = 'On Time'
WHERE flight_id = 7;

-- Update Status for All Delayed flights
UPDATE flights
SET status = 'On Time'
WHERE status = 'Delayed';

-- Update the Flight Number for a Specific flight
UPDATE flights
SET flight_number = 'AI201'
WHERE flight_id = 8;

-- Update the Departure Airport for Multiple flights
UPDATE flights
SET departure_airport = 'Delhi (DEL)'
WHERE arrival_airport = 'Mumbai (BOM)';


-- --------------------------------------------------------------
-- 						DELETE Query 							|
-- --------------------------------------------------------------

-- Delete a specific flight
DELETE FROM flights
WHERE flight_id = 2;

-- Delete All Delayed flights
DELETE FROM flights
WHERE status = "Delayed";

-- Delete flights with No Available Seats
DELETE FROM flights
WHERE seats_available = 0;

-- Delete a flight by flight Number
DELETE FROM flights
WHERE flight_number = 'AI101';

-- Delete flights Departing Before a Specific Date
DELETE FROM flights
WHERE departure_time < '2023-10-01 00:00:00';

-- Delete All flights to a Specific Destination
DELETE FROM flights
WHERE arrival_airport = 'Jaipur (JAI)';

-- Delete flights with a Duration Less Than a Specific Value
DELETE FROM flights
WHERE flight_duration < 90;

-- Delete flights with a Specific Status
DELETE FROM flights
WHERE status = 'Cancelled';

-- Delete flights with a Specific Aircraft Type
DELETE FROM flights
WHERE aircraft_type = 'Airbus A320';

-- Delete All Flights with Less Than 30 Seats Available
DELETE FROM flights
WHERE seats_available < 30;


-- --------------------------------------------------------------
-- 						ALTER Query 							|
-- --------------------------------------------------------------

-- Add a new column for flight's terminal
ALTER TABLE flights
ADD COLUMN terminal VARCHAR(10);

-- Drop the terminal column from flights table
ALTER TABLE flights
DROP COLUMN terminal;

-- Add a New Column for flight's Airline
ALTER TABLE flights
ADD COLUMN airline VARCHAR(50);

-- Change the Data Type of flight_number
ALTER TABLE flights
MODIFY flight_number VARCHAR(15);

-- Rename the arrival_airport Column
ALTER TABLE flights
RENAME COLUMN arrival_airport TO destination_airport;

-- Add a DEFAULT Value for seats_available [tricky]
ALTER TABLE flights
ALTER seats_available SET DEFAULT 100;

-- Rename the flights Table
ALTER TABLE flights
RENAME TO flights_schedules;

-- --------------------------------------------------------------
-- 						ADD and DROP Query 						|
-- --------------------------------------------------------------

SELECT * FROM flights;

-- Add a CHECK constraint to ensure flight_duration is positive
ALTER TABLE flights_schedules
ADD CONSTRAINT chk_flight_duration CHECK (flight_duration > 0);

-- Drop the CHECK constraint on flight_duration
ALTER TABLE flights_schedules
DROP CONSTRAINT chk_flight_duration;

-- Add a UNIQUE Constraint on flight_number
ALTER TABLE flights_schedules
ADD CONSTRAINT uq_flight_number UNIQUE (flight_number);

-- Add a CHECK Constraint for Seats Available
ALTER TABLE flights_schedules
ADD CONSTRAINT chk_seats_available CHECK (seats_available >= 0);

-- Drop the CHECK Constraint on Seats Available
ALTER TABLE flights_schedules
DROP CONSTRAINT chk_seats_available;

-- Add a FOREIGN KEY Constraint (if applicable)
ALTER TABLE flights_schedules
ADD CONSTRAINT fk_airport FOREIGN KEY (departure_airport) REFERENCES airports(airport_name);

-- Drop the FOREIGN KEY Constraint
ALTER TABLE flights_schedules
DROP CONSTRAINT fk_airport;

-- Add a NOT NULL Constraint to flight_number
ALTER TABLE flights_schedules
MODIFY flight_number VARCHAR(10) NOT NULL;

-- Drop the NOT NULL Constraint from flight_number
ALTER TABLE flights_schedules
MODIFY flight_number VARCHAR(10);

-- Add a DEFAULT Constraint for status
ALTER TABLE flights_schedules
ALTER status SET DEFAULT 'On Time';

-- Drop the DEFAULT Constraint for Status
ALTER TABLE flights_schedules
ALTER COLUMN status DROP DEFAULT;

-- Add a UNIQUE Constraint on aircraft_type 
ALTER TABLE flights_schedules
ADD CONSTRAINT uq_aircraft_type UNIQUE (aircraft_type);

-- Drop the UNIQUE Constraint on aircraft_type
ALTER TABLE flights_schedules
DROP CONSTRAINT uq_aircraft_type;


