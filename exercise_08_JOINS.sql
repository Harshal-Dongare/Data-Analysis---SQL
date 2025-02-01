-- Create a new database named 'demojoins'
CREATE DATABASE demojoins;

-- Use the newly created database for subsequent operations
USE demojoins;

-- Create a table named 'student' with an ID and name
CREATE TABLE student(
	id INT PRIMARY KEY,				-- 'id' is the primary key and must be unique 
    student_name VARCHAR(50)		-- 'student_name' can hold up to 50 characters
);

-- Insert records into the 'student' table
INSERT INTO student
VALUES(101, 'Kirti'),			-- ID 101 for student Kirti
(102, 'Ravi'),					-- ID 102 for student Ravi
(103, 'Lavish'),				-- ID 103 for student Lavish
(104, 'Trisha');				-- ID 104 for student Trisha

-- Retrieve all records from the 'student' table
SELECT * FROM student;


-- Create a table named 'course' with an ID and course name
CREATE TABLE course(
	id INT PRIMARY KEY, 		-- 'id' 107 for course English
    course_name VARCHAR(80)		-- 'course_name' can hold up to 80 characters
);

-- Insert records into the 'course' table
INSERT INTO course
VALUES (107, 'English'),		-- ID 107 for course English
(102, 'Python'),				-- ID 102 for course Python
(104, 'Hindi'),					-- ID 104 for course Hindi
(108, 'Maths');					-- ID 108 for course Maths

-- Retrieve all records from the 'course' table
SELECT * FROM course;

-- INNER JOIN (also known as Simple Join / Equi Join)
-- Retrieves records that have matching values in both  tables involved in the JOIN
-- Retrieve records with matching IDs from both sides

SELECT T1.id, student_name, course_name
FROM student T1
INNER JOIN 
course T2 ON T1.id = T2.id;



-- Table-1
-- Create the faculty table to store information about faculty members
CREATE TABLE faculty (
  faculty_id INT PRIMARY KEY, -- Unique identifier for each faculty
  faculty_name VARCHAR(255), -- Name of the faculty
  faculty_description TEXT, -- Description of the faculty
  dean VARCHAR(255), -- Dean of the faculty
  faculty_location VARCHAR(255), -- Location of the faculty
  faculty_contact_info VARCHAR(255) -- Contact information for the faculty
);

-- Insert sample data into the faculty table
INSERT INTO faculty (faculty_id, faculty_name, faculty_description, dean, faculty_location, faculty_contact_info) VALUES
(1, 'Faculty of Science', 'Covers various scientific disciplines', 'Dr. Alice Smith', 'Building A', 'alice.smith@example.com'),
(2, 'Faculty of Engineering', 'Focuses on engineering and technology', 'Dr. Bob Johnson', 'Building B', 'bob.johnson@example.com'),
(3, 'Faculty of Arts', 'Includes humanities and social sciences', 'Dr. Carol Williams', 'Building C', 'carol.williams@example.com'),
(4, 'Faculty of Business', 'Offers business and management courses', 'Dr. David Brown', 'Building D', 'david.brown@example.com'),
(5, 'Faculty of Education', 'Dedicated to teacher training and education studies', 'Dr. Eva Davis', 'Building E', 'eva.davis@example.com');


