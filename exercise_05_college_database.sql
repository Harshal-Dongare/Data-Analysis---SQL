
CREATE DATABASE xyz_college;
USE xyz_college;

-- Table 1

CREATE TABLE departments(
	department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    department_head VARCHAR(100),
    creation_date DATE NOT NULL,
    budget DECIMAL(15,2) CHECK (budget >=0),
    location VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    Status ENUM('Active', 'Inactive') DEFAULT 'Active'
);

INSERT INTO departments(department_id, department_name, department_head, creation_date, budget, location, phone_number, email, status)
VALUES ('1', 'Computer Science', 'Dr. Aditi Joshi', '2025-08-01', '60000.00', 'Main Campus', '022-123456789', 'cs@mumbaiuniversity.edu', 'Active'),
(2, 'Mechanical Engineering', 'Dr. Rohan Mehta', '2016-07-15', 550000.00, 'Engineering Block', '022-23456789', 'mech@mumbaiuniversity.edu', 'Active'),
(3, 'Civil Engineering', 'Dr. Priya Sharma', '2017-09-10', 500000.00, 'Engineering Block', '022-34567890', 'civil@mumbaiuniversity.edu', 'Active'),
(4, 'Electrical Engineering', 'Dr. Vikram Singh', '2018-01-20', 520000.00, 'Engineering Block', '022-45678901', 'electrical@mumbaiuniversity.edu', 'Inactive'),
(5, 'Information Technology', 'Dr. Neha Gupta', '2019-03-05', 480000.00, 'IT Building', '022-56789012', 'it@mumbaiuniversity.edu', 'Active'),
(6, 'Business Administration', 'Dr. Sanjay Rao', '2014-11-11', 700000.00, 'Management Building', '022-67890123', 'business@mumbaiuniversity.edu', 'Active'),
(7, 'Psychology', 'Dr. Anjali Verma', '2020-02-25', 300000.00, 'Arts Block', '022-78901234', 'psychology@mumbaiuniversity.edu', 'Active'),
(8, 'Economics', 'Dr. Karan Desai', '2018-06-30', 350000.00, 'Social Sciences Building', '022-89012345', 'economics@mumbaiuniversity.edu', 'Inactive'),
(9, 'Mathematics', 'Dr. Sneha Patil', '2016-04-15', 400000.00, 'Science Block', '022-90123456', 'maths@mumbaiuniversity.edu', 'Active'),
(10, 'History', 'Dr. Amit Bhatia', '2015-12-01', 250000.00, 'Arts Block', '022-01234567', 'history@mumbaiuniversity.edu', 'Active');

SELECT * FROM departments;


-- Table 2

CREATE TABLE faculty(
	faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(100) NOT NULL,
    department_id INT,
    hire_date DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    position ENUM('Professor', 'Associate Professor', 'Assistant Professor', 'Lecturer') NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
		ON DELETE SET NULL
        ON UPDATE CASCADE
);

INSERT INTO faculty(faculty_id, faculty_name, department_id, hire_Date, email, phone_number, position)
VALUES (1, 'Dr. Aditi Sharma', 1, '2015-08-01', 'aditi.sharma@mumbaiuniversity.edu.in', '987654321', 'Professor'),
(2, 'Prof. Rajesh Mehta', 2, '2016-09-15', 'rajesh.mehta@mumbaiuniversity.edu.in', '8765432109', 'Associate Professor'),
(3, 'Dr. Neha Patil', 3, '2018-01-10', 'neha.patil@mumbaiuniversity.edu.in', '7654321098', 'Assistant Professor'),
(4, 'Mr. Amit Desai', 1, '2020-07-20', 'amit.desai@mumbaiuniversity.edu.in', '6543210987', 'Lecturer'),
(5, 'Dr. Kavita Joshi', 2, '2017-05-25', 'kavita.joshi@mumbaiuniversity.edu.in', '5432109876', 'Professor'),
(6, 'Prof. Sanjay Kulkarni', 3, '2019-11-11', 'sanjay.kulkarni@mumbaiuniversity.edu.in', '4321098765', 'Associate Professor'),
(7, 'Ms. Pooja Nair', 4, '2021-06-30', 'pooja.nair@mumbaiuniversity.edu.in', '3210987654', 'Assistant Professor'),
(8, 'Dr. Ramesh Bhat', 5, '2014-03-15', 'ramesh.bhat@mumbaiuniversity.edu.in', '2109876543', 'Professor'),
(9, 'Mr. Vikram Singh', 4, '2022-02-01', 'vikram.singh@mumbaiuniversity.edu.in', '1098765432', 'Lecturer'),
(10, 'Dr. Sneha Iyer', 5, '2020-12-12', 'sneha.iyer@mumbaiuniversity.edu.in', '0987654321', 'Associate Professor');

