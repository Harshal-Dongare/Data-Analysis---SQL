
-- ================================================
--               Database : Enterprise 
-- ================================================

-- Create the ENTERPRISE database
CREATE DATABASE enterprise;

-- Switch to the ENTERPRISE database
USE enterprise;

-- Drop table
DROP TABLE multinationalcompanies;

-- Drop database
DROP DATABASE enterprise;

-- ---------------------------------------------------------------------------------------------------------


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--               Table 1 : COMPANIES 
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Create the COMPANIES table
CREATE TABLE companies(
   company_id INT PRIMARY KEY AUTO_INCREMENT,
   company_name VARCHAR(100) NOT NULL,
   headquarters_location VARCHAR(100),
   established_date DATE,
   industry VARCHAR(50),
   revenue DECIMAL(15,2) CHECK (revenue >= 0),  -- Revenue must be non-negative
   employee_count INT DEFAULT 0 CHECK (employee_count >= 0),  -- employee count must be non-negative
   website VARCHAR(255) UNIQUE,  -- Unique website URL for the company
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Timestamp for record creation
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- Timestamp for record updates
   UNIQUE(company_name)
);

-- Insert data into COMPANIES table
INSERT INTO companies(company_name, headquarters_location, established_date, industry, revenue, employee_count, website)
VALUES('Tata Consultancy Services', 'Mumbai, Maharashtra', '1968-04-01', 'Information Technology', 20000000000.00, 500000, 'https://www.tcs.com'),
('Infosys', 'Bengaluru, Karnataka', '1981-07-02', 'Information Technology', 16780000000.00, 335000, 'https://www.infosys.com'),
('Wipro', 'Bengaluru, Karnataka', '1945-12-29', 'Information Technology', 10600000000.00, 260000, 'https://www.wipro.com'),
('Reliance Industries', 'Mumbai, Maharashtra', '1973-05-08', 'Conglomerate', 104600000000.00, 236000, 'https://www.ril.com'),
('HCL Technologies', 'Noida, Uttar Pradesh', '1976-08-11', 'Information Technology', 12000000000.00, 222000, 'https://www.hcltech.com'),
('Mahindra & Mahindra', 'Mumbai, Maharashtra', '1945-10-02', 'Automotive', 19600000000.00, 250000, 'https://www.mahindra.com'),
('Tech Mahindra', 'Pune, Maharashtra', '1986-10-24', 'Information Technology', 6500000000.00, 160000, 'https://www.techmahindra.com'),
('Adani Group', 'Ahmedabad, Gujarat', '1988-07-20', 'Conglomerate', 25000000000.00, 230000, 'https://www.adani.com'),
('Bharti Airtel', 'New Delhi, Delhi', '1995-07-07', 'Telecommunications', 14000000000.00, 180000, 'https://www.airtel.in'),
('Larsen & Toubro', 'Mumbai, Maharashtra', '1938-02-07', 'Engineering & Construction', 22000000000.00, 337000, 'https://www.larsentoubro.com');


--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates


-- --------------------
--   SELECT queries   |
-- --------------------
 
-- 1. Select all records
SELECT * FROM companies;

-- 2. Select specific columns
SELECT company_name, employee_count, revenue FROM companies;

-- 3. Select companies in a specific industry
SELECT * FROM companies WHERE industry = 'Information Technology';

-- 4. Select companies with revenue greater than a certain amount
SELECT * FROM companies WHERE revenue > 10000000000.00;

-- 5. Select companies ordered by revenue in descending order
SELECT * FROM companies ORDER BY revenue DESC;

-- 6. Select companies established in a specified year
SELECT * FROM companies WHERE  YEAR(established_date) = '1945';

-- 7. Select companies with specific headquarters location
SELECT * FROM companies WHERE headquarters_location = "Mumbai, Maharashtra";

-- 8. Select companies established after a certain date
SELECT * FROM companies WHERE established_date > '1980-01-01';

-- 9. Select companies with employee count greater than a certain number
SELECT * FROM companies WHERE employee_count > 100000;

-- 10. Select companies with a revenue between two values
SELECT * FROM companies WHERE revenue BETWEEN 5000000000.00 AND 20000000000.00;

-- 11. Count the number of companies in each industry
SELECT industry, COUNT(*) AS company_count FROM companies GROUP BY industry;


-- --------------------
--   ALTER queries    |
-- --------------------

-- 1. Add a new column
ALTER TABLE companies
ADD COLUMN stock_symbol VARCHAR(10);

-- 2. Modify an existing column constraints
ALTER TABLE companies
MODIFY COLUMN revenue DECIMAL(20, 2) CHECK (revenue >= 0);

-- 3. Drop/Delete a column
ALTER TABLE companies
DROP COLUMN stock_symbol;

-- 4. Rename a column
ALTER TABLE companies
CHANGE COLUMN headquarters_location location VARCHAR(100);

