use project1;

create table Schools_1(std_id int primary key, std_name varchar(50) not null, phone_no varchar(12));

insert into Schools_1(std_id,std_name,phone_no)
values(1,'Akash','9856854585'),(2,'Rohan',null),(3,'Rahul','9856325625'),(4,'Shubham','9523525452'),(5,'Shubham','9854758565'),(6,'Akash','9865325654');


drop table Schools_1;


select * from Schools_1;

select distinct (std_name,phone_no)
from Schools_1;

/* Above query will show unique phone_no once, ignoring Duplicates(It just ignores, doesn't remove Duplilcates) */

/* How to find Duplicates*/

select  phone_no, count(*) as Duplicate_count
from Schools
group by phone_no
having count(*)>1;

/* This is how you remove duplicates */

with Schools_1_bkp as(
select *,
	row_number() over( partition by std_name order by std_id) as rn
	from Schools_1
)
delete from Schools_1_bkp where rn>1;



/* If you want to work on Data Structure 
   means adding constraints, changing column name , changing datatype
   you have to use DDL(create, alter, drop, truncate) commands */

/* And if you want to work on Data in that data structure then you
have to use DML(insert, update, delete) commands*/


with Schools_1_bkp1 as(
select *,
		row_number() over(partition by std_name order by std_id ) as rn_1
		from Schools_1
		)
		delete from Schools_1_bkp1 where rn_1>1;




create procedures NUll_phone_no
as
begin 
(

)























