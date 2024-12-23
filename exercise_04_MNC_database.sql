
-- ================================================
--               Database : Enterprise 
-- ================================================

-- Create the ENTERPRISE database
CREATE DATABASE enterprise;

-- Switch to the ENTERPRISE database
USE enterprise;

-- Drop table
DROP TABLE multinationalcompanies;

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


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--               Table 2 : DEPARTMENTS 
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~