-- 5. Add a default value to an existing column  (Correction in the command)
ALTER TABLE companies
MODIFY COLUMN employee_count INT DEFAULT 1;
-- ALTER COLUMN employee_count SET DEFAULT 1;

-- 6. Add a new column with a default value
ALTER TABLE companies
ADD COLUMN country VARCHAR(50) DEFAULT 'India';

-- 7. Drop a column if exists  (Below command is correct but not valid for MySQL)
ALTER TABLE companies
DROP COLUMN IF EXISTS country;

-- 8. Add a unique constraints to a specific column
ALTER TABLE companies
ADD CONSTRAINT unique_website UNIQUE (website);

-- 9. Change the data type of a column
ALTER TABLE companies
MODIFY COLUMN established_date DATETIME;

-- 10. Add a foreign key constraints
ALTER TABLE companies
ADD CONSTRAINT fk_industry FOREIGN KEY (industry) REFERENCES industries(industry_name);


-- --------------------
--   DELETE queries   |
-- --------------------

-- 1. Delete a specific record
DELETE FROM companies
WHERE company_name = 'Wipro';

-- 2. Delete records based on condition
DELETE FROM companies
WHERE industry = 'Banking';

-- 3. Delete records with revenue below a certain amount
DELETE FROM companies
WHERE revenue < 5000000000.00;

-- 4. Delete records established before a certain data
DELETE FROM companies
WHERE established_date < '1980-01-01';

-- 5. Delete records with specific headquarters location
DELETE FROM companies
WHERE location = 'New Delhi';

-- 6. Delete records with specific employee count
DELETE FROM companies
WHERE employee_count = 0;

-- 7. Delete records with specific website
DELETE FROM companies
WHERE website = 'https://www.adani.com';

-- 8. Delete records based on multiple condition
DELETE FROM companies
WHERE industry = 'Telecommunications' AND revenue < 1000000000000.00;

-- 9. Delete records with a specific name pattern
DELETE FROM companies
WHERE company_name LIKE 'I%';

-- 10. Delete all records (use with caution)
DELETE FROM companies;


-- --------------------
--   RENAME queries   |
-- --------------------

-- 1. Rename the database (Does not work instead drop the database and create it again with new name)
ALTER DATABASE enterprise RENAME TO global_corp;

-- 2. Rename the companies table
ALTER TABLE companies RENAME TO multinationalcompanies;

-- 3. Rename the column name in company table
ALTER TABLE multinationalcompanies RENAME COLUMN company_id TO id;

-- 4. Rename the company_name column
ALTER TABLE multinationalcompanies RENAME COLUMN company_name TO name;

-- 5. Rename the headquarters location column
ALTER TABLE multinationalcompanies RENAME COLUMN location TO headquarters;

-- 6. Rename multiple columns
ALTER TABLE multinationalcompanies
RENAME COLUMN industry TO business_sector,
RENAME COLUMN website TO company_website;


-- --------------------
--   UPDATE queries   |
-- --------------------

-- 1. Update a specific record
UPDATE companies 
SET revenue = 22000000000.00, employee_count = 520000
WHERE company_name = 'Tata Consultancy Services';

-- 2. Update multiple records
UPDATE companies
SET industry = 'Telecom'
WHERE company_name IN ('Bharti Airtel', 'Reliance Industries');

-- 3. Update revenue for all companies in a specific industry
UPDATE companies
SET revenue = revenue * 1.10
WHERE industry = 'Information Technology';

-- 4. Update employee count for a specific company
UPDATE companies
SET employee_count = 210000
WHERE company_name = 'Wipro';

-- 5. Update headquarters location
UPDATE companies
SET headquarters_location = 'Gurugram, Hariyana'
WHERE company_name = 'Bharti Airtel';

-- 6. Update established date
UPDATE companies
SET established_date = '1994-01-01'
WHERE company_name = 'Larsen & Toubro';

-- 7. Update website URL
UPDATE companies
SET website = 'https://www.infosys.co.in'
WHERE company_name = 'Infosys';

-- 8. Update revenue for companies with low employee count
UPDATE companies
SET revenue = 0
WHERE employee_count < 50000;

-- 9. Update Industry for a Specific Company
UPDATE companies
SET industry = 'Automobile'
WHERE company_name = 'Mahindra & Mahindra';

-- 10. Update Multiple Fields for a Specific Company
UPDATE companies
SET revenue = 16000000000.00, industry = 'Construction & Engineering'
WHERE company_name = 'Larsen & Toubro';

-- ==================================================================================================================

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--               Table 2 : DEPARTMENTS 
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Create the DEPARTMENTS table
CREATE TABLE departments(
   department_id INT PRIMARY KEY AUTO_INCREMENT,
   department_name VARCHAR(100) NOT NULL,
   company_id INT NOT NULL,
   manager_id INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Track when record was created
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- Track when the record was last updated
   FOREIGN KEY (company_id) REFERENCES companies(company_id) ON DELETE CASCADE ON UPDATE CASCADE,
   -- FOREIGN KEY (manager_id) REFERENCES employees(employee_id) ON DELETE SET NULL ON UPDATE CASCADE,
   UNIQUE (department_name, company_id)   -- Ensure department names are unique within a company
);

