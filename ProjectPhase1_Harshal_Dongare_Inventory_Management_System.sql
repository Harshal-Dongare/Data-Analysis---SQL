
-- ------------------------------------------------------------------------------
-- 							Database : INVENTORYDB								|
-- ------------------------------------------------------------------------------

-- Create database INVENTORYDB if it does not exists
CREATE DATABASE IF NOT EXISTS inventorydb; 

-- Switch to INVENTORYDB database
USE inventorydb;

-- Drop database INVENTORYDB if it exists
DROP DATABASE IF EXISTS inventorydb;

-- ------------------------------------------------------------------------------
-- 							Table 1 : PRODUCTS									|
-- ------------------------------------------------------------------------------

/* 
PURPOSE: Product table is used to store and managed the details of each product in the inventory, such as
its name, category, stock quantity, and price
*/

-- Create table PRODUCTS
CREATE TABLE products(
	product_id VARCHAR(20) PRIMARY KEY,												-- Alphanumeric unique identifier for each product
    product_name VARCHAR(255) NOT NULL,												-- Name of the product, cannot be NULL
    category VARCHAR(100) NOT NULL,													-- Category of the product
    quantity_in_stock INT NOT NULL CHECK(quantity_in_stock >= 0),					-- Quantity in stock
    price DECIMAL(10, 2) CHECK(price >= 0),											-- Price of the product
    supplier VARCHAR(255),															-- Supplier of the product
    reorder_level INT DEFAULT 0,													-- Reorder level (minimum stock), DEFAULT is 0
    description TEXT,																-- Description of the product, can be NULL
    location VARCHAR(255),															-- Location of the product in the warehouse
    status ENUM('Available', 'Out of Stock', 'Discontinued') NOT NULL,				-- Status of the product
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,									-- Timestamp for when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP		-- Timestamp for when the record was last updated
);

-- Insert each product information in the PRODUCTS table
INSERT INTO products(product_id, product_name, category, quantity_in_stock, price, supplier, reorder_level, description, location, status)
VALUES
('B07XJ8C8F5', 'Apple iPhone 13', 'Electronics', 50, 999.99, 'Apple Inc', 10, 'Latest model of Apple iPhone 13', 'Aisle 3, Shelf 5', 'Available'),
('B08Q7BL5C2', 'Samsung Galaxy S21', 'Electronics', 30, 799.99, 'Samsung', 5, 'Samsung flagship phone', 'Aisle 2, Shelf 1', 'Available'),
('B0844JKGSK', 'Sony Wireless Headphones', 'Electronics', 70, 149.99, 'Sony', 15, 'Noise-cancelling wireless headphones', 'Aisle 4, Shelf 3', 'Available'),
('B07X8QWZQK', 'Nike Running Shoes', 'Footwear', 40, 89.99, 'Nike', 5, 'Comfortable running shoes', 'Bin 12A', 'Out of Stock'),
('B08D6J2V7X', 'Dell XPS 13 Laptop', 'Electronics', 20, 1199.99, 'Dell', 3, 'Compact, high-performance laptop', 'Aisle 6, Shelf 2', 'Available'),
('B07DLHMQ9C', 'Sony 4K TV', 'Electronics', 10, 499.99, 'Sony', 2, 'Ultra HD 4K television', 'Aisle 5, Shelf 4', 'Discontinued'),
('B081T2QZF7', 'Toshiba External Hard Drive', 'Electronics', 100, 59.99, 'Toshiba', 20, 'Portable external storage device', 'Bin 5B', 'Available'),
('B08N5M7S6K', 'Samsung Galaxy Watch 4', 'Wearables', 60, 249.99, 'Samsung', 10, 'Smartwatch with health tracking', 'Bin 7C', 'Available'),
('B0856YF9B9', 'Instant Pot Pressure Cooker', 'Home Appliances', 80, 89.99, 'Instant Pot', 15, 'Electric pressure cooker', 'Aisle 8, Shelf 1', 'Available'),
('B07W4LZWX1', 'Bose SoundLink Speaker', 'Electronics', 25, 129.99, 'Bose', 5, 'Portable Bluetooth speaker', 'Bin 2D', 'Available');

-- View all PRODUCTS information
SELECT * FROM products;


-- ------------------------------------------------------------------------------
-- 							Table 2 : SUPPLIERS									|
-- ------------------------------------------------------------------------------

/*
PURPOSE: The suppliers table stores detailed information about the vendors or suppliers who provide products to the inventory, 
enabling tracking and management of procurement sources.
*/

-- Create table SUPPLIERS
CREATE TABLE suppliers(
	supplier_id VARCHAR(20) PRIMARY KEY,											-- Unique identifier for the supplier
    supplier_name VARCHAR(255) NOT NULL,											-- Name of the supplier, cannot be NULL
    contact_name VARCHAR(255),														-- Name of the contact person
    contact_email VARCHAR(255) UNIQUE,												-- Contact email, must be unique
    contact_phone VARCHAR(20),														-- Contact phone number
    address TEXT,																	-- Address of the supplier
    city VARCHAR(100),																-- City where the supplier is located
    country VARCHAR(100),															-- Country of the supplier
    status ENUM('Active', 'Inactive') DEFAULT 'Active',								-- Status of the supplier, default is 'Active'\
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,									-- Record creation timestamp
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP		-- Last update timestamp
);

