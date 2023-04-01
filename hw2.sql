CREATE DATABASE IF NOT EXISTS hw2;

USE hw2;

CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    count_product INT
);

INSERT sales (order_date, count_product)
VALUES
	("2022-01-01", 156),
    ("2022-01-02", 180),
    ("2022-01-03", 21),
    ("2022-01-04", 124),
    ("2022-01-05", 341);

SELECT id,
CASE
	WHEN count_product < 100 THEN "Small Order"
    WHEN count_product BETWEEN 100 AND 300 THEN "Average Order"
    WHEN count_product > 300 THEN "Big Order"
END AS order_type
FROM sales; 

CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(20) NOT NULL,
    amount FLOAT NOT NULL, 
    order_status VARCHAR(20) NOT NULL
);

INSERT orders (employee_id, amount, order_status)
VALUES
	("e03", 15.00, "OPEN"),
    ("e01", 25.50, "OPEN"),
    ("e05", 100.70, "CLOSED"),
    ("e02", 22.18, "OPEN"),
    ("e04", 9.50, "CANCELLED");
    
SELECT id, employee_id, amount, order_status,
IF (order_status = "OPEN", "Order is in open state",
	IF (order_status = "CLOSED", "Order is closed", "Order is cancelled"))
AS full_order_status
FROM orders;

SELECT *
FROM orders;