-- Add the foreign key from department.manager_id to employees.employee_id
ALTER TABLE departments
ADD CONSTRAINT fk_manager_id FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
ON DELETE SET NULL ON UPDATE CASCADE;

-- Insert data into DEPARTMENTS table
INSERT INTO departments(department_name, company_id, manager_id)
VALUES ('HR', 1, 1),  -- Tata Consultancy Services
('Finance', 2, 2),  -- Infosys
('Engineering', 3, 3),  -- Wipro
('Sales', 4, 4),  -- Reliance Industries
('Marketing', 5, 5),  -- HCL Technologies
('Operations', 6, 6),  -- Mahindra & Mahindra
('Customer Support', 7, 7),  -- Tech Mahindra
('IT', 8, 8),  -- Adani Group
('Research and Development', 9, 9),  -- Bharti Airtel
('Quality Assurance', 10, 10);  -- Larsen & Toubro


-- --------------------
--   SELECT queries   |
-- --------------------

-- 1. Select all records
SELECT * FROM departments;

-- 2. Select specific columns
SELECT department_name, company_id, manager_id FROM departments;

-- 3. Select departments belonging to a specific company
SELECT * FROM departments WHERE company_id = 1;

-- 4. Select departments with a specific manager
SELECT * FROM departments WHERE manager_id = 3;

-- 5. Select departments ordered by department name
SELECT * FROM departments ORDER BY department_name;

-- 6. Select departments with a specific name pattern
SELECT * FROM departments WHERE department_name LIKE 'Sales%';

-- 7. Select departments from companies with revenue greater than a certain amount
SELECT * FROM departments WHERE company_id IN (SELECT company_id FROM companies WHERE revenue > 10000000000.00);

-- 8. Select departments from a specific industry
SELECT * FROM departments WHERE company_id IN (SELECT company_id FROM companies WHERE industry = 'Information Technology');

-- 9. Count the number of departments in each company
SELECT company_id, COUNT(*) AS department_count FROM departments GROUP BY company_id;

-- 10. Select departments with a specific manager ID
SELECT * FROM departments WHERE manager_id = 7;


-- --------------------
--   ALTER queries    |
-- --------------------

-- 1. Add a new column
ALTER TABLE departments
ADD COLUMN budget DECIMAL(15, 2);

-- 2. Modify an existing column constraints
ALTER TABLE departments
MODIFY COLUMN department_name VARCHAR(150) NOT NULL;

-- 3. Drop/Delete a column
ALTER TABLE departments
DROP COLUMN budget;

-- 4. Rename a column
ALTER TABLE departments
CHANGE COLUMN department_name dept_name VARCHAR(100);

-- 5. Add a default value to an existing column
ALTER TABLE departments
MODIFY COLUMN manager_id INT DEFAULT NULL;

-- 6. Add a new column with a default value
ALTER TABLE departments
ADD COLUMN department_location VARCHAR(100) DEFAULT 'Headquarters';

-- 7. Drop a column if exists
ALTER TABLE departments
DROP COLUMN IF EXISTS department_location;

-- 8. Add a unique constraint to a specific column
ALTER TABLE departments
ADD CONSTRAINT unique_department_name UNIQUE (department_name, company_id);

-- 9. Change the data type of a column
ALTER TABLE departments
MODIFY COLUMN manager_id INT;

-- 10. Add a foreign key constraint
ALTER TABLE departments
ADD CONSTRAINT fk_manager_id FOREIGN KEY (manager_id) REFERENCES employees(employee_id) ON DELETE SET NULL ON UPDATE CASCADE;


-- --------------------
--   DELETE queries   |
-- --------------------

-- 1. Delete a specific record
DELETE FROM departments
WHERE department_name = 'Sales';

-- 2. Delete records based on condition
DELETE FROM departments
WHERE company_id = 4;

-- 3. Delete records with a specific manager
DELETE FROM departments
WHERE manager_id = 5;

-- 4. Delete records from a specific company
DELETE FROM departments
WHERE company_id = 7;

-- 5. Delete records with specific department name
DELETE FROM departments
WHERE department_name = 'IT';

-- 6. Delete records based on multiple conditions
DELETE FROM departments
WHERE company_id = 6 AND department_name = 'Operations';

-- 7. Delete records with a specific department location
DELETE FROM departments
WHERE department_location = 'Headquarters';

-- 8. Delete records with specific manager ID
DELETE FROM departments
WHERE manager_id = 9;

-- 9. Delete departments based on name pattern
DELETE FROM departments
WHERE department_name LIKE 'Quality%';

-- 10. Delete all records (use with caution)
DELETE FROM departments;


-- --------------------
--   RENAME queries   |
-- --------------------

-- 1. Rename the departments table
ALTER TABLE departments RENAME TO department_info;

