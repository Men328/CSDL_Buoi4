CREATE DATABASE HomeWorks;

-- Bài 1
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Major VARCHAR(100) NOT NULL
);

INSERT INTO Students (StudentID, Name, Age, Major) VALUES
(1, 'Alice', 20, 'Computer Science'),
(2, 'Bob', 22, 'Mathematics'),
(3, 'Charlie', 21, 'Physics');


-- Bài 2: Cập nhật tuổi của sinh viên với StudentID = 2 thành 23
UPDATE Students
SET Age = 23
WHERE StudentID = 2;

-- Bài 3: Xóa sinh viên với StudentID = 1 khỏi bảng Students
DELETE FROM Students
WHERE StudentID = 1;

-- Bài 4: Viết truy vấn để lấy tất cả thông tin sinh viên từ bảng Students.
SELECT * FROM Students