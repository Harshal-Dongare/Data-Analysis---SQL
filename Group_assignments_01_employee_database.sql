
-- ----------------------------------
-- 			Database: COMPANY		|
-- ----------------------------------

CREATE DATABASE IF NOT EXISTS company;

USE company;

-- Table 1: Employee

-- Create table
CREATE TABLE employee(
	emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE,
    hire_date DATE NOT NULL,
    job_title VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) CHECK(salary >0),
    department_id INT,
    manager_id INT
);


INSERT INTO employee (first_name, last_name, email, phone_number, hire_date, job_title, salary, department_id, manager_id) VALUES
('Amit', 'Sharma', 'amit.sharma@example.com', '9876543210', '2023-01-15', 'Software Engineer', 70000.00, 1, NULL),
('Priya', 'Verma', 'priya.verma@example.com', '9876543211', '2022-06-20', 'Data Analyst', 65000.00, 2, 1),
('Rahul', 'Singh', 'rahul.singh@example.com', '9876543212', '2021-09-10', 'HR Manager', 80000.00, 3, NULL),
('Sonal', 'Mishra', 'sonal.mishra@example.com', '9876543213', '2023-03-05', 'Software Engineer', 72000.00, 1, 1),
('Vikram', 'Patel', 'vikram.patel@example.com', '9876543214', '2020-12-01', 'Finance Manager', 90000.00, 4, NULL),
('Neha', 'Kapoor', 'neha.kapoor@example.com', '9876543215', '2022-08-25', 'Data Scientist', 85000.00, 2, 2),
('Rohit', 'Malhotra', 'rohit.malhotra@example.com', '9876543216', '2023-02-14', 'Marketing Executive', 60000.00, 5, NULL),
('Ananya', 'Gupta', 'ananya.gupta@example.com', '9876543217', '2021-07-11', 'Business Analyst', 75000.00, 6, 5),
('Suresh', 'Yadav', 'suresh.yadav@example.com', '9876543218', '2020-11-30', 'Senior Developer', 95000.00, 1, 1),
('Divya', 'Joshi', 'divya.joshi@example.com', '9876543219', '2022-10-05', 'Product Manager', 98000.00, 6, NULL);


-- Table 2: Departments
CREATE TABLE departments(
	dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    manager_id INT,
    location VARCHAR(100) NOT NULL,
    total_employees INT DEFAULT 0 CHECK(total_employees >= 0),
    contact_email VARCHAR(100) UNIQUE
);

-- Insert data
INSERT INTO departments (dept_name, manager_id, location, total_employees, contact_email) VALUES
('Software Engineering', 1, 'Bangalore', 50, 'software@company.com'),
('Data Analytics', 2, 'Hyderabad', 30, 'analytics@company.com'),
('Human Resources', 3, 'Mumbai', 20, 'hr@company.com'),
('Finance', 4, 'Delhi', 25, 'finance@company.com'),
('Marketing', 5, 'Chennai', 40, 'marketing@company.com'),
('Product Management', 6, 'Pune', 15, 'product@company.com'),
('Customer Support', 7, 'Kolkata', 60, 'support@company.com'),
('Sales', 8, 'Noida', 35, 'sales@company.com'),
('Operations', 9, 'Ahmedabad', 45, 'operations@company.com'),
('Research & Development', 10, 'Gurgaon', 10, 'rnd@company.com');


-- Table 3
CREATE TABLE manager (
    manager_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    department_id INT UNIQUE, 
    hire_date DATE NOT NULL
);

-- Insert data into 
INSERT INTO manager (first_name, last_name, email, phone_number, department_id, hire_date) VALUES
('Amit', 'Sharma', 'amit.sharma@company.com', '9876543201', 1, '2018-04-10'),
('Priya', 'Verma', 'priya.verma@company.com', '9876543202', 2, '2019-06-15'),
('Rahul', 'Singh', 'rahul.singh@company.com', '9876543203', 3, '2017-09-20'),
('Vikram', 'Patel', 'vikram.patel@company.com', '9876543204', 4, '2016-12-05'),
('Sonal', 'Mishra', 'sonal.mishra@company.com', '9876543205', 5, '2020-03-18'),
('Neha', 'Kapoor', 'neha.kapoor@company.com', '9876543206', 6, '2015-07-22'),
('Rohit', 'Malhotra', 'rohit.malhotra@company.com', '9876543207', 7, '2021-01-30'),
('Ananya', 'Gupta', 'ananya.gupta@company.com', '9876543208', 8, '2019-11-10'),
('Suresh', 'Yadav', 'suresh.yadav@company.com', '9876543209', 9, '2014-05-25'),
('Divya', 'Joshi', 'divya.joshi@company.com', '9876543210', 10, '2018-08-05');


ALTER TABLE employee
ADD CONSTRAINT fq_emp 
FOREIGN KEY (department_id) REFERENCES departments(dept_id)
	ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE employee
ADD CONSTRAINT fq_manager 
FOREIGN KEY (manager_id) REFERENCES manager(manager_id)
	ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE departments
