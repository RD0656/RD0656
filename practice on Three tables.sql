create table employee101(
	emp_id int primary key,
	emp_name varchar(100),
	email varchar(50),
	phone_no varchar(15),
	Hire_date date
	);



create table department101(
	dept_id int primary key,
	dept_name varchar(50),
	emp_id int foreign key references employee101(emp_id)
	);
	
create table project101(
	project_id int,
	dept_name varchar(50),
	dept_id int foreign key references department101(dept_id),
	project_name varchar(100),
	project_status varchar(20)
	);

INSERT INTO employee101 (emp_id, emp_name, email, phone_no, hire_date) VALUES
(1, 'Amit Sharma', 'amit.sharma@gmail.com', '9876543210',  '2018-04-10'),
(2, 'Neha Singh', 'neha.singh@yahoo.com', '9988776655',  '2019-06-15'),
(3, 'Rohan Patil', 'rohan.patil@company.com', '9090909090',  '2020-01-12'),
(4, 'Priya Desai', 'priya.desai@gmail.com', '9123456780',  '2021-11-20'),
(5, 'Karan Verma', NULL, '9876501234', '2017-09-05'),
(6, 'Sneha Kulkarni', 'sneha.k@company.com', NULL,  '2022-03-18'),
(7, 'Vikas Mane', 'vikas.m@gmail.com', '9898989898', '2016-12-01'),
(8, 'Rahul Joshi', 'rahul.j@company.com', '9000001111',  '2020-08-09'),
(9, 'Divya Shetty', 'divya.shetty@gmail.com', NULL,  '2023-01-25'),
(10, 'Sanjay More', 'sanjay.more@yahoo.com', '9666554433', '2015-02-14');

INSERT INTO department101 (dept_id, dept_name, emp_id) VALUES
(101, 'HR', 1),
(102, 'Finance', 2),
(103, 'IT', 3),
(104, 'Operations', 4),
(105, 'Maintenance', 5),
(106, 'Development', 6),
(107, 'Quality Assurance', 7),
(108, 'Procurement', 8),
(109, 'Transport', 9),
(110, 'Planning', 10);

INSERT INTO project101 (project_id, dept_name, dept_id, project_name, project_status) VALUES
(1001, 'IT', 103, 'Network Upgrade', 'ONGOING'),
(1002, 'Finance', 102, 'Annual Audit', 'COMPLETED'),
(1003, 'Operations', 104, 'Warehouse Optimization', 'ON HOLD'),
(1004, 'Maintenance', 105, 'Building Repairs', 'ONGOING'),
(1005, 'Development', 106, 'New Product Design', 'ONGOING'),
(1006, 'HR', 101, 'Employee Onboarding System', 'COMPLETED'),
(1007, 'Transport', 109, 'Fleet Management System', 'ONGOING'),
(1008, 'Planning', 110, 'Budget Forecasting', 'NOT STARTED'),
(1009, 'Quality Assurance', 107, 'Process Inspection Automation', 'ONGOING'),
(1010, 'Procurement', 108, 'Vendor Evaluation', 'COMPLETED');




-- Fetch all employees hired after 01-JAN-2020.

select emp_name
from employee101
where Hire_date> '01-JAN-2020';

--Get employees whose name starts with 'A'

select emp_name
from employee101
where emp_name like 'A%';

--List departments where the dept_name contains 'IT'.

select dept_id, dept_name
from department101
where dept_name like '%IT%';

-- Show all active projects where project_status = 'ONGOING'

select Project_id,project_name
from project101
where project_status = 'ongoing'

--Retrieve employees whose phone number is NULL.

select emp_id, emp_name
from employee101
where phone_no is null;


select  * from department101;
select  * from project101;


--Fetch all projects belonging to department ID 110.

select p.project_name, d.dept_name
from project101 p
inner join department101 d
on p.dept_id= d.dept_id
where d.dept_id = 110;

--Get employees whose email ends with 'gmail.com'

select emp_name
from employee101
where email like '%gmail.com';

select * from employee101;

--Find projects whose name contains the word 'Road'

select project_id, project_name
from project101
where project_name like '%road%';

select * from project101 ;
select * from department101;

--Count employees working in each department.

select dept_name, count(*)as no_of_employee_in_each_dept
from department101
group by dept_name;

--Count number of projects under each department.

select d.dept_name, count(*) as no_of_projects
from department101 d
left join project101 p
on d.dept_id=p.dept_id
group by d.dept_name;

SELECT 
    dept_id,
    dept_name,
    COUNT(project_id) AS total_projects
FROM project101
GROUP BY dept_id, dept_name
ORDER BY dept_id;

--Find how many employees were hired per year.

select year(Hire_date) as Hire_year, count(*) as no_of_employees
from employee101
group by year(Hire_date);

--Show number of employees for each starting letter of emp_name

select substring(emp_name,1,1)as first_letter, count(*) as no_of_employee
from employee101
group by substring(emp_name,1,1);

--Get dept-wise count of ONGOING vs COMPLETED projects.

select dept_name, project_status, count(*) as total_count
from project101
where project_status <> 'NOT STARTED' and project_status<> 'ON HOLD'
group by dept_name,project_status;

