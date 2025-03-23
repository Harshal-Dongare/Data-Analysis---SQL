-- Create Database TravelAgency if not exist 
CREATE DATABASE TravelAgency;

-- Use TravelAgency Database
USE TravelAgency;

-- -----------------------------------------------------------------
-- 							Table 1: Customers
-- -----------------------------------------------------------------
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    DateOfBirth DATE
);

-- Insert data into Customers table
INSERT INTO Customers (FirstName, LastName, Email, Phone, DateOfBirth) VALUES
('Rahul', 'Sharma', 'rahul.sharma@gmail.com', '9876543210', '1988-07-20'),
('Priya', 'Patel', 'priya.patel@yahoo.com', '8765432109', '1992-03-15'),
('Amit', 'Singh', 'amit.singh@orcoot.com', '7654321098', '1985-11-10'),
('Neha', 'Gupta', 'neha.gupta@gmail.com', '6543210987', '1990-09-25'),
('Vikram', 'Yadav', 'vikram.yadav@yahoo.com', '5432109876', '1987-05-30'),
('Anjali', 'Joshi', 'anjali.joshi@gmail.com', '4321098765', '1995-02-14'),
('Rajesh', 'Kumar', 'rajesh.kumar@yahoo.com', '3210987654', '1980-12-05'),
('Sneha', 'Reddy', 'sneha.reddy@yahoo.com', '2109876543', '1993-08-18'),
('Arjun', 'Mehta', 'arjun.mehta@gmail.com', '1098765432', '1989-04-22'),
('Pooja', 'Mishra', 'pooja.mishra@gmail.com', '0987654321', '1991-06-12');


-- -----------------------------------------------------------------
-- 							Table 2: Bookings
-- -----------------------------------------------------------------
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    DestinationID INT,
    BookingDate DATE NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (DestinationID) REFERENCES Destinations(DestinationID) ON DELETE CASCADE
);

-- Insert data into Booking Table
INSERT INTO Bookings (CustomerID, DestinationID, BookingDate, TotalCost) VALUES
(1, 1, '2023-10-01', 500.00),
(2, 2, '2023-10-02', 400.00),
(3, 3, '2023-10-03', 700.00),
(4, 4, '2023-10-04', 600.00),
(5, 5, '2023-10-05', 450.00),
(6, 6, '2023-10-06', 800.00),
(7, 7, '2023-10-07', 350.00),
(8, 8, '2023-10-08', 300.00),
(9, 9, '2023-10-09', 550.00),
(10, 10, '2023-10-10', 500.00);


-- -----------------------------------------------------------------
-- 							Table 3: DESTINATIONS
-- -----------------------------------------------------------------
CREATE TABLE Destinations (
    DestinationID INT AUTO_INCREMENT PRIMARY KEY,
    DestinationName VARCHAR(100) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Description TEXT
);

-- Insert data into Bookings Table
INSERT INTO Destinations (DestinationName, Country, Price, Description) VALUES
('Taj Mahal', 'India', 500.00, 'Iconic white marble mausoleum in Agra'),
('Jaipur', 'India', 400.00, 'The Pink City, known for its historic forts'),
('Goa', 'India', 700.00, 'Famous for its beaches and nightlife'),
('Kerala', 'India', 600.00, 'Vast network of lakes and Kind hearted people.'),
('Mumbai', 'India', 450.00, 'Dream city with Bollywood that never sleeps.'),
('Leh-Ladakh', 'India', 800.00, 'Landscapes and high-altitude Places.'),
('Varanasi', 'India', 350.00, 'Spiritual city on the banks of the Ganges'),
('Rishikesh', 'India', 300.00, 'Yoga capital and gateway to the Himalayas'),
('Udaipur', 'India', 550.00, 'City of Lakes with royal palaces'),
('Shimla', 'India', 500.00, 'Hill station with colonial architecture');


-- ------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------

-- DDL (Data Definition Language) queries
-- 1. Adds a new column to store the type of membership for each customer.
ALTER TABLE Customers 
ADD COLUMN MembershipType VARCHAR(20);

