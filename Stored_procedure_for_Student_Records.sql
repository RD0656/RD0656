use [studentapractive]

select top 1 * from student_records;

alter procedure sp_update_delete_insert_std_records
		@p_student_id int,
		@p_first_name varchar(100),
		@p_last_name varchar(100),
		@p_marathi int,
		@p_hindi int,
		@p_english int,
		@p_math int,
		@delete int

as
begin
	set nocount on;
declare @p_total_marks int;
declare @p_percentage decimal(10,2);
declare @p_Grade varchar (5);

set @p_total_marks= @p_marathi +@p_hindi +@p_english +@p_math;
set @p_percentage =  (@p_total_marks*100)/400;
set @p_Grade = case when @p_percentage>=80 then 'A'
				when @p_percentage between 80 and 60 then 'B'
				when @p_percentage <=60 then 'C'
				else 'D' end;

/* with cte_dups as(
	select student_id,
	row_number() over(partition by first_name,last_name order by student_id) as du
	from student_records
	)
	delete from cte_dups where du>1;*/  -- BAD PRACTICE --- This will run every time the procedure is called → very risky.
											--		Better approach:
											--		Create separate cleanup procedure, or run it once daily.

if exists (select 1 from student_records where first_name=@p_first_name and last_name=@p_last_name and @delete= 0)
begin
	update student_records
	set first_name = @p_first_name,
	    last_name = @p_last_name,
		marathi = @p_marathi,
		hindi= @p_hindi,
		math = @p_math,
		english= @p_english,
		total_marks= @p_total_marks,
		percentage = @p_percentage,
		grade = @p_grade
	where first_name=@p_first_name and last_name= @p_last_name;

print @p_first_name + (' Records updated successfully');
end
else if (@delete = 1)
begin 
	delete from student_records where student_id= @p_student_id;
end
else 
begin
	insert into student_records(first_name,last_name,marathi,hindi,english,math,total_marks,percentage,grade)
	values(@p_first_name,@p_last_name,@p_marathi,@p_hindi,@p_english,@p_math,@p_total_marks,@p_percentage,@p_grade);
print @p_first_name +('Records inserted successfully');
end;
select * from student_records;
end;

exec sp_update_delete_insert_std_records
		@p_first_name = 'Ram',
		@p_last_name = 'sharma', 
		@p_marathi = 80,
		@p_hindi = 90,
		@p_english =90,
		@p_math =60,
		@p_student_id=1
		@p_delete = 


select * from student_records;

delete from student_records where student_id= 4;
select first_name,last_name,count(*)
from student_records
group by first_name, last_name
having count(*)>1;



with cte as (
	select student_id,
	row_number() over(partition by first_name,last_name order by student_id) as du
	from student_records
	)
	delete from cte where du>1;

	select * from student_records;
	
	----- finding sp in oracle
	/*select distict name as procedure_name
	from all_source
	where owner = 'student_practice'
	and type= 'procedure'
	and lower(text) like '%student_records%';*/

EXEC sp_update_delete_insert_std_records
    @p_first_name = 'Ram',
    @p_last_name  = 'Sharma',
    @p_marathi    = 78,
    @p_hindi      = 82,
    @p_english    = 75,
    @p_math       = 91,
	@p_student_id = null,
	@delete = 0

















