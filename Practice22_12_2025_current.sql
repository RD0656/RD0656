use pwd;


create table bank_customers(
customer_id int primary key,
customer_name varchar(100),
cust_email varchar(50)
);

insert into bank_customers(customer_id,customer_name,cust_email)
values(1,'Ram Sharma','ram@gmail.com'),
	  (2,'Shyam Varma','shyam@gmail.com'),
	  (3,'Rohan Kale','rohan@gmail.com');

create table bank_transactions(
tran_id int ,
customer_id int ,
tran_date date,
tran_status varchar(20)
);

insert into bank_transactions(tran_id,customer_id,tran_date,tran_status)
values(101,1,'20-06-2022','success'),
	  (102,2,'24-06-2022','pending'),
	  (103,3,'25-06-2022','success');

alter table bank_transactions
alter column tran_date varchar(20);

select b.customer_name,bt.tran_date,bt.tran_status
from bank_customers b
left join bank_transactions bt
on b.customer_id=bt.customer_id
where bt.tran_status= 'success';

select * from bank_customers;

create procedure sp_insertupdatedelete_in_bankcustomers
	@customer_id int,
	@customer_name varchar,
	@cust_email varchar,
	@operation varchar(1)
	
as
begin
	set nocount on;
	begin try
	begin transaction;
	if(@operation='I')
	begin
	if (select 1 from bank_customers where customer_id=@customer_id)
	begin 
	raiserror('Customer already Exists: Insert not allowed',16,1);
	end

	insert into bank_customers(customer_id,customer_name,cust_email)
	values(@customer_id,@customer_name,@cust_email);

	end

	else if (@operation='U')
	begin
	if not exists (select 1 from bank_customer where customer_id=@customer_id)
	begin
	raiserror('customer does not exists. update not possible',16,1)
	end
	update bank_customers 
	set customer_name=@customer_name,
		cust_email= @cust_email
	where customer_id=@customer_id;

	end

	else if(@operation = 'D')
	begin
	if not exists(select 1 from bank_customers where customer_id=@customer_id)
	begin 
	raiserror('Customer does not exists. Delete is not possible',16,1)
	end
	delete from bank_customers
	where customer_id=@customer_id
	end

	else 
	begin 
	raiserror ('Invalid Operation. I,U,D')
	end
	commit transaction;
	end try

	begin catch
	 if @@trancount>0
	  rollback transaction;
	end catch;
end;
	























