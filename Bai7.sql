CREATE DATABASE Bai7;

CREATE TABLE customers (
	customerID INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    joinDate DATE
);

CREATE TABLE orders (
	orderID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT,
    FOREIGN KEY (customerID) REFERENCES customers(customerID),
    orderDate DATETIME,
    totalAmount DECIMAL(10,2) NOT NULL
);

INSERT INTO customers (customerID, `name`, email, joinDate) VALUES
(1, 'Alice', 'alice@example.com', '2023-01-10'),
(2, 'Bob', 'bob@example.com', '2023-01-15'),
(3, 'Charlie', 'charlie@example.com', '2023-01-20'),
(4, 'David', 'david@example.com', '2023-01-25');

INSERT INTO orders (orderID, customerID, orderDate, totalAmount) VALUES
(1, 1, '2023-02-01 10:00:00', 250.00),
(2, 2, '2023-02-02 11:00:00', 150.00),
(3, 3, '2023-02-03 12:00:00', 300.00),
(4, 1, '2023-02-04 09:00:00', 200.00),
(5, 2, '2023-02-05 15:00:00', 400.00);

UPDATE orders
SET totalAmount = 350.00
WHERE orderID = 3;

UPDATE customers
SET email = 'bob_new@example.com'
WHERE customerID = 2;

DELETE FROM customers
WHERE customerID = 4;

DELETE FROM orders
WHERE orderID = 1;

-- lấy tất cả thông tin đơn hàng cùng với tên khách hàng.
SELECT o.orderID, o.orderDate, o.totalAmount, c.name AS customerName
FROM orders o
JOIN customers c ON o.customerID = c.customerID;

-- lấy tổng số tiền đơn hàng của từng khách hàng (group by CustomerID).
SELECT customerID, SUM(totalAmount) 
FROM orders
GROUP BY customerID;