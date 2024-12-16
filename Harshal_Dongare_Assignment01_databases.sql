/*

----------------------------------------------------------------------
|                 ONLINE VIDEO GAME STREAMING DATABASE				 |
----------------------------------------------------------------------
User Table : (User_ID, Username, Email, Date_Joined, Subscription_Type);
Game Table : (Game_ID, Game_Name, Genre, Release_Date, Developer);
Streamer Table: (Streamer_ID, Streamer_Name, Channel_Name, Followers, Platform);
Strem Table : (Stream_ID, Streamer_ID, Game_ID, Start_Time, End_Time);
Chat Table : (Chat_ID, Stream_ID, User_ID, Message, Timestamp);


----------------------------------------------------------------------
|                 		GROCERY STORE DATABASE				 		 |
----------------------------------------------------------------------
Customer Table : (Customer_ID, Name, Email, Phone_Number, Address);
Product Table : (Product_ID, Product_Name, Category, Price, Stock_Quantity);
Order Table : (Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status);
Order_Items Table : (Order_Item_ID, Order_ID, Product_ID, Quantity, Item_Price);
Payment Table : (Payment_ID, Order_ID, Payment_Method, Payment_Date, Payment_Status);


----------------------------------------------------------------------
|                 		  	FOOTBALL DATABASE					     |
----------------------------------------------------------------------
Player Table : (Player_ID, Player_Name, Age, Team_ID, Position);
Team Table : (Team_ID, Team_Name, Coach_Name, City, Stadium, Founded_Year);
Match Table : (Match_ID, Home_Team_ID, Away_Team_ID, Match_Date, Match_Result);
Score Table : (Score_ID, Match_ID, Player_ID, Goals_Scored, Assists);
Leagues Table: (League_ID, League_Name, Season, Start_Date, End_Date);


----------------------------------------------------------------------
|                 		  	WEATHER DATABASE					     |
----------------------------------------------------------------------
City Table : (City_ID, City_Name, Counrty, Latitude, Longitude);
Weather_Reports Table : (Report_ID, City_ID, Report_Date, Temperature, Weather_Condition);
Forecasts Table : (Forecast_ID, City_ID, Forecast_Date, Predicted_Temperature, Predicted_Weather);
Humidity Table : (Humidity_ID, City_ID, Report_Date, Humidity_Percentage, Dew_Point);
Wind_Speed Table : (Wind_ID, City_ID, Report_Date, Wind_Speed, Wind_Direction);


----------------------------------------------------------------------
|                   BANKING INSTITUITION DATABASE			         |
----------------------------------------------------------------------
Customer Table : (Customer_ID, Name, Email, Phone, Address);
Account Table : (Account_ID, Cusomter_ID, Account_Type, Balance, Date_Created);
Transaction Table : (Transaction_ID, Account_ID, Transaction_Date, Amount, Transaction_Type);
Loan Table : (Loan_ID, Customer_ID, Loan_Amount, Loan_Type, Loan_Status);
Branch Table : (Branch_ID, Branch_Name, Branch_Location, Branch_Manager, Branch_Contact);


----------------------------------------------------------------------
|                   	TOURIST PLACE DATABASE			             |
----------------------------------------------------------------------
Tourist_Place Table : (Place_ID, Place_Name, Loaction, Description, Opening_Hours);
Categories Table : (Category_ID, Category_Name, Description, Parent_Category_ID);
Attractions Table: (Attraction_ID, Place_ID, Attraction_Name, Type, Entry_Fee);
Review Table : (Review_ID, Place_ID, User_ID, Rating, Review_Text);
Bookings Table: (Booking_ID, User_ID, Place_ID, Booking_Date, Number_of_People);


----------------------------------------------------------------------
|                   	   LIBRARY DATABASE			                 |
----------------------------------------------------------------------
Books Table: (Book_ID, Title, Author, Genre, Published_Year);
Members Table: (Member_ID, Name, Email, Phone, Membership_Date);
Transactions Table: (Transaction_ID, Member_ID, Book_ID, Transaction_Date, Transaction_Type (Issue/Return));
Categories Table: (Category_ID, Category_Name, Description, Parent_Category_ID);
Staff Table: (Staff_ID, Name, Position, Contact_Info, Hire_Date);

----------------------------------------------------------------------
|                   	   MOVIE WEBSITE DATABASE			         |
----------------------------------------------------------------------
Movie Table : (Movie_ID, Movie_Title, Genre, Release_Year, Director);
Actor Table : (Actor_ID, Actor_Name, Date_Of_Birth, Nationality, Gender);
Director Table : (Director_ID, Director_Name, Date_Of_Birth, Nationality, Gender);
Reviews Table : (Review_ID, Movie_ID, User_ID, Rating, Review_Text);
Showtimes Table : (Showtime_ID, Movie_ID, Cinema_ID, Showtime_Date, Showtime_Time);


----------------------------------------------------------------------
|                   	   RESTAURANT DATABASE			             |
----------------------------------------------------------------------
Customer Table : (Customer_ID, Name, Phone, Email, Address);
Menu Table : (Menu_Item_ID, Item_Name, Category, Price, Description);
Order Table : (Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status);
Order_Items Table : (Order_Item_ID, Order_ID, Menu_Item_ID, Quantity, Item_Price);
Reservation Table : (Reservation_ID, Customer_ID, Reservation_Date, Table_Number, Reservation_Status);


----------------------------------------------------------------------
|                   	   REAL ESTATE DATABASE			             |
----------------------------------------------------------------------
Property Table : (Property_ID, Property_Name, Property_Type, Location, Price);
Customer Table : (Customer_ID, Name, Email, Phone, Address);
Agent Table : (Agent_ID, Agent_Name, Phone, Email, Agency_Name);
Transaction Table : (Transaction_ID, Property_ID, Customer_ID, Transaction_Date, Transaction_Amount);
Inspection Table : (Inspection_ID, Property_ID, Customer_ID, Inspection_Date, Inspection_Status);


----------------------------------------------------------------------
|                   	ONLINE LEARNING DATABASE			         |
----------------------------------------------------------------------
Student Table : (Student_ID, Name, Email, Phone, Enrollment_Date);
Course Table : (Course_ID, Course_Name, Instructor_ID, Duration, Price);
Instructor Table : (Instructor_ID, Instructor_Name, Email, Phone, Department);
Enrollment Table : (Enrollment_ID, Student_ID, Course_ID, Enrollment_Date, Completion_Status);
Assignment Table : (Assignment_ID, Course_ID, Title, Due_Date, Total_Marks);


----------------------------------------------------------------------
|                   	ONLINE LEARNING DATABASE			         |
----------------------------------------------------------------------



*/