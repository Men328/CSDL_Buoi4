CREATE DATABASE Bai8;

CREATE TABLE invoices (
	invoiceID INT PRIMARY KEY AUTO_INCREMENT,
    invoiceDate DATETIME,
    customerName VARCHAR(100) NOT NULL
);

CREATE TABLE products (
	productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE invoiceDetail (
	detailID INT PRIMARY KEY AUTO_INCREMENT,
    invoiceID INT,
    FOREIGN KEY (invoiceID) REFERENCES invoices(invoiceID),
    productID INT,
    FOREIGN KEY (productID) REFERENCES products(productID),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

INSERT INTO products (productID, productName, price) VALUES
(1, 'Product A', 50.00),
(2, 'Product B', 30.00),
(3, 'Product C', 20.00);

INSERT INTO invoices (invoiceID, invoiceDate, customerName) VALUES
(1, '2023-10-01 14:00:00', 'Alice'),
(2, '2023-10-02 10:30:00', 'Bob');

INSERT INTO invoiceDetail (detailID, invoiceID, productID, quantity, price) VALUES
(1, 1, 1, 2, 50.00),
(2, 1, 2, 1, 30.00), 
(3, 2, 1, 1, 50.00), 
(4, 2, 3, 3, 20.00); 

UPDATE products
SET price = 55.00
WHERE productID = 1;

UPDATE invoiceDetail
SET quantity = 10
WHERE detailID = 2;

DELETE FROM products
WHERE productID = 3;

DELETE FROM invoiceDetail
WHERE detailID = 1;

--  lấy tổng giá trị hóa đơn (giá * số lượng) của từng hóa đơn
SELECT i.invoiceID, 
SUM(id.price * id.quantity) AS totalValue
FROM invoices i
JOIN invoiceDetail id ON i.invoiceID = id.invoiceID
GROUP BY i.invoiceID;

-- lấy danh sách tất cả sản phẩm trong từng hóa đơn cùng với số lượng và giá
SELECT i.invoiceID, p.productName, id.quantity, id.price
FROM invoiceDetail id
JOIN invoices i ON id.invoiceID = i.invoiceID
JOIN products p ON id.productID = p.productID;