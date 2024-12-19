/*

----------------------------------------------------------------------
|                 ONLINE VIDEO GAME STREAMING DATABASE               |
----------------------------------------------------------------------
User Table : (User_ID, Username, Email, Date_Joined, Subscription_Type);
Game Table : (Game_ID, Game_Name, Genre, Release_Date, Developer);
Streamer Table: (Streamer_ID, Streamer_Name, Channel_Name, Followers, Platform);
Strem Table : (Stream_ID, Streamer_ID, Game_ID, Start_Time, End_Time);
Chat Table : (Chat_ID, Stream_ID, User_ID, Message, Timestamp);


----------------------------------------------------------------------
|                       GROCERY STORE DATABASE                       |
----------------------------------------------------------------------
Customer Table : (Customer_ID, Name, Email, Phone_Number, Address);
Product Table : (Product_ID, Product_Name, Category, Price, Stock_Quantity);
Order Table : (Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status);
Order_Items Table : (Order_Item_ID, Order_ID, Product_ID, Quantity, Item_Price);
Payment Table : (Payment_ID, Order_ID, Payment_Method, Payment_Date, Payment_Status);


----------------------------------------------------------------------
|                          FOOTBALL DATABASE                         |
----------------------------------------------------------------------
Player Table : (Player_ID, Player_Name, Age, Team_ID, Position);
Team Table : (Team_ID, Team_Name, Coach_Name, City, Stadium, Founded_Year);
Match Table : (Match_ID, Home_Team_ID, Away_Team_ID, Match_Date, Match_Result);
Score Table : (Score_ID, Match_ID, Player_ID, Goals_Scored, Assists);
Leagues Table: (League_ID, League_Name, Season, Start_Date, End_Date);


----------------------------------------------------------------------
|                           WEATHER DATABASE                         |
----------------------------------------------------------------------
City Table : (City_ID, City_Name, Counrty, Latitude, Longitude);
Weather_Reports Table : (Report_ID, City_ID, Report_Date, Temperature, Weather_Condition);
Forecasts Table : (Forecast_ID, City_ID, Forecast_Date, Predicted_Temperature, Predicted_Weather);
Humidity Table : (Humidity_ID, City_ID, Report_Date, Humidity_Percentage, Dew_Point);
Wind_Speed Table : (Wind_ID, City_ID, Report_Date, Wind_Speed, Wind_Direction);


----------------------------------------------------------------------
|                   BANKING INSTITUITION DATABASE                    |
----------------------------------------------------------------------
Customer Table : (Customer_ID, Name, Email, Phone, Address);
Account Table : (Account_ID, Cusomter_ID, Account_Type, Balance, Date_Created);
Transaction Table : (Transaction_ID, Account_ID, Transaction_Date, Amount, Transaction_Type);
Loan Table : (Loan_ID, Customer_ID, Loan_Amount, Loan_Type, Loan_Status);
Branch Table : (Branch_ID, Branch_Name, Branch_Location, Branch_Manager, Branch_Contact);


----------------------------------------------------------------------
|                       TOURIST PLACE DATABASE                       |
----------------------------------------------------------------------
Tourist_Place Table : (Place_ID, Place_Name, Loaction, Description, Opening_Hours);
Categories Table : (Category_ID, Category_Name, Description, Parent_Category_ID);
Attractions Table: (Attraction_ID, Place_ID, Attraction_Name, Type, Entry_Fee);
Review Table : (Review_ID, Place_ID, User_ID, Rating, Review_Text);
Bookings Table: (Booking_ID, User_ID, Place_ID, Booking_Date, Number_of_People);


----------------------------------------------------------------------
|                          LIBRARY DATABASE                          |
----------------------------------------------------------------------
Books Table: (Book_ID, Title, Author, Genre, Published_Year);
Members Table: (Member_ID, Name, Email, Phone, Membership_Date);
Transactions Table: (Transaction_ID, Member_ID, Book_ID, Transaction_Date, Transaction_Type (Issue/Return));
Categories Table: (Category_ID, Category_Name, Description, Parent_Category_ID);
Staff Table: (Staff_ID, Name, Position, Contact_Info, Hire_Date);

----------------------------------------------------------------------
|                          MOVIE WEBSITE DATABASE                    |
----------------------------------------------------------------------
Movie Table : (Movie_ID, Movie_Title, Genre, Release_Year, Director);
Actor Table : (Actor_ID, Actor_Name, Date_Of_Birth, Nationality, Gender);
Director Table : (Director_ID, Director_Name, Date_Of_Birth, Nationality, Gender);
Reviews Table : (Review_ID, Movie_ID, User_ID, Rating, Review_Text);
Showtimes Table : (Showtime_ID, Movie_ID, Cinema_ID, Showtime_Date, Showtime_Time);


----------------------------------------------------------------------
|                        RESTAURANT DATABASE                         |
----------------------------------------------------------------------
Customer Table : (Customer_ID, Name, Phone, Email, Address);
Menu Table : (Menu_Item_ID, Item_Name, Category, Price, Description);
Order Table : (Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status);
Order_Items Table : (Order_Item_ID, Order_ID, Menu_Item_ID, Quantity, Item_Price);
Reservation Table : (Reservation_ID, Customer_ID, Reservation_Date, Table_Number, Reservation_Status);


----------------------------------------------------------------------
|                          REAL ESTATE DATABASE                      |
----------------------------------------------------------------------
Property Table : (Property_ID, Property_Name, Property_Type, Location, Price);
Customer Table : (Customer_ID, Name, Email, Phone, Address);
Agent Table : (Agent_ID, Agent_Name, Phone, Email, Agency_Name);
Transaction Table : (Transaction_ID, Property_ID, Customer_ID, Transaction_Date, Transaction_Amount);
Inspection Table : (Inspection_ID, Property_ID, Customer_ID, Inspection_Date, Inspection_Status);


----------------------------------------------------------------------
|                       ONLINE LEARNING DATABASE                     |
----------------------------------------------------------------------
Student Table : (Student_ID, Name, Email, Phone, Enrollment_Date);
Course Table : (Course_ID, Course_Name, Instructor_ID, Duration, Price);
Instructor Table : (Instructor_ID, Instructor_Name, Email, Phone, Department);
Enrollment Table : (Enrollment_ID, Student_ID, Course_ID, Enrollment_Date, Completion_Status);
Assignment Table : (Assignment_ID, Course_ID, Title, Due_Date, Total_Marks);


----------------------------------------------------------------------
|                  E-COMMERCE PLATFORM DATABASE                      |
----------------------------------------------------------------------
Customer Table : (Customer_ID, Name, Email, Phone_Number, Shipping_Address);
Product Table : (Product_ID, Product_Name, Category, Price, Stock_Quantity);
Order Table : (Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status);
Order_Items Table : (Order_Item_ID, Order_ID, Product_ID, Quantity, Item_Price);
Payment Table : (Payment_ID, Order_ID, Payment_Method, Payment_Date, Payment_Status);
Shipping Table : (Shipping_ID, Order_ID, Shipping_Address, Shipping_Method, Shipping_Status);


----------------------------------------------------------------------
|                      HEALTHCARE SYSTEM DATABASE                    |
----------------------------------------------------------------------
Patient Table : (Patient_ID, Name, DOB, Gender, Contact_Info, Address);
Doctor Table : (Doctor_ID, Name, Specialty, Phone, Email, Office_Location);
Appointment Table : (Appointment_ID, Patient_ID, Doctor_ID, Appointment_Date, Status);
Prescription Table : (Prescription_ID, Appointment_ID, Medication, Dosage, Start_Date, End_Date);
Billing Table : (Billing_ID, Patient_ID, Appointment_ID, Amount, Payment_Status);


----------------------------------------------------------------------
|                      AIRLINE RESERVATION DATABASE                  |
----------------------------------------------------------------------
Flight Table : (Flight_ID, Flight_Code, Origin, Destination, Departure_Time, Arrival_Time);
Passenger Table : (Passenger_ID, Name, Email, Phone, Passport_Number);
Booking Table : (Booking_ID, Passenger_ID, Flight_ID, Booking_Date, Seat_Type, Price);
Ticket Table : (Ticket_ID, Booking_ID, Ticket_Number, Issue_Date, Status);
Payment Table : (Payment_ID, Booking_ID, Payment_Method, Payment_Date, Payment_Status);


----------------------------------------------------------------------
|                    HOSPITALITY MANAGEMENT DATABASE                 |
----------------------------------------------------------------------
Hotel Table : (Hotel_ID, Hotel_Name, Location, Contact_Info, Star_Rating);
Room Table : (Room_ID, Hotel_ID, Room_Type, Price, Available_Quantity);
Booking Table : (Booking_ID, Customer_ID, Room_ID, Check_In_Date, Check_Out_Date);
Customer Table : (Customer_ID, Name, Email, Phone, Address);
Payment Table : (Payment_ID, Booking_ID, Payment_Method, Payment_Date, Amount);


----------------------------------------------------------------------
|                      FITNESS CENTER DATABASE                       |
----------------------------------------------------------------------
Member Table : (Member_ID, Name, Email, Phone, Membership_Start_Date, Membership_Type);
Trainer Table : (Trainer_ID, Name, Specialty, Contact_Info);
Class Table : (Class_ID, Trainer_ID, Class_Name, Class_Date, Class_Time, Capacity);
Membership Table : (Membership_ID, Member_ID, Start_Date, End_Date, Payment_Status);
Attendance Table : (Attendance_ID, Class_ID, Member_ID, Attendance_Date);


----------------------------------------------------------------------
|                    SUPPLY CHAIN MANAGEMENT DATABASE                |
----------------------------------------------------------------------
Supplier Table : (Supplier_ID, Supplier_Name, Contact_Info, Location);
Product Table : (Product_ID, Product_Name, Category, Price, Supplier_ID);
Inventory Table : (Inventory_ID, Product_ID, Quantity, Warehouse_Location);
Order Table : (Order_ID, Supplier_ID, Order_Date, Total_Amount, Order_Status);
Shipment Table : (Shipment_ID, Order_ID, Shipping_Date, Estimated_Arrival, Shipment_Status);


----------------------------------------------------------------------
|                    EVENT MANAGEMENT DATABASE                       |
----------------------------------------------------------------------
Event Table : (Event_ID, Event_Name, Event_Date, Location, Organizer_ID);
Organizer Table : (Organizer_ID, Organizer_Name, Contact_Info);
Participant Table : (Participant_ID, Event_ID, Participant_Name, Email, Phone);
Ticket Table : (Ticket_ID, Event_ID, Participant_ID, Ticket_Type, Price);
Sponsorship Table : (Sponsorship_ID, Event_ID, Sponsor_Name, Contribution_Amount);


----------------------------------------------------------------------
|                        ONLINE MARKETPLACE DATABASE                 |
----------------------------------------------------------------------
Seller Table : (Seller_ID, Seller_Name, Contact_Info, Rating);
Product Table : (Product_ID, Product_Name, Category, Price, Seller_ID, Stock_Quantity);
Customer Table : (Customer_ID, Customer_Name, Contact_Info, Address);
Order Table : (Order_ID, Customer_ID, Order_Date, Total_Amount, Shipping_Status);
Review Table : (Review_ID, Product_ID, Customer_ID, Rating, Review_Text);


----------------------------------------------------------------------
|                        SMART HOME DATABASE                         |
----------------------------------------------------------------------
Device Table : (Device_ID, Device_Name, Device_Type, Status, Location);
User Table : (User_ID, User_Name, Email, Phone, Address);
Room Table : (Room_ID, Room_Name, House_ID, Location);
House Table : (House_ID, House_Name, Owner_ID, Location);
Event Table : (Event_ID, Device_ID, Event_Type, Event_Time, Status);

*/

