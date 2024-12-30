-- --------------------------------------------------------
--              Database: Healthcare System               |
-- --------------------------------------------------------


-- ------------------------------------------------------------- 
--       Database Creation, Selection, and Deletion Commands   |
-- -------------------------------------------------------------

-- Create the 'healthcaredb' database
CREATE DATABASE healthcaredb;

-- Create the 'healthcaredb' database if it doesn't already exist
CREATE DATABASE IF NOT EXISTS healthcaredb;

-- Delete the 'healthcaredb' database
DROP DATABASE healthcaredb;

-- Drop the 'healthcaredb' database if it exists
DROP DATABASE IF EXISTS healthcaredb;

-- Switch to the 'healthcaredb' database
USE healthcaredb;


-- O================O==================O==================O==================O



-- -----------------------------------------------------
--                    Table 1: PATIENTS                |    
-- -----------------------------------------------------

-- Create table to store patient details
CREATE TABLE patients(
    patient_id INT AUTO_INCREMENT PRIMARY KEY,        -- Unique identifier for each patient, auto-incremented
    name VARCHAR(100) NOT NULL,                       -- Full name of the patient, cannot be NULL
    age INT,                                          -- Age of the patient
    gender ENUM("Male", "Female", "Other"),           -- Gender of the patient, restricted to specific values
    contact VARCHAR(15) UNIQUE NOT NULL,              -- Contact number of the patient, must be UNIQUE and cannot be NULL
    address TEXT NOT NULL,                            -- Residential address of the patient, cannot be NULL
	CONSTRAINT chk_age CHECK (age BETWEEN 0 AND 120)  -- Ensures age is within a realistic range
);

-- Insert patient details into the patient table
INSERT INTO patients(name, age, gender, contact, address)
VALUES
("Harshal Dongare", 25, "Male", "7895236411", "123 Main St, City, Country"),
("Aisha Sharma", 30, "Female", "7895236412", "456 Elm St, City, Country"),
("Ravi Patel", 28, "Male", "7895236413", "789 Oak St, City, Country"),
("Priya Yadav", 35, "Female", "7895236414", "101 Pine St, City, Country"),
("Sanjay Kumar", 40, "Male", "7895236415", "202 Maple St, City, Country"),
("Anjali Mehta", 22, "Female", "7895236416", "303 Birch St, City, Country"),
("Vikram Singh", 50, "Male", "7895236417", "404 Cedar St, City, Country"),
("Neha Gupta", 27, "Female", "7895236418", "505 Willow St, City, Country"),
("Amit Verma", 33, "Male", "7895236419", "606 Redwood St, City, Country"),
("Simran Kaur", 29, "Female", "7895236420", "707 Spruce St, City, Country");


--                              --------------------------
--                              |      Basic Commands    | 
--                              --------------------------


-- Drop 'patients' table and all its data
DROP TABLE patients;

-- Remove all data from the patient's table without deleting the table structure
TRUNCATE TABLE patients;

--                              --------------------------
--                              |     SELECT Queries     | 
--                              --------------------------

-- Select all columns from the patient table
SELECT * FROM patients;

-- Select only the name and age of all patients
SELECT name, age FROM patients;

-- Select all patients who are older than 30
SELECT * FROM patients WHERE age > 30;

-- Select distinct values of gender from the patients table
SELECT DISTINCT gender FROM patients;

-- Select all patients whose name starts with 'A'
SELECT * FROM patients WHERE name LIKE 'A%';

-- Select the name and contact of patients where age is between 20 and 40
SELECT name,contact FROM patients WHERE age BETWEEN 20 AND 40;

-- Select the total number of patients in the patients table
SELECT COUNT(*) AS patient_count FROM patients;

-- Select the patient details who have the contact number "7895236411"
SELECT * FROM patients WHERE contact = '7895236411';

-- Select the average age of all patients in the patient's table
SELECT AVG(age) AS avg_age FROM patients;

-- Select the name and address of patients ordered by age in descending order
SELECT name,address FROM patients ORDER BY age DESC;