-- Insert each supplier information in the SUPPLIERS table
INSERT INTO suppliers(supplier_id, supplier_name, contact_name, contact_email, contact_phone, address, city, country, status)
VALUES
('SUP001', 'Fast Track Electronics', 'Amit Verma', 'amit.verma@fasttrack.com', '+91-9876543210', 'Building 21, Industrial Area', 'Mumbai', 'India', 'Active'),
('SUP002', 'Global Packaging Solutions', 'Linda Green', 'linda.green@globalpackaging.com', '+1-415-987-6543', '456 Business Blvd', 'San Francisco', 'USA', 'Active'),
('SUP003', 'Elite Furniture Co.', 'Ravi Shankar', 'ravi.shankar@elitefurniture.com', '+91-9988776655', 'Plot 12, Woodwork Zone', 'Bangalore', 'India', 'Active'),
('SUP004', 'Prime Textiles', 'Samantha Brown', 'samantha.brown@primetextiles.com', '+44-7890-123456', '89 High Street', 'London', 'UK', 'Active'),
('SUP005', 'Eco Green Supplies', 'Arjun Mehta', 'arjun.mehta@ecogreen.com', '+91-9123456789', '37 Eco Park, Greenbelt', 'Delhi', 'India', 'Inactive'),
('SUP006', 'Universal Tools Ltd.', 'Chen Wei', 'chen.wei@universaltools.com', '+86-135-1234-5678', 'Tool Market, Sector 8', 'Shenzhen', 'China', 'Active'),
('SUP007', 'SmartTech Accessories', 'Emily Johnson', 'emily.johnson@smarttech.com', '+1-718-555-4321', '123 Innovation Drive', 'New York', 'USA', 'Active'),
('SUP008', 'Golden Spices Pvt. Ltd.', 'Kiran Patel', 'kiran.patel@goldenspices.com', '+91-8765432109', 'Spice Market, Sector 4', 'Ahmedabad', 'India', 'Inactive'),
('SUP009', 'Dynamic Logistics', 'Tom Harris', 'tom.harris@dynamiclogistics.com', '+61-400-555-555', '15 Logistics Hub', 'Sydney', 'Australia', 'Active'),
('SUP010', 'Ace Apparel Co.', 'Nisha Kapoor', 'nisha.kapoor@aceapparel.com', '+91-9988001122', 'Garment Zone, Industrial Area', 'Ludhiana', 'India', 'Active');

-- View all SUPPLIERS information
SELECT * FROM suppliers;


-- ------------------------------------------------------------------------------
-- 							Table 3 : CATEGORIES								|
-- ------------------------------------------------------------------------------

/*
PURPOSE: The categories table organizes products into different groups or types, helping to classify and manage products efficiently. 
It allows easy categorization, filtering, and search operations within the inventory system.
*/

-- Create CATEGORIES table
CREATE TABLE categories(
	category_id INT AUTO_INCREMENT PRIMARY KEY,						-- Unique identifier for each category
    category_name VARCHAR(100) NOT NULL UNIQUE,						-- Name of the category, must be unique
    description TEXT,												-- Description of the category
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,					-- Timestamp for when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
				ON UPDATE CURRENT_TIMESTAMP							-- Last updated timestamp
);

-- Insert category information in CATEGORIES table
INSERT INTO categories (category_name, description) 
VALUES
('Electronics', 'Devices and gadgets such as smartphones, laptops, and accessories'),
('Furniture', 'Home and office furniture including chairs, tables, and cabinets'),
('Clothing', 'Apparel for men, women, and children, including shirts, pants, and dresses'),
('Groceries', 'Food items, beverages, and household supplies'),
('Tools', 'Hand tools, power tools, and hardware for construction and repairs'),
('Toys', 'Toys and games for children of all ages'),
('Books', 'Printed and digital books across various genres'),
('Sports & Outdoors', 'Equipment and gear for sports and outdoor activities'),
('Health & Beauty', 'Personal care products, cosmetics, and health supplements'),
('Automotive', 'Car parts, accessories, and tools for vehicle maintenance');

-- View CATEGORY information
SELECT * FROM categories;


-- ------------------------------------------------------------------------------
-- 								Table 4 : ORDERS								|
-- ------------------------------------------------------------------------------

/*
PURPOSE: The orders table tracks customer orders in an inventory management system. It captures key details about the order, 
such as the products ordered, the customer who placed the order, the order's status, and payment information.
*/

-- Create ORDERS table
CREATE TABLE orders(
	order_id INT AUTO_INCREMENT PRIMARY KEY, 					-- Unique identifier for each order
    customer_id INT NOT NULL,									-- Reference to the customer placing the order
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,				-- Date and time the order placed
    total_amount DECIMAL(10, 2) NOT NULL,						-- Total price of the order
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') 
				Default 'Pending',								-- Status of the order, DEFAULT is 'Pending'
	shipping_address VARCHAR(255) NOT NULL,						-- Shipping address for the order
    payment_status ENUM('Pending', 'Completed', 'Failed')		
				DEFAULT 'Pending', 								-- Payment status of the order, DEFAULT is 'Pending'
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,				-- Timestamp for when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
				ON UPDATE CURRENT_TIMESTAMP						-- Last updated timestamp
);

-- Inserting sample order records into the orders table
INSERT INTO orders(customer_id, order_date, total_amount, status, shipping_address, payment_status)
VALUES
(1, '2025-01-08 10:30:00', 299.99, 'Pending', '1234 Elm St, Springfield, IL, 62701', 'Pending'),
(2, '2025-01-07 14:20:00', 159.50, 'Shipped', '5678 Oak Ave, Chicago, IL, 60601', 'Completed'),
(3, '2025-01-06 11:15:00', 499.99, 'Delivered', '9101 Maple Rd, St. Louis, MO, 63101', 'Completed'),
(4, '2025-01-05 16:40:00', 89.99, 'Pending', '2345 Pine St, Peoria, IL, 61602', 'Pending'),
(5, '2025-01-04 09:10:00', 350.75, 'Shipped', '6789 Birch Blvd, Champaign, IL, 61820', 'Completed'),
(6, '2025-01-03 08:00:00', 120.00, 'Pending', '4321 Cedar Ln, Decatur, IL, 62521', 'Pending'),
(7, '2025-01-02 19:00:00', 249.99, 'Cancelled', '1357 Walnut St, Urbana, IL, 61801', 'Failed'),
(8, '2025-01-01 12:30:00', 180.00, 'Delivered', '2468 Chestnut Ave, Normal, IL, 61761', 'Completed'),
(9, '2024-12-31 15:45:00', 550.00, 'Shipped', '9876 Redwood Dr, Bloomington, IL, 61704', 'Completed'),
(10, '2024-12-30 17:50:00', 399.99, 'Pending', '6543 Maplewood Rd, Lincoln, IL, 62656', 'Pending');

-- View ORDERS table
SELECT * FROM orders;

-- Add FOREIGN KEY customer_id after creating and inserting data into CUSTOMERS table
ALTER TABLE orders
ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

