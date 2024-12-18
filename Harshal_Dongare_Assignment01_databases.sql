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


----------------------------------------------------------------------
|                AUTOMOBILE SERVICE CENTER DATABASE                  |
----------------------------------------------------------------------
Customer Table : (Customer_ID, Name, Email, Phone, Address);
Vehicle Table : (Vehicle_ID, Customer_ID, Make, Model, Year, VIN);
Service Table : (Service_ID, Vehicle_ID, Service_Type, Service_Date, Service_Cost);
Appointment Table : (Appointment_ID, Customer_ID, Service_ID, Appointment_Date, Status);
Parts Table : (Part_ID, Service_ID, Part_Name, Part_Price, Quantity_Used);
Payment Table : (Payment_ID, Appointment_ID, Payment_Method, Payment_Date, Payment_Status);

---------------------------------------------------------------------- 
|                          MUSIC STREAMING DATABASE                  | 
---------------------------------------------------------------------- 
User Table : (User_ID, Username, Email, Join_Date, Subscription_Type); 
Artist Table : (Artist_ID, Artist_Name, Genre, Country); 
Album Table : (Album_ID, Album_Name, Artist_ID, Release_Date); 
Track Table : (Track_ID, Album_ID, Track_Name, Duration, Popularity); 
Playlist Table : (Playlist_ID, User_ID, Playlist_Name, Creation_Date); 

---------------------------------------------------------------------- 
|                          ONLINE EDUCATION DATABASE                 | 
---------------------------------------------------------------------- 
Student Table : (Student_ID, Name, Email, Phone, Registration_Date); 
Course Table : (Course_ID, Course_Name, Instructor_ID, Duration, Price); 
Instructor Table : (Instructor_ID, Name, Specialty, Email, Phone); 
Class Table : (Class_ID, Course_ID, Start_Date, End_Date, Class_Time); 
Assignment Table : (Assignment_ID, Class_ID, Title, Due_Date, Total_Marks); 

---------------------------------------------------------------------- 
|                          PET CARE DATABASE                         | 
---------------------------------------------------------------------- 
Owner Table : (Owner_ID, Name, Phone, Email, Address); 
Pet Table : (Pet_ID, Owner_ID, Pet_Name, Breed, Age, Medical_History); 
Appointment Table : (Appointment_ID, Pet_ID, Vet_ID, Appointment_Date, Purpose); 
Vet Table : (Vet_ID, Name, Specialty, Phone, Email, Clinic_Address); 
Treatment Table : (Treatment_ID, Appointment_ID, Diagnosis, Treatment, Cost); 

---------------------------------------------------------------------- 
|                          SOCIAL MEDIA DATABASE                     | 
---------------------------------------------------------------------- 
User Table : (User_ID, Name, Email, Phone, Registration_Date); 
Post Table : (Post_ID, User_ID, Content, Post_Date, Likes_Count); 
Comment Table : (Comment_ID, Post_ID, User_ID, Comment_Text, Comment_Date); 
Follow Table : (Follow_ID, Follower_ID, Followed_ID, Follow_Date); 
Message Table : (Message_ID, Sender_ID, Receiver_ID, Message_Text, Timestamp); 

---------------------------------------------------------------------- 
|                          ONLINE TRAVEL DATABASE                    | 
---------------------------------------------------------------------- 
Traveler Table : (Traveler_ID, Name, Email, Phone, Registration_Date); 
Destination Table : (Destination_ID, Name, Location, Category, Popularity); 
Package Table : (Package_ID, Destination_ID, Package_Name, Price, Duration); 
Booking Table : (Booking_ID, Traveler_ID, Package_ID, Booking_Date, Status); 
Review Table : (Review_ID, Traveler_ID, Destination_ID, Rating, Review_Text); 

*/
