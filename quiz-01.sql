/*
	QUIZ - 1
	1. Database - Library Management
	2. Create 5 Tables using proper attributes, datatypes & constraints
	3. Five records in each table
	4. Write all queries you have read till now
	5. Do proper documentation
*/

-- create library database
CREATE DATABASE library;

-- create database while checking if database with same name exists
CREATE DATABASE IF NOT EXISTS library;

-- delete table
DROP DATABASE library;

-- remove all entries from a table
TRUNCATE TABLE books;


-- select database
USE library;

-- -------------------------------------------------------------
--                         Table 1: BOOKS                      |
-- -------------------------------------------------------------
-- create table books
CREATE TABLE books(
	book_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for book table
	title VARCHAR(50) NOT NULL,  -- name of the book
    book_genre VARCHAR(50) NOT NULL,  -- category of the book
    author VARCHAR(50) NOT NULL, -- name of the author
    published_year CHAR(4)  -- Publishing year of the book
);

-- insert data into book table
INSERT INTO books(title, book_genre, author, published_year)
VALUES("Hold My Hand", "Romantic", "Durjoy Datta", "2014"),
("Art of Deal", "Self Help", "Donald Trump", "2009"),
("The Alchemist", "Self Help", "Paulo Cohelo", "2005"),
("Wings of Fire", "Science", "Dr. Abdul Kalam", "2003"),
("Simple Physics", "Mathematics", "H. C. Verma", "2003");

-- view books data
SELECT * FROM books;

-- -------------------------------------------------------------
--                         Table 2: MEMBER                     |
-- -------------------------------------------------------------
-- create member table
CREATE TABLE member(
	member_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for member table
	name VARCHAR(50) NOT NULL,  -- name of the member
    email VARCHAR(50) NOT NULL,  -- email of the member
    phone VARCHAR(50) NOT NULL, -- phone of the member
    membership_date DATE  -- Membership date
);

-- insert data into member table
INSERT INTO member(name, email, phone, membership_date)
VALUES("harshal", "abc123@gmail.com", "789456123", "2014-02-17"),
("jitesh", "abc456@gmail.com", "951357852", "2018-06-14"),
("shobha", "rty123@gmail.com", "741258963", "2012-09-10"),
("mansi", "opi758@gmail.com", "852364579", "2019-08-15"),
("prajakta", "prag123@gmail.com", "745612369", "2015-02-24");

-- view member data
SELECT * FROM member;

-- -------------------------------------------------------------
--                         Table 3: CATERGORY                  |
-- -------------------------------------------------------------

-- create category table
CREATE TABLE category(
	category_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for category table
	category_name VARCHAR(50) NOT NULL,  -- name of the category
    description VARCHAR(50) NOT NULL,  -- description of the category
    total_books INT NOT NULL, -- total number of books present in the category
    shelf_location VARCHAR(50)  -- location of the shelf
);

-- insert data into category table
INSERT INTO category(category_name, description, total_books, shelf_location)
VALUES ('Fiction', 'Stories that are imaginative.', 150, 'Shelf A1'),
('Non-Fiction', 'Books that provide factual information.', 120, 'Shelf B2'),
('Science', 'Books covering scientific topics.', 200, 'Shelf C3'),
('Biography', 'Life stories of notable individuals.', 80, 'Shelf D4'),
('Mystery', 'Novels filled with suspense plots.', 100, 'Shelf E5');

-- view category table
SELECT * FROM category;

-- -------------------------------------------------------------
--                         Table 4: Transaction                |
-- -------------------------------------------------------------

-- create transaction table
CREATE TABLE transaction(
	transaction_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for transaction table
	member_id INT NOT NULL,  -- name of the member
    book_id INT NOT NULL,  -- id of the book
    transaction_date DATE NOT NULL, -- date of the transaction
    transaction_type VARCHAR(50) CHECK (transaction_type IN ('issue', 'return')),  -- location of the shelf
    FOREIGN KEY (member_id) REFERENCES member(member_id),  -- link tranasaction with member table
    FOREIGN KEY (book_id) REFERENCES books(book_id)   -- link transaction with book table
);

-- insert data into TRANSACTION table
INSERT INTO transaction(member_id, book_id, transaction_date, transaction_type)
VALUES (1, 1, "2000-02-15", "issue"),
(2, 4, "2015-02-18", "return"),
(4, 2, "2014-07-12", "return"),
(5, 3, "2022-09-19", "issue"),
(3, 5, "2020-12-15", "return");

-- view transaction data
SELECT * FROM transaction;


-- -------------------------------------------------------------
--                         Table 5: STAFF                      |
-- -------------------------------------------------------------

-- create STAFF table
CREATE TABLE staff(
	staff_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for staff table
	staff_name VARCHAR(50) NOT NULL,  -- name of the staff
    position VARCHAR(50) NOT NULL,  -- position of the staff
    contact_info VARCHAR(50) NOT NULL, -- contact of the staff
    hire_date DATE NOT NULL  -- hiring date of the staff
);

-- insert data into staff table
INSERT INTO staff(staff_name, position, contact_info, hire_date)
VALUES ('Anita Sharma', 'Librarian', 'anitasharma@orkoot.com', '2020-05-15'),
('Rajesh Verma', 'Assistant Librarian', 'rajeshverma@gmail.com', '2021-03-10'),
('Pooja Reddy', 'Clerk', 'pooja.reddy@outlook.com', '2022-07-01'),
('Amit Kumar', 'Library Manager', 'amitkumar@gmail.com', '2019-09-20'),
('Sneha Gupta', 'Clerk', 'snehagupta@gmail.com', '2023-01-25');

-- view staff data
SELECT * FROM staff;