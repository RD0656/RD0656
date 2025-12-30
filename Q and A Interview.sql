create database interview;

use interview;

-- Departments Table

create table Departments (
    DeptID int primary key,
    DeptName varchar(50),
    Location varchar(50)
);

-- Employees Table

create table Employees (
    EmpID int primary key,
    EmpName varchar(50),
    Salary decimal(10,2),
    DeptID int foreign key references Departments(DeptID)
);

-- Projects Table

create table Projects (
    ProjectID int primary key,
    ProjectName varchar(100),
    DeptID int foreign key references Departments(DeptID),
    Budget decimal(10,2)
);

-- Departments

 insert into Departments
 VALUES
(1, 'IT', 'Pune'),
(2, 'HR', 'Mumbai'),
(3, 'Finance', 'Delhi'),
(4, 'Operations', 'Bangalore');

-- Employees

INSERT INTO Employees 
VALUES
(101, 'Amit', 60000, 1),
(102, 'Sneha', 55000, 2),
(103, 'Rohit', 75000, 1),
(104, 'Priya', 50000, 3),
(105, 'Karan', 65000, 4);

-- Projects

INSERT INTO Projects VALUES
(201, 'ERP Upgrade', 1, 150000),
(202, 'Recruitment Workflow', 2, 60000),
(203, 'Tax Automation', 3, 100000),
(204, 'Warehouse Optimization', 4, 80000),
(205, 'Cloud Migration', 1, 130000);

select * from Departments;

select * from Employees;

select * from Projects;


--Add a new column Email to Employees table.

alter table Employees
add Email varchar(50);

-- Rename column Location to City in Departments table.

sp_rename'Departments.Location','City';

-- Drop the column Budget from Projects table.

alter table Projects
drop column Budget;

--Modify column Salary to increase precision from (10,2) to (12,2). [ What to do if we have to lower the precision ]

alter table Employees
alter column Salary decimal(12,2);

--Create a new table Attendance with EmpID, Date, Status.

create table Attendance(
EmpID int,
Date date,
Status varchar(50)
);

select * from Attendance;

--Increase salary of IT department employees by 10%.
use interview;

select * from Employees;

select * from Departments;

update Employees
set Salary = Salary+(Salary*0.1)
where DeptID= (
select DeptID
from Departments
where DeptName= 'IT' );

update e
set e.Salary = e.Salary-(e.Salary*0.1)
from Employees e
join Departments d
on e.DeptID= d.DeptID
where d.DeptName='IT';

--Delete employees working in HR department.

delete e
from Employees e
join Departments d
on e.DeptID= d.DeptID
where d.DeptName= 'HR';

select * from Employees;

--Update project budget by adding 20,000 for Finance department projects.

select * from Departments;

select * from Employees;

select * from Projects;

drop table Projects;

update p
set p.Budget= p.Budget + 20000
from Projects p
join Departments d
on p.DeptID= d.DeptID
where d.DeptName='Finance';

--Select employees whose salary is above 60,000.
  
select * from Employees;

select EmpName 
from Employees
where Salary>60000;

--Insert a new project in IT department named "AI Automation".














































