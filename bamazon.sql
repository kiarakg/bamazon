DROP DATABASE IF EXISTS bamazonDB;

CREATE DATABASE bamazonDB;

USE bamazonDB;

CREATE TABLE product (
    item_id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR (100) NOT NULL,
    department_name VARCHAR (100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT(11) NOT NULL,
    PRIMARY KEY (item_id)
);

INSERT INTO product (product_name, department_name, price, stock_quantity)
VALUES
    ('Running Shoes', 'Footwear', 120, 25),
    ('Workout Gloves', 'Accessories', 25, 15),
    ('Baseball Caps', 'Accessories', 30, 20),
    ('Workout Leggings', 'Activewear', 20, 15),
    ('Sports Bras', 'Activewear', 15, 15),
    ('Gym Shorts', 'Activewear', 20, 15),
    ('Workout Tops', 'Activewear', 20, 20),
    ('Hoodies & Pullovers', 'Activewear', 35, 20),
    ('Socks', 'Accessories', 10, 20),
    ('Bags & Backpacks', 'Accessories', 30, 15)