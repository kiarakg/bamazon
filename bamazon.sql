DROP DATABASE IF EXISTS bamazonDB;

CREATE DATABASE bamazonDB;

USE bamazonDB;

CREATE TABLE product (
    itemid INT NOT NULL AUTO_INCREMENT,
    productname VARCHAR (45) NOT NULL,
    departmentname VARCHAR (45) NOT NULL,
    price DECIMAL(10, 4) NOT NULL,
    stockquantity INT(10) NOT NULL,
    PRIMARY KEY (itemid)
);

INSERT INTO product (productname, departmentname, price, stockquantity)
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

SELECT * FROM bamazonDB.product;