-- ----------------------------------------------------------------------
-- |                        Ecommerce Dababase                          |
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- |                        Table 1: CUSTOMER                           |
-- ----------------------------------------------------------------------

-- Create Customer Table
CREATE TABLE customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Phone_Number INT NOT NULL,
    Shipping_Address VARCHAR(100) NOT NULL
);

-- Insert data into Customer Table
INSERT INTO customer (Customer_ID, Customer_Name, Email, Phone_Number, Shipping_Address)
VALUES
(1, 'Rajesh Kumar', 'rajesh.kumar@example.com', 9876543210, '123 MG Road, Bangalore, Karnataka'),
(2, 'Anjali Sharma', 'anjali.sharma@example.com', 9123456780, '45 Park Street, Kolkata, West Bengal'),
(3, 'Amit Patel', 'amit.patel@example.com', 7890123456, '67 Gandhi Nagar, Ahmedabad, Gujarat'),
(4, 'Priya Singh', 'priya.singh@example.com', 8765432109, '89 Civil Lines, Jaipur, Rajasthan'),
(5, 'Vikram Malhotra', 'vikram.malhotra@example.com', 9988776655, '12 Residency Road, Chennai, Tamil Nadu'),
(6, 'Meera Iyer', 'meera.iyer@example.com', 9901234567, '55 Marine Drive, Mumbai, Maharashtra'),
(7, 'Ravi Verma', 'ravi.verma@example.com', 9812345678, '23 Sector-17, Chandigarh, Punjab'),
(8, 'Sneha Rao', 'sneha.rao@example.com', 8007654321, '45 Residency Road, Hyderabad, Telangana'),
(9, 'Nikhil Gupta', 'nikhil.gupta@example.com', 8098765432, '100 Ganga Nagar, Pune, Maharashtra'),
(10, 'Pooja Chatterjee', 'pooja.chatterjee@example.com', 7654321098, '78 Salt Lake, Kolkata, West Bengal');

