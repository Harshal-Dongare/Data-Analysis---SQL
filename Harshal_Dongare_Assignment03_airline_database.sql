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


-- ------------------------------------------------------------------------------
-- 							Table 2 : PASSENGERS								|
-- ------------------------------------------------------------------------------


-- Create PASSENGERS table
CREATE TABLE passengers (
  passenger_ID INT PRIMARY KEY AUTO_INCREMENT, 				-- Unique identifier for each passenger (Primary Key, Auto Increment)
  first_Name VARCHAR(50) NOT NULL, 							-- Passenger's first name (Not Null)
  last_Name VARCHAR(50) NOT NULL, 							-- Passenger's last name (Not Null)
  email VARCHAR(100) UNIQUE NOT NULL, 						-- Passenger's email address (Not Null, must be unique)
  phone_number VARCHAR(15), 								-- Passenger's phone number (Optional)
  date_of_birth DATE NOT NULL, 								-- Passenger's date of birth (Not Null)
  frequent_flyer_number VARCHAR(20) UNIQUE, 				-- Frequent flyer number (Optional, must be unique)
  nationality VARCHAR(50) NOT NULL 							-- Nationality of the passenger (Not Null)
);


-- Insert Records into PASSENGERS Table
INSERT INTO passengers (first_name, last_name, email, phone_number, date_of_birth, frequent_flyer_number, nationality)
VALUES 
('Rahul', 'Sharma', 'rahul.sharma@example.com', '9876543210', '1990-01-15', 'FF001', 'India'),
('Priya', 'Verma', 'priya.verma@example.com', '8765432109', '1992-02-20', 'FF002', 'India'),
('Amit', 'Kumar', 'amit.kumar@example.com', '7654321098', '1988-03-25', 'FF003', 'India'),
('Sneha', 'Reddy', 'sneha.reddy@example.com', '6543210987', '1995-04-30', 'FF004', 'India'),
('Vikram', 'Singh', 'vikram.singh@example.com', '5432109876', '1985-05-05', 'FF005', 'India'),
('Neha', 'Gupta', 'neha.gupta@example.com', '4321098765', '1993-06-10', 'FF006', 'India'),
('Ravi', 'Patel', 'ravi.patel@example.com', '3210987654', '1987-07-15', 'FF007', 'India'),
('Anjali', 'Mehta', 'anjali.mehta@example.com', '2109876543', '1991-08-20', 'FF008', 'India'),
('Karan', 'Bansal', 'karan.bansal@example.com', '1098765432', '1989-09-25', 'FF009', 'India'),
('Pooja', 'Joshi', 'pooja.joshi@example.com', '0987654321', '1994-10-30', 'FF010', 'India'),
('Suresh', 'Nair', 'suresh.nair@example.com', '9876543210', '1986-11-05', 'FF011', 'India'),
('Tina', 'Chopra', 'tina.chopra@example.com', '8765432109', '1992-12-10', 'FF012', 'India'),
('Mohit', 'Agarwal', 'mohit.agarwal@example.com', '7654321098', '1988-01-15', 'FF013', 'India'),
('Ritika', 'Sethi', 'ritika.sethi@example.com', '6543210987', '1995-02-20', 'FF014', 'India'),
('Deepak', 'Kohli', 'deepak.kohli@example.com', '5432109876', '1985-03-25', 'FF015', 'India');


-- ------------------------------------------------------------------------------
-- 							Table 3 : BOOKINGS									|
-- ------------------------------------------------------------------------------