-- 2. Increases the size of the `Phone` column to store longer phone numbers.
ALTER TABLE Customers 
MODIFY COLUMN Phone VARCHAR(20);

-- 3. Removes the `MembershipType` column from the `Customers` table.
ALTER TABLE Customers 
DROP COLUMN MembershipType;

-- 4. Creates an index on the `Email` column to speed up search operations.
CREATE INDEX idx_email 
ON Customers(Email);


-- DML (Data Manipulation Language) queries
SELECT * FROM Customers;
-- 5. Adds a new customer record to the `Customers` table.
INSERT INTO Customers (FirstName, LastName, Email, Phone, DateOfBirth)
VALUES ('Ravi', 'Verma', 'ravi.verma@example.com', '9876543210', '1990-01-01');

-- 6. Updates the `TotalCost` of the booking with `BookingID = 1`.
UPDATE Bookings SET TotalCost = 550.00 WHERE BookingID = 1;

-- 7. Deletes the customer with `CustomerID = 10` from the `Customers` table.
DELETE FROM Customers WHERE CustomerID = 10;

-- 8. Adds a new destination to the `Destinations` table.
INSERT INTO Destinations (DestinationName, Country, Price, Description)
VALUES ('Darjeeling', 'India', 450.00, 'Famous hill station in West Bengal');

-- DQL(Data Query Language) Queries
-- 9. Retrieves all customers born after January 1, 1990.
SELECT * FROM Customers WHERE DateOfBirth > '1990-01-01';

-- 10. Retrieves all bookings where the `TotalCost` is greater than 500.
SELECT * FROM Bookings WHERE TotalCost > 500;

-- 11. Retrieves all destinations sorted by price from highest to lowest.
SELECT * FROM Destinations ORDER BY Price DESC;

-- 12. Counts the number of bookings made by each customer.
SELECT CustomerID, COUNT(*) AS TotalBookings 
FROM Bookings 
GROUP BY CustomerID;

-- 13. Retrieves customers who have made at least one booking.
SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName 
FROM Customers c 
JOIN Bookings b ON c.CustomerID = b.CustomerID;

-- DCL(Data Control Language) Queries
-- 14. Grants SELECT permission on the `Customers` table to a specific user.
GRANT SELECT ON TravelAgency.Customers TO 'root'@'localhost';

-- 15. Revokes SELECT permission on the `Customers` table from a specific user.
REVOKE SELECT ON TravelAgency.Customers FROM 'root'@'localhost';

-- TCL(Transaction Control Language) Queries
-- 16. Starts a transaction, updates the `TotalCost` of a booking, and commits the changes.
START TRANSACTION;
UPDATE Bookings SET TotalCost = 600.00 WHERE BookingID = 2;
COMMIT;

-- Operators, Clauses, and Commands
-- 17. Retrieves customers whose first name starts with the letter 'A'.
SELECT * FROM Customers WHERE FirstName LIKE 'A%';

-- 18. Retrieves destinations with prices between 400 and 600.
SELECT * FROM Destinations WHERE Price BETWEEN 400 AND 600;

-- 19. Retrieves destinations with prices between 400 and 600.
SELECT * FROM Destinations WHERE Price BETWEEN 400 AND 600;

-- 20. Retrieves bookings made by customers with `CustomerID` 1, 3, or 5.
SELECT * FROM Bookings WHERE CustomerID IN (1, 3, 5);


-- Function(Built in & User Defined)
-- 1. Calculate the average price of all destinations.
SELECT AVG(Price) AS AveragePrice FROM Destinations;

-- 2. Find the total number of bookings made by each customer
SELECT CustomerID, COUNT(*) AS TotalBookings 
FROM Bookings 
GROUP BY CustomerID;

-- 3. Get the length of the Description for each Destination
SELECT Description, length(Description) AS DescriptionLength
FROM Destinations;

