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


-- ----------------------------------------------
-- 					DELETE Queries	 			|
-- ----------------------------------------------

-- Delete a specific flight
DELETE FROM flights
WHERE flight_id = 2;

-- Delete all delayed flights
DELETE FROM flights
WHERE status = 'Delayed';

-- Delete flights with no available seats
DELETE FROM flights
WHERE seats_available = 0;

-- Delete a flight by flight number
DELETE FROM flights
WHERE flight_number = 'AI101';

-- Delete flights departing before a specific date 
DELETE FROM flights
WHERE departure_time < '2023-10-01 00:00:00';

-- Delete all flights to a specific destination
DELETE FROM flights
WHERE arrival_airport = 'Jaipur (JAI)';

-- Delete flights with a duration less than a specific value
DELETE FROM flights
WHERE flight_duration < 90;

-- Delete flights with a specific status
DELETE FROM flights
WHERE status = 'Cancelled';

-- Delete flights with a specific aircraft type
DELETE FROM flights
WHERE aircraft_type = 'Airbus A320';

-- Delete all flights with less than 30 seats available
DELETE FROM flights
WHERE seats_available < 30;


-- ----------------------------------------------
-- 					ALTER Queries	 			|
-- ----------------------------------------------

-- Add a new column for flight's terminal
ALTER TABLE flights
ADD COLUMN terminal VARCHAR(10);

-- Drop the terminal column from flights table
ALTER TABLE flights
DROP COLUMN terminal;

-- Add a new column for flight's airline
ALTER TABLE flights
ADD COLUMN airline VARCHAR(50) DEFAULT 'undefined';

-- Change the data type of flight_number
ALTER TABLE flights
MODIFY COLUMN flight_number VARCHAR(15);

-- Rename the arrival_airport column
ALTER TABLE flights
RENAME COLUMN arrival_airport TO destination_airport;

-- Add a default value for seats_available
ALTER TABLE flights
ALTER COLUMN seats_available SET DEFAULT 100;

-- Rename the flights table
ALTER TABLE flights_schedules
RENAME TO flights;


-- --------------------------------------------------
-- 			ADD and DROP CONSTRAINTS Queries	 	|
-- --------------------------------------------------

-- Add a CHECK constraint to ensure flight_duration is positive
ALTER TABLE flights
ADD CONSTRAINT chk_flight_duration CHECK (flight_duration >= 0);

-- Drop the CHECK constraint on flight_duration
ALTER TABLE flights
DROP CONSTRAINT chk_flight_duration;

-- Add a UNIQUE Constraint on flight_number
ALTER TABLE flights
ADD CONSTRAINT uq_flight_number UNIQUE (flight_number);

-- Add a CHECK Constraint for seats available
ALTER TABLE flights
ADD CONSTRAINT chk_seats_available CHECK (seats_available >= 0);

-- Drop the CHECK Constraint on seats_available
ALTER TABLE flights
DROP CONSTRAINT chk_seats_available;

-- Add a FOREIGN KEY Constraint (if applicable)
ALTER TABLE flights
ADD CONSTRAINT fk_airport FOREIGN KEY (departure_airport) REFERENCES airports(airport_name);

-- Drop the FOREIGN KEY Constraint
ALTER TABLE flights
DROP CONSTRAINT fk_airport;

-- Add a NOT NULL Constraint to flight_number
ALTER TABLE flights
MODIFY COLUMN flight_number VARCHAR(10) NOT NULL;

-- Drop the NOT NULL Constraint from flight_number
ALTER TABLE flights
MODIFY COLUMN flight_number VARCHAR(10);

-- Add a DEFAULT Constraint for status
ALTER TABLE flights
ALTER COLUMN status SET DEFAULT 'On Time';

-- Drop the DEFAULT Constraint for status
ALTER TABLE flights
ALTER COLUMN status DROP DEFAULT;

-- Add a UNIQUE Constraint on aircraft_type
ALTER TABLE flights
ADD CONSTRAINT uq_aircraft_type UNIQUE (aircraft_type);

-- Drop the UNIQUE Constraint on aircraft_type
ALTER TABLE flights
DROP CONSTRAINT uq_aircraft_type;


-- --------------------------------------------------
-- 				WHERE CLAUSE Queries	 			|
-- --------------------------------------------------

-- Select flights that are delayed
SELECT * FROM flights WHERE status = 'Delayed';

-- Select flights departing from Delhi
SELECT * FROM flights WHERE departure_airport = 'Delhi (DEL)';

-- Select flights arriving in Mumbai
SELECT * FROM flights WHERE arrival_airport = 'Mumbai (BOM)';

-- Select flights with a duration greater than 120 minutes
SELECT * FROM flights WHERE flight_duration > 120;

-- Select flights with available seats less than 30
SELECT * FROM flights WHERE seats_available  < 30;

-- Select flights that departed after a specific date
SELECT * FROM flights WHERE departure_time > '2023-10-01 00:00:00';

-- Select flights with a specific flight number
SELECT * FROM flights WHERE flight_number = 'AI101';