-- 2. Rename the column department_name
ALTER TABLE department_info RENAME COLUMN dept_name TO department_title;

-- 3. Rename the company_id column
ALTER TABLE department_info RENAME COLUMN company_id TO company_identifier;

-- 4. Rename the manager_id column
ALTER TABLE department_info RENAME COLUMN manager_id TO department_head;

-- 5. Rename the department_location column
ALTER TABLE department_info RENAME COLUMN department_location TO location;

-- 6. Rename multiple columns
ALTER TABLE department_info
RENAME COLUMN department_title TO department_name,
RENAME COLUMN company_identifier TO company_id;


-- --------------------
--   UPDATE queries   |
-- --------------------

-- 1. Update a specific record
UPDATE departments
SET department_name = 'Human Resources'
WHERE department_name = 'HR';

-- 2. Update multiple records
UPDATE departments
SET department_name = 'Finance and Accounting'
WHERE department_name = 'Finance';

-- 3. Update manager ID for a specific department
UPDATE departments
SET manager_id = 10
WHERE department_name = 'Engineering';

-- 4. Update department name for a specific company
UPDATE departments
SET department_name = 'Research'
WHERE company_id = 3;

-- 5. Update department location
UPDATE departments
SET department_location = 'Pune'
WHERE department_name = 'Sales';

-- 6. Update multiple department details
UPDATE departments
SET manager_id = 5, department_location = 'Delhi'
WHERE department_name = 'Marketing';

-- 7. Update department manager for a specific company
UPDATE departments
SET manager_id = 7
WHERE company_id = 6 AND department_name = 'Operations';

-- 8. Update manager for multiple departments
UPDATE departments
SET manager_id = 4
WHERE department_name IN ('HR', 'Finance');

-- 9. Update department for a specific company
UPDATE departments
SET department_name = 'R&D'
WHERE company_id = 8;

-- 10. Update multiple fields for a specific department
UPDATE departments
SET department_name = 'Customer Service', manager_id = 9
WHERE department_id = 7;


-- ==================================================================================================================

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--               Table 3 : EMPLOYEES 
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Create the EMPLOYEES table
CREATE TABLE employees(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    hire_date DATE NOT NULL,
    job_title VARCHAR(50),
    department_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Insert data into EMPLOYEES table
INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_title, department_id)
VALUES ('Amit', 'Sharma', 'amit.sharma@example.com', '9876543210', '2022-03-01', 'HR Manager', 1),
('Priya', 'Kumar', 'priya.kumar@example.com', '9876543211', '2021-11-15', 'Finance Analyst', 2),
('Rajesh', 'Verma', 'rajesh.verma@example.com', '9876543212', '2020-05-20', 'Software Engineer', 3),
('Anjali', 'Desai', 'anjali.desai@example.com', '9876543213', '2019-07-10', 'Sales Executive', 4),
('Manish', 'Mehta', 'manish.mehta@example.com', '9876543214', '2023-01-10', 'Marketing Specialist', 5),
('Sunita', 'Rao', 'sunita.rao@example.com', '9876543215', '2022-12-05', 'Operations Lead', 6),
('Vikram', 'Singh', 'vikram.singh@example.com', '9876543216', '2023-02-18', 'Customer Support Rep', 7),
('Sneha', 'Joshi', 'sneha.joshi@example.com', '9876543217', '2021-06-25', 'IT Technician', 8),
('Arjun', 'Nair', 'arjun.nair@example.com', '9876543218', '2018-09-14', 'R&D Scientist', 9);

-- --------------------
--   SELECT queries   |
-- --------------------

-- 1. Select all records
SELECT * FROM employees;

-- 2. Select specific columns
SELECT first_name, last_name, job_title FROM employees;

-- 3. Select employees belonging to a specific department
SELECT * FROM employees WHERE department_id = 3;

-- 4. Select employees by their job title
SELECT * FROM employees WHERE job_title = 'HR Manager';

-- 5. Select employees hired after a certain date
SELECT * FROM employees WHERE hire_date > '2022-01-01';

-- 6. Select employees with a specific email pattern
SELECT * FROM employees WHERE email LIKE '%@example.com';

-- 7. Select employees from specific departments
SELECT * FROM employees WHERE department_id IN (1, 2, 3);

-- 8. Count the number of employees in each department
SELECT department_id, COUNT(*) AS employee_count FROM employees GROUP BY department_id;

-- 9. Select employees ordered by their last name
SELECT * FROM employees ORDER BY last_name;

-- 10. Select employees with a specific phone number
SELECT * FROM employees WHERE phone_number = '9876543210';


-- --------------------
--   ALTER queries    |
-- --------------------

-- 1. Add a new column
ALTER TABLE employees
ADD COLUMN salary DECIMAL(15, 2);

-- 2. Modify an existing column constraints
ALTER TABLE employees
MODIFY COLUMN email VARCHAR(150) NOT NULL;