--                              --------------------------
--                              |      ALTER Queries     | 
--                              --------------------------

-- Add a new column email of type VARCHAR(100) to the patients table
ALTER TABLE patients
ADD COLUMN email VARCHAR(100);

-- Change the data type of the contact column in the patients table to VARCHAR(20)
ALTER TABLE patients
MODIFY COLUMN contact VARCHAR(20);

-- Rename the column contact to phone_number in the patients table
ALTER TABLE patients
RENAME COLUMN contact TO phone_number;

-- Drop the address column from the patients table
ALTER TABLE patients
DROP COLUMN address;

-- Add the unique constraint on the email column in the patient table
ALTER TABLE patients
ADD CONSTRAINT unique_email UNIQUE (email);

-- Modify the age column to set a default value of 18 in the patient table
ALTER TABLE patients
MODIFY COLUMN age INT DEFAULT 18;

-- Add a new column date_of_birth of type DATE to the patient table
ALTER TABLE patients
ADD COLUMN date_of_birth DATE;

-- Change the gender column to allow only ENUM("Male", "Female", "Other") values in the patient table
ALTER TABLE patients
MODIFY COLUMN gender ENUM("Male", "Female", "Other");

-- Rename the patient table to patient_record
ALTER TABLE patients
RENAME TO patient_records; 

-- Add a NOT NULL constraint to the age column in the patients table
ALTER TABLE patient_records
MODIFY COLUMN age INT NOT NULL DEFAULT 18;

--                              --------------------------
--                              |      DELETE Queries    | 
--                              --------------------------

-- Delete a patient by their patient_id
DELETE FROM patient_records
WHERE patient_id = 5;

-- Delete all patients who are younger than 27
DELETE FROM patient_records
WHERE age <= 27;

-- Delete patients whose contact number is NULL
DELETE FROM patient_records
WHERE phone_number IS NULL;

-- Delete all patients whose address contains "Delhi"
DELETE FROM patient_records
WHERE address LIKE "%Delhi%";

-- Delete patients who are older than 80 years old
DELETE FROM patient_records
WHERE age >= 50;

-- Delete all the patients with the gender "Other"
DELETE FROM patient_records
WHERE gender = "Other";

-- Delete all rows from patient table
DELETE FROM patient_records;


--                              --------------------------
--                              |      RENAME Queries    | 
--                              --------------------------

-- Rename the contact column to phone_number in the patient table
ALTER TABLE patients
RENAME COLUMN contact TO phone_number;

-- Rename the age column to patient_age in the patients table
-- (You cannot rename the column directly because it is involved in the constraint)
ALTER TABLE patients
DROP CONSTRAINT chk_age;

ALTER TABLE patients
RENAME COLUMN age TO patient_age;

ALTER TABLE patients
ADD CONSTRAINT chk_age CHECK (patient_age BETWEEN 0 AND 120);

-- Rename patient table to patient_records
ALTER TABLE patients
RENAME TO patient_records;

-- Rename the address column to residential_address in the patients table
ALTER TABLE patient_records
RENAME COLUMN address TO residential_address;

-- Rename the name column to full_name in the patients table
ALTER TABLE patient_records
RENAME COLUMN name TO full_name;

--                              --------------------------
--                              |      UPDATE Queries    | 
--                              --------------------------

select * from patient_records;

-- Update the contact number of a patient with a specific patient_id
UPDATE patient_records
SET phone_number = "1111222269"
WHERE patient_id = 1;

-- Update the age of a patient where the name is 'Neha Gupta'
UPDATE patient_records
SET patient_age = 19
WHERE full_name = "Neha Gupta";

-- Update the address of all patients where the gender is 'Male' to a new city
UPDATE patient_records
SET residential_address = "999 Main Street, New Delhi, India"
WHERE gender = "Male";

-- O================O==================O==================O==================O

-- -----------------------------------------------------
--                    Table 2: DOCTORS                 |    
-- -----------------------------------------------------