-- Select flights that are either cancelled or delayed
SELECT * FROM flights WHERE status IN ('Cancelled', 'Delayed');

-- Select flights with a flight duration between 90 and 150 minutes
SELECT * FROM flights WHERE flight_duration BETWEEN 90 AND 150;

-- Select flights with more than 50 available seats
SELECT * FROM flights WHERE seats_available > 50;


-- --------------------------------------------------
-- 				DISTINCT CLAUSE Queries	 			|
-- --------------------------------------------------

-- Select distinct aircraft types used in flights
SELECT DISTINCT aircraft_type FROM flights;

-- Select distinct departure airports
SELECT DISTINCT departure_airport FROM flights;

-- Select distinct arrival airports
SELECT DISTINCT arrival_airport FROM flights;

-- Select distinct flight statuses
SELECT DISTINCT status FROM flights;

-- Select distinct flight numbers
SELECT DISTINCT flight_number FROM flights;

-- Select distinct combinations of departure and arrival airports
SELECT DISTINCT departure_airport, arrival_airport FROM flights;

-- Select distinct flight durations
SELECT DISTINCT flight_duration FROM flights;

-- Select distinct departure times
SELECT departure_time FROM flights;

-- Select distinct arrival times
SELECT DISTINCT arrival_time FROM flights;

-- Select distinct seat availability counts
SELECT DISTINCT seats_available FROM flights;


-- --------------------------------------------------
-- 					FROM CLAUSE Queries	 			|
-- --------------------------------------------------

-- Select all records from Flights table
SELECT * FROM flights;

-- Select flight numbers and statuses from flights table
SELECT flight_number, status FROM flights;

-- Select departure and arrival airports from flights table
SELECT departure_airport, arrival_airport FROM flights;

-- Select flight ID and duration from flights table
SELECT flight_id, flight_duration FROM flights;

-- Select all columns from flights table where status is 'On Time'
SELECT * FROM flights WHERE status = 'On Time';

-- Select all flights with a specific aircraft type
SELECT * FROM flights WHERE aircraft_type = 'Boeing 737';

-- Select all flights departing after a specific time
SELECT * FROM flights WHERE departure_time > '2023-10-01 12:00:00';

-- Select all flights arriving in a specific city
SELECT * FROM flights WHERE arrival_airport = 'Chennai (MAA)';

-- Select all flights with available seats greater than 40
SELECT * FROM flights WHERE seats_available > 40;

-- Select all flights with a specific flight duration
SELECT * FROM flights WHERE flight_duration = 120;


-- --------------------------------------------------
-- 					ORDER BY CLAUSE Queries	 		|
-- --------------------------------------------------

-- Select all flights ordered by departure_time 
SELECT * FROM flights ORDER BY departure_time;

-- Select all flights ordered by flight_duration in descending order
SELECT * FROM flights ORDER BY flight_duration DESC;

-- Select all flights ordered by seats_available
SELECT * FROM flights ORDER BY seats_available;

-- Select all flights ordered by status and then by departure_time
SELECT * FROM flights ORDER BY status, departure_time;

-- Select all flights ordered by arrival_airport
SELECT * FROM flights ORDER BY arrival_airport;

-- Select all flights ordered by flight_number in descending order
SELECT * FROM flights ORDER BY flight_number DESC;

-- Select all flights ordered by departure_airport and then by flight_duration
SELECT * FROM flights ORDER BY departure_airport, flight_duration;

-- Select all flights ordered by arrival_time in descending order
SELECT * FROM flights ORDER BY arrival_time DESC;

-- Select all flights ordered by flight_id
SELECT * FROM flights ORDER BY flight_id;

-- Select all flights ordered by arrival_time
SELECT * FROM flights ORDER BY arrival_time;


-- --------------------------------------------------
-- 					GROUP BY CLAUSE Queries	 		|
-- --------------------------------------------------

-- Count flights grouped by status
SELECT status, COUNT(*) AS number_of_flights FROM flights GROUP BY status;

-- Group flights by departure_airport and count them
SELECT departure_airport, COUNT(*) FROM flights GROUP BY departure_airport;

-- Group flights by arrival_airport and count them
SELECT arrival_airport, COUNT(*) FROM flights GROUP BY arrival_airport;

-- Group flights by aircraft_type and calculate average duration
SELECT aircraft_type, AVG(flight_duration) FROM flights GROUP BY aircraft_type;

-- Group flights by flight_number and count them
SELECT flight_number, COUNT(*) FROM flights GROUP BY flight_number;

-- Group flights by departure_airport and calculate total available seats
SELECT departure_airport, SUM(seats_available) FROM flights GROUP BY departure_airport;

-- Group flights by status and calculate maximum duration
SELECT status, MAX(flight_duration) FROM flights GROUP BY status;

-- Group flights by arrival_airport and calculate minimum duration
SELECT arrival_airport, MIN(flight_duration) FROM flights GROUP BY arrival_airport;

