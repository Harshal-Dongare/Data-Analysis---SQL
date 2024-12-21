/*
What is a data type? Give two examples.
-> A data type defines the kind of data a column can hold in a database. It helps ensure data
   is stored and processed correctly.
   Examples:
   a. INT : Used to store whole numbers (eg., 10, 25)
   b. VARCHAR : Used to store text or strings (eg., "John", "Hello")
   c. DATE : Used to store dates (eg., "2024-12-21")
   d. FLOAT : Used to store decimal numbers (eg., 12.34, 3.14)
*/

CREATE TABLE ExampleTable (
    ID INT,
    Name VARCHAR(50),
    BirthDate DATE,
    Salary FLOAT
);

-- -----------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------

/*
What is the purpose of constraints in a database?
-> Constraints ensure the accuracy(data is correct), reliabilty(data follows rules), and
   integrity(data is consistent) of data in a database by defining rules for the data.
   
   Key purpose include:
   1. Prevent invalid data entry (eg., NOT NULL ensures no empty values).
   2. Maintain relationships between tables (e.g., FOREIGN KEY).
   3. Enforce uniqueness (e.g., PRIMARY KEY OR UNIQUE).
   4. Apply custom conditions (e.g., CHECK).
   5. Set default values for columns (e.g., DEFAULT ensures a value is assigned automatically).
   6. Improve query performance using indexes (e.g., CREATE INDEX speeds up data retrieval).
*/

-- -----------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------

/*
Define the PRIMARY KEY constraints.
-> The PRIMARY KEY uniquely identifies each record in a table. It ensures that:
   1. The value is unique in every row.
   2. The value cannot be NULL.
*/

CREATE TABLE Students (
student_id INT PRIMARY KEY, 
name VARCHAR(50)
);

-- -----------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------

/*
What is the difference between CHAR and VARCHAR data types?
-> 1. Storage:
      - CHAR : Fixed-length. Always uses the specified size, even if the value is shorter.
      - VARCHAR : Variable-length. Uses only as much space as needed for the value.
   2. Performance:
      - CHAR : Faster for fixed length data because it doesn't adjust storage.
      - VARCHAR : Can be slower because it adjust the storage space based on the length of the data, which 
                  takes extra effort.ALTER
   3. Use Case : 
      - CHAR : Suitable for fixed-size data like PIN codes or status codes (e.g., "YES", "NO")
      - VARCHAR : Suitable for variable-size data like names or descriptions.
*/

CREATE TABLE user_accounts(
country_code CHAR(2),   -- Fixed length, always stores 2 characters (e.g., "IN", "US")
username VARCHAR(50)    -- Variable-length, stores names of different lengths
);

-- -----------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------

/*
Write a SQL query to select all authors from the Authors table.
*/
SELECT * FROM authors;

-- -----------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------

/*
What does the NOT NULL constraint do?
-> The NOT NULL constraints ensures that a column cannot have a NULL value. It forces the user to
   provide a value for that column when inserting or updating records.
*/

CREATE TABLE authors(
author_id INT NOT NULL,   -- author_id cannot be NULL
name VARCHAR(100) NOT NULL    -- Name cannot be NULL 
);


-- -----------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------

