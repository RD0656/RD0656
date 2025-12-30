use [studentapractive];


create table employees(
emp_id int,
basic_salary decimal(10,2) ,
tax_percent decimal(4,2),
net_salary int
);

insert into employees (emp_id,basic_salary,tax_percent)
values
      (3,80000,5);

alter table employees
drop column Leaves;

alter PROCEDURE sp_process_salary
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @emp_id INT,
        @basic_salary DECIMAL(10,2),
        @tax_percent  DECIMAL(5,2),
        @net_salary   DECIMAL(10,2),
        @incentive decimal(10,2),
        @Leaves int;

    DECLARE salary_cursor CURSOR FOR
    SELECT emp_id, basic_salary, tax_percent, Leaves
    FROM employees;

    OPEN salary_cursor;

    FETCH NEXT FROM salary_cursor
    INTO @emp_id, @basic_salary, @tax_percent,@Leaves;
    WHILE @@FETCH_STATUS = 0
    begin
   
        set @incentive= case when @Leaves<=4 then 1000
                              else 0 end; 
        SET @net_salary = (@basic_salary + @incentive) - ((@basic_salary + @incentive) * @tax_percent / 100);
                      

        UPDATE employees
        SET net_salary = @net_salary,
            incentive = @incentive
        WHERE emp_id = @emp_id;

        FETCH NEXT FROM salary_cursor
        INTO @emp_id, @basic_salary, @tax_percent,@Leaves;
    END;

    CLOSE salary_cursor;
    DEALLOCATE salary_cursor;

    select * from employees;
END;
GO

exec sp_process_salary;

alter  table employees
add Leaves int;

update employees
set Leaves = 3
where emp_id =1;

alter table employees
add incentive decimal(10,2);

update employees
set Leaves = 2
where emp_id =3;

with cte as (
    select emp_name,
    row_number() over(partition by emp_name order by emp_id) as du
    from employees
        )
        delete from cte where du=1;




