SELECT * FROM faculty;

-- Table 3

CREATE TABLE students(
	student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    department_id INT,
    enrollment_date DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    date_of_birth DATE,
    address VARCHAR(255),
    
    CONSTRAINT chk_email_format CHECK (email LIKE '%_@__%.__%'),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
		ON DELETE SET NULL
        ON UPDATE CASCADE
);

INSERT INTO students(student_id, student_name, department_id, enrollment_date, email, phone_number, date_of_birth, address)
VALUES (1, 'Aditi Sharma', 1, '2023-08-01', 'aditi.sharma@exmaple.com', '987654321', '2005-06-15', '123, Marine Drive, Mumbai'),
(2, 'Rahul Desai', 2, '2023-08-01', 'rahul.desai@example.com', '9876543211', '2004-05-20', '456, Juhu Beach, Mumbai'),
(3, 'Sneha Patil', 1, '2023-08-01', 'sneha.patil@example.com', '9876543212', '2005-07-30', '789, Bandra, Mumbai'),
(4, 'Vikram Joshi', 3, '2023-08-01', 'vikram.joshi@example.com', '9876543213', '2004-02-10', '321, Andheri, Mumbai'),
(5, 'Priya Iyer', 2, '2023-08-01', 'priya.iyer@example.com', '9876543214', '2005-04-25', '654, Powai, Mumbai'),
(6, 'Rohit Mehta', 3, '2023-08-01', 'rohit.mehta@example.com', '9876543215', '2004-11-11', '987, Thane, Mumbai'),
(7, 'Neha Gupta', 1, '2023-08-01', 'neha.gupta@example.com', '9876543216', '2005-12-01', '159, Dadar, Mumbai'),
(8, 'Karan Singh', 2, '2023-08-01', 'karan.singh@example.com', '9876543217', '2004-09-15', '753, Malad, Mumbai'),
(9, 'Anjali Verma', 3, '2023-08-01', 'anjali.verma@example.com', '9876543218', '2005-03-05', '852, Borivali, Mumbai'),
(10, 'Siddharth Rao', 1, '2023-08-01', 'siddharth.rao@example.com', '9876543219', '2004-01-20', '963, Ghatkopar, Mumbai');

SELECT * FROM students;

-- Table 4

CREATE TABLE marks(
	mark_id INT PRIMARY KEY,
    student_id INT,
    faculty_id INT,
    subject VARCHAR(100) NOT NULL,
    marks_obtained INT CHECK (marks_obtained >= 0 AND marks_obtained <= 100),
    exam_date DATE NOT NULL,
    
    FOREIGN KEY (student_id) REFERENCES students(student_id)
		ON DELETE SET NULL
        ON UPDATE CASCADE,
	FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
		ON DELETE SET NULL
        ON UPDATE CASCADE
);

