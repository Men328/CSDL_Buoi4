CREATE DATABASE Bai5;

CREATE TABLE Students (
	StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(50) NOT NULL,
    Major VARCHAR(50) NOT NULL
);

CREATE TABLE Courses (
	CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) NOT NULL,
    Instructor VARCHAR(50) NOT NULL
);

-- INSERT
INSERT INTO Students (StudentName, Major) VALUES
('Alice', 'Computer Science'),
('Bob', 'Mathematics'),
('Charlie', 'Physics'),
('David', 'Biology');

INSERT INTO Courses (CourseName, Instructor) VALUES
('Introduction to Programming', 'Dr. Smith'),
('Calculus', 'Dr. Johnson'),
('Physics I', 'Dr. Brown');

-- UPDATE
UPDATE Courses 
SET CourseName = 'Advanced Mathmatics'
WHERE CourseID = 2;

UPDATE Students
SET Major = 'Engineering'
WHERE StudentID = 3;

-- DELETE
DELETE FROM Students
WHERE StudentID = 1;

DELETE FROM Courses
WHERE CourseID = 3;

-- SELECT
SELECT * FROM Students;
SELECT * FROM Courses;