-- 4. User define function 
-- This function calculates the age of a specific customer.
DELIMITER //
CREATE FUNCTION CalculateAge(date_of_birth DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = YEAR(CURDATE()) - YEAR(date_of_birth);
    IF DATE_FORMAT(CURDATE(), '%m-%d') < DATE_FORMAT(date_of_birth, '%m-%d') THEN
        SET age = age - 1;
    END IF;
    RETURN age;
END //
DELIMITER ;

-- Usage of the Function 
SELECT 
    FirstName, 
    LastName, 
    DateOfBirth, 
    CalculateAge(DateOfBirth) AS Age 
FROM Customers;

-- 5. User defined function to Check if a Destination is Expensive
DELIMITER //
CREATE FUNCTION IsExpensiveDestination(destination_id INT) 
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(10);
    SELECT IF(Price > 1000, 'Yes', 'No') INTO result 
    FROM Destinations 
    WHERE DestinationID = destination_id;
    RETURN result;
END //
DELIMITER ;

-- Usage
SELECT 
    DestinationName,
    Price,
    IsExpensiveDestination(DestinationID) AS IsExpensive
FROM Destinations;



-- View customerbookings
-- Create a View for Expensive Bookings
CREATE VIEW CustomerBookings AS
SELECT 
    c.FirstName,
    c.LastName,
    b.BookingDate,
    d.DestinationName,
    b.TotalCost
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
JOIN Destinations d ON b.DestinationID = d.DestinationID;

-- Usage
SELECT * FROM CustomerBookings; 

-- CTEs
-- CTE to Calculate Total Bookings per Customer
WITH CustomerBookingCount AS (
    SELECT 
        CustomerID, 
        COUNT(*) AS TotalBookings
    FROM Bookings
    GROUP BY CustomerID
)
SELECT 
    c.FirstName,
    c.LastName,
    cb.TotalBookings
FROM Customers c
JOIN CustomerBookingCount cb ON c.CustomerID = cb.CustomerID;

-- Stored Procedures
-- Stored Procedure to Add a New Customer
DELIMITER //
CREATE PROCEDURE AddCustomer(
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_Email VARCHAR(100),
    IN p_Phone VARCHAR(15),
    IN p_DateOfBirth DATE
)
BEGIN
    INSERT INTO Customers (FirstName, LastName, Email, Phone, DateOfBirth)
    VALUES (p_FirstName, p_LastName, p_Email, p_Phone, p_DateOfBirth);
END //
DELIMITER ;

-- Usage
CALL AddCustomer('Vijay', 'Patil', 'vijay123@gmail.com', '9876543210', '1990-01-01');

-- Window Functions
-- 1: Rank destinations by their price in ascending order
-- This query ranks destinations based on their price, with the cheapest destination getting rank 1.
SELECT 
    DestinationID,
    DestinationName,
    Price,
    RANK() OVER (ORDER BY Price ASC) AS PriceRank
FROM Destinations;


-- 2: Calculate the running total of booking costs for each customer
-- This query calculates the cumulative total of booking costs for each customer, ordered by booking date.
SELECT 
    CustomerID,
    BookingID,
    BookingDate,
    TotalCost,
    SUM(TotalCost) OVER (PARTITION BY CustomerID ORDER BY BookingDate) AS RunningTotalCost
FROM Bookings;

-- 3: Assign a row number to each booking for a customer, ordered by booking date
-- This query assigns a unique row number to each booking for a customer, ordered by booking date.
SELECT 
    CustomerID,
    BookingID,
    BookingDate,
    TotalCost,
    ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY BookingDate) AS BookingRowNumber
FROM Bookings;

-- 4: Find the average booking cost for each customer
-- This query calculates the average booking cost for each customer.
SELECT 
    CustomerID,
    BookingID,
    TotalCost,
    AVG(TotalCost) OVER (PARTITION BY CustomerID) AS AvgBookingCost
FROM Bookings;


-- 5: Calculate the difference between each booking's cost and the average booking cost for the customer
-- This query calculates the difference between each booking's cost and the average booking cost for the customer.
SELECT 
    CustomerID,
    BookingID,
    TotalCost,
    AVG(TotalCost) OVER (PARTITION BY CustomerID) AS AvgBookingCost,
    TotalCost - AVG(TotalCost) OVER (PARTITION BY CustomerID) AS CostDifference