-- Table-2
-- Create the department table to store information about departments within faculties
CREATE TABLE department (
  department_id INT PRIMARY KEY, -- Unique identifier for each department
  department_name VARCHAR(255), -- Name of the department
  department_description TEXT, -- Description of the department
  faculty_id INT, -- Foreign key referencing the faculty
  department_head VARCHAR(255), -- Head of the department
  department_location VARCHAR(255), -- Location of the department
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the department table
INSERT INTO department (department_id, department_name, department_description, faculty_id, department_head, department_location) VALUES
(1, 'Department of Physics', 'Study of matter and energy', 1, 'Dr. Emily White', 'Room 101'),
(2, 'Department of Computer Science', 'Focus on computing and programming', 1, 'Dr. Frank Green', 'Room 102'),
(3, 'Department of Civil Engineering', 'Deals with infrastructure and construction', 2, 'Dr. Grace Black', 'Room 201'),
(4, 'Department of Mechanical Engineering', 'Focus on machinery and mechanics', 2, 'Dr. Henry Blue', 'Room 202'),
(5, 'Department of History', 'Study of past events and societies', 3, 'Dr. Irene Red', 'Room 301');


-- Table-3
-- Create the students table to store information about students
CREATE TABLE students (
  student_id INT PRIMARY KEY, -- Unique identifier for each student
  student_name VARCHAR(255), -- Name of the student
  student_email VARCHAR(255), -- Email of the student
  department_id INT, -- Foreign key referencing the department
  enrollment_year INT, -- Year of enrollment
  faculty_id INT, -- Foreign key referencing the faculty
  FOREIGN KEY (department_id) REFERENCES department(department_id), -- Establishing relationship with department
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the students table
INSERT INTO students (student_id, student_name, student_email, department_id, enrollment_year, faculty_id) VALUES
(1, 'John Doe', 'john.doe@example.com', 1, 2021, 1),
(2, 'Jane Smith', 'jane.smith@example.com', 2, 2020, 1),
(3, 'Alice Johnson', 'alice.johnson@example.com', 1, 2022, 1),
(4, 'Bob Brown', 'bob.brown@example.com', 3, 2021, 2),
(5, 'Charlie Davis', 'charlie.davis@example.com', 4, 2023, 2);


-- Table-4
-- Create the salary table to store salary information for faculty members
CREATE TABLE salary (
  salary_id INT PRIMARY KEY, -- Unique identifier for each salary record
  faculty_id INT, -- Foreign key referencing the faculty
  amount DECIMAL(10, 2), -- Salary amount
  payment_date DATE, -- Date of salary payment
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the salary table
INSERT INTO salary (salary_id, faculty_id, amount, payment_date) VALUES
(1, 1, 75000.00, '2023-01-15'),
(2, 2, 80000.00, '2023-01-15'),
(3, 3, 70000.00, '2023-01-15'),
(4, 4, 72000.00, '2023-01-15'),
(5, 5, 68000.00, '2023-01-15');

-- Table-5
-- Create the marks table to store marks obtained by students
CREATE TABLE marks (
  marks_id INT PRIMARY KEY, -- Unique identifier for each marks record
  student_id INT, -- Foreign key referencing the student
  subject_name VARCHAR(255), -- Name of the subject
  marks_obtained INT, -- Marks obtained by the student
  semester INT, -- Semester in which the marks were obtained
  FOREIGN KEY (student_id) REFERENCES students(student_id) -- Establishing relationship with students
);

-- Insert sample data into the marks table
INSERT INTO marks (marks_id, student_id, subject_name, marks_obtained, semester) VALUES
(1, 1, 'Physics', 85, 1),
(2, 1, 'Mathematics', 90, 1),
(3, 2, 'Computer Science', 88, 2),
(4, 3, 'Physics', 92, 1),
(5, 4, 'Civil Engineering', 75, 2),
(6, 5, 'Business Management', 80, 1);

-- JOIN 2 tables
SELECT faculty.faculty_id, faculty_name, student_name
FROM students
INNER JOIN
faculty ON students.faculty_id = faculty.faculty_id;

-- JOIN 2 tables
SELECT faculty.*, student_name
FROM students
INNER JOIN faculty ON students.faculty_id = faculty.faculty_id;


-- LEFT JOIN (also known as LEFT OUTER JOIN)
-- Retrieves all records from the left table and the matched records from the right table
-- Retrieves all records from 'student' and matching records from 'course'

SELECT student.id, student_name, course_name
FROM student
LEFT JOIN
course ON student.id = course.id;


-- RIGHT JOIN (also known as RIGHT OUTER JOIN)
-- Retrieves  all records from the right table and the matched records from the left table
-- Retrieves all records from the 'course' and matching records from 'student'

SELECT student.id, student_name, course_name
FROM student
RIGHT JOIN
course ON student.id = course.id;


-- FULL JOIN (also known as FULL OUTER JOIN)
/* It retrieves all records  from both tables, matching rows where possible, and filling in NULL values where
   there are no matches.
*/
-- Retrieves all records from both tables, with NULLs where there are no matches

SELECT student.id, student_name, course_name
FROM student
LEFT JOIN course ON student.id = course.id
UNION
SELECT student.id, student_name, course_name
FROM student
RIGHT JOIN course ON student.id = course.id;


-- LEFT EXCLUSIVE JOIN (also known as LEFT ANTI JOIN)
-- Retrieves rows from the left table that do not have matching rows in the right table
-- Retrives records from 'student' that do not have matches in 'course'
SELECT student.id, student_name, course_name
FROM student
LEFT JOIN course ON student.id = course.id
WHERE course.id IS NULL;


-- RIGHT EXCLUSIVE JOIN (also known as RIGHT ANTI JOIN)
-- Retrives rows from the right table that do not have matching rows in the left table.
-- Retrives records from 'course' that do not have matches in 'student'
SELECT student.id, student_name, course_name
FROM student
RIGHT JOIN course ON student.id = course.id
WHERE student.id IS NULL;


-- SELF JOIN (INNER SELF JOIN/ OUTER SELF JOIN/ SELF REFERENCE JOIN/ SELF-RELATING JOIN/ TABLE SELF JOIN)
-- SELF JOIN is a special case of a join that allows a table to be joined with itself
-- Join the  'student' table with itself based on matching IDs
SELECT student.id, student_name, course_name
FROM student, course
WHERE student.id = course.id;		


-- CROSS JOIN (CARTESIAN JOIN / CARTESIAN PRODUCT JOIN)
/* A CROSS JOIN retrieves the CARTESIAN PRODUCT of two tables, meaning every row from the first table is
   combined with every row from the second table
*/
-- JOIN the 'student' table with itself based on matching IDs
SELECT student.id, student_name, course_name
FROM student
CROSS JOIN course;


-- -----------------------------------------------------------------------
-- 								INNER JOIN								 |
-- -----------------------------------------------------------------------
-- JOIN 2 tables
SELECT T2.faculty_id, faculty_name, student_name
FROM students T1
INNER JOIN faculty T2 ON T1.faculty_id = T2.faculty_id;	

-- JOIN 2 tables
SELECT T2.*, student_name
FROM students T1
INNER JOIN faculty T2 ON T1.faculty_id = T2.faculty_id;

-- JOIN 3 tables
SELECT T1.faculty_id, faculty_name, department_name, student_name
FROM students as T1
INNER JOIN faculty as T2 ON T1.faculty_id = T2.faculty_id
INNER JOIN department as T3 ON T2.faculty_id = T3.faculty_id;

-- JOIN 4 tables
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM marks m
INNER JOIN students s ON m.student_id = s.student_id
INNER JOIN department d ON s.department_id = d.department_id
INNER JOIN faculty f ON d.faculty_id = f.faculty_id;


-- JOIN 5 tables
SELECT T2.student_name, T1.subject_name, T1.marks_obtained, T3.department_name, T4.faculty_name, T5.amount
FROM marks T1
INNER JOIN students T2 ON T1.student_id = T2.student_id
INNER JOIN department T3 ON T2.department_id = T3.department_id
INNER JOIN faculty T4 ON T3.faculty_id = T4.faculty_id
INNER JOIN salary T5 ON T4.faculty_id = T5.faculty_id;


-- -----------------------------------------------------------------------
-- 								LEFT JOIN								 |
-- -----------------------------------------------------------------------


-- LEFT JOIN (also known as LEFT OUTER JOIN)
-- Retrives all records from the left table and the matched records from the right table

-- JOIN 2 tables: marks and students
SELECT s.student_id, student_name, marks_obtained
FROM students s
LEFT JOIN marks m
ON s.student_id = m.student_id;

-- JOIN 2 tables: salary and faculty
SELECT f.faculty_id, faculty_name, amount
FROM faculty f
LEFT JOIN salary s
ON f.faculty_id = s.faculty_id;

-- JOIN 3 Tables: students, department, and faculty
SELECT s.student_id, student_name, department_name, faculty_name
FROM students s
LEFT JOIN department m ON s.student_id = m.department_id
LEFT JOIN faculty f ON f.faculty_id = m.faculty_id;

-- JOIN 4 Tables: marks, students, department, and faculty
SELECT s.student_id, student_name, marks_obtained, department_name, faculty_name
FROM students s
LEFT JOIN marks m ON s.student_id = m.student_id
LEFT JOIN department d ON s.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id;

-- JOIN 5 Tables: marks, students, department, faculty, and salary
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM students st
LEFT JOIN marks m ON st.student_id = m.student_id
LEFT JOIN department d ON st.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
LEFT JOIN salary s ON f.faculty_id = s.faculty_id;


-- -----------------------------------------------------------------------
-- 								RIGHT JOIN								 |
-- -----------------------------------------------------------------------

-- retrieves all records from the right table and the matched records from the left table.

-- Join 2 Tables: marks and students
SELECT s.student_name, m.subject_name, m.marks_obtained
FROM students s
RIGHT JOIN marks m ON s.student_id = m.student_id;

-- Join 2 Tables: salary and faculty
SELECT f.faculty_name, s.amount
FROM salary s
RIGHT JOIN faculty f ON s.faculty_id = f.faculty_id;

--  Join 3 Tables: students, department, and faculty
SELECT s.student_name, d.department_name, f.faculty_name
FROM department d
RIGHT JOIN students s ON d.department_id = s.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id;

-- Join 4 Tables: marks, students, department, and faculty
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM marks m
RIGHT JOIN students s ON m.student_id = s.student_id
RIGHT JOIN department d ON s.department_id = d.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id;


-- Join 5 Tables: marks, students, department, faculty, and salary
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM marks m
RIGHT JOIN students st ON m.student_id = st.student_id
RIGHT JOIN department d ON st.department_id = d.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id
RIGHT JOIN salary s ON f.faculty_id = s.faculty_id;

-- -----------------------------------------------------------------------
-- 								FULL JOIN								 |
-- -----------------------------------------------------------------------

--  Join 2 Tables: marks and students
SELECT s.student_name, m.subject_name, m.marks_obtained
FROM students s
LEFT JOIN marks m ON s.student_id = m.student_id
UNION
SELECT s.student_name, m.subject_name, m.marks_obtained
FROM students s
RIGHT JOIN marks m ON s.student_id = m.student_id;

-- Join 3 Tables: students, department, and faculty
SELECT s.student_name, d.department_name, f.faculty_name
FROM students s
LEFT JOIN department d ON s.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
UNION
SELECT s.student_name, d.department_name, f.faculty_name
FROM students s
RIGHT JOIN department d ON s.department_id = d.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id;


--  Join 4 Tables: marks, students, department, and faculty
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM marks m
LEFT JOIN students s ON m.student_id = s.student_id
LEFT JOIN department d ON s.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
UNION
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM marks m
RIGHT JOIN students s ON m.student_id = s.student_id
RIGHT JOIN department d ON s.department_id = d.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id;

-- Join 5 Tables: marks, students, department, faculty, and salary
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM marks m
LEFT JOIN students st ON m.student_id = st.student_id
LEFT JOIN department d ON st.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
LEFT JOIN salary s ON f.faculty_id = s.faculty_id
UNION
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM marks m
RIGHT JOIN students st ON m.student_id = st.student_id
RIGHT JOIN department d ON st.department_id = d.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id
RIGHT JOIN salary s ON f.faculty_id = s.faculty_id;


-- -----------------------------------------------------------------------
-- 								LEFT EXCLUSIVE JOIN						 |
-- -----------------------------------------------------------------------
-- retrieves rows from the left table that do not have matching rows in the right table.  

-- Join 2 Tables: marks and students
SELECT s.student_name, m.subject_name, m.marks_obtained
FROM students s
LEFT JOIN marks m ON s.student_id = m.student_id
WHERE m.student_id IS NULL;


-- Join 3 Tables: students, department, and faculty
SELECT s.student_name, d.department_name, f.faculty_name
FROM students s
LEFT JOIN department d ON s.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
WHERE d.department_id IS NULL AND f.faculty_id IS NULL;

-- Join 4 Tables: marks, students, department, and faculty
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM marks m
LEFT JOIN students s ON m.student_id = s.student_id
LEFT JOIN department d ON s.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
WHERE d.department_id IS NULL AND f.faculty_id IS NULL;

-- Join 5 Tables: marks, students, department, faculty, and salary
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM marks m
LEFT JOIN students st ON m.student_id = st.student_id
LEFT JOIN department d ON st.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
LEFT JOIN salary s ON f.faculty_id = s.faculty_id
WHERE d.department_id IS NULL AND f.faculty_id IS NULL AND s.faculty_id IS NULL;

-- -----------------------------------------------------------------------
-- 								RIGHT EXCLUSIVE JOIN					 |
-- -----------------------------------------------------------------------

-- Join 2 Tables: marks and students
SELECT s.student_name, m.subject_name, m.marks_obtained
FROM marks m
RIGHT JOIN students s ON m.student_id = s.student_id
WHERE m.student_id IS NULL;

-- Join 3 Tables: students, department, and faculty
SELECT s.student_name, d.department_name, f.faculty_name
FROM department d
RIGHT JOIN students s ON d.department_id = s.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id
WHERE s.student_id IS NULL;

-- Join 4 Tables: marks, students, department, and faculty
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM department d
RIGHT JOIN students s ON d.department_id = s.department_id
RIGHT JOIN marks m ON s.student_id = m.student_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id
WHERE s.student_id IS NULL;

-- Join 5 Tables: marks, students, department, faculty, and salary
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM salary s
RIGHT JOIN faculty f ON s.faculty_id = f.faculty_id
RIGHT JOIN department d ON f.faculty_id = d.faculty_id
RIGHT JOIN students st ON d.department_id = st.department_id
RIGHT JOIN marks m ON st.student_id = m.student_id
WHERE st.student_id IS NULL;

-- -----------------------------------------------------------------------
-- 								SELF JOIN								 |
-- -----------------------------------------------------------------------

-- Join 2 Tables: students (e.g., finding students with the same department)
SELECT s1.student_name AS Student1, s2.student_name AS Student2, d.department_name
FROM students s1
JOIN students s2 ON s1.department_id = s2.department_id AND s1.student_id <> s2.student_id
JOIN department d ON s1.department_id = d.department_id;

-- Join 3 Tables: students, department, and faculty (e.g., finding students and their faculty)
SELECT s.student_name, d.department_name, f.faculty_name
FROM students s
JOIN department d ON s.department_id = d.department_id
JOIN faculty f ON d.faculty_id = f.faculty_id;

-- Join 4 Tables: marks, students, department, and faculty (e.g., finding students and their faculty with marks)
SELECT s.student_name, d.department_name, f.faculty_name, m.subject_name, m.marks_obtained
FROM marks m
JOIN students s ON m.student_id = s.student_id
JOIN department d ON s.department_id = d.department_id
JOIN faculty f ON d.faculty_id = f.faculty_id;

-- Join 5 Tables: marks, students, department, faculty, and salary (e.g., finding students, their faculty, and salary of faculty)
SELECT s.student_name, d.department_name, f.faculty_name, s.salary AS Faculty_Salary, m.subject_name, m.marks_obtained
FROM marks m
JOIN students s ON m.student_id = s.student_id
JOIN department d ON s.department_id = d.department_id
JOIN faculty f ON d.faculty_id = f.faculty_id
JOIN salary s ON f.faculty_id = s.faculty_id;



-- -----------------------------------------------------------------------
-- 								CROSS JOIN								 |
-- -----------------------------------------------------------------------

-- Join 2 Tables: marks and students
SELECT m.subject_name, m.marks_obtained, s.student_name
FROM marks m
CROSS JOIN students s;

-- Join 3 Tables: students, department, and faculty
SELECT s.student_name, d.department_name, f.faculty_name
FROM students s
CROSS JOIN department d
CROSS JOIN faculty f;

-- Join 4 Tables: marks, students, department, and faculty
SELECT m.subject_name, m.marks_obtained, s.student_name, d.department_name, f.faculty_name
FROM marks m
CROSS JOIN students s
CROSS JOIN department d
CROSS JOIN faculty f;

-- Join 5 Tables: marks, students, department, faculty, and salary
SELECT m.subject_name, m.marks_obtained, s.student_name, d.department_name, f.faculty_name, s.amount
FROM marks m
CROSS JOIN students s
CROSS JOIN department d
CROSS JOIN faculty f
CROSS JOIN salary s;


-- Sub queries
SELECT s.student_name, m.marks_obtained
FROM students s
JOIN marks m ON s.student_id = m.student_id
WHERE m.marks_obtained > (SELECT MAX(marks_obtained) FROM marks WHERE subject_name = 'Mathematics');