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
--                    Table 2: DOCTORS                |    
-- -----------------------------------------------------

-- Create table to store doctor details
CREATE TABLE doctors(
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,        -- Unique identifier for each doctor, auto-incremented
    name VARCHAR(100) NOT NULL,                       -- Full name of the doctor, cannot be NULL
    specialty VARCHAR(100),                           -- Specialty of the doctor
    phone VARCHAR(15) UNIQUE NOT NULL,                -- Contact number of the doctor, must be UNIQUE and cannot be NULL
    email VARCHAR(100) UNIQUE,                        -- Email of the doctor, must be UNIQUE
    CONSTRAINT chk_specialty CHECK (specialty IN ("Cardiology", "Neurology", "Orthopedics", "Dermatology", "Pediatrics", "General Medicine"))  -- Ensures specialty is one of the predefined options
);

-- Insert doctor details into the doctor table
INSERT INTO doctors(name, specialty, phone, email)
VALUES
("Dr. Harshal Dongare", "Cardiology", "9885236411", "harshal.d@hospital.com"),
("Dr. Aisha Sharma", "Neurology", "9885236412", "aisha.s@hospital.com"),
("Dr. Ravi Patel", "Orthopedics", "9885236413", "ravi.p@hospital.com"),
("Dr. Priya Yadav", "Dermatology", "9885236414", "priya.y@hospital.com"),
("Dr. Sanjay Kumar", "Pediatrics", "9885236415", "sanjay.k@hospital.com"),
("Dr. Anjali Mehta", "General Medicine", "9885236416", "anjali.m@hospital.com"),
("Dr. Vikram Singh", "Cardiology", "9885236417", "vikram.s@hospital.com"),
("Dr. Neha Gupta", "Neurology", "9885236418", "neha.g@hospital.com"),
("Dr. Amit Verma", "Orthopedics", "9885236419", "amit.v@hospital.com"),
("Dr. Simran Kaur", "Dermatology", "9885236420", "simran.k@hospital.com");


--                              --------------------------
--                              |      Basic Commands    | 
--                              --------------------------

-- Drop 'doctors' table and all its data
DROP TABLE doctors;

-- Remove all data from the doctor's table without deleting the table structure
TRUNCATE TABLE doctors;


--                              --------------------------
--                              |     SELECT Queries     | 
--                              --------------------------

-- Select all columns from the doctor table
SELECT * FROM doctors;

-- Select only the name and specialty of all doctors
SELECT name, specialty FROM doctors;

-- Select all doctors who specialize in Cardiology
SELECT * FROM doctors WHERE specialty = "Cardiology";

-- Select distinct values of specialty from the doctors table
SELECT DISTINCT specialty FROM doctors;

-- Select all doctors whose name starts with 'A'
SELECT * FROM doctors WHERE name LIKE 'A%';

-- Select the name and phone number of doctors who are specialists in Neurology
SELECT name, phone FROM doctors WHERE specialty = "Neurology";

-- Select the total number of doctors in the doctors table
SELECT COUNT(*) AS doctor_count FROM doctors;

-- Select the doctor details with the phone number "9885236411"
SELECT * FROM doctors WHERE phone = '9885236411';

-- Select the average number of doctors in each specialty
SELECT specialty, COUNT(*) AS count FROM doctors GROUP BY specialty;

-- Select the name and specialty of doctors ordered by name in ascending order
SELECT name, specialty FROM doctors ORDER BY name ASC;


--                              --------------------------
--                              |      ALTER Queries     | 
--                              --------------------------

-- Add a new column address of type VARCHAR(200) to the doctors table
ALTER TABLE doctors
ADD COLUMN address VARCHAR(200);

-- Change the data type of the phone column in the doctors table to VARCHAR(20)
ALTER TABLE doctors
MODIFY COLUMN phone VARCHAR(20);

-- Rename the column phone to phone_number in the doctors table
ALTER TABLE doctors
RENAME COLUMN phone TO phone_number;

-- Drop the email column from the doctors table
ALTER TABLE doctors
DROP COLUMN email;

-- Add the unique constraint on the phone_number column in the doctor table
ALTER TABLE doctors
ADD CONSTRAINT unique_phone_number UNIQUE (phone_number);

-- Modify the specialty column to set a default value of 'General Medicine' in the doctor table
ALTER TABLE doctors
MODIFY COLUMN specialty VARCHAR(100) DEFAULT 'General Medicine';

-- Add a new column date_of_birth of type DATE to the doctor table
ALTER TABLE doctors
ADD COLUMN date_of_birth DATE;

-- Change the doctor_id column to allow auto-increment
ALTER TABLE doctors
MODIFY COLUMN doctor_id INT AUTO_INCREMENT;

-- Rename the doctor table to doctor_details
ALTER TABLE doctors
RENAME TO doctor_details;

-- Add a NOT NULL constraint to the name column in the doctors table
ALTER TABLE doctor_details
MODIFY COLUMN name VARCHAR(100) NOT NULL;


--                              --------------------------
--                              |      DELETE Queries    | 
--                              --------------------------

-- Delete a doctor by their doctor_id
DELETE FROM doctor_details
WHERE doctor_id = 5;

-- Delete all doctors who specialize in Dermatology
DELETE FROM doctor_details
WHERE specialty = "Dermatology";

-- Delete doctors whose phone number is NULL
DELETE FROM doctor_details
WHERE phone_number IS NULL;

-- Delete all doctors whose specialty is 'General Medicine'
DELETE FROM doctor_details
WHERE specialty = "General Medicine";

-- Delete doctors who are older than 65 years old
DELETE FROM doctor_details
WHERE date_of_birth < "1959-01-01";

-- Delete all the doctors with the specialty "Neurology"
DELETE FROM doctor_details
WHERE specialty = "Neurology";

-- Delete all rows from the doctor table
DELETE FROM doctor_details;


--                              --------------------------
--                              |      RENAME Queries    | 
--                              --------------------------

-- Rename the phone_number column to contact_number in the doctor table
ALTER TABLE doctors
RENAME COLUMN phone_number TO contact_number;

-- Rename the specialty column to area_of_expertise in the doctors table
ALTER TABLE doctors
RENAME COLUMN specialty TO area_of_expertise;

-- Rename doctor table to doctor_details
ALTER TABLE doctors
RENAME TO doctor_details;

-- Rename the name column to full_name in the doctors table
ALTER TABLE doctor_details
RENAME COLUMN name TO full_name;

--                              --------------------------
--                              |      UPDATE Queries    | 
--                              --------------------------

-- Select all records from the doctor_details table
SELECT * FROM doctor_details;

-- Update the phone number of a doctor with a specific doctor_id
UPDATE doctor_details
SET contact_number = "9991223344"
WHERE doctor_id = 1;

-- Update the specialty of a doctor where the name is 'Dr. Neha Gupta'
UPDATE doctor_details
SET area_of_expertise = "Orthopedics"
WHERE full_name = "Dr. Neha Gupta";

