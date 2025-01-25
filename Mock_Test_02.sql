-- --------------------------------------------------
-- 					Database: E-commerce			|
-- --------------------------------------------------

-- Create Database
CREATE DATABASE IF NOT EXISTS e_commerce;

-- Select Database
USE e_commerce;

-- ------------------------------------------------------------------------------
-- 								Table 1 : PRODUCTS								|
-- ------------------------------------------------------------------------------

-- Create table PRODUCTS
CREATE TABLE products(
	product_id VARCHAR(20) PRIMARY KEY,													-- Alphanumeric unique identifier for each product
    product_name VARCHAR(255) NOT NULL,												-- Name of the product, cannot be NULL
    category_id INT,																	-- Category of the product
    quantity_in_stock INT NOT NULL CHECK(quantity_in_stock >= 0),					-- Quantity in stock
    price DECIMAL(10, 2) CHECK(price >= 0),												-- Price of the product
    supplier_id VARCHAR(20),															-- Supplier of the product
    reorder_level INT DEFAULT 0,													-- Reorder level (minimum stock), DEFAULT is 0
    description TEXT,																-- Description of the product, can be NULL
    location VARCHAR(255),																-- Location of the product in the warehouse
    status ENUM('Available', 'Out of Stock', 'Discontinued') NOT NULL,						-- Status of the product
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,										-- Timestamp for when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP		-- Timestamp for when the record was last updated
);



-- Insert each product information in the PRODUCTS table
INSERT INTO products(product_id, product_name, category_id, quantity_in_stock, price, supplier_id, reorder_level, description, location, status)
VALUES
('B07XJ8C8F5', 'Apple iPhone 13', 1, 50, 999.99, 'SUP006', 10, 'Latest Apple iPhone model', 'Aisle 3, Shelf 5', 'Available'),  
('B08N5WRWNW', 'Samsung Galaxy S21', 1, 40, 799.99, 'SUP007', 8, 'Samsung flagship smartphone', 'Aisle 3, Shelf 6', 'Available'),  
('B07HFGQJ69', 'Sony WH-1000XM4', 2, 30, 349.99, 'SUP008', 5, 'Noise-canceling wireless headphones', 'Aisle 4, Shelf 2', 'Available'),  
('B08L5NP6NG', 'Dell XPS 13', 3, 25, 1199.99, 'SUP009', 5, '13-inch ultrabook laptop', 'Aisle 5, Shelf 1', 'Available'),  
('B09G3HRMVB', 'Logitech MX Master 3', 2, 35, 99.99, 'SUP012', 7, 'Wireless ergonomic mouse', 'Aisle 4, Shelf 3', 'Available'),  
('B07FZ8S74R', 'Amazon Echo Dot', 4, 60, 49.99, 'SUP012', 15, 'Smart speaker with Alexa', 'Aisle 6, Shelf 4', 'Available');

-- Practice
-- 6. Get the first three characters of each product's location

-- View all PRODUCTS information
SELECT * FROM products;

-- 10 Misleneous Queries
-- 1. Retrieve product names in uppercase and display them with a custom alias
SELECT UPPER(product_name) AS product_uppercase FROM products;

-- 2. Calculate total stock value (price * quantity) for each product
SELECT product_name, (price * quantity_in_stock) AS total_stock_value FROM products;

-- 3. Find products that are either in Category 1 or have a price greater than $500
SELECT product_name, category_id, price 
FROM products 
WHERE category_id = 1 OR price > 500;

-- 4. Get distinct supplier IDs who supply products
SELECT DISTINCT supplier_id FROM products;

-- 5. Find the length of each product name and sort by longest name first
SELECT product_name, LENGTH(product_name) AS name_length 
FROM products 
ORDER BY name_length DESC;

-- 6. Count the number of products in stock per supplier, aliasing the result
SELECT supplier_id, COUNT(*) AS total_products FROM products GROUP BY supplier_id;

-- 7. Retrieve products whose description contains the word 'wireless' (case insensitive)
SELECT product_name, description 
FROM products 
WHERE LOWER(description) LIKE '%wireless%';

-- 8. Find products that have a reorder level greater than 5 and are in stock
SELECT product_name, reorder_level, quantity_in_stock 
FROM products 
WHERE reorder_level > 5 AND quantity_in_stock > 0;

-- 9. Round the price of each product to the nearest integer
SELECT product_name, ROUND(price) AS rounded_price FROM products;


-- ------------------------------------------------------------------------------
-- 								Table 2 : SUPPLIERS								|
-- ------------------------------------------------------------------------------

/*
PURPOSE: The suppliers table stores detailed information about the vendors or suppliers who provide products to the inventory, 
enabling tracking and management of procurement sources.
*/

