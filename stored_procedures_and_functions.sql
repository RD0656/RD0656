use project_swiggy;

with cte as(
	select cast('INTERVIEW' as varchar(20)) as result, len('INTERVIEW') as n
	union all
	select left(result, n-1), n-1
	from cte
	where n>1
	)
	select result from cte;



CREATE TABLE crm_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    created_date DATE
);

INSERT INTO crm_customers VALUES
(1, 'ABC Corp', 'contact@abc.com', '9998887771', 'Pune', '2021-01-10'),
(2, 'XYZ Ltd', 'info@xyz.com', '9998887772', 'Mumbai', '2021-02-15'),
(3, 'Global Tech', NULL, '9998887773', 'Delhi', '2021-03-20'),
(4, 'ABC Corp', 'sales@abc.com', NULL, 'Pune', '2021-04-05'), -- duplicate name
(5, 'NextGen', 'hello@nextgen.com', '9998887775', NULL, '2021-05-12'),
(6, 'Innova', 'contact@innova.com', '9998887776', 'Bangalore', '2021-06-01'),
(7, 'FutureSoft', NULL, NULL, 'Hyderabad', '2021-07-18'),
(8, 'XYZ Ltd', 'support@xyz.com', '9998887772', 'Mumbai', '2021-08-21'), -- duplicate
(9, 'Alpha Systems', 'alpha@sys.com', '9998887780', 'Pune', '2021-09-11'),
(10, 'Beta Solutions', 'beta@sol.com', NULL, 'Chennai', '2021-10-09'),
(11, 'CloudNine', 'cloud@nine.com', '9998887783', NULL, '2021-11-30'),
(12, 'DataWorks', 'info@dataworks.com', '9998887784', 'Delhi', '2021-12-01'),
(13, 'SmartTech', NULL, '9998887785', 'Pune', '2022-01-05'),
(14, 'CoreLogic', 'contact@core.com', NULL, 'Mumbai', '2022-02-14'),
(15, 'VisionWare', 'vision@ware.com', '9998887787', 'Bangalore', '2022-03-19');

CREATE TABLE crm_leads (
    lead_id INT PRIMARY KEY,
    customer_id INT,
    lead_source VARCHAR(50),
    lead_status VARCHAR(30),
    assigned_to VARCHAR(50),
    lead_created_date DATE,
    FOREIGN KEY (customer_id) REFERENCES crm_customers(customer_id)
);

INSERT INTO crm_leads VALUES
(101, 1, 'Website', 'OPEN', 'Amit', '2021-01-15'),
(102, 2, 'Email Campaign', 'CLOSED', 'Neha', '2021-02-20'),
(103, 3, 'Referral', 'OPEN', NULL, '2021-03-25'),
(104, 4, 'Website', 'OPEN', 'Amit', '2021-04-10'),
(105, 5, 'Cold Call', 'LOST', 'Ravi', '2021-05-15'),
(106, 1, 'Website', 'OPEN', 'Amit', '2021-06-05'), -- duplicate customer
(107, 6, 'Email Campaign', NULL, 'Sneha', '2021-06-20'),
(108, 7, 'Referral', 'OPEN', NULL, '2021-07-25'),
(109, 8, 'Cold Call', 'CLOSED', 'Neha', '2021-08-30'),
(110, 9, 'Website', 'OPEN', 'Ravi', '2021-09-12'),
(111, 10, NULL, 'OPEN', 'Amit', '2021-10-10'),
(112, 11, 'Email Campaign', 'OPEN', NULL, '2021-11-05'),
(113, 12, 'Website', 'CLOSED', 'Sneha', '2021-12-15'),
(114, 13, 'Referral', 'LOST', 'Ravi', '2022-01-10'),
(115, 14, 'Website', NULL, 'Amit', '2022-02-20');


CREATE TABLE crm_interactions (
    interaction_id INT PRIMARY KEY,
    lead_id INT,
    interaction_type VARCHAR(50),
    interaction_date DATE,
    remarks VARCHAR(200),
    FOREIGN KEY (lead_id) REFERENCES crm_leads(lead_id)
);