-- Update the email of all doctors specializing in Cardiology to a new domain
UPDATE doctor_details
SET email = "cardiology@hospital.com"
WHERE area_of_expertise = "Cardiology";

-- O================O==================O==================O==================O

-- -----------------------------------------------------
--                    Table 3: APPOINTMENTS            |    
-- -----------------------------------------------------

-- Create table to store appointment details
CREATE TABLE appointments(
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,        -- Unique identifier for each appointment, auto-incremented
    patient_id INT,                                       -- Foreign key referring to the patient_id from the patients table
    doctor_id INT,                                        -- Foreign key referring to the doctor_id from the doctors table
    appointment_date DATE,                                -- The date of the appointment
    appointment_time TIME,                                -- The time of the appointment
    status ENUM("Scheduled", "Completed", "Cancelled") DEFAULT "Scheduled",  -- Status of the appointment
    CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE,  -- Foreign key constraint for patient_id
    CONSTRAINT fk_doctor FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id) ON DELETE CASCADE,   -- Foreign key constraint for doctor_id
    CONSTRAINT chk_appointment_time CHECK (appointment_time BETWEEN '08:00:00' AND '18:00:00')  -- Ensures the appointment time is within working hours (8 AM to 6 PM)
);

-- Insert appointment details into the appointments table
INSERT INTO appointments(patient_id, doctor_id, appointment_date, appointment_time, status)
VALUES
(1, 2, '2024-12-31', '09:00:00', 'Scheduled'),
(2, 3, '2024-12-31', '10:00:00', 'Scheduled'),
(3, 4, '2024-12-31', '11:00:00', 'Scheduled'),
(4, 5, '2024-12-31', '12:00:00', 'Scheduled'),
(5, 6, '2024-12-31', '13:00:00', 'Scheduled'),
(6, 7, '2024-12-31', '14:00:00', 'Scheduled'),
(7, 8, '2024-12-31', '15:00:00', 'Scheduled'),
(8, 9, '2024-12-31', '16:00:00', 'Scheduled'),
(9, 10, '2024-12-31', '17:00:00', 'Scheduled'),
(10, 1, '2024-12-31', '18:00:00', 'Scheduled');


--                              --------------------------
--                              |      Basic Commands    | 
--                              --------------------------

-- Drop 'appointments' table and all its data
DROP TABLE appointments;

-- Remove all data from the appointments table without deleting the table structure
TRUNCATE TABLE appointments;


--                              --------------------------
--                              |     SELECT Queries     | 
--                              --------------------------

-- Select all columns from the appointments table
SELECT * FROM appointments;

-- Select all appointments for a specific patient by patient_id
SELECT * FROM appointments WHERE patient_id = 1;

-- Select all appointments for a specific doctor by doctor_id
SELECT * FROM appointments WHERE doctor_id = 2;

-- Select all appointments scheduled for a particular date
SELECT * FROM appointments WHERE appointment_date = '2024-12-31';

-- Select all appointments with status 'Scheduled'
SELECT * FROM appointments WHERE status = 'Scheduled';

-- Select the count of appointments scheduled for a particular date
SELECT COUNT(*) AS appointment_count FROM appointments WHERE appointment_date = '2024-12-31';

-- Select all appointments where the time is between 9:00 AM and 12:00 PM
SELECT * FROM appointments WHERE appointment_time BETWEEN '09:00:00' AND '12:00:00';

-- Select the name of patients and the names of doctors for a particular appointment
SELECT p.name AS patient_name, d.name AS doctor_name
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE a.appointment_id = 1;


--                              --------------------------
--                              |      ALTER Queries     | 
--                              --------------------------

-- Add a new column appointment_type of type VARCHAR(50) to the appointments table
ALTER TABLE appointments
ADD COLUMN appointment_type VARCHAR(50);

-- Change the data type of the status column to VARCHAR(20)
ALTER TABLE appointments
MODIFY COLUMN status VARCHAR(20);

-- Rename the column status to appointment_status in the appointments table
ALTER TABLE appointments
RENAME COLUMN status TO appointment_status;

-- Drop the appointment_type column from the appointments table
ALTER TABLE appointments
DROP COLUMN appointment_type;

-- Add a unique constraint on the combination of patient_id, doctor_id, and appointment_date
ALTER TABLE appointments
ADD CONSTRAINT unique_appointment UNIQUE (patient_id, doctor_id, appointment_date);

-- Modify the status column to set a default value of 'Scheduled' in the appointments table
ALTER TABLE appointments
MODIFY COLUMN appointment_status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled';

-- Add a new column appointment_time_end of type TIME to the appointments table
ALTER TABLE appointments
ADD COLUMN appointment_time_end TIME;

-- Modify the appointment_time column to allow appointments to be scheduled between 08:00 AM and 08:00 PM
ALTER TABLE appointments
MODIFY COLUMN appointment_time TIME CHECK (appointment_time BETWEEN '08:00:00' AND '20:00:00');

-- Rename the appointments table to patient_appointments
ALTER TABLE appointments
RENAME TO patient_appointments;


--                              --------------------------
--                              |      DELETE Queries    | 
--                              --------------------------

-- Delete an appointment by appointment_id
DELETE FROM patient_appointments
WHERE appointment_id = 3;

-- Delete all appointments for a specific patient by patient_id
DELETE FROM patient_appointments
WHERE patient_id = 1;

-- Delete all appointments for a specific doctor by doctor_id
DELETE FROM patient_appointments
WHERE doctor_id = 2;

-- Delete all appointments that are scheduled for a past date
DELETE FROM patient_appointments
WHERE appointment_date < CURDATE();

-- Delete all appointments with status 'Cancelled'
DELETE FROM patient_appointments
WHERE appointment_status = 'Cancelled';

-- Delete all appointments with status 'Completed'
DELETE FROM patient_appointments
WHERE appointment_status = 'Completed';

-- Delete all rows from the appointments table
DELETE FROM patient_appointments;


--                              --------------------------
--                              |      RENAME Queries    | 
--                              --------------------------

-- Rename the appointment_time column to start_time in the appointments table
ALTER TABLE patient_appointments
RENAME COLUMN appointment_time TO start_time;

-- Rename the appointment_date column to appointment_day in the appointments table
ALTER TABLE patient_appointments
RENAME COLUMN appointment_date TO appointment_day;

-- Rename patient_appointments table to appointment_details
ALTER TABLE patient_appointments
RENAME TO appointment_details;

--                              --------------------------
--                              |      UPDATE Queries    | 
--                              --------------------------

-- Select all records from the appointment_details table
SELECT * FROM appointment_details;

-- Update the status of an appointment with a specific appointment_id
UPDATE appointment_details
SET appointment_status = 'Completed'
WHERE appointment_id = 1;

-- Update the appointment time for a specific patient and doctor
UPDATE appointment_details
SET start_time = '10:30:00'
WHERE patient_id = 2 AND doctor_id = 3;

-- Update the status of all appointments for a specific doctor
UPDATE appointment_details
SET appointment_status = 'Cancelled'
WHERE doctor_id = 4;