-- Create BOOKINGS table
CREATE TABLE bookings (
  booking_id INT PRIMARY KEY AUTO_INCREMENT, 						-- Unique identifier for each booking (Primary Key, Auto Increment)
  flight_id INT NOT NULL, 											-- Foreign key referencing Flights table (Not Null)
  passenger_id INT NOT NULL, 										-- Foreign key referencing Passengers table (Not Null)
  booking_date DATETIME NOT NULL, 									-- Date and time of booking (Not Null)
  number_of_seats INT NOT NULL CHECK (Number_of_Seats > 0), 		-- Number of seats booked (Not Null, must be greater than zero)
  total_price DECIMAL(10, 2) NOT NULL, 								-- Total price for the booking (Not Null)
  booking_status ENUM('Confirmed', 'Cancelled', 'Pending') 
		NOT NULL DEFAULT 'Pending', 								-- Status of the booking (Not Null, default is 'Pending')
  FOREIGN KEY (flight_id) REFERENCES flights(flight_id) 
		ON DELETE CASCADE, 											-- Foreign key constraint linking to Flights table with cascading delete
  FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id) 
		ON DELETE CASCADE 											-- Foreign key constraint linking to Passengers table with cascading delete
);

INSERT INTO bookings (flight_id, passenger_id, booking_date, number_of_seats, total_price, booking_status)
VALUES 
(1, 1, '2023-09-01 10:00:00', 1, 1500.00, 'Confirmed'),
(2, 2, '2023-09-02 11:00:00', 2, 3000.00, 'Confirmed'),
(3, 3, '2023-09-03 12:00:00', 1, 1500.00, 'Confirmed'),
(4, 4, '2023-09-04 13:00:00', 1, 1500.00, 'Confirmed'),
(5, 5, '2023-09-05 14:00:00', 1, 1500.00, 'Confirmed'),
(6, 6, '2023-09-06 15:00:00', 1, 1500.00, 'Confirmed'),
(7, 7, '2023-09-07 16:00:00', 1, 1500.00, 'Confirmed'),
(8, 8, '2023-09-08 17:00:00', 1, 1500.00, 'Confirmed'),
(9, 9, '2023-09-09 18:00:00', 1, 1500.00, 'Confirmed'),
(10, 10, '2023-09-10 19:00:00', 1, 1500.00, 'Confirmed'),
(11, 11, '2023-09-11 20:00:00', 1, 1500.00, 'Confirmed'),
(12, 12, '2023-09-12 21:00:00', 1, 1500.00, 'Confirmed'),
(13, 13, '2023-09-13 22:00:00', 1, 1500.00, 'Confirmed'),
(14, 14, '2023-09-14 23:00:00', 1, 1500.00, 'Confirmed'),
(15, 15, '2023-09-15 09:00:00', 1, 1500.00, 'Confirmed');


-- ------------------------------------------------------------------------------
-- 							Table 4 : AIRLINES									|
-- ------------------------------------------------------------------------------

-- Create Airlines table
CREATE TABLE airlines (
  airline_id INT PRIMARY KEY AUTO_INCREMENT, 				-- Unique identifier for each airline (Primary Key, Auto Increment)
  airline_name VARCHAR(100) NOT NULL, 						-- Name of the airline (Not Null)
  iata_code VARCHAR(3) UNIQUE NOT NULL, 					-- IATA code for the airline (Not Null, must be unique)
  country VARCHAR(50) NOT NULL, 							-- Country where the airline is based (Not Null)
  established_year INT CHECK (established_year > 1900), 	-- Year the airline was established (Must be greater than 1900)
  headquarter_location VARCHAR(100) NOT NULL 				-- Location of the airline's headquarters (Not Null)
);

-- Insert Records into Airlines Table
INSERT INTO airlines (airline_name, iata_code, country, established_year, headquarter_location)
VALUES 
('Air India', 'AI', 'India', 1932, 'Mumbai'),
('IndiGo', '6E', 'India', 2006, 'Gurgaon'),
('SpiceJet', 'SG', 'India', 2005, 'Gurgaon'),
('Vistara', 'UK', 'India', 2013, 'Gurgaon'),
('GoAir', 'G8', 'India', 2005, 'Mumbai'),
('AirAsia India', 'I5', 'India', 2014, 'Bangalore'),
('Alliance Air', '9I', 'India', 1996, 'Delhi'),
('Jet Airways', '9W', 'India', 1993, 'Mumbai'),
('Air India Express', 'IX', 'India', 2005, 'Kochi'),
('Star Air', 'S5', 'India', 2019, 'Bangalore'),
('Akasa Air', 'QP', 'India', 2022, 'Mumbai'),
('TruJet', '2T', 'India', 2015, 'Hyderabad'),
('Zoom Air', 'Z5', 'India', 2017, 'Delhi'),
('Flybig', 'FB', 'India', 2020, 'Indore'),
('Deccan Charters', 'DC', 'India', 1997, 'Bangalore');