INSERT INTO crm_interactions VALUES
(1001, 101, 'Call', '2021-01-16', 'Initial discussion'),
(1002, 102, 'Email', '2021-02-22', 'Proposal sent'),
(1003, 103, 'Meeting', '2021-03-28', NULL),
(1004, 104, 'Call', '2021-04-12', 'Follow-up required'),
(1005, 105, 'Email', '2021-05-18', 'No response'),
(1006, 106, 'Call', '2021-06-07', 'Pricing discussed'),
(1007, 107, 'Meeting', '2021-06-25', NULL),
(1008, 108, 'Call', '2021-07-27', 'Interested'),
(1009, 109, 'Email', '2021-09-01', 'Deal closed'),
(1010, 110, 'Call', '2021-09-15', NULL),
(1011, 111, 'Email', '2021-10-12', 'Awaiting response'),
(1012, 112, 'Meeting', '2021-11-10', 'Demo given'),
(1013, 113, 'Call', '2021-12-20', 'Contract signed'),
(1014, 114, 'Email', '2022-01-15', NULL),
(1015, 115, 'Call', '2022-02-25', 'No interest');

select * from crm_customers;

select * from crm_leads;

select * from crm_interactions;

--Create a procedure to fetch all customers from crm_customers.

create procedure sp_get_all_customers
as
begin
    set nocount on;
    select customer_name
    from crm_customers;
end;

exec sp_get_all_customers;

--Create a procedure to get all leads for a given customer_id.

alter procedure sp_All_leads
    @cust_id int
as
begin
    set nocount on;
    select l.lead_id,l.customer_id,l.lead_source,l.lead_status,l.assigned_to,l.lead_created_date
    from crm_leads l
    inner join crm_customers c
    on l.customer_id=c.customer_id
    where c.customer_id=@cust_id;
end;

exec sp_All_leads
@cust_id=3


--Create a procedure to insert a new interaction.

select * from crm_interactions;

alter procedure sp_insert_new_interactions
    @interaction_id int,
    @lead_id int,
    @interaction_type varchar,
    @interaction_date date,
    @remarks varchar
as
begin
    set nocount on;
    begin Transaction;
    if exists(select 1 from crm_interactions where interaction_id=@interaction_id )
    begin
    rollback transaction;
    print'Interaction_id already exists';
    return;
    end;
    insert into crm_interactions(interaction_id,lead_id,interaction_type,interaction_date,remarks)
    values(@interaction_id,@lead_id,@interaction_type,@interaction_date,@remarks);
    commit transaction;
end;

exec sp_insert_new_interactions
    @interaction_id=1001,
    @lead_id= 112,
    @interaction_type =call,
    @interaction_date = '2022-04-11',
    @remarks= null

--Procedure to return total leads per lead_status.

select * from crm_leads;

alter procedure sp_total_leads
as
begin
    set nocount on;
    select lead_status, count(*) as total_leads
    from crm_leads
    group by lead_status;
end;

exec sp_total_leads;

--Procedure to update lead_status to CLOSED for a given lead_id.

create procedure sp_update_lead_status
    @lead_id int
as
begin
    set nocount on;
    update crm_leads
    set lead_status= 'CLOSED'
    where lead_id=@lead_id;
end;

exec sp_update_lead_status
@lead_id=102




--Procedure to fetch customers who have more than 1 lead.

create procedure 


--Procedure to return leads created in the last 30 days.

--Procedure to insert a lead only if customer email is NOT NULL.

--Procedure to delete duplicate customers based on customer_name (keep latest).

--Procedure with pagination to fetch interactions for a given lead_id.

--Scalar function to return customer city by customer_id.

--Function to count number of leads for a customer.

--Function to check if a lead is OPEN or CLOSED.

--Function to return lead age (days since lead_created_date).

--Function to return total interactions for a lead.

--Function to replace NULL lead_status with 'OPEN'.

--Function to return customer email domain (after @

--Table-valued function to return all OPEN leads with customer name.

--Function to calculate conversion rate (CLOSED leads / total leads).

--Function to return latest interaction date per customer.