-- Update the appointment date for a specific patient
UPDATE appointment_details
SET appointment_day = '2025-01-01'
WHERE patient_id = 3;

-- O================O==================O==================O==================O

-- -----------------------------------------------------
--                    Table 4: MEDICAL_HISTORY          |    
-- -----------------------------------------------------

-- Create table to store medical history details
CREATE TABLE medical_history(
    history_id INT AUTO_INCREMENT PRIMARY KEY,        -- Unique identifier for each medical history record, auto-incremented
    patient_id INT,                                    -- Foreign key referring to the patient_id from the patients table
    diagnosis TEXT,                                    -- Diagnosis given to the patient
    treatment TEXT,                                    -- Treatment prescribed to the patient
    notes TEXT,                                        -- Additional notes or remarks related to the medical history
    CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE   -- Foreign key constraint for patient_id
);

-- Insert medical history details into the medical_history table
INSERT INTO medical_history(patient_id, diagnosis, treatment, notes)
VALUES
(1, 'Common Cold', 'Rest, Fluids, Paracetamol', 'Patient is advised to avoid cold weather'),
(2, 'Hypertension', 'Blood Pressure Medications', 'Patient is advised to follow a low-salt diet'),
(3, 'Diabetes Type 2', 'Insulin Therapy, Metformin', 'Patient needs to monitor blood sugar levels regularly'),
(4, 'Asthma', 'Inhaler, Bronchodilators', 'Avoid exposure to allergens and cold air'),
(5, 'Migraine', 'Painkillers, Avoid Triggers', 'Patient should track migraine triggers'),
(6, 'Anemia', 'Iron Supplements, Vitamin B12', 'Patient advised to include iron-rich foods in the diet'),
(7, 'Osteoarthritis', 'Pain Relief, Physical Therapy', 'Patient should engage in light exercise to improve mobility'),
(8, 'Back Pain', 'Rest, Physiotherapy, Painkillers', 'Patient advised to avoid lifting heavy weights'),
(9, 'Pneumonia', 'Antibiotics, Rest', 'Patient needs to complete the full course of antibiotics'),
(10, 'Flu', 'Rest, Antiviral Medications', 'Patient advised to stay hydrated and rest at home');

--                              --------------------------
--                              |      Basic Commands    | 
--                              --------------------------

-- Drop 'medical_history' table and all its data
DROP TABLE medical_history;

-- Remove all data from the medical_history table without deleting the table structure
TRUNCATE TABLE medical_history;


--                              --------------------------
--                              |     SELECT Queries     | 
--                              --------------------------

-- Select all columns from the medical_history table
SELECT * FROM medical_history;

-- Select all medical history records for a specific patient by patient_id
SELECT * FROM medical_history WHERE patient_id = 1;

-- Select all medical history records for a specific diagnosis
SELECT * FROM medical_history WHERE diagnosis LIKE '%Cold%';

-- Select all treatments provided to a specific patient
SELECT treatment FROM medical_history WHERE patient_id = 2;

-- Select all patients who have received treatment for 'Hypertension'
SELECT p.name, m.diagnosis, m.treatment
FROM medical_history m
JOIN patients p ON m.patient_id = p.patient_id
WHERE m.diagnosis = 'Hypertension';

-- Select the count of medical history records
SELECT COUNT(*) AS history_count FROM medical_history;

-- Select all medical history records with notes
SELECT * FROM medical_history WHERE notes IS NOT NULL;


--                              --------------------------
--                              |      ALTER Queries     | 
--                              --------------------------

-- Add a new column visit_date of type DATE to the medical_history table
ALTER TABLE medical_history
ADD COLUMN visit_date DATE;

-- Change the data type of the diagnosis column to VARCHAR(255)
ALTER TABLE medical_history
MODIFY COLUMN diagnosis VARCHAR(255);

-- Rename the column treatment to prescribed_treatment in the medical_history table
ALTER TABLE medical_history
RENAME COLUMN treatment TO prescribed_treatment;

-- Drop the notes column from the medical_history table
ALTER TABLE medical_history
DROP COLUMN notes;

-- Add a unique constraint on the combination of patient_id and visit_date
ALTER TABLE medical_history
ADD CONSTRAINT unique_patient_history UNIQUE (patient_id, visit_date);

-- Modify the diagnosis column to set a default value of 'No diagnosis provided'
ALTER TABLE medical_history
MODIFY COLUMN diagnosis VARCHAR(255) DEFAULT 'No diagnosis provided';

-- Add a new column treatment_start_date of type DATE to the medical_history table
ALTER TABLE medical_history
ADD COLUMN treatment_start_date DATE;

-- Rename the medical_history table to patient_medical_history
ALTER TABLE medical_history
RENAME TO patient_medical_history;


--                              --------------------------
--                              |      DELETE Queries    | 
--                              --------------------------

-- Delete a medical history record by history_id
DELETE FROM patient_medical_history
WHERE history_id = 3;

-- Delete all medical history records for a specific patient by patient_id
DELETE FROM patient_medical_history
WHERE patient_id = 1;

-- Delete all medical history records for a specific diagnosis
DELETE FROM patient_medical_history
WHERE diagnosis = 'Asthma';

-- Delete all medical history records with missing treatment
DELETE FROM patient_medical_history
WHERE prescribed_treatment IS NULL;

-- Delete all medical history records for patients who have visited after a certain date
DELETE FROM patient_medical_history
WHERE visit_date > '2024-12-31';

-- Delete all rows from the medical_history table
DELETE FROM patient_medical_history;


--                              --------------------------
--                              |      RENAME Queries    | 
--                              --------------------------

-- Rename the diagnosis column to patient_diagnosis in the medical_history table
ALTER TABLE patient_medical_history
RENAME COLUMN diagnosis TO patient_diagnosis;

-- Rename the prescribed_treatment column to treatment_plan in the medical_history table
ALTER TABLE patient_medical_history
RENAME COLUMN prescribed_treatment TO treatment_plan;

-- Rename patient_medical_history table to medical_records
ALTER TABLE patient_medical_history
RENAME TO medical_records;

--                              --------------------------
--                              |      UPDATE Queries    | 
--                              --------------------------

-- Select all records from the medical_records table
SELECT * FROM medical_records;

-- Update the prescribed treatment for a specific patient
UPDATE medical_records
SET treatment_plan = 'Physical Therapy, Surgery'
WHERE patient_id = 7;

-- Update the diagnosis for a specific patient
UPDATE medical_records
SET patient_diagnosis = 'Severe Migraine'
WHERE patient_id = 9;

-- Update the treatment plan for all patients diagnosed with 'Flu'
UPDATE medical_records
SET treatment_plan = 'Rest, Antiviral Medications, Hydration'
WHERE patient_diagnosis = 'Flu';

-- Update the visit date for a specific patient
UPDATE medical_records
SET visit_date = '2024-12-25'
WHERE patient_id = 6;

-- O================O==================O==================O==================O

-- -----------------------------------------------------
--                    Table 5: MEDICATIONS               |    
-- -----------------------------------------------------