-- delete rows and columns from table Customer
TRUNCATE TABLE customer;

-- delete entire table from database
DROP customer

-- View data in Customer Table
SELECT * FROM customer;


-- ----------------------------------------------------------------------
-- |                        Table 2: PRODUCT                            |
-- ----------------------------------------------------------------------

-- Create Product Table
CREATE TABLE product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price INT NOT NULL,
    Stock_Quantity INT NOT NULL
);

-- Insert data into Product Table
INSERT INTO product (Product_ID, Product_Name, Category, Price, Stock_Quantity)
VALUES
(1, 'Laptop', 'Electronics', 79999, 50),
(2, 'Smartphone', 'Electronics', 69999, 100),
(3, 'Headphones', 'Accessories', 29999, 200),
(4, 'Smartwatch', 'Accessories', 12999, 150),
(5, 'Bluetooth Speaker', 'Accessories', 9999, 300),
(6, 'Television', 'Electronics', 159999, 20),
(7, 'Camera', 'Electronics', 139999, 30),
(8, 'Keyboard', 'Accessories', 24999, 500),
(9, 'Gaming Console', 'Electronics', 59999, 75),
(10, 'Tablet', 'Electronics', 35999, 60);

-- View data in Product Table
SELECT * FROM product;


-- ----------------------------------------------------------------------
-- |                        Table 3: ORDER                              |
-- ----------------------------------------------------------------------

