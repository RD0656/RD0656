use interview;

select * from Employees;

sp_depends Employees;--to find names of stored procedures(No matter how many there are) on perticular table.

sp_helptext spGetEmployeeByNameandDeptID;

sp_help Employees;

select * from sys.procedures;
select * from Departments;

select * from Projects;

select top 5 * from Employees;

begin transaction;
begin try
	update Employees set Salary = Salary + 2850 where EmpID= 103;
	update Employees set Salary= Salary+2500 where EmpID =104;
	commit transaction;
end try
begin catch
	rollback transaction;
end catch;

use interview;


alter procedure spGetEmployeeByNameandDeptID
@EmpName varchar(100),
@DeptID int
as
begin
	select EmpName,DeptID,Salary
	from Employees
	where EmpName=@EmpName and DeptID = @DeptID;
end;

exec spGetEmployeeByNameandDeptID 'Amit',1;

/* If i want to pass a stored procedure result to another procedure
   Then I have to store the result into temp table */

   insert into #Emp exec spGetEmployeesByNameandDeptID;

  
  
  
  --Stored Procedure to search Employees

alter procedure spSearchEmployees

    @EmpName varchar(50)= NULL,      -- Parameters without Default values must be written like = null [not like null]
    @DeptID INT = NULL,
    @MinSalary decimal(10,2) = NULL,
    @MaxSalary decimal(10,2) = NULL

AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Employees
    WHERE (@EmpName IS NULL OR EmpName LIKE '%' + @EmpName + '%')
      AND (@DeptID IS NULL OR DeptID = @DeptID)
      AND (@MinSalary IS NULL OR Salary >= @MinSalary)
      AND (@MaxSalary IS NULL OR Salary <= @MaxSalary);
END;


exec spSearchEmployees @DeptID = 1;
exec spSearchEmployees @EmpName = 'a';
exec spSearchEmployees @MinSalary = 40000, @MaxSalary = 60000;







































