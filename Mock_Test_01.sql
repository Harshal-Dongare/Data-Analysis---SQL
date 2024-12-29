-- ------------------------------------------------------
--           Database : Grocery Shopping Management             
-- ------------------------------------------------------

CREATE DATABASE grocery_shopping_management;

USE grocery_shopping_management;

DROP DATABASE grocery_shopping_management;

-- -------------------------
--    table  1: Customers  |
-- -------------------------

CREATE TABLE customers(
     cust_id INT PRIMARY KEY, -- Unique identifier for customers
     cust_name VARCHAR(100) NOT NULL,  -- name of the customer
     phone_num VARCHAR(20) NOT NULL,   -- contact number of the customer
     address VARCHAR(100),  -- Address of the customer
     email VARCHAR(50)    -- Email of the customer
);

INSERT INTO customers(cust_id, cust_name, phone_num, address, email)
VALUES(1, "Vivek", "45645316546", "USA", "vi123@gmail.com"),
(2, "Shraddha", "49878767566", "Brazil", "sh196@gmail.com"),
(3, "Priya", "64645656464", "India", "pr865@gmail.com"),
(4, "Jitesh", "56465466546", "Australia", "ji235@gmail.com"),
(5, "Prajakta", "35435433535", "Africa", "pra96@gmail.com");

-- Drop table
DROP TABLE customers;

-- TRUNCATE table
TRUNCATE TABLE customers;

-- SELECT queries
SELECT * FROM customers;

-- UPDATE queries
UPDATE customers
SET phone_num = '11112222999'
WHERE cust_id = 1;

-- DELETE queries
DELETE FROM customers
WHERE cust_id = 5;

-- ALTER queries
ALTER TABLE customers
ADD COLUMN amount_pending VARCHAR(50) DEFAULT 0;

-- RENAME queries
ALTER TABLE customers RENAME TO customer_data;


-- ==============================================================================

-- -------------------------
--    Table  2: GROCERY    |
-- -------------------------

CREATE TABLE grocery(
    item_id INT PRIMARY KEY,  -- Unique identifier of the table
    name VARCHAR(50) NOT NULL,  -- name of the grocery
    category VARCHAR(50),   -- category of the item
    supplier_name VARCHAR(50) NOT NULL,   -- supplier name of the grocery
    quantity VARCHAR(20)   -- quantity of the items
);

INSERT INTO grocery(item_id, name, category, supplier_name, quantity)
VALUES (1, "Apple", "Fruit", "Tichukle Food Supplier", "100"),
(2, "Soya", "grocery", "Max Food Supplier", "100"),
(3, "Banana", "Fruit", "Quick Food Supplier", "100"),
(4, "Capsicum", "Vegetable", "Tendulkar Food Supplier", "100"),
(5, "Chilly Powder", "Spices", "Fresh Food Supplier", "100");

-- Drop table
DROP TABLE grocery;

-- TRUNCATE table
TRUNCATE TABLE grocery;

-- SELECT queries
SELECT * FROM grocery;

-- UPDATE queries
UPDATE grocery
SET supplier_name = 'Postman Food Services'
WHERE item_id = 4;

-- DELETE queries
DELETE FROM grocery
WHERE cust_id = 3;

-- ALTER queries
ALTER TABLE grocery
ADD COLUMN last_supply TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- RENAME queries
ALTER TABLE grocery RENAME TO grocery_list;

-- ================================================================================

-- -------------------------
--    Table  3: PAYMENT    |
-- -------------------------

CREATE TABLE payment(
    tran_id INT PRIMARY KEY,  -- Unique identifier of the transaction
    tran_method VARCHAR(50) NOT NULL,  -- Transaction method for payment
    amount VARCHAR(50) NOT NULL,  -- Amount to be paid 
    cust_id INT  NOT NULL,  -- Customer id 
    tran_status ENUM("in process", "cancelled", "successful"),  -- Transaction status
    
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

INSERT INTO payment(tran_id, tran_method, amount, cust_id, tran_status)
VALUES (101, "Credit Card", "2000", "1", "successful"),
(102, "Credit Card", "8000", "1", "cancelled"),
(103, "Debit Card", "9000", "1", "successful"),
(104, "Cash", "5000", "1", "successful"),
(105, "UPI", "3000", "1", "in process");

-- Drop table
DROP TABLE payment;

-- TRUNCATE table
TRUNCATE TABLE payment;

-- SELECT queries
SELECT * FROM payment;

-- UPDATE queries
UPDATE payment
SET tran_method = 'Cash'
WHERE tran_id = 2;

-- DELETE queries
DELETE FROM payment
WHERE tran_id = 1;

-- ALTER queries
ALTER TABLE payment
CHANGE COLUMN amount amount_paid VARCHAR(50) NOT NULL;

-- RENAME queries
ALTER TABLE payment RENAME TO transactions;

-- ==============================================================================