ADD CONSTRAINT fk_manager_id
FOREIGN KEY (manager_id) REFERENCES manager(manager_id)
	ON DELETE SET NULL
    ON UPDATE CASCADE;
    
ALTER TABLE manager
ADD CONSTRAINT fk_dept_id
FOREIGN KEY (department_id) REFERENCES departments(dept_id)
	ON DELETE SET NULL
    ON UPDATE CASCADE;

-- View employee data
SELECT * FROM employee_info; 

-- Change the name of the employee
UPDATE employee
SET first_name = 'Kavya'
WHERE emp_id = 4;

-- Total number of employees
SELECT COUNT(*) AS employee_count FROM employee;

-- Modify the table name
RENAME TABLE employee TO employee_info;

-- Total salary of the employees
SELECT SUM(salary) AS total_Salary FROM employee_info;

-- See employee belongs to which department
SELECT emp.first_name, dept.dept_name
FROM employee_info AS emp
INNER JOIN departments AS dept
ON emp.department_id = dept.dept_id;
-- WHERE first_name= 'Priya';

-- Remove the phone number column from employee table
ALTER TABLE employee_info
DROP COLUMN phone_number;

-- See total count of employees for specific job title
SELECT job_title, COUNT(*) AS total_employees
FROM employee_info
GROUP BY job_title;

-- Select employee who is manager whose hiring date after a specific date
SELECT job_title, hire_date
FROM employee_info
WHERE job_title LIKE '%Manager%' and hire_date > '2020-12-01';

-- See the entire email list of the employee
SELECT email FROM employee_info;

-- Find the total number of employees in the department
SELECT SUM(total_employees) AS employee_count FROM departments;

-- Select employees with salary greater than 80,000
SELECT first_name, last_name, salary 
FROM employee_info 
WHERE salary > 80000;

-- Find the average salary in each department
SELECT dept.dept_name, AVG(emp.salary) AS avg_salary
FROM employee_info AS emp
JOIN departments AS dept ON emp.department_id = dept.dept_id
GROUP BY dept.dept_name;

-- Find employees who do not have a manager assigned
SELECT first_name, last_name 
FROM employee_info 
WHERE manager_id IS NULL;

-- List all employees hired in the last 2 years
SELECT first_name, last_name, hire_date 
FROM employee_info 
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- Get a list of all department names and their total employees
SELECT dept_name, total_employees FROM departments;

-- Display employees who work in the Software Engineering department
SELECT emp.first_name, emp.last_name, dept.dept_name 
FROM employee_info AS emp
JOIN departments AS dept ON emp.department_id = dept.dept_id
WHERE dept.dept_name = 'Software Engineering';

-- Increase the salary of employees in the Data Analytics department by 10%
UPDATE employee_info
SET salary = salary * 1.10
WHERE department_id = (SELECT dept_id FROM departments WHERE dept_name = 'Data Analytics');

-- Delete employees who left before 2020
DELETE FROM employee_info 
WHERE hire_date < '2020-01-01';

-- Count how many employees are managers
SELECT COUNT(*) AS total_managers FROM employee_info 
WHERE job_title LIKE '%Manager%';

-- Show all managers along with their departments
SELECT mgr.first_name, mgr.last_name, dept.dept_name 
FROM manager AS mgr
JOIN departments AS dept ON mgr.department_id = dept.dept_id;

-- Find employees with the highest salary
SELECT first_name, last_name, salary 
FROM employee_info 
ORDER BY salary DESC 
LIMIT 1;

-- List all employees along with their managers' names
SELECT e.first_name AS Employee, e.last_name AS Employee_LastName, 
       m.first_name AS Manager, m.last_name AS Manager_LastName
FROM employee_info e
LEFT JOIN employee_info m ON e.manager_id = m.emp_id;

-- Find departments with more than 30 employees
SELECT dept_name, total_employees 
FROM departments 
WHERE total_employees > 30;

-- Count the number of employees in each department
SELECT dept.dept_name, COUNT(emp.emp_id) AS employee_count
FROM employee_info AS emp
JOIN departments AS dept ON emp.department_id = dept.dept_id
GROUP BY dept.dept_name;

-- Get employees who were hired in 2023
SELECT first_name, last_name, hire_date 
FROM employee_info 
WHERE YEAR(hire_date) = 2023;

-- List all employees with salaries between 60,000 and 80,000
SELECT first_name, last_name, salary 
FROM employee_info 
WHERE salary BETWEEN 60000 AND 80000;

-- Show department with the highest number of employees
SELECT dept_name, total_employees 
FROM departments 
ORDER BY total_employees DESC 
LIMIT 1;

-- Show employees who have the same job title
SELECT job_title, COUNT(*) AS num_employees
FROM employee_info 
GROUP BY job_title
HAVING num_employees > 1;

-- Display employees who have a last name starting with 'S'
SELECT first_name, last_name 
FROM employee_info 
WHERE last_name LIKE 'S%';

-- List employees sorted by hire date in ascending order
SELECT first_name, last_name, hire_date 
FROM employee_info 
ORDER BY hire_date ASC;