-- 3. Drop/Delete a column
ALTER TABLE employees
DROP COLUMN salary;

-- 4. Rename a column
ALTER TABLE employees
CHANGE COLUMN phone_number phone VARCHAR(20);

-- 5. Add a default value to an existing column
ALTER TABLE employees
MODIFY COLUMN job_title VARCHAR(50) DEFAULT 'Employee';

-- 6. Add a new column with a default value
ALTER TABLE employees
ADD COLUMN department_location VARCHAR(100) DEFAULT 'Headquarters';

-- 7. Drop a column if exists
ALTER TABLE employees
DROP COLUMN IF EXISTS department_location;

-- 8. Add a unique constraint to a specific column
ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);

-- 9. Change the data type of a column
ALTER TABLE employees
MODIFY COLUMN phone VARCHAR(15);

-- 10. Add a foreign key constraint
ALTER TABLE employees
ADD CONSTRAINT fk_department_id FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE SET NULL ON UPDATE CASCADE;


-- --------------------
--   DELETE queries   |
-- --------------------

-- 1. Delete a specific record
DELETE FROM employees
WHERE email = 'amit.sharma@example.com';

-- 2. Delete employees from a specific department
DELETE FROM employees
WHERE department_id = 4;

-- 3. Delete employees by their job title
DELETE FROM employees
WHERE job_title = 'Marketing Specialist';

-- 4. Delete employees hired before a certain date
DELETE FROM employees
WHERE hire_date < '2022-01-01';

-- 5. Delete employees with a specific phone number
DELETE FROM employees
WHERE phone_number = '9876543210';

-- 6. Delete employees by multiple conditions
DELETE FROM employees
WHERE department_id = 5 AND hire_date > '2023-01-01';

-- 7. Delete employees from specific departments
DELETE FROM employees
WHERE department_id IN (6, 7);

-- 8. Delete employees based on job title pattern
DELETE FROM employees
WHERE job_title LIKE 'Software%';

-- 9. Delete employees with a specific first name
DELETE FROM employees
WHERE first_name = 'Rajesh';

-- 10. Delete all employees (use with caution)
DELETE FROM employees;


-- --------------------
--   RENAME queries   |
-- --------------------

-- 1. Rename the employees table
ALTER TABLE employees RENAME TO staff;

-- 2. Rename the column first_name
ALTER TABLE staff RENAME COLUMN first_name TO first_name_new;

-- 3. Rename the last_name column
ALTER TABLE staff RENAME COLUMN last_name TO surname;

-- 4. Rename the job_title column
ALTER TABLE staff RENAME COLUMN job_title TO position;

-- 5. Rename the department_id column
ALTER TABLE staff RENAME COLUMN department_id TO department_ref;

-- 6. Rename multiple columns
ALTER TABLE staff
RENAME COLUMN first_name_new TO first_name,
RENAME COLUMN surname TO last_name,
RENAME COLUMN department_ref TO department_id;


-- --------------------
--   UPDATE queries   |
-- --------------------

-- 1. Update a specific record
UPDATE employees
SET job_title = 'Senior HR Manager'
WHERE email = 'amit.sharma@example.com';

-- 2. Update multiple records
UPDATE employees
SET job_title = 'Senior Finance Analyst'
WHERE department_id = 2;

-- 3. Update employee job title for a specific department
UPDATE employees
SET job_title = 'Software Development Lead'
WHERE department_id = 3;

-- 4. Update employee's department
UPDATE employees
SET department_id = 5
WHERE email = 'priya.kumar@example.com';

-- 5. Update employee's hire date
UPDATE employees
SET hire_date = '2022-01-01'
WHERE email = 'rajiv.singh@example.com';

-- 6. Update job title for employees in a specific department
UPDATE employees
SET job_title = 'Lead Sales Executive'
WHERE department_id = 4;

-- 7. Update phone number for a specific employee
UPDATE employees
SET phone_number = '9876543222'
WHERE email = 'rajesh.verma@example.com';

-- 8. Update multiple fields for a specific employee
UPDATE employees
SET first_name = 'Amit', last_name = 'Sharma', job_title = 'HR Head'
WHERE employee_id = 1;

-- 9. Update job titles for multiple employees
UPDATE employees
SET job_title = 'Customer Support Specialist'
WHERE job_title = 'Customer Support Rep';

-- 10. Update job title and department for multiple employees
UPDATE employees
SET job_title = 'Operations Manager', department_id = 6
WHERE department_id = 7;