-- ------------------------------------------------------------------------------
-- 								Table 5 : ORDER_ITEMS							|
-- ------------------------------------------------------------------------------

/*
PURPOSE: This table tracks which products are included in each order. It connects products to orders and captures
details about the quantity and price for each product in a specific order.
*/

-- Create table ORDER_ITEMS
CREATE TABLE order_items(
	order_item_id INT AUTO_INCREMENT PRIMARY KEY, 					-- Unique identifier for each order item
    order_id INT NOT NULL,											-- ID of the order to which the item belongs
    product_id VARCHAR(20) NOT NULL,								-- ID of the product being ordered
    quantity INT NOT NULL CHECK(quantity > 0),						-- Quantity of the product in the order
    unit_price DECIMAL(10, 2) CHECK(unit_price >= 0),				--  Price of one unit of the product
    total_price DECIMAL(10, 2) 
		GENERATED ALWAYS AS (quantity * unit_price) STORED, 		-- Total price for the product in the order
	
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
		ON DELETE CASCADE,											-- Foreign key referencing orders table 
	FOREIGN KEY (product_id) REFERENCES products(product_id)
		ON DELETE CASCADE											-- Foreign key referencing products table
);

-- Insert data into ORDER_ITEMS
INSERT INTO order_items(order_id, product_id, quantity, unit_price)
VALUES
(1, 'B07XJ8C8F5', 2, 999.99),
(1, 'B08Q7BL5C2', 1, 799.99),
(2, 'B0844JKGSK', 3, 149.99),
(2, 'B07X8QWZQK', 1, 89.99),
(3, 'B08D6J2V7X', 1, 1199.99),
(4, 'B07DLHMQ9C', 1, 499.99),
(5, 'B081T2QZF7', 2, 59.99),
(6, 'B08N5M7S6K', 1, 249.99),
(7, 'B0856YF9B9', 1, 89.99),
(8, 'B07W4LZWX1', 2, 129.99);

-- View order_items data
SELECT * FROM order_items;

-- ------------------------------------------------------------------------------
-- 								Table 6 : CUSTOMERS								|
-- ------------------------------------------------------------------------------

-- Create CUSTOMERS table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,        		-- Unique identifier for each customer
    first_name VARCHAR(100) NOT NULL,                  		-- Customer's first name
    last_name VARCHAR(100) NOT NULL,                   		-- Customer's last name
    email VARCHAR(255) UNIQUE NOT NULL,                		-- Customer's email address, unique
    phone VARCHAR(15),                                 		-- Customer's phone number
    shipping_address TEXT,                             		-- Customer's shipping address
    billing_address TEXT,                              		-- Customer's billing address
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP  	-- Timestamp for when the customer registered
);

-- Insert data into CUSTOMERS table
INSERT INTO customers (customer_id, first_name, last_name, email, phone, shipping_address, billing_address)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '1234 Elm Street, Springfield', '1234 Elm Street, Springfield'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', '5678 Oak Avenue, Rivertown', '5678 Oak Avenue, Rivertown'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', '1122334455', '9101 Pine Road, Greenfield', '9101 Pine Road, Greenfield'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '2233445566', '1023 Maple Drive, Lakeside', '1023 Maple Drive, Lakeside'),
(5, 'David', 'Martinez', 'david.martinez@example.com', '3344556677', '2234 Birch Street, Hilltop', '2234 Birch Street, Hilltop'),
(6, 'Sophia', 'Garcia', 'sophia.garcia@example.com', '4455667788', '3345 Cedar Lane, Valleyview', '3345 Cedar Lane, Valleyview'),
(7, 'William', 'Taylor', 'william.taylor@example.com', '5566778899', '4567 Redwood Avenue, Seaside', '4567 Redwood Avenue, Seaside'),
(8, 'Olivia', 'Anderson', 'olivia.anderson@example.com', '6677889900', '5678 Willow Way, Sun Valley', '5678 Willow Way, Sun Valley'),
(9, 'James', 'Wilson', 'james.wilson@example.com', '7788990011', '6789 Elm Street, Mountainview', '6789 Elm Street, Mountainview'),
(10, 'Isabella', 'Thomas', 'isabella.thomas@example.com', '8899001122', '7890 Pinecrest Road, Riverview', '7890 Pinecrest Road, Riverview');


-- View CUSTOMERS data
SELECT * FROM customers;


-- ------------------------------------------------------------------------------
-- 								Table 7 : PAYMENTS								|
-- ------------------------------------------------------------------------------

-- Create PAYMENTS table
CREATE TABLE payments(
	payment_id INT AUTO_INCREMENT PRIMARY KEY, 							-- Unique identifier for each payment
    order_id INT NOT NULL,												-- Foreign key to the orders table
	payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,					-- Date and time when payment was made
    payment_amount DECIMAL(10, 2) CHECK(payment_amount >= 0),			-- Amount paid for the order
	payment_method ENUM('Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer', 'Cash on Delivery') NOT NULL,  -- Payment method used
    payment_status ENUM('Pending', 'Completed', 'Failed') NOT NULL,  	-- Status of the payment
    transaction_id VARCHAR(100),                              			-- Unique transaction identifier for the payment
    
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE  -- Linking to orders table
);

-- Insert data into PAYMENTS table
INSERT INTO payments (order_id, payment_amount, payment_method, payment_status, transaction_id)
VALUES
(1, 999.99, 'Credit Card', 'Completed', 'TXN0001'),
(2, 799.99, 'Debit Card', 'Completed', 'TXN0002'),
(3, 149.99, 'PayPal', 'Completed', 'TXN0003'),
(4, 89.99, 'Cash on Delivery', 'Pending', 'TXN0004'),
(5, 1199.99, 'Credit Card', 'Failed', 'TXN0005'),
(6, 499.99, 'Bank Transfer', 'Completed', 'TXN0006'),
(7, 59.99, 'Debit Card', 'Completed', 'TXN0007'),
(8, 249.99, 'PayPal', 'Completed', 'TXN0008'),
(9, 89.99, 'Credit Card', 'Completed', 'TXN0009'),
(10, 129.99, 'Cash on Delivery', 'Pending', 'TXN0010');

-- View payments information
SELECT * FROM payments;