-- --------------------------------------------------
-- 					JOIN CLAUSE Queries	 			|
-- --------------------------------------------------

-- Join flights with bookings to get flight details along with booking information
SELECT * 
FROM flights f
INNER JOIN bookings b
ON f.flight_id = b.flight_id;

-- Join flights with passengers to get flight details along with passenger information
SELECT f.flight_id, f.flight_number, p.passenger_id, p.first_name, p.last_name
FROM flights f
INNER JOIN bookings b ON f.flight_id = b.flight_id
INNER JOIN passengers p ON b.passenger_id = p.passenger_id;

-- Left join flights with bookings to get all flights and their booking status (if any)
SELECT f.flight_id, f.flight_number, b.booking_id, b.booking_status
FROM flights f
LEFT JOIN bookings b
ON f.flight_id = b.flight_id;

-- Left join Flights with Airlines to get flight details along with airline information
SELECT f.Flight_ID, f.Flight_Number, a.Airline_Name, a.IATA_Code
FROM Flights f
LEFT JOIN Airlines a ON f.Airline_ID = a.Airline_ID;  -- Assuming Airline_ID is added to Flights table

-- Right join BOOKINGS with FLIGHTS to get all bookings and their corresponding flight details (if any)
SELECT b.booking_id, b.booking_date, f.flight_number, f.departure_airport
FROM bookings b 
RIGHT JOIN flights f
ON b.flight_id = f.flight_id;


-- --------------------------------------------------
-- 					UNION CLAUSE Queries	 		|
-- --------------------------------------------------

-- Select flights from two different departure airports
SELECT flight_id, flight_number, departure_airport, arrival_airport
FROM flights
WHERE departure_airport = 'Delhi (DEL)'
UNION
SELECT flight_id, flight_number, departure_airport, arrival_airport
FROM flights
WHERE departure_airport = 'Mumbai (BOM)';

-- Select All Delayed and Cancelled Flights
SELECT flight_id, flight_number, status
FROM flights
WHERE status = 'On Time'
UNION
SELECT flight_id, flight_number, status
FROM flights
WHERE status = 'Cancelled';

-- Select Flights with More Than 50 Available Seats
SELECT flight_id, flight_number, seats_available
FROM flights
WHERE seats_available > 50
UNION
SELECT flight_id, flight_number, seats_available
FROM flights
WHERE flight_duration < 120;

-- Select Flights to Chennai and Bangalore
SELECT flight_id, flight_number, arrival_airport
FROM flights
WHERE arrival_airport = 'Chennai (MAA)'
UNION
SELECT flight_id, flight_number, arrival_airport
FROM flights
WHERE arrival_airport = 'Bangalore (BLR)';

-- Select flights with specific flight numbers
SELECT flight_id, flight_number, departure_airport
FROM flights
WHERE flight_number = 'AI101'
UNION
SELECT flight_id, flight_number, departure_airport
FROM flights
WHERE flight_number = 'AI102';

-- Select flights with a duration greater than 150 minutes
SELECT flight_id, flight_number, flight_duration
FROM flights
WHERE flight_duration > 150
UNION
SELECT flight_id, flight_number, flight_duration
FROM flights
WHERE status = 'On Time';

-- Select flights with arrival in specific cities
SELECT flight_id, flight_number, arrival_airport
FROM flights
WHERE arrival_airport = 'Hyderabad (HYD)'
UNION
SELECT flight_id, flight_number, arrival_airport
FROM flights
WHERE arrival_airport = 'Pune (PNQ)';

-- Select flights with specific statuses
SELECT flight_id, flight_number, status
FROM flights
WHERE status = 'On Time'
UNION
SELECT Flight_ID, Flight_Number, Status 
FROM Flights 
WHERE Status = 'Delayed';