-- ==================================================================================================================

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--               Table 4 : PROJECTS 
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Create the PROJECTS table
CREATE TABLE projects(
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    budget DECIMAL(15,2) CHECK(budget >= 0), -- Ensure budget is non-negative
    company_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Track when the record was created
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- Track when the record was last updated
    FOREIGN KEY (company_id) REFERENCES companies(company_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Insert data into PROJECTS table
INSERT INTO projects(project_name, start_date, end_date, budget, company_id)
VALUES ('Website Redesign', '2024-01-10', '2024-04-10', 50000.00, 1),
('Mobile App Development', '2024-02-15', '2024-07-30', 80000.00, 2),
('E-commerce Platform', '2024-03-01', '2024-08-01', 150000.00, 3),
('Cloud Migration', '2024-04-01', '2024-09-01', 120000.00, 4),
('AI Chatbot Implementation', '2024-05-10', '2024-09-10', 70000.00, 5),
('Digital Marketing Campaign', '2024-06-05', '2024-08-30', 20000.00, 1),
('Data Analytics Tool', '2024-07-01', '2024-12-31', 50000.00, 6),
('CRM Software Development', '2024-08-01', '2025-01-15', 100000.00, 7),
('Business Intelligence Dashboard', '2024-09-15', '2025-03-15', 60000.00, 8),
('Cybersecurity Infrastructure', '2024-10-01', '2025-04-01', 90000.00, 9);


-- --------------------
--   SELECT queries   |
-- --------------------

-- 1. Select all records
SELECT * FROM projects;

-- 2. Select specific columns
SELECT project_name, start_date, end_date FROM projects;

-- 3. Select projects from a specific company
SELECT * FROM projects WHERE company_id = 2;

-- 4. Select projects with a specific budget
SELECT * FROM projects WHERE budget > 70000;

-- 5. Select projects that have ended
SELECT * FROM projects WHERE end_date < CURRENT_DATE;

-- 6. Select ongoing projects (i.e., where the end date is in the future)
SELECT * FROM projects WHERE end_date > CURRENT_DATE;

-- 7. Select projects with a budget within a specific range
SELECT * FROM projects WHERE budget BETWEEN 50000 AND 100000;

-- 8. Count the number of projects in each company
SELECT company_id, COUNT(*) AS project_count FROM projects GROUP BY company_id;

-- 9. Select projects ordered by budget (descending)
SELECT * FROM projects ORDER BY budget DESC;

-- 10. Select projects that started after a specific date
SELECT * FROM projects WHERE start_date > '2024-06-01';


-- --------------------
--   ALTER queries    |
-- --------------------

-- 1. Add a new column
ALTER TABLE projects
ADD COLUMN project_manager_id INT;

-- 2. Modify an existing column constraints
ALTER TABLE projects
MODIFY COLUMN project_name VARCHAR(150) NOT NULL;

-- 3. Drop/Delete a column
ALTER TABLE projects
DROP COLUMN project_manager_id;

-- 4. Rename a column
ALTER TABLE projects
CHANGE COLUMN update_at last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 5. Add a default value to an existing column
ALTER TABLE projects
MODIFY COLUMN budget DECIMAL(15, 2) DEFAULT 10000.00;

-- 6. Add a new column with a default value
ALTER TABLE projects
ADD COLUMN project_status VARCHAR(20) DEFAULT 'Active';

-- 7. Drop a column if exists
ALTER TABLE projects
DROP COLUMN IF EXISTS project_status;

-- 8. Add a unique constraint to a specific column
ALTER TABLE projects
ADD CONSTRAINT unique_project_name UNIQUE (project_name);

-- 9. Change the data type of a column
ALTER TABLE projects
MODIFY COLUMN budget DECIMAL(20, 2);

-- 10. Add a foreign key constraint (assuming project_manager is another table)
ALTER TABLE projects
ADD CONSTRAINT fk_project_manager_id FOREIGN KEY (project_manager_id) REFERENCES employees(employee_id) ON DELETE SET NULL ON UPDATE CASCADE;


-- --------------------
--   DELETE queries   |
-- --------------------

-- 1. Delete a specific record
DELETE FROM projects
WHERE project_name = 'Website Redesign';

-- 2. Delete projects from a specific company
DELETE FROM projects
WHERE company_id = 3;

-- 3. Delete projects with a budget less than a specific amount
DELETE FROM projects
WHERE budget < 50000;

-- 4. Delete projects that have ended
DELETE FROM projects
WHERE end_date < CURRENT_DATE;

-- 5. Delete projects within a specific date range
DELETE FROM projects
WHERE start_date BETWEEN '2024-01-01' AND '2024-06-01';

-- 6. Delete projects with a specific name
DELETE FROM projects
WHERE project_name = 'AI Chatbot Implementation';

-- 7. Delete projects from multiple companies
DELETE FROM projects
WHERE company_id IN (1, 4);

-- 8. Delete projects with a specific budget pattern
DELETE FROM projects
WHERE budget > 100000;

-- 9. Delete all projects (use with caution)
DELETE FROM projects;

-- 10. Delete projects that have a specific status
DELETE FROM projects
WHERE project_status = 'Completed';


-- --------------------
--   RENAME queries   |
-- --------------------

-- 1. Rename the projects table
ALTER TABLE projects RENAME TO project_records;

-- 2. Rename the column project_name
ALTER TABLE project_records RENAME COLUMN project_name TO project_title;

-- 3. Rename the start_date column
ALTER TABLE project_records RENAME COLUMN start_date TO project_start_date;

-- 4. Rename the budget column
ALTER TABLE project_records RENAME COLUMN budget TO project_budget;

-- 5. Rename the company_id column
ALTER TABLE project_records RENAME COLUMN company_id TO company_reference;

-- 6. Rename multiple columns
ALTER TABLE project_records
RENAME COLUMN project_title TO project_name,
RENAME COLUMN project_start_date TO start_date,
RENAME COLUMN project_budget TO budget,
RENAME COLUMN company_reference TO company_id;


-- --------------------
--   UPDATE queries   |
-- --------------------

-- 1. Update a specific record
UPDATE projects
SET budget = 60000.00
WHERE project_name = 'Website Redesign';

-- 2. Update multiple records
UPDATE projects
SET budget = 100000.00
WHERE company_id = 2;

-- 3. Update project budget for a specific project
UPDATE projects
SET budget = 150000.00
WHERE project_name = 'E-commerce Platform';

-- 4. Update project's end date
UPDATE projects
SET end_date = '2024-12-31'
WHERE project_name = 'Cloud Migration';

-- 5. Update project status
UPDATE projects
SET project_status = 'Completed'
WHERE project_name = 'AI Chatbot Implementation';

-- 6. Update the start date for a specific project
UPDATE projects
SET start_date = '2024-03-01'
WHERE project_name = 'Digital Marketing Campaign';

-- 7. Update project name for multiple projects
UPDATE projects
SET project_name = 'New Marketing Campaign'
WHERE project_name LIKE 'Digital Marketing Campaign';

-- 8. Update project budget for multiple projects
UPDATE projects
SET budget = budget + 20000
WHERE company_id = 1;

-- 9. Update project details based on budget range
UPDATE projects
SET project_status = 'On Hold'
WHERE budget BETWEEN 50000 AND 80000;

-- 10. Update project start and end dates
UPDATE projects
SET start_date = '2024-07-01', end_date = '2025-01-01'
WHERE project_name = 'CRM Software Development';


-- ==================================================================================================================

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--               Table 5 : SALARIES 
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Create the SALARIES table
CREATE TABLE salaries(
    salary_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    salary_amount DECIMAL(15,2) NOT NULL CHECK(salary_amount >= 0),  -- Ensure salary amount in non-negative
    effective_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Track when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- Track when the record was last updated
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (employee_id, effective_date)  -- Ensure unique salary records for each employee on a specific date
);


-- Insert data into SALARIES table
INSERT INTO salaries(employee_id, salary_amount, effective_date)
VALUES 
(1, 80000.00, '2023-01-01'),
(2, 90000.00, '2023-02-01'),
(3, 120000.00, '2023-03-01'),
(4, 75000.00, '2023-04-01'),
(5, 70000.00, '2023-05-01'),
(6, 85000.00, '2023-06-01'),
(7, 65000.00, '2023-07-01'),
(8, 95000.00, '2023-08-01'),
(9, 110000.00, '2023-09-01');

-- --------------------
--   SELECT queries   |
-- --------------------

-- 1. Select all salary records
SELECT * FROM salaries;

-- 2. Select specific columns (employee_id, salary_amount)
SELECT employee_id, salary_amount FROM salaries;

-- 3. Select salary records for a specific employee
SELECT * FROM salaries WHERE employee_id = 3;

-- 4. Select salary records above a certain amount
SELECT * FROM salaries WHERE salary_amount > 80000;

-- 5. Select salary records for a specific date
SELECT * FROM salaries WHERE effective_date = '2023-03-01';

-- 6. Select salary records for a specific employee in a date range
SELECT * FROM salaries WHERE employee_id = 5 AND effective_date BETWEEN '2023-01-01' AND '2023-06-01';

-- 7. Count the number of salary records for each employee
SELECT employee_id, COUNT(*) AS salary_count FROM salaries GROUP BY employee_id;

-- 8. Select salaries ordered by salary amount (descending)
SELECT * FROM salaries ORDER BY salary_amount DESC;

-- 9. Select the latest salary record for each employee
SELECT * FROM salaries
WHERE effective_date = (SELECT MAX(effective_date) FROM salaries WHERE employee_id = salaries.employee_id);

-- 10. Select salary records where the amount is within a certain range
SELECT * FROM salaries WHERE salary_amount BETWEEN 70000 AND 100000;


-- --------------------
--   ALTER queries    |
-- --------------------

-- 1. Add a new column for bonus
ALTER TABLE salaries
ADD COLUMN bonus_amount DECIMAL(15,2) DEFAULT 0;

-- 2. Modify the salary_amount column to allow more precision
ALTER TABLE salaries
MODIFY COLUMN salary_amount DECIMAL(18,2) NOT NULL;

-- 3. Drop a column (if needed)
ALTER TABLE salaries
DROP COLUMN bonus_amount;

-- 4. Rename the salary_amount column
ALTER TABLE salaries
RENAME COLUMN salary_amount TO base_salary;

-- 5. Add a default value to an existing column
ALTER TABLE salaries
MODIFY COLUMN base_salary DECIMAL(15, 2) DEFAULT 50000.00;

-- 6. Add a foreign key for manager_id
ALTER TABLE salaries
ADD COLUMN manager_id INT;

-- 7. Drop the manager_id column
ALTER TABLE salaries
DROP COLUMN manager_id;

-- 8. Add a unique constraint on salary_amount for each employee
ALTER TABLE salaries
ADD CONSTRAINT unique_salary_per_employee UNIQUE (employee_id, salary_amount);

-- 9. Modify the effective_date column to allow NULL values
ALTER TABLE salaries
MODIFY COLUMN effective_date DATE NULL;

-- 10. Change the data type of the salary_id column
ALTER TABLE salaries
MODIFY COLUMN salary_id BIGINT AUTO_INCREMENT;

-- --------------------
--   DELETE queries   |
-- --------------------

-- 1. Delete a specific salary record
DELETE FROM salaries
WHERE salary_id = 1;

-- 2. Delete all salary records for a specific employee
DELETE FROM salaries
WHERE employee_id = 3;

-- 3. Delete salary records with salary amount less than a specific value
DELETE FROM salaries
WHERE salary_amount < 75000;

-- 4. Delete salary records before a certain date
DELETE FROM salaries
WHERE effective_date < '2023-01-01';

-- 5. Delete salary records for employees with a certain job title
DELETE FROM salaries
WHERE employee_id IN (SELECT employee_id FROM employees WHERE job_title = 'Software Engineer');

-- 6. Delete salary records for employees with specific IDs
DELETE FROM salaries
WHERE employee_id IN (1, 5, 9);

-- 7. Delete all salary records for employees in a specific department
DELETE FROM salaries
WHERE employee_id IN (SELECT employee_id FROM employees WHERE department_id = 2);

-- 8. Delete salary records older than a specific date
DELETE FROM salaries
WHERE effective_date < '2023-06-01';

-- 9. Delete salary records for employees with a specific salary range
DELETE FROM salaries
WHERE salary_amount BETWEEN 70000 AND 90000;

-- 10. Delete all salary records (use with caution)
DELETE FROM salaries;


-- --------------------
--   RENAME queries   |
-- --------------------

-- 1. Rename the salaries table
ALTER TABLE salaries RENAME TO employee_salaries;

-- 2. Rename the column employee_id
ALTER TABLE employee_salaries RENAME COLUMN employee_id TO emp_id;

-- 3. Rename the column salary_amount
ALTER TABLE employee_salaries RENAME COLUMN base_salary TO salary_amount;

-- 4. Rename the effective_date column
ALTER TABLE employee_salaries RENAME COLUMN effective_date TO salary_date;

-- 5. Rename multiple columns
ALTER TABLE employee_salaries
RENAME COLUMN salary_amount TO base_salary,
RENAME COLUMN salary_date TO effective_date;


-- --------------------
--   UPDATE queries   |
-- --------------------

-- 1. Update salary for a specific employee
UPDATE salaries
SET salary_amount = 95000.00
WHERE employee_id = 2;

-- 2. Update salary for employees in a specific department
UPDATE salaries
SET salary_amount = 80000.00
WHERE employee_id IN (SELECT employee_id FROM employees WHERE department_id = 4);

-- 3. Increase salary by a specific amount for all employees
UPDATE salaries
SET salary_amount = salary_amount + 5000;

-- 4. Update salary for a specific employee on a certain date
UPDATE salaries
SET salary_amount = 100000.00
WHERE employee_id = 1 AND effective_date = '2023-01-01';

-- 5. Update salary for multiple employees in a department
UPDATE salaries
SET salary_amount = salary_amount * 1.10
WHERE employee_id IN (SELECT employee_id FROM employees WHERE department_id = 2);

-- 6. Update salary for employees with a specific job title
UPDATE salaries
SET salary_amount = salary_amount + 10000
WHERE employee_id IN (SELECT employee_id FROM employees WHERE job_title = 'HR Manager');

-- 7. Update salary to a fixed amount for a specific employee
UPDATE salaries
SET salary_amount = 120000.00
WHERE employee_id = 3;

-- 8. Update salary for employees based on performance review
UPDATE salaries
SET salary_amount = salary_amount * 1.15
WHERE employee_id IN (SELECT employee_id FROM employees WHERE hire_date < '2020-01-01');

-- 9. Update salary for a specific employee after promotion
UPDATE salaries
SET salary_amount = salary_amount + 15000
WHERE employee_id = 4;

-- 10. Update salary for employees in a specific range
UPDATE salaries
SET salary_amount = salary_amount * 1.05
WHERE salary_amount BETWEEN 75000 AND 100000;

-- =======================================================================================================================
--                                                         END                                                           |
-- =======================================================================================================================