-- ------------------------------------------------------------------------------
-- 								Table 8 : SHIPMENTS								|
-- ------------------------------------------------------------------------------

/*
The shipments table tracks the shipping details of orders, including status, method, tracking information, 
and delivery date.
*/

-- Create SHIPMENTS table
CREATE TABLE shipments(
	shipment_id INT AUTO_INCREMENT PRIMARY KEY,                      				-- Unique identifier for each shipment
    order_id INT NOT NULL,                                            				-- Foreign key to the orders table
    shipment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                				-- Date when the shipment was made
    shipment_status ENUM('Pending', 'Shipped', 'Delivered', 'Returned') NOT NULL, 	-- Current status of the shipment
    shipping_method ENUM('Standard', 'Express', 'Overnight') NOT NULL,  			-- Method used for shipping
    tracking_number VARCHAR(100),                                     				-- Tracking number provided by the shipping company
    delivery_date TIMESTAMP,                                          				-- Date when the shipment was delivered
    shipping_address VARCHAR(255),                                     				-- Shipping address for the order
    
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE  			-- Linking to orders table
);

-- Insert data into SHIPMENTS table
INSERT INTO shipments (order_id, shipment_status, shipping_method, tracking_number, delivery_date, shipping_address)
VALUES
(1, 'Shipped', 'Standard', 'TRACK12345', '2025-01-05', '123 Apple St, Cupertino, CA'),
(2, 'Delivered', 'Express', 'TRACK12346', '2025-01-06', '456 Samsung Rd, San Jose, CA'),
(3, 'Pending', 'Overnight', 'TRACK12347', NULL, '789 Sony Blvd, Palo Alto, CA'),
(4, 'Shipped', 'Standard', 'TRACK12348', '2025-01-04', '101 Nike Ave, Portland, OR'),
(5, 'Delivered', 'Express', 'TRACK12349', '2025-01-07', '202 Dell St, Austin, TX'),
(6, 'Returned', 'Standard', 'TRACK12350', '2025-01-03', '303 Sony Dr, Los Angeles, CA'),
(7, 'Shipped', 'Overnight', 'TRACK12351', '2025-01-05', '404 Toshiba Rd, Seattle, WA'),
(8, 'Delivered', 'Standard', 'TRACK12352', '2025-01-06', '505 Samsung Ln, San Francisco, CA'),
(9, 'Shipped', 'Express', 'TRACK12353', '2025-01-04', '606 Bose Blvd, Boston, MA'),
(10, 'Pending', 'Standard', 'TRACK12354', NULL, '707 Instant Pot Pl, Chicago, IL');

-- View SHIPMENTS information
SELECT * FROM shipments;


-- ------------------------------------------------------------------------------
-- 								Table 9 : PRODUCT_REVIEWS						|
-- ------------------------------------------------------------------------------

-- Create PRODUCT_REVIEWS table
CREATE TABLE product_reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,                              			-- Unique identifier for each review
    product_id VARCHAR(20) NOT NULL,                                        		-- Foreign key linking to the products table
    customer_id INT NOT NULL,                                               		-- Foreign key linking to the customers table
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),                     		-- Rating given by the customer (1 to 5)
    review_comment TEXT,                                                    		-- Review comment provided by the customer
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                        		-- Timestamp for when the review was submitted
    
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE, 	-- Foreign key to products table
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE 	-- Foreign key to customers table
);

-- Insert data into product_reviews table
INSERT INTO product_reviews (product_id, customer_id, rating, review_comment)
VALUES
('B07XJ8C8F5', 1, 5, 'Excellent phone, highly recommend!'),
('B08Q7BL5C2', 2, 4, 'Great phone, but the battery life could be better.'),
('B0844JKGSK', 3, 5, 'Amazing sound quality! Perfect for music lovers.'),
('B07X8QWZQK', 4, 2, 'Not comfortable for long runs, disappointing fit.'),
('B08D6J2V7X', 5, 5, 'Super fast and lightweight laptop, love it!'),
('B07DLHMQ9C', 6, 1, 'The TV stopped working after a few days, terrible quality.'),
('B081T2QZF7', 7, 4, 'Works great for storing files, would recommend for backups.'),
('B08N5M7S6K', 8, 5, 'Awesome smartwatch, great fitness tracking features.'),
('B0856YF9B9', 9, 4, 'Nice pressure cooker, but a bit bulky for small kitchens.'),
('B07W4LZWX1', 10, 3, 'Good sound quality but bulky, not as portable as expected.');

-- View all reviews
SELECT * FROM product_reviews;


-- ------------------------------------------------------------------------------
-- 							Table 10 : INVENTORY_TRANSACTIONS					|
-- ------------------------------------------------------------------------------

/*
The inventory_transactions table helps track any changes made to the stock of products in the warehouse. 
It records when products are added or removed from the inventory.
*/

-- Create INVENTORY_TRANSACTIONS table
CREATE TABLE inventory_transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,                         					-- Unique identifier for each transaction
    product_id VARCHAR(20) NOT NULL,                                       					-- Foreign key linking to the products table
    transaction_type ENUM('Stock Addition', 'Stock Removal', 'Stock Update') NOT NULL,  	-- Type of transaction
    quantity INT NOT NULL CHECK(quantity >= 0),                            					-- Quantity of product added/removed
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                  					-- Timestamp of when the transaction occurred
    reason TEXT,                                                           					-- Reason for the transaction (e.g., restocking, order fulfillment)
    
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE  			-- Foreign key to products table
);

-- Insert data into INVENTORY_TRANSACTIONS table
INSERT INTO inventory_transactions (product_id, transaction_type, quantity, reason)
VALUES
('B07XJ8C8F5', 'Stock Removal', 10, 'Order Fulfillment for Order ID 1'),
('B08Q7BL5C2', 'Stock Removal', 5, 'Order Fulfillment for Order ID 2'),
('B0844JKGSK', 'Stock Removal', 7, 'Order Fulfillment for Order ID 3'),
('B07X8QWZQK', 'Stock Removal', 5, 'Order Fulfillment for Order ID 4'),
('B08D6J2V7X', 'Stock Addition', 20, 'Restocking'),
('B07DLHMQ9C', 'Stock Removal', 2, 'Order Fulfillment for Order ID 6'),
('B081T2QZF7', 'Stock Addition', 30, 'Restocking'),
('B08N5M7S6K', 'Stock Removal', 10, 'Order Fulfillment for Order ID 8'),
('B0856YF9B9', 'Stock Removal', 15, 'Order Fulfillment for Order ID 9'),
('B07W4LZWX1', 'Stock Removal', 5, 'Order Fulfillment for Order ID 10');