-- Create table to store medication details
CREATE TABLE medications(
    medication_id INT AUTO_INCREMENT PRIMARY KEY,      -- Unique identifier for each medication, auto-incremented
    name VARCHAR(100) NOT NULL,                         -- Name of the medication, cannot be NULL
    type VARCHAR(50),                                   -- Type of the medication (e.g., tablet, syrup)
    price DECIMAL(10, 2),                               -- Price of the medication, formatted to two decimal places
    description TEXT                                    -- Description of the medication
);

-- Insert medication details into the medications table
INSERT INTO medications(name, type, price, description)
VALUES
("Paracetamol", "Tablet", 10.00, "Used for fever and pain relief"),
("Ibuprofen", "Tablet", 15.00, "Anti-inflammatory and pain relief"),
("Aspirin", "Tablet", 12.50, "Used for pain relief, inflammation, and reducing fever"),
("Amoxicillin", "Capsule", 25.00, "Antibiotic used to treat bacterial infections"),
("Metformin", "Tablet", 30.00, "Used to control blood sugar levels in diabetes"),
("Losartan", "Tablet", 50.00, "Used for treating high blood pressure"),
("Omeprazole", "Capsule", 40.00, "Used for treating acid reflux and stomach ulcers"),
("Loratadine", "Syrup", 20.00, "Antihistamine used for allergies"),
("Doxycycline", "Capsule", 60.00, "Antibiotic used for treating various infections"),
("Fluoxetine", "Tablet", 80.00, "Antidepressant used to treat depression and anxiety");

--                              --------------------------
--                              |      Basic Commands    | 
--                              --------------------------

-- Drop 'medications' table and all its data
DROP TABLE medications;

-- Remove all data from the medications table without deleting the table structure
TRUNCATE TABLE medications;


--                              --------------------------
--                              |     SELECT Queries     | 
--                              --------------------------

-- Select all columns from the medications table
SELECT * FROM medications;

-- Select all medications with a specific type (e.g., Tablet)
SELECT * FROM medications WHERE type = 'Tablet';

-- Select all medications whose price is greater than a specific value
SELECT * FROM medications WHERE price > 20.00;

-- Select distinct values of medication type
SELECT DISTINCT type FROM medications;

-- Select the name and price of all medications whose name starts with 'A'
SELECT name, price FROM medications WHERE name LIKE 'A%';

-- Select the total number of medications in the medications table
SELECT COUNT(*) AS medication_count FROM medications;

-- Select the details of a specific medication by its name
SELECT * FROM medications WHERE name = 'Ibuprofen';

-- Select the average price of all medications
SELECT AVG(price) AS avg_price FROM medications;

-- Select the name and price of medications ordered by price in descending order
SELECT name, price FROM medications ORDER BY price DESC;


--                              --------------------------
--                              |      ALTER Queries     | 
--                              --------------------------

-- Add a new column manufacturer of type VARCHAR(100) to the medications table
ALTER TABLE medications
ADD COLUMN manufacturer VARCHAR(100);

-- Change the data type of the price column to DECIMAL(12, 2)
ALTER TABLE medications
MODIFY COLUMN price DECIMAL(12, 2);

-- Rename the column description to details in the medications table
ALTER TABLE medications
RENAME COLUMN description TO details;

-- Drop the manufacturer column from the medications table
ALTER TABLE medications
DROP COLUMN manufacturer;

-- Add the unique constraint on the name column in the medications table
ALTER TABLE medications
ADD CONSTRAINT unique_medication_name UNIQUE (name);

-- Modify the price column to set a default value of 0.00 in the medications table
ALTER TABLE medications
MODIFY COLUMN price DECIMAL(10, 2) DEFAULT 0.00;

-- Add a new column expiry_date of type DATE to the medications table
ALTER TABLE medications
ADD COLUMN expiry_date DATE;

-- Rename the medications table to pharmaceutical_products
ALTER TABLE medications
RENAME TO pharmaceutical_products;


--                              --------------------------
--                              |      DELETE Queries    | 
--                              --------------------------

-- Delete a medication by its medication_id
DELETE FROM pharmaceutical_products
WHERE medication_id = 3;

-- Delete all medications whose price is less than a specific value
DELETE FROM pharmaceutical_products
WHERE price < 20.00;

-- Delete medications with no description
DELETE FROM pharmaceutical_products
WHERE details IS NULL;

-- Delete all medications from a specific manufacturer
DELETE FROM pharmaceutical_products
WHERE manufacturer = 'XYZ Pharma';

-- Delete all medications that have expired
DELETE FROM pharmaceutical_products
WHERE expiry_date < '2024-12-31';

-- Delete all rows from the medications table
DELETE FROM pharmaceutical_products;


--                              --------------------------
--                              |      RENAME Queries    | 
--                              --------------------------

-- Rename the type column to medication_type in the medications table
ALTER TABLE pharmaceutical_products
RENAME COLUMN type TO medication_type;

-- Rename the name column to medication_name in the medications table
ALTER TABLE pharmaceutical_products
RENAME COLUMN name TO medication_name;

-- Rename the pharmaceutical_products table to drugs
ALTER TABLE pharmaceutical_products
RENAME TO drugs;

--                              --------------------------
--                              |      UPDATE Queries    | 
--                              --------------------------

-- Select all records from the drugs table
SELECT * FROM drugs;

-- Update the price of a medication by its medication_id
UPDATE drugs
SET price = 18.00
WHERE medication_id = 1;

-- Update the description of a specific medication
UPDATE drugs
SET details = 'Pain relief for fever and headaches'
WHERE medication_name = 'Paracetamol';

-- Update the price for all medications of a specific type
UPDATE drugs
SET price = price + 5.00
WHERE medication_type = 'Tablet';

-- Update the manufacturer for a specific medication
UPDATE drugs
SET manufacturer = 'ABC Pharma'
WHERE medication_id = 4;

-- O================O==================O==================O==================O

-- -----------------------------------------------------
--                    Table 6: PRESCRIPTIONS             |    
-- -----------------------------------------------------

-- Create table to store prescription details
CREATE TABLE prescriptions(
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique identifier for each prescription, auto-incremented
    patient_id INT,                                     -- Foreign Key linking to the patient table
    medication_id INT,                                  -- Foreign Key linking to the medications table
    date_provided DATE,                                 -- The date when the prescription was provided
    dosage VARCHAR(100),                                -- Dosage instructions for the medication
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),  -- Ensure that patient_id exists in the patients table
    FOREIGN KEY (medication_id) REFERENCES medications(medication_id)  -- Ensure that medication_id exists in the medications table
);