-- Create table SUPPLIERS
CREATE TABLE suppliers(
	supplier_id VARCHAR(20) PRIMARY KEY,											-- Unique identifier for the supplier
    supplier_name VARCHAR(255) NOT NULL,											-- Name of the supplier, cannot be NULL
    contact_name VARCHAR(255),															-- Name of the contact person
    contact_email VARCHAR(255) UNIQUE,													-- Contact email, must be unique
    contact_phone VARCHAR(20),															-- Contact phone number
    address TEXT,																	-- Address of the supplier
    city VARCHAR(100),																	-- City where the supplier is located
    status ENUM('Active', 'Inactive') DEFAULT 'Active'								-- Status of the supplier, default is 'Active'
);

-- Insert each supplier information in the SUPPLIERS table
INSERT INTO suppliers(supplier_id, supplier_name, contact_name, contact_email, contact_phone, address, city)
VALUES
('SUP006', 'Fast Track Electronics', 'Amit Verma', 'amit.verma@fasttrack.com', '+91-9876543210', 'Building 21, Industrial Area', 'Mumbai'),
('SUP007', 'Global Tech Supplies', 'Priya Sharma', 'priya.sharma@globaltech.com', '+91-8765432109', 'Sector 5, IT Park', 'Bangalore'),
('SUP008', 'Quick Connect Distributors', 'Rajesh Gupta', 'rajesh.gupta@quickconnect.com', '+91-7654321098', 'Plot 12, Electronic City', 'Delhi'),
('SUP009', 'Electro World', 'Sanjay Patel', 'sanjay.patel@electroworld.com', '+91-6543210987', 'Mall Road, Sector 9', 'Ahmedabad'),
('SUP010', 'Techno Traders', 'Neha Kapoor', 'neha.kapoor@technotraders.com', '+91-5432109876', 'Industrial Estate', 'Hyderabad'),
('SUP012', 'Bright Future Gadgets', 'Vikas Singh', 'vikas.singh@brightfuture.com', '+91-4321098765', 'Gadget Lane, Tech Market', 'Chennai');


-- View all SUPPLIERS information
SELECT * FROM suppliers;

-- 10 Mislenous Queries
-- 1. Retrieve all supplier names in uppercase with an alias
SELECT UPPER(supplier_name) AS supplier_uppercase FROM suppliers;

-- 2. Extract the city name and count how many suppliers are in each city
SELECT city, COUNT(*) AS total_suppliers FROM suppliers GROUP BY city;

-- 3. Find suppliers whose contact email contains 'tech'
SELECT supplier_name, contact_email 
FROM suppliers 
WHERE LOWER(contact_email) LIKE '%tech%';

-- 4. Display supplier names along with the length of their names
SELECT supplier_name, LENGTH(supplier_name) AS name_length FROM suppliers;

-- 5. Retrieve supplier contact names and mask the first 3 digits of their phone number
SELECT contact_name, CONCAT('XXX-', RIGHT(contact_phone, 7)) AS masked_phone FROM suppliers;

-- 6. Find suppliers located in cities that start with 'B' or 'C'
SELECT supplier_name, city 
FROM suppliers 
WHERE city LIKE 'B%' OR city LIKE 'C%';

-- 8. Get the first three characters of the supplier name as a short code
SELECT supplier_name, LEFT(supplier_name, 3) AS supplier_code FROM suppliers;

-- 9. Sort suppliers by their city names in descending order
SELECT * FROM suppliers ORDER BY city DESC;

-- 10. Count how many suppliers have 'Electronics' in their name
SELECT COUNT(*) AS electronics_suppliers 
FROM suppliers 
WHERE supplier_name LIKE '%Electronics%';



-- ------------------------------------------------------------------------------
-- 								Table 3 : CATEGORIES							|
-- ------------------------------------------------------------------------------

/*
PURPOSE: The categories table organizes products into different groups or types, helping to classify and manage products efficiently. 
It allows easy categorization, filtering, and search operations within the inventory system.
*/

-- Create CATEGORIES table
CREATE TABLE categories(
	category_id INT AUTO_INCREMENT PRIMARY KEY,							-- Unique identifier for each category
    category_name VARCHAR(100) NOT NULL UNIQUE,								-- Name of the category, must be unique
    description TEXT,													-- Description of the category
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,							-- Timestamp for when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
				ON UPDATE CURRENT_TIMESTAMP								-- Last updated timestamp
);