-- View all data
SELECT * FROM inventory_transactions;


-- ------------------------------------------------------------------------------
-- 								Table 11 : RETURNS								|
-- ------------------------------------------------------------------------------

/*
PURPOSE: The RETURNS table keeps track of products that customers return after purchase.
*/

-- Create RETURNS table
CREATE TABLE returns(
	return_id INT AUTO_INCREMENT PRIMARY KEY, 					-- Unique ID for each return
    order_id INT NOT NULL,										-- Links to the ORDERS table
    customer_id INT NOT NULL,									-- Links to the CUSTOMERS table
    product_id VARCHAR(20) NOT NULL,									-- Links to the PRODUCTS table
    return_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 			-- Date and Time of the return
    quantity INT NOT NULL CHECK(quantity > 0),					-- Quantity of product being return
    reason TEXT NOT NULL, 										-- Reason for the return 
    status ENUM('Pending', 'Approved', 'Rejected') NOT NULL, 	-- Status of the return process
    refunded BOOLEAN DEFAULT FALSE, 							-- Whether the refund has been processed
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,				-- Timestamp for when the record was created
    updated_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
				ON UPDATE CURRENT_TIMESTAMP,					-- Last updated timestamp
    
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES products(product_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Insert data into RETURNS table
INSERT INTO returns(order_id, customer_id, product_id, quantity, reason, status, refunded)
VALUES
(1, 1, 'B07XJ8C8F5', 1, 'Defective product', 'Approved', TRUE),         -- Order ID 1: A valid return due to defect
(2, 2, 'B08Q7BL5C2', 2, 'Wrong item delivered', 'Approved', TRUE),      -- Order ID 2: Return for wrong delivery
(3, 3, 'B0844JKGSK', 1, 'Damaged in transit', 'Pending', FALSE),        -- Order ID 3: Pending review
(4, 4, 'B07X8QWZQK', 1, 'Size issue', 'Rejected', FALSE),               -- Order ID 4: Return request rejected
(5, 5, 'B08D6J2V7X', 1, 'Not as described', 'Approved', TRUE),          -- Order ID 5: Approved for refund
(6, 1, 'B081T2QZF7', 3, 'Changed mind', 'Approved', TRUE),              -- Order ID 6: Multiple items returned
(7, 3, 'B0856YF9B9', 1, 'Product expired', 'Pending', FALSE),           -- Order ID 7: Awaiting approval
(8, 2, 'B07W4LZWX1', 2, 'Missing parts', 'Approved', TRUE),             -- Order ID 8: Approved due to missing parts
(9, 4, 'B07DLHMQ9C', 1, 'Discontinued model', 'Rejected', FALSE),       -- Order ID 9: Return rejected
(10, 5, 'B08N5M7S6K', 1, 'Customer dissatisfaction', 'Approved', TRUE); -- Order ID 10: Approved refund


-- ------------------------------------------------------------------------------
-- 								Table 12 : DISCOUNTS							|
-- ------------------------------------------------------------------------------

/*
PURPOSE: The DISCOUNTS table stores information about discounts or offers applied to products in the inventory.
*/

-- Create DISCOUNTS table
CREATE TABLE discounts(
	discount_id INT AUTO_INCREMENT PRIMARY KEY, 					-- Unique identifier for each discount
    product_id VARCHAR(20),											-- ID of the product to which the discount applies
    discount_type ENUM('Percentage', 'Flat Amount') NOT NULL,		-- Type of discount (percentage or fixed amount)
    discount_value DECIMAL(10, 2) NOT NULL, 						-- Value of the discount
    start_date DATE NOT NULL,										-- Start date of the discount
    end_Date DATE NOT NULL,											-- End date of the discount
    status ENUM('Active', 'Expired') DEFAULT 'Active',				-- Status of the discount
    
    FOREIGN KEY (product_id) REFERENCES products(product_id)		-- Links to the PRODUCTS table
			ON DELETE CASCADE										-- Removes discount if the product is deleted
);

-- Insert data into DISCOUNTS table
INSERT INTO discounts(product_id, discount_type, discount_value, start_date, end_date, status)
VALUES
('B07XJ8C8F5', 'Percentage', 10.00, '2025-01-01', '2025-01-31', 'Active'),
('B08Q7BL5C2', 'Flat Amount', 50.00, '2025-01-05', '2025-01-20', 'Active'),
('B0844JKGSK', 'Percentage', 15.00, '2025-01-10', '2025-01-30', 'Active'),
('B07X8QWZQK', 'Flat Amount', 20.00, '2025-01-01', '2025-01-15', 'Expired'),
('B081T2QZF7', 'Percentage', 5.00, '2025-01-10', '2025-02-10', 'Active');


-- ------------------------------------------------------------------------------
-- 								Table 13 : WAREHOUSES							|
-- ------------------------------------------------------------------------------

/*
PURPOSE: This table stores information about different warehouses, where products are stored. It will also 
include location details.
*/

-- Create WAREHOUSES table
CREATE TABLE warehouses(
	warehouse_id INT AUTO_INCREMENT PRIMARY KEY, 					-- Unique identifier for each warehouse
    warehouse_name VARCHAR(255) NOT NULL,							-- Name of the warehouse
    location VARCHAR(255) NOT NULL,									-- Physical location of the warehouse
    capacity INT NOT NULL CHECK(capacity >= 0),						-- Total capacity of the warehouse (Number of units/products)
    current_stock INT NOT NULL CHECK(current_stock >= 0),			-- Actual number of products(units) that are physically available in the warehouse			
    contact_number VARCHAR(20),										-- Contact number for the warehouse
    manager_name VARCHAR(255),										-- Name of the manager
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,					-- Timestamp when the warehouse record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
			ON UPDATE CURRENT_TIMESTAMP								-- Timestamp when the warehouse record was last updated
);

-- Insert data into WAREHOUSES table
INSERT INTO warehouses (warehouse_name, location, capacity, current_stock) 
VALUES
('Main Warehouse', 'Aisle 1, Row 2', 500, 250),
('Electronics Warehouse', 'Aisle 3, Row 4', 500, 450),
('Clothing Warehouse', 'Aisle 5, Row 1', 500, 200),
('Furniture Warehouse', 'Aisle 6, Row 3', 500, 300),
('Toy Warehouse', 'Aisle 2, Row 5', 500, 180),
('Home Appliances Warehouse', 'Aisle 4, Row 7', 500, 370),
('Sports Equipment Warehouse', 'Aisle 8, Row 2', 500, 410),
('Books Warehouse', 'Aisle 7, Row 8', 500, 150),
('Food & Beverages Warehouse', 'Aisle 9, Row 6', 500, 290),
('Seasonal Goods Warehouse', 'Aisle 10, Row 4', 500, 100);

-- ------------------------------------------------------------------------------
-- 							Table 14 : EMPLOYEE_DETAILS							|
-- ------------------------------------------------------------------------------

/*
PURPOSE: This table will store details like employee ID, name, position, and the warehouse they work 
in (linked to the warehouses table).
*/

-- Create EMPLOYEE_DETAILS table
CREATE TABLE employee_details(
	employee_id INT AUTO_INCREMENT PRIMARY KEY,                      	-- Unique employee identifier
    first_name VARCHAR(100) NOT NULL,                                 	-- First name of the employee
    last_name VARCHAR(100) NOT NULL,                                  	-- Last name of the employee
    email VARCHAR(255) UNIQUE NOT NULL,                        			-- Employee's email (unique)
    phone_number VARCHAR(20),                          					-- Employee's phone number
    position VARCHAR(100),                                           	-- Job position (e.g., Warehouse Manager, Stock Clerk)
    warehouse_id INT,                                                 	-- Foreign key to the warehouses table
    hire_date DATE NOT NULL,                                          	-- Date of hire
    salary DECIMAL(10, 2) CHECK(salary >= 0),                         	-- Employee's salary
    status ENUM('Active', 'Inactive', 'On Leave') NOT NULL,           	-- Employee status
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id) 
					ON DELETE SET NULL									-- Foreign key linking to the warehouses table
);

-- Insert data into EMPLOYEE_TABLES tables
INSERT INTO employee_details (first_name, last_name, email, phone_number, position, warehouse_id, hire_date, salary, status)
VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234', 'Warehouse Manager', 1, '2021-06-15', 55000.00, 'Active'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678', 'Stock Clerk', 2, '2020-04-01', 35000.00, 'Active'),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-8765', 'Warehouse Associate', 3, '2019-02-20', 32000.00, 'On Leave'),
('Bob', 'Brown', 'bob.brown@example.com', '555-4321', 'Inventory Specialist', 1, '2022-01-10', 42000.00, 'Active'),
('Charlie', 'Davis', 'charlie.davis@example.com', '555-6789', 'Warehouse Manager', 2, '2018-07-15', 57000.00, 'Inactive'),
('David', 'Martinez', 'david.martinez@example.com', '555-2468', 'Logistics Coordinator', 1, '2021-08-05', 48000.00, 'Active'),
('Eva', 'Garcia', 'eva.garcia@example.com', '555-1357', 'Stock Clerk', 2, '2017-03-12', 34000.00, 'Active'),
('Frank', 'Wilson', 'frank.wilson@example.com', '555-2584', 'Warehouse Associate', 3, '2020-09-22', 31000.00, 'On Leave'),
('Grace', 'Lee', 'grace.lee@example.com', '555-3698', 'Inventory Specialist', 1, '2019-11-18', 38000.00, 'Active'),
('Henry', 'Taylor', 'henry.taylor@example.com', '555-1470', 'Warehouse Manager', 3, '2015-06-10', 59000.00, 'Inactive');