-- Select flights with departure after a specific time
SELECT flight_id, flight_number, departure_time
FROM flights
WHERE departure_time > '2023-10-01 12:00:00'
UNION
SELECT flight_id, flight_number, departure_time
FROM flights
WHERE departure_time > '2023-10-01 14:00:00';

-- Select Flights with Different Aircraft Types
SELECT flight_id, flight_number, aircraft_type
FROM flights 
WHERE aircraft_type = 'Boeing 737'
UNION
SELECT flight_id, flight_number, aircraft_type
FROM flights 
WHERE aircraft_type = 'Airbus A320';


-- --------------------------------------------------
-- 					INTO CLAUSE Queries	 			|
-- --------------------------------------------------

-- Create a new table to store flights with less than 50 available seats
/*
SELECT flight_number, departure_airport  			This format only supported in Postgress and SQL Server 
INTO new_flights_table
FROM flights
WHERE seats_available < 50;
*/
CREATE TABLE new_flights_table AS
SELECT flight_number, departure_airport
FROM flights
WHERE seats_available < 50;

-- Create a new table to store details of flights that are delayed
CREATE TABLE delayed_flights AS
SELECT flight_id, flight_number, arrival_airport
FROM flights
WHERE status = 'Delayed';

-- Create a new table for flights that use Boeing 737 aircraft
CREATE TABLE boeing737_flights AS
SELECT flight_id, flight_number, departure_airport, arrival_airport
FROM flights
WHERE aircraft_type = 'Boeing 737';

-- Create a new table for flights that have a duration greater than 150 minutes
CREATE TABLE long_flights AS
SELECT flight_number, flight_duration
FROM flights
WHERE flight_duration > 150;

-- Create a new table for flights departing from Delhi (DEL)
CREATE TABLE delhi_departures AS
SELECT flight_number, departure_airport, arrival_airport
FROM flights
WHERE departure_airport = 'Delhi (DEL)';

-- Create a new table for flights that have no available seats
CREATE TABLE fully_booked_flights AS
SELECT flight_number, departure_airport, arrival_airport
FROM flights
WHERE seats_available = 0;


-- --------------------------------------------------
-- 					CASE CLAUSE Queries	 			|
-- --------------------------------------------------

-- Select flight numbers and provide a descriptive status message
SELECT flight_number,
	CASE
		WHEN status = 'On Time' THEN 'Flight is on schedule'
		WHEN status = 'Delayed' THEN 'Flight is delayed'
        ELSE 'Flight is Cancelled'
	END AS flight_status
FROM flights;

-- Select flight numbers and categorize them based on duration
SELECT flight_number,
	CASE
		WHEN flight_duration < 90 THEN 'Short Flight'
		WHEN flight_duration BETWEEN 90 AND 150 THEN 'Medium Flight'
        ELSE 'Long Flight'
	END AS flight_duration
FROM flights;

-- Select flight numbers and categorize seat availability
SELECT flight_number,
	CASE
		WHEN seats_available > 50 THEN 'Plenty of seats available'
		WHEN seats_available BETWEEN 20 AND 50 THEN 'Limited seats available'
        ELSE 'Almost FULL'
	END AS seats_available
FROM flights;

-- Select flight numbers and convert flight duration from minutes to hours
SELECT flight_number,
	CASE
		WHEN flight_duration < 60 THEN CONCAT(flight_duration, ' Minutes')
        ELSE CONCAT(flight_duration, ' Minutes')
	END AS seats_available
FROM flights;

-- Select flight numbers and provide status based on departure time
SELECT flight_number,
	CASE
		WHEN departure_time < NOW() THEN 'Flight has departed'
		WHEN departure_time = NOW() THEN 'Flight is departing now'
        ELSE 'Flight is scheduled to depart'
	END AS departure_time
FROM flights;

-- Select flight numbers and categorize based on aircraft type
SELECT flight_number,
	CASE 
		WHEN aircraft_type LIKE 'Boeing%' THEN 'Boeing Aircraft'
		WHEN aircraft_type LIKE 'Airbus%' THEN 'Airbus Aircraft'
        ELSE 'Long Trip'
	END AS aircraft_type