-- Insert prescription details into the prescriptions table
INSERT INTO prescriptions(patient_id, medication_id, date_provided, dosage)
VALUES
(1, 3, '2024-12-01', 'Take 1 tablet twice a day'),
(2, 1, '2024-12-05', 'Take 1 tablet every 6 hours'),
(3, 5, '2024-12-10', 'Take 2 tablets once a day'),
(4, 6, '2024-12-12', 'Take 1 tablet in the morning and evening'),
(5, 2, '2024-12-15', 'Take 1 tablet before meals'),
(6, 4, '2024-12-17', 'Take 1 capsule in the morning'),
(7, 7, '2024-12-18', 'Take 1 tablet twice a day'),
(8, 8, '2024-12-20', 'Take 1 syrup once a day'),
(9, 9, '2024-12-22', 'Take 1 capsule after meals'),
(10, 10, '2024-12-25', 'Take 1 tablet every morning');

--                              --------------------------
--                              |      Basic Commands    | 
--                              --------------------------

-- Drop 'prescriptions' table and all its data
DROP TABLE prescriptions;

-- Remove all data from the prescriptions table without deleting the table structure
TRUNCATE TABLE prescriptions;


--                              --------------------------
--                              |     SELECT Queries     | 
--                              --------------------------

-- Select all columns from the prescriptions table
SELECT * FROM prescriptions;

-- Select all prescriptions for a specific patient
SELECT * FROM prescriptions WHERE patient_id = 1;

-- Select all prescriptions for a specific medication
SELECT * FROM prescriptions WHERE medication_id = 5;

-- Select the patient ID, medication name, and dosage for all prescriptions
SELECT p.patient_id, m.name AS medication_name, pr.dosage 
FROM prescriptions pr
JOIN medications m ON pr.medication_id = m.medication_id;

-- Select all prescriptions where the dosage contains "twice a day"
SELECT * FROM prescriptions WHERE dosage LIKE "%twice a day%";

-- Select the total number of prescriptions in the prescriptions table
SELECT COUNT(*) AS prescription_count FROM prescriptions;

-- Select the details of prescriptions provided on a specific date
SELECT * FROM prescriptions WHERE date_provided = '2024-12-05';

-- Select the patient ID and dosage for prescriptions ordered by date provided
SELECT patient_id, dosage FROM prescriptions ORDER BY date_provided DESC;


--                              --------------------------
--                              |      ALTER Queries     | 
--                              --------------------------

-- Add a new column instructions of type TEXT to the prescriptions table
ALTER TABLE prescriptions
ADD COLUMN instructions TEXT;

-- Change the data type of the dosage column to VARCHAR(200)
ALTER TABLE prescriptions
MODIFY COLUMN dosage VARCHAR(200);

-- Rename the column dosage to medication_dosage in the prescriptions table
ALTER TABLE prescriptions
RENAME COLUMN dosage TO medication_dosage;

-- Drop the instructions column from the prescriptions table
ALTER TABLE prescriptions
DROP COLUMN instructions;

-- Modify the date_provided column to set a default value of current date in the prescriptions table
ALTER TABLE prescriptions
MODIFY COLUMN date_provided DATE DEFAULT CURRENT_DATE;

-- Add a new column follow_up_date of type DATE to the prescriptions table
ALTER TABLE prescriptions
ADD COLUMN follow_up_date DATE;

-- Rename the prescriptions table to patient_prescriptions
ALTER TABLE prescriptions
RENAME TO patient_prescriptions;


--                              --------------------------
--                              |      DELETE Queries    | 
--                              --------------------------

-- Delete a prescription by its prescription_id
DELETE FROM patient_prescriptions
WHERE prescription_id = 3;

-- Delete all prescriptions for a specific patient
DELETE FROM patient_prescriptions
WHERE patient_id = 4;

-- Delete all prescriptions for medications whose price is less than a specific value
DELETE FROM patient_prescriptions
WHERE medication_id IN (SELECT medication_id FROM medications WHERE price < 20.00);

-- Delete prescriptions with no dosage instructions
DELETE FROM patient_prescriptions
WHERE medication_dosage IS NULL;

-- Delete all prescriptions provided before a specific date
DELETE FROM patient_prescriptions
WHERE date_provided < '2024-12-10';

-- Delete all rows from the prescriptions table
DELETE FROM patient_prescriptions;


--                              --------------------------
--                              |      RENAME Queries    | 
--                              --------------------------

-- Rename the medication_id column to drug_id in the prescriptions table
ALTER TABLE patient_prescriptions
RENAME COLUMN medication_id TO drug_id;

-- Rename the date_provided column to prescription_date in the prescriptions table
ALTER TABLE patient_prescriptions
RENAME COLUMN date_provided TO prescription_date;

-- Rename the patient_prescriptions table to prescriptions_history
ALTER TABLE patient_prescriptions
RENAME TO prescriptions_history;

--                              --------------------------
--                              |      UPDATE Queries    | 
--                              --------------------------

-- Select all records from the prescriptions_history table
SELECT * FROM prescriptions_history;

-- Update the dosage of a prescription for a specific patient
UPDATE prescriptions_history
SET medication_dosage = 'Take 1 tablet three times a day'
WHERE prescription_id = 5;

-- Update the dosage for all prescriptions of a specific medication
UPDATE prescriptions_history
SET medication_dosage = 'Take 1 capsule twice a day'
WHERE drug_id = 2;

-- Update the follow-up date for a specific prescription
UPDATE prescriptions_history
SET follow_up_date = '2025-01-15'
WHERE prescription_id = 6;

-- Update the patient ID for a specific prescription
UPDATE prescriptions_history
SET patient_id = 8
WHERE prescription_id = 7;

-- O================O==================O==================O==================O

-- -----------------------------------------------------
--                    Table 7: BILLS                    |    
-- -----------------------------------------------------

-- Create table to store bill details
CREATE TABLE bills(
    bill_id INT AUTO_INCREMENT PRIMARY KEY,            -- Unique identifier for each bill, auto-incremented
    patient_id INT,                                     -- Foreign Key linking to the patient table
    total_amount DECIMAL(10, 2),                        -- Total amount for the bill
    payment_status ENUM("Paid", "Unpaid", "Pending"),   -- Payment status (Paid, Unpaid, or Pending)
    date DATE,                                          -- The date when the bill was generated
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)  -- Ensure that patient_id exists in the patients table
);

-- Insert bill details into the bills table
INSERT INTO bills(patient_id, total_amount, payment_status, date)
VALUES
(1, 1500.00, "Paid", '2024-12-01'),
(2, 2000.00, "Unpaid", '2024-12-05'),
(3, 1200.50, "Pending", '2024-12-10'),
(4, 1800.75, "Paid", '2024-12-12'),
(5, 2500.00, "Unpaid", '2024-12-15'),
(6, 900.00, "Paid", '2024-12-17'),
(7, 1700.25, "Pending", '2024-12-18'),
(8, 1400.00, "Paid", '2024-12-20'),
(9, 2200.30, "Unpaid", '2024-12-22'),
(10, 1900.00, "Paid", '2024-12-25');

--                              --------------------------
--                              |      Basic Commands    | 
--                              --------------------------

-- Drop 'bills' table and all its data
DROP TABLE bills;

-- Remove all data from the bills table without deleting the table structure
TRUNCATE TABLE bills;