INSERT INTO marks(mark_id, student_id, faculty_id, subject, marks_obtained, exam_date)
VALUES(1, 1, 1, 'Mathematics', 85, '2023-05-15'), -- Student 1
(2, 2, 2, 'Physics', 78, '2023-05-16'),        -- Student 2
 (3, 3, 3, 'Chemistry', 92, '2023-05-17'),      -- Student 3
 (4, 4, 4, 'Biology', 88, '2023-05-18'),        -- Student 4
 (5, 5, 5, 'Computer Science', 95, '2023-05-19'), -- Student 5
 (6, 6, 6, 'English', 76, '2023-05-20'),        -- Student 6
 (7, 7, 7, 'History', 84, '2023-05-21'),        -- Student 7
 (8, 8, 8, 'Geography', 90, '2023-05-22'),      -- Student 8
 (9, 9, 9, 'Economics', 70, '2023-05-23'),      -- Student 9
 (10, 10, 10, 'Political Science', 82, '2023-05-24'); -- Student 10
 
 SELECT * FROM marks;
 
 -- Table 5
 
 CREATE TABLE salary(
	salary_id INT PRIMARY KEY,
	faculty_id INT,
    salary_amount DECIMAL(10, 2) CHECK (salary_amount >= 0),
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE
 );
 
 INSERT INTO salary(salary_id, faculty_id, salary_amount, payment_date, payment_method)
 VALUES (1, 1, 50000.00, '2023-06-30', 'Bank Transfer'),
 (2, 2, 55000.00, '2023-06-30', 'Cash'),              
(3, 3, 60000.00, '2023-06-30', 'Bank Transfer'),    
(4, 4, 52000.00, '2023-06-30', 'Cheque'),            
(5, 5, 51000.00, '2023-07-30', 'Bank Transfer'),    
(6, 2, 53000.00, '2023-07-30', 'Cash'),              
(7, 3, 59000.00, '2023-07-30', 'Bank Transfer'),    
(8, 4, 54000.00, '2023-07-30', 'Cheque'),            
(9, 1, 52000.00, '2023-08-30', 'Bank Transfer'),    
(10, 2, 55000.00, '2023-08-30', 'Cash');

SELECT * FROM salary;


-- DELETE and UPDATE operation

-- Delete a department with department_id = 1
DELETE FROM departments 
WHERE department_id = 1;

-- Check the faculty and students tables to see the effects
SELECT * FROM faculty;
SELECT * FROM students;

-- Delete a faculty member with faculty_id = 1
DELETE FROM faculty
WHERE faculty_id = 1;

-- Check the SALARY table to see if the salary record for faculty_id = 1 is deleted
SELECT * FROM salary;

-- Check the MARKS table to see the effects
SELECT * FROM marks;

-- Update a department_id from 2 to 20
UPDATE departments
SET department_id = 20
WHERE department_id = 2;

-- Check the FACULTY and STUDENTS tables to see the effects
SELECT * FROM faculty;
SELECT * FROM students;

-- Update a faculty_id from 3 to 30
UPDATE faculty
SET faculty_id = 30
WHERE faculty_id = 3;

-- Check the MARKS and SALARY tables to see the effects
SELECT * FROM marks;
SELECT * FROM salary;

-- ADD and DROP constraints on existing tables

-- Adding a FOREIGN KEY Constraint to the MARKS table
ALTER TABLE marks
ADD CONSTRAINT fk_student
FOREIGN KEY (student_id) REFERENCES students(student_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE;
    
-- Adding a UNIQUE Constraint to the FACULTY table on email
ALTER TABLE faculty
ADD CONSTRAINT uq_faculty_email UNIQUE (email);

-- Show INDEXES on table
SHOW INDEX FROM faculty;

--  Adding a Check Constraint to the SALARY table to ensure salary_amount is positive
ALTER TABLE salary
ADD CONSTRAINT chk_salary_amount CHECK (salary_amount > 0);

-- Dropping a FOREIGN KEY Constraint from the MARKS table
ALTER TABLE marks
DROP FOREIGN KEY fk_student;

-- Dropping a UNIQUE Constraint from the FACULTY table
ALTER TABLE faculty
DROP INDEX uq_faculty_email;

-- Remove duplicate index (Alternative command for above query)
DROP INDEX uq_faculty_email ON faculty;

-- Dropping a CHECK Constraint from the SALARY table
ALTER TABLE salary
DROP CHECK chk_salary_amount;

-- ERROR in the query
-- Adding a new CHECK Constraint to the STUDENTS table to ensure age is valid 
ALTER TABLE students
ADD CONSTRAINT chk_age CHECK (YEAR(CURDATE()) - YEAR(date_of_birth) >= 0);

-- Dropping the CHECK Constraint from the STUDENTS table
ALTER TABLE students
DROP CHECK chk_age;