FROM flights;

-- Select flight numbers and provide a status message based on flight duration
SELECT flight_number,
	CASE
		WHEN status = 'On Time' THEN 'All systems go'
		WHEN status = 'Delayed' THEN 'Please wait for updates'
		WHEN status = 'Delayed' THEN 'We apologize for the inconvenience'
        ELSE 'Unkown Status'
	END AS status
FROM flights;


-- --------------------------------------------------
-- 					IN CLAUSE Queries	 			|
-- --------------------------------------------------

-- Select all flights arriving at Mumbai (BOM) or Delhi (DEL)
SELECT * FROM flights
WHERE arrival_airport IN ('Mumbai (BOM)', 'Delhi (DEL)');

-- Select all flights departing from Delhi (DEL), Chennai (MAA), or Bangalore (BLR)
SELECT * FROM flights
WHERE departure_airport IN ('Chennai (MAA)', 'Delhi (DEL)', 'Banglore (BLR)');

-- Select flights with specific flight numbers AI101, AI102, and AI103
SELECT * FROM flights
WHERE flight_number IN ('AI101', 'AI102', 'AI103');

-- Select all flights that are either Delayed or Cancelled
SELECT * FROM flights
WHERE status IN ('Delayed', 'Cancelled');

-- Select flights that use either Boeing 737 or Airbus A320 aircraft
SELECT * FROM flights
WHERE aircraft_type IN ('Boeing 737', 'Airbus A320');

-- Select flights that depart at specific times
SELECT * FROM flights
WHERE departure_time IN ('2023-10-01 06:00:00', '2023-10-01 09:00:00');

-- Select flights that have a duration of either 120 or 150 minutes
SELECT * FROM flights
WHERE flight_duration IN (120, 150);

-- Select flights that have either 30 or 50 available seats
SELECT * FROM flights
WHERE seats_available IN (30, 50);


-- --------------------------------------------------
-- 				BETWEEN CLAUSE Queries	 			|
-- --------------------------------------------------

-- Select all flights with a duration between 120 and 150 minutes
SELECT * FROM flights
WHERE flight_duration BETWEEN 120 AND 150;

-- Select flights that depart between 8 AM and 12 PM on October 1, 2023
SELECT * FROM flights
WHERE departure_time BETWEEN '2023-10-01 08:00:00' AND '2023-10-01 12:00:00';

-- Select flights that arrive between 10 AM and 2 PM on October 1, 2023
SELECT * FROM flights
WHERE arrival_time BETWEEN '2023-10-01 10:00:00' AND '2023-10-01 14:00:00';

-- Select flights that have between 20 and 60 available seats
SELECT * FROM flights
WHERE seats_available BETWEEN 20 AND 60;

-- Select flights with Flight_IDs between 5 and 10
SELECT * FROM flights
WHERE flight_id BETWEEN 5 AND 10;

-- Select flights with a duration less than 90 minutes
SELECT * FROM flights
WHERE flight_duration < 90;

-- Select flights that depart between 12 PM and 6 PM on October 1, 2023
SELECT * FROM flights
WHERE departure_time BETWEEN '2023-10-01 12:00:00' AND '2023-10-01 18:00:00';

-- Select flights that arrive between 6 PM and 10 PM on October 1, 2023
SELECT * FROM flights
WHERE arrival_time BETWEEN '2023-10-01 18:00:00' AND '2023-10-01 22:00:00';


-- --------------------------------------------------
-- 					LIKE CLAUSE Queries	 			|
-- --------------------------------------------------

-- Select all flights where the flight number starts with 'AI'
SELECT * FROM flights
WHERE flight_number LIKE 'AI%';

-- Select all flights where the flight number ends with '101'
SELECT * FROM flights
WHERE flight_number LIKE '%101';

-- Select all flights where the flight number contains '10'
SELECT * FROM flights
WHERE flight_number LIKE '%10%';

-- Select all flights departing from airports that have 'Delhi' in their name
SELECT * FROM flights
WHERE departure_airport LIKE '%Delhi%';