--                              --------------------------
--                              |     SELECT Queries     | 
--                              --------------------------

-- Select all columns from the bills table
SELECT * FROM bills;

-- Select all bills for a specific patient
SELECT * FROM bills WHERE patient_id = 1;

-- Select all bills with "Unpaid" status
SELECT * FROM bills WHERE payment_status = 'Unpaid';

-- Select the patient ID, total amount, and payment status for all bills
SELECT patient_id, total_amount, payment_status FROM bills;

-- Select the total amount of bills with "Paid" status
SELECT SUM(total_amount) AS total_paid FROM bills WHERE payment_status = 'Paid';

-- Select all bills where the amount is greater than a specific value
SELECT * FROM bills WHERE total_amount > 1500.00;

-- Select the patient ID and total amount for bills ordered by date in descending order
SELECT patient_id, total_amount FROM bills ORDER BY date DESC;

-- Select the total number of bills with "Pending" status
SELECT COUNT(*) AS pending_bill_count FROM bills WHERE payment_status = 'Pending';


--                              --------------------------
--                              |      ALTER Queries     | 
--                              --------------------------

-- Add a new column discount of type DECIMAL(5, 2) to the bills table
ALTER TABLE bills
ADD COLUMN discount DECIMAL(5, 2);

-- Change the data type of the total_amount column to DECIMAL(12, 2)
ALTER TABLE bills
MODIFY COLUMN total_amount DECIMAL(12, 2);

-- Rename the column total_amount to amount_due in the bills table
ALTER TABLE bills
RENAME COLUMN total_amount TO amount_due;

-- Drop the discount column from the bills table
ALTER TABLE bills
DROP COLUMN discount;

-- Modify the payment_status column to set a default value of "Unpaid" in the bills table
ALTER TABLE bills
MODIFY COLUMN payment_status ENUM("Paid", "Unpaid", "Pending") DEFAULT 'Unpaid';

-- Add a new column payment_date of type DATE to the bills table
ALTER TABLE bills
ADD COLUMN payment_date DATE;

-- Rename the bills table to patient_bills
ALTER TABLE bills
RENAME TO patient_bills;


--                              --------------------------
--                              |      DELETE Queries    | 
--                              --------------------------

-- Delete a bill by its bill_id
DELETE FROM patient_bills
WHERE bill_id = 3;

-- Delete all bills for a specific patient
DELETE FROM patient_bills
WHERE patient_id = 4;

-- Delete all bills with "Unpaid" status
DELETE FROM patient_bills
WHERE payment_status = 'Unpaid';

-- Delete all bills with amount greater than a specific value
DELETE FROM patient_bills
WHERE amount_due > 2000.00;

-- Delete all bills generated before a specific date
DELETE FROM patient_bills
WHERE date < '2024-12-10';

-- Delete all rows from the bills table
DELETE FROM patient_bills;


--                              --------------------------
--                              |      RENAME Queries    | 
--                              --------------------------

-- Rename the payment_status column to status in the bills table
ALTER TABLE patient_bills
RENAME COLUMN payment_status TO status;

-- Rename the patient_bills table to billing_history
ALTER TABLE patient_bills
RENAME TO billing_history;

--                              --------------------------
--                              |      UPDATE Queries    | 
--                              --------------------------

-- Select all records from the billing_history table
SELECT * FROM billing_history;

-- Update the payment status of a specific bill to "Paid"
UPDATE billing_history
SET status = 'Paid'
WHERE bill_id = 2;

-- Update the total amount for all bills of a specific patient
UPDATE billing_history
SET amount_due = 1600.00
WHERE patient_id = 5;

-- Update the discount for all "Unpaid" bills
UPDATE billing_history
SET discount = 100.00
WHERE status = 'Unpaid';

-- Update the payment date for a specific bill
UPDATE billing_history
SET payment_date = '2024-12-26'
WHERE bill_id = 10;

-- O================O==================O==================O==================O

-- -----------------------------------------------------
--                    Table 8: STAFF                    |    
-- -----------------------------------------------------

-- Create table to store staff details
CREATE TABLE staff(
    staff_id INT AUTO_INCREMENT PRIMARY KEY,           -- Unique identifier for each staff member, auto-incremented
    name VARCHAR(100) NOT NULL,                         -- Full name of the staff member, cannot be NULL
    role VARCHAR(50) NOT NULL,                          -- Role of the staff member (e.g., Nurse, Receptionist, etc.)
    contact VARCHAR(15) UNIQUE NOT NULL,                -- Contact number of the staff member, must be UNIQUE and cannot be NULL
    shift ENUM("Morning", "Afternoon", "Night")         -- Shift for the staff member (Morning, Afternoon, or Night)
);

-- Insert staff details into the staff table
INSERT INTO staff(name, role, contact, shift)
VALUES
("Rajesh Kumar", "Nurse", "9876543210", "Morning"),
("Sita Verma", "Receptionist", "9876543211", "Afternoon"),
("Manoj Patel", "Doctor", "9876543212", "Night"),
("Priya Rani", "Nurse", "9876543213", "Morning"),
("Ravi Sharma", "Technician", "9876543214", "Afternoon"),
("Anjali Yadav", "Admin", "9876543215", "Night"),
("Vikram Singh", "Security", "9876543216", "Morning"),
("Neha Mehta", "Receptionist", "9876543217", "Afternoon"),
("Amit Verma", "Doctor", "9876543218", "Night"),
("Simran Kaur", "Nurse", "9876543219", "Morning");

--                              --------------------------
--                              |      Basic Commands    | 
--                              --------------------------

-- Drop 'staff' table and all its data
DROP TABLE staff;

-- Remove all data from the staff table without deleting the table structure
TRUNCATE TABLE staff;


--                              --------------------------
--                              |     SELECT Queries     | 
--                              --------------------------

-- Select all columns from the staff table
SELECT * FROM staff;

-- Select only the name and role of all staff
SELECT name, role FROM staff;

-- Select all staff working in the "Morning" shift
SELECT * FROM staff WHERE shift = "Morning";

-- Select distinct roles from the staff table
SELECT DISTINCT role FROM staff;

-- Select the staff details with a specific contact number
SELECT * FROM staff WHERE contact = '9876543210';

-- Select the name and role of staff ordered by shift (Morning, Afternoon, Night)
SELECT name, role FROM staff ORDER BY FIELD(shift, 'Morning', 'Afternoon', 'Night');

-- Select the total number of staff in each shift
SELECT shift, COUNT(*) AS staff_count FROM staff GROUP BY shift;

-- Select the staff details for a specific role (e.g., Nurse)
SELECT * FROM staff WHERE role = 'Nurse';


--                              --------------------------
--                              |      ALTER Queries     | 
--                              --------------------------

-- Add a new column email of type VARCHAR(100) to the staff table
ALTER TABLE staff
ADD COLUMN email VARCHAR(100);

-- Change the data type of the contact column in the staff table to VARCHAR(20)
ALTER TABLE staff
MODIFY COLUMN contact VARCHAR(20);