-- ------------------------------------------------------------------------------
-- 								Table 15 : USERS								|
-- ------------------------------------------------------------------------------

/*
PURPOSE: The users table typically stores authentication and access information for both customers and admin personnel who interact with the system. 
This table will define the different roles (e.g., customer, admin, etc.) and keep track of login credentials.
*/

-- Create USERS table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,             						-- Unique identifier for each user
    username VARCHAR(50) NOT NULL UNIQUE,               						-- Username for login, must be unique
    password_hash VARCHAR(255) NOT NULL,                						-- Securely stored password (hashed)
    email VARCHAR(100) NOT NULL UNIQUE,                 						-- User's email, must be unique
    role ENUM('customer', 'admin', 'employee', 'manager') NOT NULL, 			-- User role in the system (customer, admin, or employee)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     						-- Timestamp when the user was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 	-- Timestamp when the record was last updated
);

-- Insert data into USERS table
INSERT INTO users (username, password_hash, email, role)
VALUES
('john_doe', 'hashed_password_123', 'john.doe@example.com', 'customer'),
('jane_smith', 'hashed_password_456', 'jane.smith@example.com', 'customer'),
('bob_johnson', 'hashed_password_789', 'bob.johnson@example.com', 'customer'),
('alice_williams', 'hashed_password_012', 'alice.williams@example.com', 'customer'),
('mike_brown', 'hashed_password_345', 'mike.brown@example.com', 'employee'),
('susan_davis', 'hashed_password_678', 'susan.davis@example.com', 'employee'),
('david_moore', 'hashed_password_901', 'david.moore@example.com', 'employee'),
('emily_taylor', 'hashed_password_234', 'emily.taylor@example.com', 'manager'),
('james_clark', 'hashed_password_567', 'james.clark@example.com', 'manager'),
('kate_lee', 'hashed_password_890', 'kate.lee@example.com', 'admin');


-- ------------------------------------------------------------------------------
-- 								Table 16 : AUDIT_LOGS							|
-- ------------------------------------------------------------------------------

/*
PURPOSE: The Audit Logs table records every action performed in the system for tracking and security purposes. 
It helps track changes to records such as insertions, updates, deletions, and any other activities that occur within the database.
*/


