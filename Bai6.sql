CREATE DATABASE Bai6;

CREATE TABLE suppliers (
	suppliearID INT PRIMARY KEY AUTO_INCREMENT,
    supplierName VARCHAR(100) NOT NULL,
    contactEmail VARCHAR(100) NOT NULL
);

CREATE TABLE products (
	productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100) NOT NULL,
    supplierID INT,
    FOREIGN KEY (supplierID) REFERENCES suppliers(suppliearID),
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

-- INSERT
INSERT INTO suppliers (suppliearID, supplierName, contactEmail) VALUES
(1, 'A', 'contactA@example.com'),
(2, 'B', 'contactB@example.com'),
(3, 'C', 'contactC@example.com');

INSERT INTO products (productID, productName, supplierID, price, stock) VALUES
(1, 'Product 1', 1, 29.99, 100),
(2, 'Product 2', 2, 45.99, 50),
(3, 'Product 3', 1, 15.75, 200),
(4, 'Product 4', 3, 22.50, 150);

-- UPDATE
UPDATE products
SET price = 45.99
WHERE productID = 2;

UPDATE suppliers
SET supplierName = 'new supplier'
WHERE suppliearID = 1;

-- DELETE
DELETE FROM products 
WHERE supplierID = 3;
DELETE FROM suppliers
WHERE suppliearID = 3;

DELETE FROM products
WHERE productID = 4;

-- Truy van
SELECT p.productID, p.productName, p.price, p.stock, s.supplierName
FROM products p
JOIN suppliers s ON p.supplierID = s.suppliearID;