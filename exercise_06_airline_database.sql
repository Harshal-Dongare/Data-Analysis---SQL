
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

-- --------------------------------------------------------------
-- 							WHERE Query 						|
-- --------------------------------------------------------------

-- Select flights that are delayed
SELECT * FROM flights_schedules WHERE status = 'Delayed';

-- Select flights departing from Delhi
SELECT * FROM flights_schedules WHERE departure_airport = "Delhi (DEL)";

-- Select flights arriving in Mumbai
SELECT * FROM flights_schedules WHERE destination_airport = "Mumbai (BOM)";

-- Select flights with a duration greater than 120 minutes
SELECT * FROM flights_schedules WHERE flight_duration > 120;

-- Select flights with available seats less than 30
SELECT * FROM flights_schedules WHERE seats_available < 30;

-- Select flights that departed after a specific date
SELECT * FROM flights_schedules WHERE departure_time > '2023-10-01 00:00:00';

-- Select flights with a specific flight number
SELECT * FROM flights_schedules WHERE flight_number = 'AI101';

-- Select flights that are either cancelled or delayed
SELECT * FROM flights_schedules WHERE status IN ('Delayed', 'Cancelled');

-- Select flights with a flight duration between 90 and 150 minutes
SELECT * FROM flights_schedules WHERE flight_duration BETWEEN 90 AND 150;

-- Select flights with more than 50 available seats
SELECT * FROM flights_schedules WHERE seats_available > 50;


-- --------------------------------------------------------------
-- 							DISTINCT Query 						|
-- --------------------------------------------------------------

-- Select DISTINCT aircraft types used in flights
SELECT DISTINCT aircraft_type FROM flights_schedules;

-- Select distinct departure airports
SELECT DISTINCT departure_airport FROM flights_schedules;

-- Select distinct arrival airports
SELECT DISTINCT destination_airport FROM flights_schedules;

-- Select distinct flight statuses
SELECT DISTINCT status FROM flights_schedules;

-- Select distinct flight numbers
SELECT DISTINCT flight_number FROM flights_schedules;

-- Select distinct combinations of departure and arrival airports
SELECT DISTINCT departure_airport, destination_airport FROM flights_schedules;

-- Select distinct flight durations
SELECT DISTINCT flight_duration FROM flights_schedules;

-- Select distinct departure times
SELECT DISTINCT departure_time FROM flights_schedules;

-- Select distinct arrival times
SELECT DISTINCT arrival_time FROM flights_schedules;

-- Select distinct seat availability counts
SELECT DISTINCT seats_available FROM flights_schedules;


-- --------------------------------------------------------------
-- 							FROM Query 							|
-- --------------------------------------------------------------

-- Select all records from Flights table
SELECT * FROM flights_schedules;

-- Select flight numbers and statuses from Flights table
SELECT flight_number, status FROM flights_schedules;

-- Select departure and arrival airports from Flights table
SELECT departure_airport, destination_airport FROM flights_schedules;

-- Select flight id and duration from Flights table
 SELECT flight_id, flight_duration FROM flights_schedules;
 
 -- Select all columns from Flights table where status is 'On Time'
 SELECT * FROM flights_schedules WHERE status = 'On Time';
 
 -- Select all flights with a specific aircraft type
 SELECT * FROM flights_schedules WHERE aircraft_type = 'Boeing 737';
 
 -- Select all flights departing after a specific time
 SELECT * FROM flights_schedules WHERE departure_time > '2023-10-01 12:00:00';
 
 -- Select all flights arriving in a specific city
 SELECT * FROM flights_schedules WHERE destination_airport = 'Chennai (MAA)';
 
 -- Select all flights with available seats greater than 40
 SELECT * FROM flights_schedules WHERE seats_available > 40;
 
 -- Select all flights with a specific flight duration
 SELECT * FROM flights_schedules WHERE flight_duration = 120;


-- --------------------------------------------------------------
-- 							ORDER Query 						|
-- --------------------------------------------------------------

-- Select all flights ordered by Departure_Time
SELECT * FROM flights_schedules ORDER BY departure_time;