-- Select all flights arriving at airports that have 'BOM' in their code
SELECT * FROM flights
WHERE arrival_airport LIKE '%BOM%';

-- Select all flights that use aircraft types starting with 'Airbus'
SELECT * FROM flights
WHERE aircraft_type LIKE 'Airbus%';

-- Select all flights where the status contains the word 'Delayed'
SELECT * FROM flights
WHERE status LIKE '%Delayed%';

-- Select all flights where the flight number matches the pattern 'AI1__'
SELECT * FROM flights
WHERE flight_number LIKE 'AI1__';

-- Select all flights departing from airports that have 'MAA' in their code
SELECT * FROM Flights 
WHERE Departure_Airport LIKE '%MAA%';

-- Select all flights arriving at airports that start with the letter 'K'
SELECT * FROM Flights 
WHERE Arrival_Airport LIKE 'K%';


-- --------------------------------------------------
-- 					EXIST CLAUSE Queries	 		|
-- --------------------------------------------------

-- Select all flights where there exists at least one cancelled flight to the same arrival airport
SELECT * FROM flights f
WHERE EXISTS (
	SELECT 1
    FROM flights
    WHERE status = 'Cancelled' AND arrival_airport = f.arrival_airport
);

 -- Select all flights where there exists at least one delayed flight from the same departure airport
 SELECT * FROM flights f
 WHERE EXISTS(
	SELECT 1
    FROM flights
    WHERE status = 'Delayed' AND departure_airport = f.departure_airport
 );
 
 -- Select all flights where there exists at least one flight to the same destination with available seats
 SELECT * FROM flights f
 WHERE EXISTS(
	SELECT 1
    FROM flights
    WHERE arrival_airport = f.arrival_airport and seats_available > 0
 );
 
 -- Select all flights where there exists at least one flight departing at the same time
 SELECT * FROM flights f
 WHERE EXISTS (
	SELECT 1
    FROM flights
    WHERE departure_time = f.departure_time
 );
 
 -- Select all flights where there exists at least one flight using the same aircraft type
 SELECT * FROM flights f
 WHERE EXISTS (
	SELECT 1
    FROM flights
    WHERE aircraft_type = f.aircraft_type
 );
 
 
 -- -------------------------------------------------
-- 						ALIAS	 					|
-- --------------------------------------------------

-- Table Alias
SELECT f.flight_id, f.flight_number, f.departure_airport, f.arrival_airport
FROM flights f;

-- Column Alias
SELECT f.Flight_ID AS ID, f.Flight_Number AS Num, f.Departure_Airport AS Departure
FROM flights f;

-- Derived Table Alias
SELECT *
FROM (
	SELECT f.Flight_ID, f.Flight_Number, f.Departure_Airport, f.Arrival_Airport
	FROM Flights f
) AS flight_info;

-- Filtering with Alias
SELECT f.flight_id, f.flight_number, f.departure_airport
FROM flights f
WHERE f.departure_airport = 'JFK';

-- Sorting with Alias
SELECT f.flight_id, f.flight_number, f.departure_airport, f.arrival_airport
FROM flights f
ORDER BY f.departure_time;

-- Grouping with Alias
SELECT f.departure_airport, COUNT(f.flight_id) AS num_flights
FROM flights f
GROUP BY f.departure_airport;

-- Aggregate Functions with Alias
SELECT f.Departure_Airport, AVG(f.Flight_Duration) AS AvgDuration
FROM Flights f
GROUP BY f.Departure_Airport;

-- Having Clause with Alias
SELECT f.departure_airport, AVG(f.flight_duration) AS avg_duration
FROM flights f
GROUP BY f.departure_airport
HAVING AVG(f.flight_duration) = 4;


-- add a column then write a query to enter all details at 1 time.
ALTER TABLE flights ADD flight_status varchar(20);

select * from flights;

UPDATE flights
SET flight_status = 'Scheduled'
WHERE flight_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15);

