USE lesson1;

SELECT *
FROM phone;

SELECT ProductName, Manufacturer, Price
FROM phone
WHERE ProductCount > 2;

SELECT ProductName, Manufacturer, ProductCount, Price
FROM phone
WHERE Manufacturer = "Samsung";

SELECT ProductName, Manufacturer, ProductCount, Price
FROM phone
WHERE ProductCount * Price > 100000 AND ProductCount * Price < 145000;

SELECT ProductName, Manufacturer, ProductCount, Price
FROM phone
WHERE ProductName LIKE "Iphone%";

SELECT ProductName, Manufacturer, ProductCount, Price
FROM phone
WHERE ProductName LIKE "Galaxy%";

SELECT ProductName, Manufacturer, ProductCount, Price
FROM phone
WHERE ProductName RLIKE "[0-9]";

SELECT ProductName, Manufacturer, ProductCount, Price
FROM phone
WHERE ProductName LIKE "%8%";