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