-- Create AUDIT_LOGS table
CREATE TABLE audit_logs(
	audit_id INT AUTO_INCREMENT PRIMARY KEY,                               	-- Unique identifier for each audit log
    action_type ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,                -- Type of action performed (Insert, Update, or Delete)
    table_name VARCHAR(255) NOT NULL,                                       -- Name of the table where the action occurred
    record_id VARCHAR(20) NOT NULL,                                                 -- ID of the record that was modified
    user_id INT NOT NULL,                                                   -- ID of the user who performed the action
    action_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                   -- Timestamp of when the action occurred
    old_value TEXT,                                                         -- The old value (for updates or deletes)
    new_value TEXT,                                                         -- The new value (for updates or inserts)
    
    FOREIGN KEY (user_id) REFERENCES users(user_id) 
				ON DELETE CASCADE,      									-- Foreign key reference to the users table
    FOREIGN KEY (record_id) REFERENCES products(product_id) 
				ON DELETE CASCADE   										-- Foreign key reference to the products table (for example)
);

-- Insert data into AUDIT_LOGS
INSERT INTO audit_logs (action_type, table_name, record_id, user_id, action_timestamp, old_value, new_value)
VALUES 
('INSERT', 'products', 'B07XJ8C8F5', 1, '2025-01-09 10:00:00', NULL, '{"product_name": "Apple iPhone 13", "category": "Electronics", "price": "999.99"}'),
('UPDATE', 'products', 'B08Q7BL5C2', 2, '2025-01-09 11:30:00', '{"price": "799.99"}', '{"price": "749.99"}'),
('DELETE', 'products', 'B07X8QWZQK', 3, '2025-01-09 12:00:00', '{"status": "Out of Stock"}', NULL),
('INSERT', 'products', 'B0844JKGSK', 4, '2025-01-09 13:00:00', NULL, '{"product_name": "Sony Wireless Headphones", "category": "Electronics", "price": "149.99"}'),
('UPDATE', 'products', 'B08D6J2V7X', 5, '2025-01-09 14:15:00', '{"quantity_in_stock": "20"}', '{"quantity_in_stock": "15"}'),
('DELETE', 'products', 'B08N5M7S6K', 6, '2025-01-09 15:30:00', '{"status": "Available"}', NULL),
('INSERT', 'products', 'B0856YF9B9', 7, '2025-01-09 16:00:00', NULL, '{"product_name": "Instant Pot Pressure Cooker", "category": "Home Appliances", "price": "89.99"}'),
('UPDATE', 'products', 'B07W4LZWX1', 8, '2025-01-09 17:45:00', '{"price": "129.99"}', '{"price": "119.99"}'),
('INSERT', 'products', 'B081T2QZF7', 9, '2025-01-09 18:15:00', NULL, '{"product_name": "Toshiba External Hard Drive", "category": "Electronics", "price": "59.99"}'),
('DELETE', 'products', 'B07DLHMQ9C', 10, '2025-01-09 19:00:00', '{"status": "Discontinued"}', NULL);


-- ------------------------------------------------------------------------------
-- 									Table 17 : TAXES							|
-- ------------------------------------------------------------------------------

/*
PURPOSE: This table stores tax information applied to orders or individual products, including the tax rate and the type of tax.
*/

-- Create TAXES table
CREATE TABLE taxes (
    tax_id INT AUTO_INCREMENT PRIMARY KEY,                        				-- Unique identifier for each tax
    tax_type ENUM('Sales Tax', 'Value Added Tax', 'Service Tax') NOT NULL,  	-- Type of tax
    tax_rate DECIMAL(5, 2) NOT NULL CHECK(tax_rate >= 0),          				-- Tax rate (percentage)
    country VARCHAR(100),                                          				-- Country where the tax is applied
    state VARCHAR(100),                                            				-- State where the tax is applied (if applicable)
    product_id VARCHAR(20),                                         			-- Foreign key for product (if tax applies to product)
    order_id INT,                                                  				-- Foreign key for order (if tax applies to order)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                				-- Timestamp of when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
			ON UPDATE CURRENT_TIMESTAMP, 										-- Timestamp for when record was updated
            
    FOREIGN KEY (product_id) REFERENCES products(product_id) 
			ON DELETE CASCADE,  												-- Foreign key to products table
    FOREIGN KEY (order_id) REFERENCES orders(order_id) 
			ON DELETE CASCADE    												-- Foreign key to orders table
);

-- Insert data into TAXES
INSERT INTO taxes (tax_type, tax_rate, country, state, product_id, order_id)
VALUES
('Sales Tax', 5.00, 'USA', 'California', 'B07XJ8C8F5', NULL),
('Value Added Tax', 18.00, 'India', 'Delhi', 'B08Q7BL5C2', NULL),
('Sales Tax', 10.00, 'Canada', 'Ontario', 'B0844JKGSK', 1),
('Service Tax', 8.00, 'UK', 'London', NULL, 2),
('Sales Tax', 5.50, 'USA', 'Texas', 'B07X8QWZQK', NULL),
('Sales Tax', 7.00, 'Australia', 'New South Wales', 'B08D6J2V7X', 3),
('Value Added Tax', 15.00, 'Germany', 'Berlin', 'B081T2QZF7', 4),
('Sales Tax', 9.00, 'USA', 'Florida', 'B08N5M7S6K', NULL),
('Service Tax', 12.00, 'India', 'Mumbai', NULL, 5),
('Sales Tax', 6.00, 'USA', 'New York', 'B0856YF9B9', 6);


-- ------------------------------------------------------------------------------
-- 							Table 18 : PRODUCT_IMAGES							|
-- ------------------------------------------------------------------------------

/*
PURPOSE: This table can store information about images associated with the products.
*/

-- Create PRODUCT_IMAGES table
CREATE TABLE product_images (
    image_id INT AUTO_INCREMENT PRIMARY KEY,  					-- Unique ID for each image
    product_id VARCHAR(20) NOT NULL,          					-- Product ID the image is associated with
    image_url VARCHAR(255) NOT NULL,          					-- URL of the image
    image_description TEXT,                   					-- Optional description of the image
    is_primary BOOLEAN DEFAULT FALSE,         					-- Whether this image is the primary one for the product
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  			-- Timestamp when the image was added
    
    FOREIGN KEY (product_id) REFERENCES products(product_id)	-- Links to the PRODUCTS table
);