-- Insert category information in CATEGORIES table
INSERT INTO categories (category_name, description) 
VALUES
('Electronics', 'Devices and gadgets such as smartphones, laptops, and accessories'),
('Home Appliances', 'Electrical machines used in households like refrigerators and washing machines'),
('Furniture', 'Household and office furniture including tables, chairs, and sofas'),
('Clothing', 'Apparel for men, women, and children including shirts, pants, and dresses'),
('Footwear', 'Different types of shoes, sandals, and slippers'),
('Beauty & Personal Care', 'Cosmetics, skincare, and personal grooming products'),
('Sports & Fitness', 'Gym equipment, sports gear, and fitness accessories');

-- View CATEGORY information
SELECT * FROM categories;

-- 1. Retrieve all category names in uppercase with an alias
SELECT UPPER(category_name) AS category_uppercase FROM categories;

-- 2. Count the total number of categories available
SELECT COUNT(*) AS total_categories FROM categories;

-- 3. Find categories where the description contains the word 'household' (case insensitive)
SELECT category_name, description 
FROM categories 
WHERE LOWER(description) LIKE '%household%';

-- 4. Get the length of each category name and sort by longest name first
SELECT category_name, LENGTH(category_name) AS name_length 
FROM categories 
ORDER BY name_length DESC;

-- 5. List categories where the name starts with 'B' or 'C'
SELECT category_name FROM categories WHERE category_name LIKE 'B%' OR category_name LIKE 'C%';

-- 6. Concatenate category name with its description
SELECT category_name, CONCAT(category_name, ': ', description) AS full_info FROM categories;

-- 8. Display only the first 20 characters of the description for preview
SELECT category_name, LEFT(description, 20) AS short_description FROM categories;

-- 9. Sort categories in reverse alphabetical order
SELECT * FROM categories ORDER BY category_name DESC;

-- 10. Find categories with more than 10 characters in their name
SELECT category_name FROM categories WHERE LENGTH(category_name) > 10;



-- ------------------------------------------------------------------------------
-- 								Table 4 : ORDERS								|
-- ------------------------------------------------------------------------------

/*
PURPOSE: The orders table tracks customer orders in an inventory management system. It captures key details about the order, 
such as the products ordered, the customer who placed the order, the order's status, and payment information.
*/

-- Create ORDERS table
CREATE TABLE orders(
	order_id INT AUTO_INCREMENT PRIMARY KEY, 							-- Unique identifier for each order
    customer_id INT,													-- Reference to the customer placing the order
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,							-- Date and time the order placed
    total_amount DECIMAL(10, 2) NOT NULL,								-- Total price of the order
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') 
				Default 'Pending',											-- Status of the order, DEFAULT is 'Pending'
	shipping_address VARCHAR(255) NOT NULL,								-- Shipping address for the order
    payment_status ENUM('Pending', 'Completed', 'Failed')		
				DEFAULT 'Pending' 										-- Payment status of the order, DEFAULT is 'Pending'
);

-- Inserting sample order records into the orders table
INSERT INTO orders(customer_id, order_date, total_amount, status, shipping_address, payment_status)
VALUES
(1, '2025-01-08 10:30:00', 299.99, 'Pending', '1234 Elm St, Springfield, IL, 62701', 'Pending'),
(2, '2025-01-09 12:15:00', 499.99, 'Shipped', '5678 Oak St, Springfield, IL, 62702', 'Completed'),
(3, '2025-01-10 09:45:00', 150.75, 'Delivered', '2345 Maple Ave, Springfield, IL, 62703', 'Completed'),
(4, '2025-01-11 14:30:00', 249.50, 'Pending', '6789 Pine Rd, Springfield, IL, 62704', 'Pending'),
(5, '2025-01-12 11:00:00', 125.20, 'Cancelled', '3456 Birch Blvd, Springfield, IL, 62705', 'Failed');


-- View ORDERS table
SELECT * FROM orders;

-- Add foreign key constraint to connect ORDERS table with CUSTOMERS table
ALTER TABLE orders
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE CASCADE;

-- 10 Miscellenous Queries
-- 1. Retrieve all orders with status 'Pending'
SELECT * FROM orders WHERE status = 'Pending';

-- 2. Get the total revenue from all completed orders
SELECT SUM(total_amount) AS total_revenue FROM orders WHERE order_status = 'Completed';

-- 3. Find the average order value for all orders
SELECT AVG(total_amount) AS avg_order_value FROM orders;

-- 4. Count the number of orders per status
SELECT order_status, COUNT(*) AS total_orders FROM orders GROUP BY order_status;

-- 5. Extract only the date from the order timestamp
SELECT order_id, DATE(order_date) AS order_date_only FROM orders;

-- 6. Find the earliest and latest order dates
SELECT MIN(order_date) AS earliest_order, MAX(order_date) AS latest_order FROM orders;

-- 7. Retrieve orders that were placed in the morning (before 12 PM)
SELECT * FROM orders WHERE TIME(order_date) < '12:00:00';