FROM Bookings;


-- Joins and Alias
-- 1: Inner Join with Aliases
-- Retrieve customer details along with their bookings
-- This query uses an inner join to combine customer and booking data. Aliases `c` and `b` are used for table names.
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    b.BookingID,
    b.BookingDate,
    b.TotalCost
FROM Customers c
INNER JOIN Bookings b ON c.CustomerID = b.CustomerID;


-- 2: Left Join with Aliases
-- Retrieve all customers and their bookings (if any)
-- This query uses a left join to include all customers, even if they have no bookings. Aliases `c` and `b` are used.
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    b.BookingID,
    b.BookingDate,
    b.TotalCost
FROM Customers c
LEFT JOIN Bookings b ON c.CustomerID = b.CustomerID;

-- 3: Right Join with Aliases
-- Retrieve all bookings and their corresponding customer details (if any)
-- This query uses a right join to include all bookings, even if the customer details are missing. Aliases `c` and `b` are used.
SELECT 
    b.BookingID,
    b.BookingDate,
    b.TotalCost,
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM Customers c
RIGHT JOIN Bookings b ON c.CustomerID = b.CustomerID;


-- 4: Join with Multiple Tables and Aliases
-- Retrieve customer details, booking details, and destination details
-- This query joins three tables (Customers, Bookings, Destinations) and retrieves combined data. Aliases `c`, `b`, and `d` are used.
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    b.BookingID,
    b.BookingDate,
    b.TotalCost,
    d.DestinationName,
    d.Country
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
JOIN Destinations d ON b.DestinationID = d.DestinationID;

-- 5: Self-Join with Aliases
-- Retrieve customers who share the same last name
-- This query uses a self-join to find customers who share the same last name but are not the same person. Aliases `c1` and `c2` are used.
SELECT 
    c1.CustomerID AS Customer1ID,
    c1.FirstName AS Customer1FirstName,
    c1.LastName AS Customer1LastName,
    c2.CustomerID AS Customer2ID,
    c2.FirstName AS Customer2FirstName
FROM Customers c1
JOIN Customers c2 ON c1.LastName = c2.LastName AND c1.CustomerID <> c2.CustomerID;

-- Subqueries
-- 1. Retrieve customers who have made bookings
-- This query uses a subquery to find customers who have made at least one booking.
SELECT 
    CustomerID,
    FirstName,
    LastName
FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Bookings);

-- 2. Retrieve the total number of bookings for each customer
-- This query uses a subquery in the SELECT clause to count the number of bookings for each customer.
SELECT 
    CustomerID,
    FirstName,
    LastName,
    (SELECT COUNT(*) FROM Bookings b WHERE b.CustomerID = c.CustomerID) AS TotalBookings
FROM Customers c;

-- 3. Retrieve the average booking cost for each customer
-- This query uses a subquery in the FROM clause to create a temporary table of booking details.
SELECT 
    CustomerID,
    AVG(TotalCost) AS AvgBookingCost
FROM (SELECT CustomerID, TotalCost FROM Bookings) AS BookingDetails
GROUP BY CustomerID;

-- 4. Retrieve customers who have made bookings for destinations in India
-- This query uses a subquery with EXISTS to find customers who have booked destinations in India.
SELECT 
    CustomerID,
    FirstName,
    LastName
FROM Customers c
WHERE EXISTS (
    SELECT 1 
    FROM Bookings b
    JOIN Destinations d ON b.DestinationID = d.DestinationID
    WHERE b.CustomerID = c.CustomerID AND d.Country = 'India'
);

-- 5. Retrieve customers who have made bookings with a total cost greater than 500
-- This query uses a subquery with ANY to find customers who have made bookings with a total cost greater than 500.
SELECT 
    CustomerID,
    FirstName,
    LastName
FROM Customers
WHERE CustomerID = ANY (
    SELECT CustomerID 
    FROM Bookings 
    WHERE TotalCost > 500
);




