-- Insert data into PRODUCT_IMAGES table
INSERT INTO product_images (product_id, image_url, image_description, is_primary)
VALUES
('B07XJ8C8F5', 'https://example.com/images/iphone13_front.jpg', 'Front view of Apple iPhone 13', TRUE),
('B07XJ8C8F5', 'https://example.com/images/iphone13_back.jpg', 'Back view of Apple iPhone 13', FALSE),
('B08Q7BL5C2', 'https://example.com/images/galaxys21_front.jpg', 'Front view of Samsung Galaxy S21', TRUE),
('B08Q7BL5C2', 'https://example.com/images/galaxys21_side.jpg', 'Side view of Samsung Galaxy S21', FALSE),
('B0844JKGSK', 'https://example.com/images/sony_headphones.jpg', 'Sony Wireless Headphones', TRUE),
('B07X8QWZQK', 'https://example.com/images/nike_shoes.jpg', 'Nike Running Shoes', TRUE),
('B08D6J2V7X', 'https://example.com/images/dell_laptop.jpg', 'Dell XPS 13 Laptop', TRUE),
('B07DLHMQ9C', 'https://example.com/images/sony_4k_tv.jpg', 'Sony 4K TV', TRUE),
('B081T2QZF7', 'https://example.com/images/toshiba_harddrive.jpg', 'Toshiba External Hard Drive', TRUE),
('B08N5M7S6K', 'https://example.com/images/galaxy_watch4.jpg', 'Samsung Galaxy Watch 4', TRUE);


-- ------------------------------------------------------------------------------
-- 							Table 19 : SHIPPING_METHODS							|
-- ------------------------------------------------------------------------------

/*
PURPOSE: This table will store the shipping methods available for orders.
*/

-- Create SHIPPING_METHODS table
CREATE TABLE shipping_methods (
    method_id INT AUTO_INCREMENT PRIMARY KEY,    		-- Unique identifier for each shipping method
    method_name VARCHAR(100) NOT NULL,           		-- Name of the shipping method (e.g., Standard, Express)
    delivery_time VARCHAR(50),                   		-- Estimated delivery time (e.g., "3-5 business days")
    price DECIMAL(10, 2) NOT NULL,               		-- Shipping cost for this method
    is_active BOOLEAN DEFAULT TRUE,              		-- Whether the shipping method is currently available
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  	-- Timestamp for when the record was created
);

-- Insert data into SHIPPING_METHODS
INSERT INTO shipping_methods (method_name, delivery_time, price, is_active)
VALUES 
('Standard Shipping', '5-7 business days', 5.99, TRUE),
('Express Shipping', '2-3 business days', 15.99, TRUE),
('Overnight Shipping', '1 business day', 29.99, TRUE),
('Free Shipping', '7-10 business days', 0.00, TRUE),
('International Shipping', '10-15 business days', 39.99, TRUE),
('Economy Shipping', '7-14 business days', 3.99, TRUE),
('Priority Shipping', '3-5 business days', 12.99, TRUE),
('Same Day Shipping', 'Same day', 19.99, TRUE),
('Two-Day Shipping', '2 business days', 8.99, TRUE),
('International Express Shipping', '5-7 business days', 49.99, TRUE);


-- ------------------------------------------------------------------------------
-- 								Table 20 : PROMOTIONS							|
-- ------------------------------------------------------------------------------

/*
PURPOSE: This table will store details about ongoing promotions, like discount percentages, promotional codes, 
start/end dates, and eligible product categories.
*/

-- Create PROMOTIONS table
CREATE TABLE promotions (
    promotion_id INT PRIMARY KEY AUTO_INCREMENT,          -- Unique identifier for the promotion
    promo_code VARCHAR(50) NOT NULL,                      -- The promotional code (e.g., "SUMMER21")
    discount_percentage DECIMAL(5, 2) NOT NULL 
			CHECK(discount_percentage BETWEEN 0 AND 100), -- Discount percentage (0 to 100%)
    start_date DATE NOT NULL,                             -- Start date of the promotion
    end_date DATE NOT NULL,                               -- End date of the promotion
    eligible_category VARCHAR(100),                       -- The product category eligible for the promotion
    is_active BOOLEAN DEFAULT TRUE,                       -- Status of the promotion (active or not)
    description TEXT                                      -- Description of the promotion
);

-- Insert data into PROMOTIONS table
INSERT INTO promotions (promo_code, discount_percentage, start_date, end_date, eligible_category, is_active, description)
VALUES
('SUMMER21', 15.00, '2021-06-01', '2021-08-31', 'Electronics', TRUE, 'Summer sale for all electronic products.'),
('WINTER15', 20.00, '2021-12-01', '2021-12-31', 'Apparel', TRUE, 'Winter sale offering 20% off on apparel.'),
('BOGO20', 0.00, '2021-09-01', '2021-09-30', 'Footwear', TRUE, 'Buy one, get one free on selected footwear items.'),
('BLACKFRIDAY25', 25.00, '2021-11-26', '2021-11-28', 'All', TRUE, 'Black Friday sale with 25% off on all items.'),
('NEWYEAR10', 10.00, '2021-12-31', '2022-01-02', 'Home Appliances', TRUE, 'New Year Sale – 10% off on home appliances.'),
('STUDENT15', 15.00, '2021-08-01', '2021-08-31', 'Books', TRUE, '15% discount for students on all book purchases.'),
('FREESHIP', 0.00, '2021-07-01', '2021-07-31', 'All', TRUE, 'Free shipping on all orders over $50.'),
('SUMMERCLEARANCE30', 30.00, '2021-06-15', '2021-06-30', 'Furniture', TRUE, 'Clearance sale for furniture items – 30% off.'),
('XMAS50', 50.00, '2021-12-20', '2021-12-25', 'Toys', TRUE, '50% off on selected toys for Christmas.'),
('VIP20', 20.00, '2021-09-15', '2021-09-25', 'All', TRUE, 'Exclusive VIP offer: 20% off on all orders.');






