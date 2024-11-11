CREATE DATABASE QuanLyDuAnVaNhanVien;

CREATE TABLE Projects (
	ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Budget DECIMAL(10,2) NOT NULL
);

CREATE TABLE Employees (
	EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
);

CREATE TABLE Tasks (
	TaskID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectID INT,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    TaskName VARCHAR(100) NOT NULL,
    AssignedTo INT,
    FOREIGN KEY (AssignedTo) REFERENCES Employees(EmployeeID),
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    `Status` VARCHAR(50) NOT NULL,
    HoursWorked DECIMAL(5,2) NOT NULL
);

INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, Budget) VALUES
	(1, 'Du an A', '2024-1-1','2024-9-1', 100000.00),
    ('2', 'Du an B', '2014-1-2', '2024-9-2', '90000.00'),
    ('3', 'Du an C', '2024-1-3', '2024-9-3', '110000.00');
    
INSERT INTO Employees (EmployeeID, EmployeeName, Position, HireDate, Salary) VALUES
    ('1' ,'do minh trong' ,'lap trinh vien' ,'2023-01-15', '60000.00'),
    ('2', 'nguyen thu thuy', 'thiet ke', '2023-02-20', '65000.00'),
    ('3', 'vu ha yen vy', 'quan ly du an', '2022-03-10', '80000.00'),
    ('4', 'tran huyen trang', 'phan tich he thong', '2022-04-05', '50000.00'),
    ('5', 'hoang cam tu', 'kiem thu', '2021-05-12', '65000.00');    
    
INSERT INTO Tasks (TaskID, ProjectID, TaskName, AssignedTo, StartDate, EndDate, `Status`, HoursWorked) VALUES
(1, 1, 'Lập kế hoạch', 1, '2024-01-05', '2024-01-10', 'Hoan Thanh', 30.00),
(2, 1, 'Phát triển phần mềm', 1, '2024-01-15', '2024-06-30', 'Đang Thuc Hien', 100.00),
(3, 2, 'Thiết kế giao diện', 2, '2024-02-01', '2024-04-01', 'Hoan Thanh', 40.00),
(4, 2, 'Phân tích yêu cầu', 4, '2024-02-05', '2024-03-15', 'Đang Thuc Hien', 25.00),
(5, 3, 'Kiểm thử phần mềm', 5, '2024-03-01', '2024-09-01', 'Đang Thuc Hien', 60.00),
(6, 3, 'Bảo trì hệ thống', 3, '2024-03-15', '2024-10-30', 'chua bat dau', 0.00);    
    
UPDATE Projects
SET Budget = 50000.00
WHERE ProjectID = 2;

UPDATE Tasks 
SET HoursWorked = 25.50
WHERE TaskID = 4;

DELETE FROM Tasks
WHERE AssignedTo = 3;
DELETE FROM Employees 
WHERE EmployeeID = 3;

DELETE FROM Tasks
WHERE TaskID = 5;

-- Truy van nang cao

-- Tinh tong chi phi
SELECT t.ProjectID, p.ProjectName,
SUM(Hoursworked) * 50.00 AS TotalCost
FROM Tasks t
INNER JOIN Projects p ON T.ProjectID = p.ProjectID
GROUP BY t.ProjectID, p.ProjectName;

-- Thong ke du an
SELECT p.ProjectID, p.ProjectName,
COUNT(CASE WHEN t.Status = 'Hoan thanh' THEN 1 END) AS CompletedTasks,
COUNT(CASE WHEN t.Status = 'Dang thuc hien' THEN 1 END) AS InProgressTasks
FROM Projects p
LEFT JOIN Tasks t ON t.projectID = p.ProjectID
GROUP BY p.ProjectID, p.ProjectName;

-- Thong ke nhan vien
SELECT e.EmployeeID, e.EmployeeName,
    COUNT(t.TaskID) AS TaskCount,
    SUM(t.HoursWorked) AS TotalHoursWorked
FROM Employees e
LEFT JOIN Tasks t ON e.EmployeeID = t.AssignedTo
GROUP BY e.EmployeeID, e.EmployeeName;

-- Tinh luong trung binh theo vi tri
SELECT Position,
AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Position;