-- Select all flights ordered by Flight_Duration in descending order
SELECT * FROM flights_schedules ORDER BY flight_duration DESC;

-- Select all flights ordered by Seats_Available
SELECT * FROM flights_schedules ORDER BY seats_available;

-- Select all flights ordered by Status and then by Departure_Time
SELECT * FROM flights_schedules ORDER BY status, departure_time;

-- Select all flights ordered by Arrival_Airport
SELECT * FROM flights_schedules ORDER BY departure_airport;

-- Select all flights ordered by Flight_Number in descending order
SELECT * FROM flights_schedules ORDER BY flight_number DESC;

-- Select all flights ordered by Departure_Airport and then by Flight_Duration
SELECT * FROM flights_schedules ORDER BY departure_airport, flight_duration;

-- Select all flights ordered by Arrival_Time in descending order
SELECT * FROM flights_schedules ORDER BY arrival_time DESC;

-- Select all flights ordered by Flight_ID
SELECT * FROM flights_schedules ORDER BY flight_id;

-- Select all flights ordered by Arrival_Time
SELECT * FROM flights_schedules ORDER BY arrival_time;


-- --------------------------------------------------------------
-- 							GROUP BY Query 						|
-- --------------------------------------------------------------

-- Count flights grouped by status
SELECT status, COUNT(*) AS number_of_flights FROM flights_schedules GROUP BY status;

-- Group flights by Departure_Airport and count them
SELECT departure_airport, COUNT(*) AS number_of_flights FROM flights_schedules GROUP BY departure_airport;

-- Group flights by Arrival_Airport and count them
SELECT destination_airport, COUNT(*) FROM flights_schedules GROUP BY destination_airport;

-- Group flights by Aircraft_Type and calculate average duration
SELECT aircraft_type, AVG(flight_duration) FROM flights_schedules GROUP BY aircraft_type;

-- Group flights by Flight_Number and count them
SELECT flight_number, COUNT(*) FROM flights_schedules GROUP BY flight_number;

-- Group flights by Departure_Airport and calculate total available seats
SELECT departure_airport, SUM(seats_available) AS total_seats FROM flights_schedules GROUP BY departure_airport;

-- Group flights by Status and calculate maximum duration
SELECT status, MAX(flight_duration) FROM flights_schedules GROUP BY status;

-- Group flights by Arrival_Airport and calculate minimum duration
SELECT destination_airport, MIN(flight_duration) AS min_duration FROM flights_schedules GROUP BY destination_airport;

-- Group flights by Departure_Airport and calculate average available seats
SELECT departure_airport, AVG(seats_available) FROM flights_schedules GROUP BY departure_airport;

-- Group flights by Aircraft_Type and count distinct statuses
SELECT aircraft_type, COUNT(DISTINCT status) FROM flights_schedules GROUP BY aircraft_type;


-- --------------------------------------------------------------
-- 							HAVING BY Query 					|
-- --------------------------------------------------------------

-- Select statuses with more than 5 flights
SELECT status, COUNT(*) AS number_of_flights
FROM flights_schedules
GROUP BY status
HAVING COUNT(*) > 5;

-- Select departure airports with more than 3 flights
SELECT departure_airport, COUNT(*) AS number_of_flights
FROM flights_schedules  
GROUP BY departure_airport
HAVING COUNT(*) > 3;

-- Select aircraft types with an average flight duration greater than 120 minutes
SELECT aircraft_type, avg(flight_duration)
FROM flights_schedules
GROUP BY aircraft_type
HAVING AVG(Flight_Duration) > 120;

-- Select arrival airports with less than 2 flights
SELECT destination_airport, COUNT(*) AS number_of_flights 
FROM flights_schedules
GROUP BY destination_airport
HAVING COUNT(*) < 2;

-- Select statuses with a total of available seats greater than 200
SELECT status, SUM(seats_available) 
FROM flights_schedules
GROUP BY status
HAVING SUM(seats_available) > 200;

-- Select flight numbers with more than 1 occurrence
SELECT flight_number, COUNT(*)
FROM flights_schedules
GROUP BY flight_number
HAVING COUNT(*) > 1;