-- Rename the column contact to phone_number in the staff table
ALTER TABLE staff
RENAME COLUMN contact TO phone_number;

-- Drop the shift column from the staff table
ALTER TABLE staff
DROP COLUMN shift;

-- Add a unique constraint on the email column in the staff table
ALTER TABLE staff
ADD CONSTRAINT unique_email UNIQUE (email);

-- Modify the role column to set a default value of "Nurse" in the staff table
ALTER TABLE staff
MODIFY COLUMN role VARCHAR(50) DEFAULT 'Nurse';

-- Add a new column date_of_joining of type DATE to the staff table
ALTER TABLE staff
ADD COLUMN date_of_joining DATE;

-- Rename the staff table to hospital_staff
ALTER TABLE staff
RENAME TO hospital_staff;

-- Add a NOT NULL constraint to the role column in the staff table
ALTER TABLE hospital_staff
MODIFY COLUMN role VARCHAR(50) NOT NULL;


--                              --------------------------
--                              |      DELETE Queries    | 
--                              --------------------------

-- Delete a staff member by their staff_id
DELETE FROM hospital_staff
WHERE staff_id = 4;

-- Delete all staff members working the "Night" shift
DELETE FROM hospital_staff
WHERE shift = 'Night';

-- Delete staff members with NULL contact details
DELETE FROM hospital_staff
WHERE phone_number IS NULL;

-- Delete all staff members with the role "Technician"
DELETE FROM hospital_staff
WHERE role = "Technician";

-- Delete all rows from the staff table
DELETE FROM hospital_staff;


--                              --------------------------
--                              |      RENAME Queries    | 
--                              --------------------------

-- Rename the phone_number column to contact in the staff table
ALTER TABLE hospital_staff
RENAME COLUMN phone_number TO contact;

-- Rename the hospital_staff table to staff_records
ALTER TABLE hospital_staff
RENAME TO staff_records;

--                              --------------------------
--                              |      UPDATE Queries    | 
--                              --------------------------

-- Select all records from the staff_records table
SELECT * FROM staff_records;

-- Update the contact number of a staff member with a specific staff_id
UPDATE staff_records
SET contact = "1111222269"
WHERE staff_id = 1;

-- Update the shift for a specific role, e.g., changing all "Nurse" staff to the "Afternoon" shift
UPDATE staff_records
SET shift = "Afternoon"
WHERE role = "Nurse";

-- Update the email of a staff member
UPDATE staff_records
SET email = 'rajesh.kumar@example.com'
WHERE staff_id = 1;

-- Update the date_of_joining for all staff members
UPDATE staff_records
SET date_of_joining = '2024-12-01'
WHERE date_of_joining IS NULL;

-- O================O==================O==================O==================O

-- -----------------------------------------------------
--                    Table 9: DEPARTMENTS              |    
-- -----------------------------------------------------

-- Create table to store department details
CREATE TABLE departments(
    department_id INT AUTO_INCREMENT PRIMARY KEY,       -- Unique identifier for each department, auto-incremented
    name VARCHAR(100) NOT NULL,                          -- Name of the department, cannot be NULL
    location VARCHAR(100),                               -- Location of the department
    phone VARCHAR(15) UNIQUE NOT NULL                    -- Contact phone number for the department, must be UNIQUE and cannot be NULL
);

-- Insert department details into the departments table
INSERT INTO departments(name, location, phone)
VALUES
("Cardiology", "First Floor, Building A", "1234567890"),
("Neurology", "Second Floor, Building B", "1234567891"),
("Pediatrics", "Ground Floor, Building C", "1234567892"),
("Orthopedics", "Third Floor, Building D", "1234567893"),
("Radiology", "First Floor, Building E", "1234567894"),
("Dermatology", "Second Floor, Building F", "1234567895"),
("General Medicine", "Ground Floor, Building G", "1234567896"),
("Surgery", "Third Floor, Building H", "1234567897"),
("Emergency", "Basement Floor, Building I", "1234567898"),
("Obstetrics", "First Floor, Building J", "1234567899");

--                              --------------------------
--                              |      Basic Commands    | 
--                              --------------------------

-- Drop 'departments' table and all its data
DROP TABLE departments;

-- Remove all data from the departments table without deleting the table structure
TRUNCATE TABLE departments;

--                              --------------------------
--                              |     SELECT Queries     | 
--                              --------------------------

-- Select all columns from the departments table
SELECT * FROM departments;

-- Select only the name and location of all departments
SELECT name, location FROM departments;

-- Select all departments located on the "First Floor"
SELECT * FROM departments WHERE location LIKE '%First Floor%';

-- Select distinct locations of departments from the departments table
SELECT DISTINCT location FROM departments;

-- Select the department details with a specific phone number
SELECT * FROM departments WHERE phone = '1234567890';

-- Select the name and location of departments ordered by name in ascending order
SELECT name, location FROM departments ORDER BY name ASC;

-- Select the total number of departments in each location
SELECT location, COUNT(*) AS department_count FROM departments GROUP BY location;

-- Select the department details for a specific location (e.g., "First Floor, Building A")
SELECT * FROM departments WHERE location = 'First Floor, Building A';


--                              --------------------------
--                              |      ALTER Queries     | 
--                              --------------------------

-- Add a new column email of type VARCHAR(100) to the departments table
ALTER TABLE departments
ADD COLUMN email VARCHAR(100);

-- Change the data type of the phone column in the departments table to VARCHAR(20)
ALTER TABLE departments
MODIFY COLUMN phone VARCHAR(20);

-- Rename the column phone to contact_number in the departments table
ALTER TABLE departments
RENAME COLUMN phone TO contact_number;

-- Drop the location column from the departments table
ALTER TABLE departments
DROP COLUMN location;

-- Add a unique constraint on the email column in the departments table
ALTER TABLE departments
ADD CONSTRAINT unique_email UNIQUE (email);

-- Modify the name column to set a default value of "General" in the departments table
ALTER TABLE departments
MODIFY COLUMN name VARCHAR(100) DEFAULT 'General';

-- Add a new column date_established of type DATE to the departments table
ALTER TABLE departments
ADD COLUMN date_established DATE;

-- Rename the departments table to hospital_departments
ALTER TABLE departments
RENAME TO hospital_departments;

-- Add a NOT NULL constraint to the name column in the departments table
ALTER TABLE hospital_departments
MODIFY COLUMN name VARCHAR(100) NOT NULL;


--                              --------------------------
--                              |      DELETE Queries    | 
--                              --------------------------

-- Delete a department by its department_id
DELETE FROM hospital_departments
WHERE department_id = 4;

-- Delete all departments located on the "Second Floor"
DELETE FROM hospital_departments
WHERE location LIKE '%Second Floor%';

-- Delete departments with NULL contact details
DELETE FROM hospital_departments
WHERE contact_number IS NULL;

-- Delete all departments with the name "General Medicine"
DELETE FROM hospital_departments
WHERE name = "General Medicine";

-- Delete all rows from the departments table
DELETE FROM hospital_departments;


