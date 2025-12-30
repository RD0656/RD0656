use project1;

create table Schools(std_id int primary key, std_name varchar(50), phone_no varchar(12));

insert into Schools(std_id, std_name,phone_no)
values (1,'Rahul','9856856525'),(2,'Rohan','9523525485'),(3,'Akash',null),(4,'SHubham','9854585652'),(5,'Rohit','9856254585'),(6,'Aditya',null);

select * from Schools;
						
drop table Schools;	


update Schools
set phone_no='9856525475'
where std_id = 3;

select * from Schools;


delete from Schools
where phone_no is null;

-- deleting while using stored procedures

create procedure Remove_null_phone_no
as 
begin 
	delete from Schools
	where phone_no is null;

	print'Rows with null phone_no is removed'
end;

exec Remove_null_phone_no;

select name from sys.procedures; -- To find all the stored procedures in system

sp_helptext Remove_null_phone_no;   -- Show the text of stored procedures