-- Group flights by departure_airport and calculate average available seats
SELECT departure_airport, AVG(seats_available) FROM flights GROUP BY departure_airport;

-- Group flights by aircraft_type and count distinct statuses
SELECT aircraft_type, COUNT(DISTINCT status) FROM flights GROUP BY aircraft_type;


-- --------------------------------------------------
-- 					HAVING CLAUSE Queries	 		|
-- --------------------------------------------------

-- Select statuses with more than 5 flights
SELECT status, COUNT(*) AS number_of_flights FROM flights GROUP BY status HAVING COUNT(*) > 5; 

-- Select departure airports with more than 3 flights
SELECT departure_airport, COUNT(*) FROM flights GROUP BY departure_airport HAVING COUNT(*) > 3;

-- Select aircraft types with an average flight duration greater than 120 minutes
SELECT aircraft_type, AVG(flight_duration) AS average_duration FROM flights GROUP BY aircraft_type HAVING AVG(flight_duration) > 120;

-- Select arrival airports with less than 2 flights
SELECT arrival_airport, COUNT(*) FROM flights GROUP BY arrival_airport HAVING COUNT(*) > 2;

-- Select statuses with a total of available seats greater than 200
SELECT status, SUM(seats_available) FROM flights GROUP BY status HAVING SUM(seats_available) > 200;

-- Select flight numbers with more than 1 occurrence
SELECT flight_number, COUNT(*) AS occurence FROM flights GROUP BY flight_number HAVING COUNT(*) > 1;

-- Select departure airports with an average available seat count less than 50
SELECT departure_airport, AVG(seats_available) FROM flights GROUP BY departure_airport HAVING AVG(seats_available) < 50;

-- Select aircraft types with a maximum flight duration of less than 150 minutes
SELECT aircraft_type, MAX(flight_duration) FROM flights GROUP BY aircraft_type HAVING MAX(flight_duration) < 150;
 
-- Select statuses with a count of flights equal to 1
SELECT status, COUNT(*) FROM flights GROUP BY status HAVING COUNT(*) = 1;

-- Select arrival airports with an average flight duration greater than 100 minutes
SELECT arrival_airport, AVG(flight_duration) FROM flights GROUP BY arrival_airport HAVING AVG(flight_duration) > 100;


-- --------------------------------------------------
-- 					LIMIT CLAUSE Queries	 		|
-- --------------------------------------------------

-- Select the first 5 flights
SELECT * FROM flights LIMIT 5;

-- Select the first 10 flights ordered by Departure_Time
SELECT * FROM flights ORDER BY departure_time LIMIT 10;

-- Select the last 3 flights based on flight_id
SELECT * FROM flights ORDER BY flight_id DESC LIMIT 3;

-- Select the first 7 flights that are delayed
SELECT * FROM flights WHERE status = 'Delayed' LIMIT 7;

-- Select the first 5 flights departing from Delhi
SELECT * FROM flights WHERE departure_airport = 'Delhi (DEL)' LIMIT 5;

-- Select the first 10 flights with available seats greater than 50
SELECT * FROM flights WHERE seats_available > 50 LIMIT 10;

-- Select the first 5 flights arriving in Mumbai
SELECT * FROM flights WHERE arrival_airport = 'Mumbai (BOM)' LIMIT 5;

-- Select the first 10 flights with a flight duration greater than 120 minutes
SELECT * FROM flights WHERE flight_duration > 120 LIMIT 10;

-- Select the first 5 flights ordered by flight_number
SELECT * FROM flights ORDER BY flight_number LIMIT 5;

-- Select the first 3 flights that departed after a specific date
SELECT * FROM flights WHERE departure_time > '2023-10-01 00:00:00' LIMIT 3;

-- Select 5 flights starting from the 10th record (OFFSET)
SELECT * FROM flights LIMIT 5 OFFSET 10;

-- Select 10 flights starting from the 20th record
SELECT * FROM flights LIMIT 10 OFFSET 20;

-- Select 3 flights starting from the 5th record
SELECT * FROM flights LIMIT 3 OFFSET 5;

-- Select 7 flights starting from the 15th record
SELECT * FROM flights LIMIT 7 OFFSET 15;

-- Select 4 flights starting from the 0th record (first record)
SELECT * FROM flights LIMIT 4 OFFSET 0;

-- Select 5 flights starting from the 10th record
SELECT * FROM flights LIMIT 5 OFFSET 10;

-- Select 10 flights starting from the 20th record
SELECT * FROM flights LIMIT 10 OFFSET 20;

-- Select 3 flights starting from the 5th record
SELECT * FROM flights LIMIT 3 OFFSET 5;

-- Select 7 flights starting from the 15th record
SELECT * FROM flights LIMIT 7 OFFSET 15;

-- Select 4 flights starting from the 0th record (first record)
SELECT * FROM flights LIMIT 4 OFFSET 0;

-- Get the total number of flights and limit the results
SELECT SQL_CALC_FOUND_ROWS * FROM flights LIMIT 5;
SELECT FOUND_ROWS();