-- 8. Get the first 10 characters of the shipping address for a summary view
SELECT order_id, LEFT(shipping_address, 10) AS short_address FROM orders;

-- 9. Display orders sorted by amount in descending order
SELECT * FROM orders ORDER BY total_amount DESC;

-- 10. Find orders where the total amount is greater than $200 and status is 'Shipped' or 'Delivered'
SELECT * FROM orders WHERE total_amount > 200 AND (order_status = 'Shipped' OR order_status = 'Delivered');


-- ------------------------------------------------------------------------------
-- 								Table 5 : CUSTOMERS								|
-- ------------------------------------------------------------------------------

-- Create CUSTOMERS table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,        			-- Unique identifier for each customer
    first_name VARCHAR(100) NOT NULL,                  			-- Customer's first name
    last_name VARCHAR(100) NOT NULL,                   			-- Customer's last name
    email VARCHAR(255) UNIQUE NOT NULL,                			-- Customer's email address, unique
    phone VARCHAR(15),                                 			-- Customer's phone number
    shipping_address TEXT,                             			-- Customer's shipping address
    billing_address TEXT,                              			-- Customer's billing address
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP  		-- Timestamp for when the customer registered
);

-- Insert data into CUSTOMERS table
INSERT INTO customers (first_name, last_name, email, phone, shipping_address, billing_address)
VALUES
('Harsh', 'Mehra', 'harsh.meh@123.com', '1234567890', '1234 MD Street, Mumbai', '1234 MD Street, Mumbai'),
('Prajakta', 'Sharma', 'pragg.sha@456.com', '0987654321', '5678 Park Avenue, Delhi', '5678 Park Avenue, Delhi'),
('Swati', 'Rede', 'swati.rede@123.com', '1122334455', '91011 Pimp Road, Hariyana', '91011 Pimp Road, Hariyana'),
('Aaditya', 'Patil', 'aadi.pat@456.com', '2233445566', '1213 Maple Street, Thane', '1213 Maple Street, Thane'),
('Joe', 'Lobo', 'joe.lobo@753.com', '3344556677', '1415 Cedar Mill, Banglore', '1415 Cedar Mill, Banglore'),
('Mayra', 'Pandey', 'mayra.pan@123.com', '4455667788', '1617 Birch Powder, Chennai', '1617 Birch Powder, Chennai');

-- See all the data from customers
SELECT * FROM customers;


-- 10 Miscellenous Queries 
-- 1. Retrieve all customer names in a single full name column
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM customers;

-- 2. Count the total number of customers
SELECT COUNT(*) AS total_customers FROM customers;

-- 3. Find customers whose email contains '123'
SELECT first_name, last_name, email FROM customers WHERE email LIKE '%123%';

-- 4. Get customers with phone numbers starting with '44' or '22'
SELECT first_name, last_name, phone FROM customers WHERE phone LIKE '44%' OR phone LIKE '22%';

-- 6. Display only the first 10 characters of the address for a summary view
SELECT first_name, last_name, LEFT(shipping_address, 10) AS short_address FROM customers;

-- 7. Find the length of each customer’s full name and sort by longest name first
SELECT first_name, last_name, LENGTH(CONCAT(first_name, ' ', last_name)) AS name_length 
FROM customers 
ORDER BY name_length DESC;

-- 8. Get distinct cities from customer addresses
SELECT DISTINCT SUBSTRING_INDEX(address, ',', -1) AS city FROM customers;

-- 9. Find customers who live in 'Mumbai' or 'Delhi'
SELECT first_name, last_name, shipping_address FROM customers WHERE shipping_address LIKE '%Mumbai%' OR shipping_address LIKE '%Delhi%';

-- 10. Sort customers alphabetically by last name, then first name
SELECT * FROM customers ORDER BY last_name, first_name;





-- Real World Based Situation Queries

-- 1. Get all products that are low in stock (below reorder level)
SELECT product_name, quantity_in_stock, reorder_level 
FROM Products 
WHERE quantity_in_stock <= reorder_level;


-- 2. Find the total revenue generated from completed orders
SELECT SUM(total_amount) AS total_revenue 
FROM orders 
WHERE payment_status = 'Completed';


-- 3. Count how many products each supplier provides
SELECT supplier_id, COUNT(*) AS total_products_supplied 
FROM Products 
GROUP BY supplier_id;


-- 4. List all pending orders with customer details
SELECT o.order_id, o.order_date, c.customer_id, c.customer_name, o.total_amount 
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'Pending';


-- 5. Find suppliers from a specific city (e.g., 'Delhi')
SELECT supplier_name, city 
FROM Suppliers
WHERE city = 'Delhi';