--List employees ordered by hire_date (newest first)

SELECT emp_name, Hire_date
from employee101
order by Hire_date;

--Show departments ordered alphabetically.

select dept_name
from department101
order by dept_name;

--Display projects ordered by project_status, then project_name.

select project_name,project_status
from project101
order by project_status, project_name;

-- Order employees by name length

select emp_name,len(emp_name)as name_length
from employee101
order by name_length;

--Order projects by department name and project status.

select p.project_name
from project101 p
left join department101 d
on d.dept_id= p.dept_id
order by d.dept_name, p.project_status;

--Display employee name with their department name.

select e.emp_name, d.dept_name
from employee101 e
inner join department101 d
on e.emp_id = d.emp_id;

--Show all employees even if no department is assigned

select e.emp_name, d.dept_name
from employee101 e
left join department101 d
on e.emp_id= d.emp_id;

--Show all departments even if no employee exists

select e.emp_name, d.dept_name
from employee101 e
right join department101 d
on e.emp_id= d.emp_id;

--Display department & project names using JOIN.

select d.dept_name,p.project_name
from department101 d
inner join project101 p
on d.dept_id= p.dept_id;

--Show employee → department → project hierarchy in a single query

select e.emp_name,d.dept_name, p.project_name
from employee101 e
join department101 d
on e.emp_id=d.emp_id
join project101 p
on d.dept_id = p.dept_id;

--Get employees who do not have any project assigned.

select e.emp_name
from employee101 e
inner join department101 d
on e.emp_id= d.emp_id
inner join project101 p
on d.dept_id= p.dept_id
where p.project_id is null; --- no data means every employee has project assigned

--List departments with total number of projects

select d.dept_name, count(p.project_id) as total_no_of_projects
from department101 d
inner join project101 p
on d.dept_id= p.dept_id
group by d.dept_name;

--Replace NULL phone numbers with 'Not Provided'

update employee101
set phone_no= 'Not Provided'
where phone_no is null;

--Count employees whose email is NULL

select emp_name,count(emp_id) as no_of_emp
from employee101
where email is null
group by emp_name;

--Display projects where department name is NULL

select *
from project101
where dept_name is null;

--Use NVL / COALESCE to replace missing dept_name.

select coalesce(dept_name,'No Department') as dept_name, project_name
from project101;

--Show employees whose hire_date is NULL.

select emp_name
from employee101
where Hire_date is null;

--Display employee name in uppercase.

select upper(emp_name) as emp_name
from employee101;

--Extract year from employee hire_date.

select emp_name, year(Hire_date) as Hired_year
from employee101;

--Show email username (before @ symbol).

select substring(email,1,charindex('@',email)-1) as email_username
from employee101
where email is not null;

--Calculate employee tenure in years (SYSDATE - HIRE_DATE).

select emp_name, datediff(Year, Hire_date,getdate()) as tenure_years
from employee101;

--Find length of project_name.

select project_name,len(project_name) as Project_name_Length
from project101;

--Concatenate project_id and project_name.

select concat(project_id,' ',project_name) as project_info
from project101;

--Count total employees.

select count(emp_id) as Total_employee
from employee101;

--Get minimum and maximum hire dates.

select min(Hire_date)as earliest_hire, max(Hire_date) as Latest_hire
from employee101;

--Return first 3 letters of department name.

select dept_name, substring(dept_name,1,3)
from department101;

--Show employees with row number ordered by hire_date.

select emp_name,
	row_number() over( order by Hire_date) as Row_number
from employee101;

--Rank employees by hire_date within each department.

select e.emp_name,d.dept_name,
	rank() over(partition by d.dept_name order by e.Hire_date) as Hire_rank
from employee101 e
inner join department101 d
on e.emp_id= d.emp_id;

--Show running total of number of employees hired (ordered by hire_date).

select emp_name, Hire_date,
	 count(*) over(order by Hire_date rows between unbounded preceding and current row) as Running_total
	from employee101;

--Display each department’s total project count using SUM OVER().

select dept_name,project_name,
	count(project_id) over(partition  by dept_name) as total_projects_per_department
from project101;
	
--Show DENSE_RANK of projects by project_status.

select project_name,project_status,
	dense_rank() over(order by project_status) as DR_by_project_status
from project101;

--Fetch latest hired employee in each department (using partition).

with cte as(
	select e.emp_name,d.dept_name,e.Hire_date,
		row_number() over(partition by d.dept_name order by e.Hire_date desc) as hd
	from employee101 e
	inner join department101 d
	on e.emp_id= d.emp_id
	)
	select emp_name,dept_name,Hire_date
	from cte 
	where hd=1;

--Show percentage of projects per department.

select distinct dept_name,
		count(*) over(partition by dept_name) as dept_project_count,
		100* count(*) over(partition by dept_name)/ count(*) over() as percentage_of_project
	from project101;

--Get cumulative project count by department ID.

select dept_name,project_name,
	count(*) over(order by dept_id rows between unbounded preceding and current row) as cumulative_total
from project101;

--Show employees who belong to a department that has more than 2 projects.

