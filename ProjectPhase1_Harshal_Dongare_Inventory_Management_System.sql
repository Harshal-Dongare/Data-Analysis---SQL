
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
    price DECIMAL(10, 2) CHECK(price >= 0),								-- Price of the product
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

SELECT * FROM products;