-- Create Order Table
CREATE TABLE orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Amount INT NOT NULL,
    Order_Status VARCHAR(20) NOT NULL,
);

-- Insert data into Order Table
INSERT INTO orders (Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status)
VALUES
(1, 1, '2024-01-01', 5000, 'Completed'),
(2, 2, '2024-01-02', 15000, 'Pending'),
(3, 3, '2024-01-03', 10000, 'Completed'),
(4, 4, '2024-01-04', 2000, 'Cancelled'),
(5, 5, '2024-01-05', 7500, 'Pending'),
(6, 6, '2024-01-06', 12000, 'Completed'),
(7, 7, '2024-01-07', 18000, 'Processing'),
(8, 8, '2024-01-08', 3000, 'Completed'),
(9, 9, '2024-01-09', 2500, 'Processing'),
(10, 10, '2024-01-10', 9500, 'Cancelled');

-- View data in Order Table
SELECT * FROM orders;


-- ----------------------------------------------------------------------
-- |                        Table 4: ORDER _ITEMS                       |
-- ----------------------------------------------------------------------

-- Create Order_Items Table
CREATE TABLE order_items (
    Order_Item_ID INT PRIMARY KEY,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL,
    Item_Price INT NOT NULL,
);

-- Insert data into Order_Items Table
INSERT INTO order_items (Order_Item_ID, Order_ID, Product_ID, Quantity, Item_Price)
VALUES
(1, 1, 1, 1, 79999),
(2, 1, 3, 2, 29999),
(3, 2, 4, 1, 12999),
(4, 2, 5, 3, 9999),
(5, 3, 6, 1, 159999),
(6, 3, 8, 1, 24999),
(7, 4, 2, 2, 69999),
(8, 5, 7, 1, 139999),
(9, 6, 9, 1, 59999),
(10, 7, 10, 2, 35999);

-- View data in Order_Items Table
SELECT * FROM order_items;

-- ----------------------------------------------------------------------
-- |                        Table 5: PAYMENT                            |
-- ----------------------------------------------------------------------

-- Create Payment Table
CREATE TABLE payment (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT NOT NULL,
    Payment_Method VARCHAR(20) NOT NULL,
    Payment_Date DATE NOT NULL,
    Payment_Status VARCHAR(20) NOT NULL,
);

-- Insert data into Payment Table
INSERT INTO payment (Payment_ID, Order_ID, Payment_Method, Payment_Date, Payment_Status)
VALUES
(1, 1, 'Credit Card', '2024-01-02', 'Completed'),
(2, 2, 'Debit Card', '2024-01-03', 'Pending'),
(3, 3, 'Net Banking', '2024-01-04', 'Completed'),
(4, 4, 'Cash', '2024-01-05', 'Cancelled'),
(5, 5, 'Credit Card', '2024-01-06', 'Pending'),
(6, 6, 'Debit Card', '2024-01-07', 'Completed'),
(7, 7, 'Cash', '2024-01-08', 'Processing'),
(8, 8, 'Credit Card', '2024-01-09', 'Completed'),
(9, 9, 'Net Banking', '2024-01-10', 'Processing'),
(10, 10, 'Debit Card', '2024-01-11', 'Cancelled');

-- View data in Payment Table
SELECT * FROM payment;