select e.emp_name
from employee101 e
where e.emp_id in(
		select d.emp_id
		from department101 d
		inner join project101 p
		on d.dept_id= p.dept_id
		group by d.emp_id
		having count(*)>2
		);

--Fetch employees whose hire_date is greater than the average hire_date.

select emp_name, Hire_date
from employee101
where Hire_date > (
	select  dateadd(day, avg(datediff(day,'1900-01-01',Hire_date)),'1900-01-01') as avg_Hire_date
	from employee101
);

--List departments that have no projects.

select d.dept_id,d.dept_name
from department101 d
where not exists(
		select 1
		from project101 p
		where d.dept_id = p.dept_id
);

--Retrieve projects whose department has more employees than average.

select p.project_name
from project101 p
join department101 d
on d.dept_id= p.dept_id
where d.emp_id in 
			(select emp_id
			from employee101
			group by emp_id
			having count(*)>
							(select avg(cn)
							from 
								(select count(*)as cn
								from employee101
								group by emp_id) x));

--Show the employee(s) with the earliest hire_date.

select emp_name,Hire_date
from employee101
where Hire_date = (select min(Hire_date) from employee101);

--Create a procedure to insert an employee record.

alter procedure sp_new_employees
	@emp_id int,
	@emp_name varchar(100),
	@email varchar(50),
	@phone_no varchar(20),
	@Hire_date varchar(10)

as 
begin
		set nocount on;
		begin transaction;
		if exists(select 1 from employee101 where emp_id=@emp_id  )
		begin 
			rollback transaction;
			raiserror('Employee id already exists',16,1);
			return;
		end;

	insert into employee101(emp_id,emp_name,email,phone_no,Hire_date)
	values(@emp_id,@emp_name,@email,@phone_no,@Hire_date);

	commit transaction;
end;


exec sp_new_employees
	@emp_id=11,
	@emp_name='Ram Sharma',
	@email= 'ram@gmail.com',
	@phone_no='8956856956',
	@Hire_date='20-06-2020'

select * 
from employee101
order by emp_id
offset 0 rows fetch next 15 rows only;

--Procedure to get all projects for a department.

create procedure sp_All_projects
	@dept_id int
as
begin
		set nocount on;
		select project_id,project_name,project_status
		from project101
		where dept_id=@dept_id
end;

--Procedure to update project status to COMPLETED.

create procedure sp_update_status
	@project_id int

as
begin
		set nocount on;
		update project101
		set project_status= 'completed'
		where project_id=@project_id
end;

--Procedure to delete an employee by emp_id.

create procedure sp_delete_employee
	@emp_id int
as
begin
	set nocount on;
	delete from employee101
	where emp_id=@emp_id;
end;

exec sp_delete_employee
@emp_id=11

--Procedure to return department name for a given emp_id.

alter procedure sp_dept
	@emp_id int
as
begin
		set nocount on;
		select d.*
		from department101 d
		left join employee101 e
		on e.emp_id=d.emp_id
		where e.emp_id= @emp_id;
end;

exec sp_dept
@emp_id=5

--Bulk insert multiple employees using a stored procedure.

create type dbo.bulkemployeetype as table
(
emp_id int,
emp_name varchar(100),
email varchar(50),
phone_no varchar(20),
Hire_date varchar(50)
);

create procedure sp_bulk_insert
	@employeelist dbo.bulkemployeetype readonly
as 
begin
	set nocount on;
	begin try
		begin transaction;

		insert into employee101(emp_id,emp_name,email,phone_no,Hire_date)
		select emp_id,emp_name,email,phone_no,Hire_date
		from @employeelist

		commit transaction;
		end try 
		begin catch
			rollback transaction;
			throw;
		end catch;
end;

DECLARE @emp_data dbo.bulkemployeetype;

INSERT INTO @emp_data VALUES
(11, 'Anil Mehta', 'anil@gmail.com', '9991112222', '2021-01-10'),
(12, 'Pooja Nair', 'pooja@gmail.com', '8882223333', '2022-03-15'),
(13, 'Rakesh Iyer', 'rakesh@gmail.com', NULL, '2020-07-25');

EXEC sp_bulk_insert @emp_data;

--Procedure to return employee count per department.

create procedure sp_employee_count
	@dept_id int
as
begin
	set nocount on;
	select d.dept_name,count(e.emp_id) as Total_employee
	from department101 d
	inner join employee101 e
	on d.emp_id=e.emp_id
	where d.dept_id=@dept_id
	group by d.dept_name;
end;

select * from department101;

exec sp_employee_count
 @dept_id=103


--Add a new column salary to employee101.

alter table employee101
add Salary decimal(10,2);

--Modify email column to varchar2(100).

alter table employee101
alter column email varchar(100);

--Drop the phone_no column.

alter table employee101
drop column phone_no ;

--Add NOT NULL constraint on hire_date.

alter table employee101
alter column Hire_date varchar(20) not null;


--Create an index on emp_name.

create index ix_emp_name 
on employee101(emp_name);

--Create a unique constraint on project_name.

alter table project101
add  constraint uq_project_name unique(project_name);

