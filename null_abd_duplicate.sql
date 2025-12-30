CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100),
    Location VARCHAR(100)
);

INSERT INTO Department (DeptID, DeptName, Location) VALUES
(1, 'HR', 'Pune'),
(2, 'IT', 'Mumbai'),
(3, 'Finance', 'Bangalore'),
(4, 'Operations', 'Chennai'),
(5, 'Admin', 'Hyderabad');

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Email VARCHAR(100),
    Salary DECIMAL(12,2),
    DeptID INT,
    HireDate DATE,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);


INSERT INTO Employee (EmpID, EmpName, Email, Salary, DeptID, HireDate) 
VALUES
(101, 'Amit Sharma', 'amit.sharma@example.com', 55000, 2, '2021-06-12'),
(102, 'Neha Patil', 'neha.patil@example.com', 48000, 1, '2022-01-05'),
(103, 'Rohan Desai', 'rohan.desai@example.com', 72000, 2, '2020-10-20'),
(104, 'Priya Nair', 'priya.nair@example.com', 65000, 3, '2023-02-15'),
(105, 'Sahil Khan', 'sahil.khan@example.com', 58000, 4, '2021-11-30'),
(106, 'Kavita Joshi', 'kavita.joshi@example.com', 47000, 1, '2023-05-01');

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(150),
    DeptID INT,
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(50),   -- Active, Completed, On-Hold
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

INSERT INTO Projects (ProjectID, ProjectName, DeptID, StartDate, EndDate, Status) VALUES
(201, 'Employee Onboarding System', 1, '2022-03-01', '2022-12-31', 'Completed'),
(202, 'Cloud Migration', 2, '2023-01-15', NULL, 'Active'),
(203, 'Payroll Automation', 3, '2021-07-10', '2022-05-20', 'Completed'),
(204, 'Logistics Optimization', 4, '2023-04-01', NULL, 'Active'),
(205, 'Office Renovation', 5, '2022-06-01', '2022-10-15', 'Completed'),
(206, 'AI Chatbot Integration', 2, '2024-02-10', NULL, 'On-Hold');


select * from Department;

select * from Employee;

select * from Projects;

update Department
set DeptName = upper(DeptName);
























