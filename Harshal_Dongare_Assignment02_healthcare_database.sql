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


-- -----------------------------------------------------
--                    Table 1: PATIENTS                |    
-- -----------------------------------------------------

CREATE TABLE patients(
    patient_id INT AUTO_INCREMENT PRIMARY KEY,        -- Unique identifier for each patient, auto-incremented
    name VARCHAR(100) NOT NULL,                       -- Full name of the patient, cannot be NULL
    age INT,                                          -- Age of the patient
    gender ENUM("Male", "Female", "Other"),           -- Gender of the patient, restricted to specific values
    contact VARCHAR(15) UNIQUE NOT NULL,              -- Contact number of the patient, must be UNIQUE and cannot be NULL
    address TEXT NOT NULL,                            -- Residential address of the patient, cannot be NULL
	CONSTRAINT chk_age CHECK (age BETWEEN 0 AND 120)  -- Ensures age is within a realistic range
);