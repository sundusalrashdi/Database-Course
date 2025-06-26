create database Coursera

use Coursera


CREATE TABLE Instructors ( 
    InstructorID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
); 
CREATE TABLE Categories ( 
    CategoryID INT PRIMARY KEY, 
    CategoryName VARCHAR(50) 
); 
CREATE TABLE Courses ( 
    CourseID INT PRIMARY KEY, 
    Title VARCHAR(100), 
    InstructorID INT, 
    CategoryID INT, 
    Price DECIMAL(6,2), 
    PublishDate DATE, 
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID), 
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) 
); 
CREATE TABLE Students ( 
    StudentID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
); 
CREATE TABLE Enrollments ( 
    EnrollmentID INT PRIMARY KEY, 
    StudentID INT, 
    CourseID INT, 
    EnrollDate DATE, 
    CompletionPercent INT, 
    Rating INT CHECK (Rating BETWEEN 1 AND 5), 
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 

-- insert 

INSERT INTO Instructors VALUES 
(1, 'Sarah Ahmed', 'sarah@learnhub.com', '2023-01-10'), 
(2, 'Mohammed Al-Busaidi', 'mo@learnhub.com', '2023-05-21'); 

select * from Instructors

-- Categories 
INSERT INTO Categories VALUES 
(1, 'Web Development'), 
(2, 'Data Science'), 
(3, 'Business'); 
select * from Categories

-- Courses 
INSERT INTO Courses VALUES 
(101, 'HTML & CSS Basics', 1, 1, 29.99, '2023-02-01'), 
(102, 'Python for Data Analysis', 2, 2, 49.99, '2023-03-15'), 
(103, 'Excel for Business', 2, 3, 19.99, '2023-04-10'), 
(104, 'JavaScript Advanced', 1, 1, 39.99, '2023-05-01'); 
select * from Courses

-- Students 
INSERT INTO Students VALUES 
(201, 'Ali Salim', 'ali@student.com', '2023-04-01'), 
(202, 'Layla Nasser', 'layla@student.com', '2023-04-05'), 
(203, 'Ahmed Said', 'ahmed@student.com', '2023-04-10'); 
select * from Students 

-- Enrollments 
INSERT INTO Enrollments VALUES 
(1, 201, 101, '2023-04-10', 100, 5), 
(2, 202, 102, '2023-04-15', 80, 4), 
(3, 203, 101, '2023-04-20', 90, 4), 
(4, 201, 102, '2023-04-22', 50, 3), 
(5, 202, 103, '2023-04-25', 70, 4), 
(6, 203, 104, '2023-04-28', 30, 2), 
(7, 201, 104, '2023-05-01', 60, 3); 
select * from Enrollments  

--Different Uses of Aggregation
--1. What is the difference between GROUP BY and ORDER BY? 
--GROUP BY groups rows that have the same values in specified columns for aggregation and is used before aggregate functions like COUNT(), AVG(). 
--ORDER BY sorts the result set by one or more columns and is used after all processing to arrange final output.

--2. Why do we use HAVING instead of WHERE when filtering aggregate results? 
--because WHERE filters rows before aggregation, while HAVING filters after aggregation, based on aggregate values.

--3. What are common beginner mistakes when writing aggregation queries? 
--Selecting columns not included in GROUP BY or in aggregate functions, or Using WHERE instead of HAVING for filtering aggregate values

--4. When would you use COUNT(DISTINCT ...), AVG(...), and SUM(...) together? 
--when we need to count unique items, total and calculate the average value.

--5. How does GROUP BY affect query performance, and how can indexes help? 
--using grouping and sorting like GROUP BY can slow down queries on large datasets, so the Indexes on the GROUP BY columns can
--Speed up grouping operations






-- Practice Tasks

--1. Count total number of students. 
select count (*)
from Students

--2. Count total number of enrollments. 
select count (*) 
from Enrollments

--3. Find average rating of each course. 
select CourseID, Avg (Rating) as AverageRating  
From  Enrollments
GROUP BY CourseID;

--4. Total number of courses per instructor. 
select InstructorID, count (*) as TotalCourses 
from courses
GROUP BY InstructorID;

--5. Number of courses in each category. 
select CategoryID,count (*) as TotalCourses
from courses
GROUP BY CategoryID;

--6. Number of students enrolled in each course. 
select CourseID, count(StudentID) as Totalstudent
from Enrollments
GROUP BY CourseID 


--7. Average course price per category. 
select CategoryID, Avg(Price) as Avgprice
from Courses
GROUP BY CategoryID

--8. Maximum course price. 
select max (Price)
from Courses

--9. Min, Max, and Avg rating per course. 
select CourseID, Min(Rating) as MinRating, 
				 Max(Rating) as MaxRating,
				 Avg (Rating) as AverageRating 
From  Enrollments
GROUP BY CourseID; 


--10. Count how many students gave rating = 5. 
select count(*) as TotalRating5
from Enrollments
WHERE Rating = 5;

