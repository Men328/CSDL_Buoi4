-- Bai1
SELECT o.orderID, o.orderDate,
	   c.name AS customerName,
       c.email AS customerEmail
FROM Orders o
JOIN Customers c ON o.customerID = c.customerID;
    
-- Bai2
SELECT ProductID, 
       COUNT(SaleID)
FROM Sales
GROUP BY ProductID;

-- Bai3
SELECT DepartmentID, 
      SUM(Salary) AS totalSalary, 
      AVG(Salary) AS averageSalary
FROM EmployeeSalaries
GROUP BY DepartmentID;

-- Bai4
SELECT productID, productName, price
FROM Products
WHERE price = (SELECT MAX(price) FROM Products);

SELECT productID, productName, price
FROM Products
WHERE price = (SELECT MIN(price) FROM Products);

-- Bai5
SELECT p.productID, p.productName, 
       SUM(od.quantity) AS totalSold
FROM Products p
JOIN OrderDetails od ON p.productID = od.productID
GROUP BY p.productID, p.productName
ORDER BY totalSold DESC;

-- Bai6
SELECT DATE_FORMAT(s.saleDate, '%Y-%m') AS month,  
       SUM(s.revenue) AS totalRevenue,            
       COUNT(s.orderID) AS totalOrders,             
       AVG(s.revenue) AS averageRevenue              
FROM Sales s
GROUP BY month
ORDER BY month;


