/*
Database Name: Hospital Management
Patients: Patient_ID, Patient_Name, Age, Gender, Contact_Info
Doctors: Doctor_ID, Doctor_Name, Specialization, Contact_Info
Appointments: Appointment_ID, Patient_ID, Doctor_ID, Appointment_Date, Status
Medications: Medication_ID, Patient_ID, Medication_Name, Dosage
Bills: Bill_ID, Patient_ID, Amount, Billing_Date, Payment_Status
*/

-- query to create new database
CREATE DATABASE hospital;

-- select database
USE hospital;

-- --------------------------------------------------------------------------
--                    			Table 1 : Patients
-- --------------------------------------------------------------------------

-- create patients table
CREATE TABLE patients(
patient_ID INT PRIMARY KEY,
patient_name VARCHAR(50) NOT NULL,
age INT NOT NULL,
gender VARCHAR(50) NOT NULL,
contact_info VARCHAR(50) NOT NULL
);

-- add patients data into patient table
INSERT INTO patients
VALUE (1, "Harsh Dongare", 27, "Male", "9865778923"),
(2, "Aarav Sharma", 34, "Male", "9876543210"),
(3, "Priya Patel", 29, "Female", "9345678901"),
(4, "Aditi Desai", 41, "Female", "9123456789"),
(5, "Ravi Kumar", 39, "Male", "9056781234"),
(6, "Neha Gupta", 25, "Female", "9887654321"),
(7, "Sanjay Reddy", 51, "Male", "9012345678"),
(8, "Kavya Iyer", 33, "Female", "9678901234"),
(9, "Manish Verma", 38, "Male", "9203847561"),
(10, "Sita Mehta", 45, "Female", "9934578234"),
(11, "Vikram Singh", 50, "Male", "9812346579");

-- select all data from patient table
SELECT * FROM patients;


-- --------------------------------------------------------------------------
--                    			Table 2 : Doctors
-- --------------------------------------------------------------------------

-- create DOCTORS table
CREATE TABLE doctors(
doctor_ID INT PRIMARY KEY,
doctor_name VARCHAR(50) NOT NULL,
specialization VARCHAR(50) NOT NULL,
contact_info VARCHAR(50) NOT NULL
);

-- insert doctors data into doctors table
INSERT INTO doctors
VALUES (1, "Dr. Rajesh Kumar", "Cardiologist", "9876543210"),
(2, "Dr. Priya Verma", "Dermatologist", "9345678901"),
(3, "Dr. Aditi Rao", "Gynecologist", "9123456789"),
(4, "Dr. Amit Desai", "Neurologist", "9056781234"),
(5, "Dr. Neha Sharma", "Pediatrician", "9887654321"),
(6, "Dr. Sanjay Mehta", "Orthopedic", "9012345678"),
(7, "Dr. Kavya Singh", "Ophthalmologist", "9678901234"),
(8, "Dr. Manish Gupta", "General Surgeon", "9203847561"),
(9, "Dr. Sita Iyer", "Endocrinologist", "9934578234"),
(10, "Dr. Vikram Patel", "Urologist", "9812346579");

-- view doctors data
SELECT * FROM doctors;


-- --------------------------------------------------------------------------
--                    		Table 3 : Appointments
-- --------------------------------------------------------------------------

-- create Appointments table
CREATE TABLE Appointments(
appointment_ID INT PRIMARY KEY,
patient_ID INT,
DOCTOR_ID INT,
appointment_date DATE,
status VARCHAR(50)
);

-- add appointments data into appointments table
INSERT INTO appointments
VALUES (1, 1, 2, "2024-12-20", "Scheduled"),
(2, 2, 3, '2024-12-22', 'Completed'),
(3, 3, 4, '2024-12-23', 'Scheduled'),
(4, 4, 5, '2024-12-24', 'Cancelled'),
(5, 5, 6, '2024-12-25', 'Scheduled'),
(6, 6, 7, '2024-12-26', 'Completed'),
(7, 7, 8, '2024-12-27', 'No Show'),
(8, 8, 9, '2024-12-28', 'Scheduled'),
(9, 9, 10, '2024-12-30', 'Completed'),
(10, 10, 1, '2024-12-31', 'Scheduled');

-- view all appointments
SELECT * FROM appointments;


-- --------------------------------------------------------------------------
--                    			Table 4 : Medications
-- --------------------------------------------------------------------------

-- create table for Medications
CREATE TABLE medications(
medication_ID INT PRIMARY KEY,
patient_ID INT NOT NULL,
medication_name VARCHAR(50) NOT NULL,
dosage VARCHAR(50) NOT NULL
);

-- add medications data into medications table
INSERT INTO medications
VALUES (1, 1, "Aspirin", "50 mg"),
(2, 2, "Paracetamol", "500 mg"),
(3, 3, "Amoxicillin", "250 mg"),
(4, 4, "Metformin", "500 mg"),
(5, 5, "Lisinopril", "10 mg"),
(6, 6, "Atorvastatin", "20 mg"),
(7, 7, "Ibuprofen", "200 mg"),
(8, 8, "Omeprazole", "20 mg"),
(9, 9, "Diphenhydramine", "25 mg"),
(10, 10, "Ciprofloxacin", "500 mg");

-- view all medications data
SELECT * FROM medications;


-- --------------------------------------------------------------------------
--                    			Table 5 : Bills
-- --------------------------------------------------------------------------

-- Bill_ID, Patient_ID, Amount, Billing_Date, Payment_Status

-- create bills table
CREATE TABLE bills(
bill_ID INT PRIMARY KEY,
patient_ID INT NOT NULL,
amount INT NOT NULL,
billing_date DATE NOT NULL,
payment_status VARCHAR(50) NOT NULL
);

-- add bills data into bills table
INSERT INTO bills
VALUES (1, 1, 1500, '2024-12-20', 'Paid'),
(2, 2, 1200, '2024-12-22', 'Pending'),
(3, 3, 1800, '2024-12-23', 'Paid'),
(4, 4, 1100, '2024-12-24', 'Cancelled'),
(5, 5, 900, '2024-12-25', 'Paid'),
(6, 6, 1300, '2024-12-26', 'Pending'),
(7, 7, 1400, '2024-12-27', 'Paid'),
(8, 8, 1600, '2024-12-28', 'Pending'),
(9, 9, 1250, '2024-12-30', 'Paid'),
(10, 10, 1700, '2024-12-31', 'Paid');

-- view bills data
SELECT * FROM bills;