--                              --------------------------
--                              |      RENAME Queries    | 
--                              --------------------------

-- Rename the contact_number column to phone_number in the departments table
ALTER TABLE hospital_departments
RENAME COLUMN contact_number TO phone_number;

-- Rename the hospital_departments table to department_records
ALTER TABLE hospital_departments
RENAME TO department_records;

--                              --------------------------
--                              |      UPDATE Queries    | 
--                              --------------------------

-- Select all records from the department_records table
SELECT * FROM department_records;

-- Update the phone number of a department with a specific department_id
UPDATE department_records
SET phone_number = "9876543210"
WHERE department_id = 1;

-- Update the location of a department (e.g., changing location for "Cardiology")
UPDATE department_records
SET location = "Ground Floor, Building K"
WHERE name = "Cardiology";

-- Update the email of a department
UPDATE department_records
SET email = 'cardiology@example.com'
WHERE department_id = 1;

-- Update the date_established for all departments
UPDATE department_records
SET date_established = '2020-01-01'
WHERE date_established IS NULL;

-- O================O==================O==================O==================O

-- -----------------------------------------------------
--                    Table 10: FACILITIES              |    
-- -----------------------------------------------------

-- Create table to store facility details
CREATE TABLE facilities(
    facility_id INT AUTO_INCREMENT PRIMARY KEY,        -- Unique identifier for each facility, auto-incremented
    name VARCHAR(100) NOT NULL,                         -- Name of the facility, cannot be NULL
    type VARCHAR(50),                                   -- Type of facility (e.g., MRI, X-ray, Surgery Room, etc.)
    cost DECIMAL(10, 2),                                 -- Cost of the facility service, can include decimal values
    availability_status ENUM("Available", "Not Available") -- Availability status of the facility (Available or Not Available)
);

-- Insert facility details into the facilities table
INSERT INTO facilities(name, type, cost, availability_status)
VALUES
("MRI Scanner", "Imaging", 500.00, "Available"),
("X-Ray Machine", "Imaging", 150.00, "Not Available"),
("Operating Room 1", "Surgical", 2000.00, "Available"),
("Operating Room 2", "Surgical", 2200.00, "Available"),
("Ultrasound Machine", "Imaging", 300.00, "Available"),
("CT Scan", "Imaging", 1000.00, "Not Available"),
("Patient Bed 1", "Basic", 50.00, "Available"),
("Patient Bed 2", "Basic", 50.00, "Not Available"),
("Pharmacy", "Service", 0.00, "Available"),
("Blood Bank", "Service", 0.00, "Available");

--                              --------------------------
--                              |      Basic Commands    | 
--                              --------------------------

-- Drop 'facilities' table and all its data
DROP TABLE facilities;

-- Remove all data from the facilities table without deleting the table structure
TRUNCATE TABLE facilities;

--                              --------------------------
--                              |     SELECT Queries     | 
--                              --------------------------

-- Select all columns from the facilities table
SELECT * FROM facilities;

-- Select only the name and type of all facilities
SELECT name, type FROM facilities;

-- Select all facilities that are available
SELECT * FROM facilities WHERE availability_status = "Available";

-- Select distinct types of facilities from the facilities table
SELECT DISTINCT type FROM facilities;

-- Select the facility details with a specific name (e.g., "MRI Scanner")
SELECT * FROM facilities WHERE name = "MRI Scanner";

-- Select the name and availability of facilities ordered by cost in ascending order
SELECT name, availability_status FROM facilities ORDER BY cost ASC;

-- Select the total number of facilities for each type
SELECT type, COUNT(*) AS facility_count FROM facilities GROUP BY type;

-- Select the facility details for a specific availability status (e.g., "Not Available")
SELECT * FROM facilities WHERE availability_status = "Not Available";


--                              --------------------------
--                              |      ALTER Queries     | 
--                              --------------------------

-- Add a new column email of type VARCHAR(100) to the facilities table
ALTER TABLE facilities
ADD COLUMN email VARCHAR(100);

-- Change the data type of the cost column in the facilities table to DECIMAL(12, 2)
ALTER TABLE facilities
MODIFY COLUMN cost DECIMAL(12, 2);

-- Rename the column name to facility_name in the facilities table
ALTER TABLE facilities
RENAME COLUMN name TO facility_name;

-- Drop the type column from the facilities table
ALTER TABLE facilities
DROP COLUMN type;

-- Add a unique constraint on the email column in the facilities table
ALTER TABLE facilities
ADD CONSTRAINT unique_email UNIQUE (email);

-- Modify the availability_status column to set a default value of "Available" in the facilities table
ALTER TABLE facilities
MODIFY COLUMN availability_status ENUM("Available", "Not Available") DEFAULT "Available";

-- Add a new column location of type VARCHAR(100) to the facilities table
ALTER TABLE facilities
ADD COLUMN location VARCHAR(100);

-- Rename the facilities table to hospital_facilities
ALTER TABLE facilities
RENAME TO hospital_facilities;

-- Add a NOT NULL constraint to the name column in the facilities table
ALTER TABLE hospital_facilities
MODIFY COLUMN facility_name VARCHAR(100) NOT NULL;


--                              --------------------------
--                              |      DELETE Queries    | 
--                              --------------------------

-- Delete a facility by its facility_id
DELETE FROM hospital_facilities
WHERE facility_id = 4;

-- Delete all facilities that are "Not Available"
DELETE FROM hospital_facilities
WHERE availability_status = "Not Available";

-- Delete facilities with NULL cost values
DELETE FROM hospital_facilities
WHERE cost IS NULL;

-- Delete all facilities of a specific type (e.g., "Imaging")
DELETE FROM hospital_facilities
WHERE type = "Imaging";

-- Delete all rows from the facilities table
DELETE FROM hospital_facilities;


--                              --------------------------
--                              |      RENAME Queries    | 
--                              --------------------------

-- Rename the facility_name column to name in the facilities table
ALTER TABLE hospital_facilities
RENAME COLUMN facility_name TO name;

-- Rename the hospital_facilities table to facilities_records
ALTER TABLE hospital_facilities
RENAME TO facilities_records;

--                              --------------------------
--                              |      UPDATE Queries    | 
--                              --------------------------

-- Select all records from the facilities_records table
SELECT * FROM facilities_records;

-- Update the availability status of a facility with a specific facility_id
UPDATE facilities_records
SET availability_status = "Available"
WHERE facility_id = 1;

-- Update the cost of a facility with a specific name (e.g., "Operating Room 1")
UPDATE facilities_records
SET cost = 2100.00
WHERE name = "Operating Room 1";

-- Update the location of a facility
UPDATE facilities_records
SET location = 'Second Floor, Building A'
WHERE facility_id = 3;

-- Update the email of a facility
UPDATE facilities_records
SET email = 'mri@example.com'
WHERE facility_id = 1;

-- Update the date_established for all facilities (if needed)
UPDATE facilities_records
SET date_established = '2020-05-01'
WHERE date_established IS NULL;

-- O================O==================O==================O==================O