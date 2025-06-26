create database companyDB 

use companyDB

create table Employee ( 
		SSN INT PRIMARY KEY, 
		Fname VARCHAR(100) not null,
		Lname VARCHAR(100)not null, 
		gender bit default 0, 
		BirthDate Date not null, 
		Super_id INT,
		Dnum INT, --fk
		FOREIGN KEY (Super_id) REFERENCES Employee(SSN)
		
);

create table Department ( 
		Dnum INT PRIMARY KEY, 
		Dname VARCHAR(100)not null, 
		Manager_SSN INT, 
		Hiring_Date DATE not null,

		FOREIGN KEY (Manager_SSN) REFERENCES Employee(SSN)
);

alter table Employee
add FOREIGN KEY (Dnum) REFERENCES Department(Dnum)

alter table Employee
alter column Super_id INT null

create table Loc ( 
		location VARCHAR(100) not null, 
		Dnum INT, --FK
		PRIMARY KEY (Dnum, Location),
);
alter table loc 
add FOREIGN KEY (Dnum) REFERENCES Department(Dnum)

create table project ( 
		Pnum INT PRIMARY KEY, 
		Pname VARCHAR (1000) not null, 
		proj_location VARCHAR(1000) not null,
		City VARCHAR (1000) not null, 
		proj_Dnum INT, 

		FOREIGN KEY (proj_Dnum) REFERENCES Department(Dnum)
);

create table work ( 
		work_SSN INT , 
		work_Pnum INT, 
		Working_Hours DECIMAL(5,2),
		PRIMARY KEY (Work_SSN, Work_Pnum),

		FOREIGN KEY (work_SSN) REFERENCES Employee(SSN),
        FOREIGN KEY (work_Pnum) REFERENCES Project(Pnum)
); 

create table Depndent( 
		Dname VARCHAR(100) PRIMARY KEY not null, 
		Depn_BirthDate Date not null, 
		Depn_gender bit default 0, 
		Depen_SSN INT , -- FK to Employee

		FOREIGN KEY (Depen_SSN) REFERENCES Employee(SSN)
);

--insert 
INSERT INTO Employee (SSN, Fname, Lname, gender, BirthDate)
VALUES (101, 'Ahmed', 'Yahya', '0', '1980-08-11'),
	   (102, 'Malak', 'Ahmed', '1', '1999-09-16');
select * from Employee

INSERT INTO Department (Dnum, Dname, Hiring_Date, Manager_SSN)
VALUES (1, 'IT', '2021-03-1', 101),
       (2, 'CS', '2022-05-23', 102);
select * from Department

UPDATE Employee 
SET Dnum = 1 WHERE SSN = 101;

UPDATE Employee
SET Dnum = 2 WHERE SSN = 102;
UPDATE Employee
SET Super_id = 101 WHERE SSN = 102;
UPDATE Employee
SET Super_id = 102 WHERE SSN = 101;

-- new table with super_id and Dnum
INSERT INTO Employee (SSN, Fname, Lname, gender, BirthDate, Super_id, Dnum)
VALUES (101, 'Ahmed', 'Yahya', '0', '1980-08-11', 1001, 1),
	   (102, 'Malak', 'Ahmed', '1', '1999-09-16', 1002, 2);
select * from Employee


INSERT INTO Loc (location, Dnum)
VALUES ('Muscat', 1),
       ('Salalah', 2);
select * from Loc

INSERT INTO project (Pnum, Pname, proj_location, City, proj_Dnum)
VALUES (10, 'Website Upgrade', 'Muscat', 'Bowsher', 1),
       (20, 'Employee Training', 'Salalah', 'Awqad', 2)
select * from project

INSERT INTO work (work_SSN, work_Pnum, Working_Hours)
VALUES (101, 10, 35.5),
       (102, 20, 40.0);
select * from work

INSERT INTO Depndent (Dname, Depn_BirthDate, Depn_gender, Depen_SSN)
VALUES ('Omar', '2017-06-20', 0, 101),
       ('Aisha', '2007-09-22', 1, 102);
select * from Depndent


DELETE FROM work
where work_SSN = 102;  

select * from work 