-- Select departure airports with an average available seat count less than 50
SELECT departure_airport, AVG(seats_available) 
FROM flights_schedules
GROUP BY departure_airport
HAVING AVG(seats_available) < 50;

-- Select aircraft types with a maximum flight duration of less than 150 minutes
SELECT aircraft_type, MAX(flight_duration)
FROM flights_schedules
GROUP BY aircraft_type
HAVING MAX(flight_duration) < 150;

-- Select statuses with a count of flights equal to 1
SELECT status, COUNT(*) AS number_of_flights
FROM flights_schedules
GROUP BY status
HAVING COUNT(*) = 1;

-- Select arrival airports with an average flight duration greater than 100 minutes
SELECT destination_airport, AVG(flight_duration)
FROM flights_schedules
GROUP BY destination_airport
HAVING AVG(flight_duration) > 100;


-- --------------------------------------------------------------
-- 							LIMIT Query		 					|
-- --------------------------------------------------------------

-- Select the first 5 flights
SELECT * FROM flights_schedules LIMIT 5;

-- Select the first 10 flights ordered by Departure_Time
SELECT * FROM flights_schedules ORDER BY departure_time LIMIT 10;

-- Select the last 3 flights based on Flight_ID
SELECT * FROM flights_schedules WHERE flight_id = 3 LIMIT 3;

-- Select the first 7 flights that are delayed
SELECT * FROM flights_schedules WHERE status = 'Delayed' LIMIT 7;

-- Select the first 5 flights departing from Delhi
SELECT * FROM flights_schedules WHERE departure_airport = 'Delhi (DEL)' LIMIT 5;

-- Select the first 10 flights with available seats greater than 50
SELECT * FROM flights_schedules WHERE seats_available > 50;

-- Select the first 5 flights arriving in Mumbai
SELECT * FROM flights_schedules WHERE destination_airport = 'Mumbai (BOM)' LIMIT 5;

-- Select the first 10 flights with a flight duration greater than 120 minutes
SELECT * FROM flights_schedules WHERE flight_duration > 120 LIMIT 10;

-- Select the first 5 flights ordered by Flight_Number
SELECT * FROM flights_schedules ORDER BY flight_number LIMIT 5;

-- Select the first 3 flights that departed after a specific date
SELECT * FROM flights_schedules WHERE departure_time > '2023-10-01 00:00:00' LIMIT 3;

-- Select 5 flights starting from the 10th record (OFFSET)
SELECT * FROM flights_schedules LIMIT 5 OFFSET 10;

-- Select 10 flights starting from the 20th record
SELECT * FROM flights_schedules LIMIT 10 OFFSET 20;

-- Select 3 flights starting from the 5th record
SELECT * FROM flights_schedules LIMIT 3 OFFSET 5;

-- Select 7 flights starting from the 15th record
SELECT * FROM flights_schedules LIMIT 7 OFFSET 15;

-- Select 4 flights starting from the 0th record (first record)
SELECT * FROM flights_schedules LIMIT 4 OFFSET 0;

-- Select 5 flights starting from the 10th record
SELECT * FROM flights_schedules LIMIT 10, 5;				-- This means skip 10 records and then return the next 5

-- Select 10 flights starting from the 20th record
SELECT * FROM flights_schedules LIMIT 20, 10;  				-- Skip 20 records and return the next 10

-- Select 3 flights starting from the 5th record
SELECT * FROM flights_schedules LIMIT 5, 3;  				-- Skip 5 records and return the next 3

-- Select 7 flights starting from the 15th record
SELECT * FROM flights_schedules LIMIT 15, 7;				-- Skip 15 records and return the next 7

-- Select 4 flights starting from the 0th record (first record)
SELECT * FROM flights_schedules LIMIT 0, 4;  				-- Skip 0 records and return the first 4

-- Get the total number of flights and limit the results  [Tricky]
SELECT SQL_CALC_FOUND_ROWS * FROM flights_schedules LIMIT 5; 	
SELECT FOUND_ROWS();			