UPDATE flights SET flight_status = 
  CASE
    WHEN flight_id IN (1, 2, 3) THEN 'Scheduled' 
    WHEN flight_id IN (4, 5) THEN 'Departed'
    WHEN flight_id IN (6,11,13) THEN 'Arrived'
    WHEN flight_id IN (7,12) THEN 'Delayed'
    WHEN flight_id IN (8,14,15) THEN 'Cancelled'
    WHEN flight_id IN (9) THEN 'Diverted' 
    WHEN flight_id IN (10) THEN 'Held' 
    ELSE 'Unknown' 
  END
WHERE flight_id IN  (1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15);


-- --------------------------------------------------------------
-- 							OPERATORS							|
-- ---------------------------------------------------------------- 


-- ------------------------------------------------------
-- 					ARITHMETIC OPERATORS				|
-- ------------------------------------------------------

-- Calculate the total flight duration for Flight AI101, adding 30 minutes for a layover
SELECT flight_number, flight_number + 30 AS total_duration
FROM flights
WHERE flight_number = 'AI101';

-- Calculate the remaining seats after booking 10 seats for flight AI102
SELECT flight_number, seats_available - 10 AS remaining_seats
FROM flights
WHERE flight_number = 'AI102';

-- Calculate the total available seats for all flights by summing the seats_available column
SELECT SUM(seats_available) AS total_available_seats
FROM flights;

-- Calculate the average flight duration across all flights
SELECT AVG(flight_duration) AS avg_flight_duration
FROM flights;

-- Calculate the flight duration in hours for each flight
SELECT flight_number, flight_duration/60 AS flight_duration_hours
FROM flights;

-- Calculate the percentage of available seats for each flight based on a total of 100 seats
SELECT flight_number, (seats_available/ 100.0) * 100 AS percentage_available
FROM flights;

-- Calculate the remaining flight duration after 30 minutes for each flight
SELECT flight_number, flight_duration - 30 AS remaining_flight_duration
FROM flights
WHERE flight_duration > 30;				-- Ensure we don't get negative duration

-- Calculate the total number of seats for flights that have more than 50 available seats
SELECT SUM(seats_available) AS total_seats
FROM flights
WHERE seats_available > 50;

-- Calculate the total duration of flights that are delayed
SELECT SUM(flight_duration)
FROM flights
WHERE status = 'Delayed';

-- Calculate the total flight time for flights departing from Delhi
SELECT SUM(flight_duration) AS total_flight_time
FROM flights
WHERE departure_airport = 'Delhi (DEL)';

-- Assuming a hypothetical cost of $2 per minute, calculate total cost for each flight
SELECT flight_number, 
       flight_duration * 2 AS Total_Cost 
FROM flights;

-- Calculate the total available seats for flights with a duration greater than 120 minutes
SELECT SUM(seats_available) AS total_seats_over_120 
FROM flights 
WHERE flight_duration > 120;

-- Calculate remaining seats after booking 5 seats for each flight
SELECT flight_number, 
       seats_available - 5 AS Remaining_After_Booking 
FROM flights;

-- Calculate total revenue from flights assuming a ticket price of $100 per seat
SELECT flight_number, 
       seats_available * 100 AS Total_Revenue 
FROM flights;

-- Calculate the total flight duration for flights arriving in Mumbai
SELECT SUM(flight_duration) AS Total_Duration_Mumbai 
FROM flights 
WHERE arrival_airport = 'Mumbai (BOM)';

-- Calculate the total number of available seats for flights that are on time
SELECT SUM(seats_available) AS Total_Seats_On_Time 
FROM flights 
WHERE status = 'On Time';

-- Calculate the total flight duration for flights that have more than 100 available seats
SELECT SUM(flight_duration) AS Total_Duration_Over_100 
FROM flights 
WHERE seats_available > 100;

-- Calculate the percentage of flights that are delayed compared to total flights
SELECT (COUNT(CASE WHEN status = 'Delayed' THEN 1 END) * 100) / COUNT(*) AS Percentage_Delayed 
FROM flights;

-- Calculate the total number of seats for flights with a duration of less than 30 minutes
SELECT SUM(seats_available) AS Total_Seats_Under_30 
FROM flights 
WHERE flight_duration < 30;

