use projects;

bulk insert dbo.swiggy
from 'c:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\swiggy.csv'
with(
	 firstrow = 2,
	 rowterminator = ',',
	 fieldterminator = '\n',
	 tablock,
	 codepage = 65001
	 );

select * into Restaurants_2
from swiggy;

select * from Restaurants_2;

alter table Restaurants_2
add Restaurant_name varchar(100);

alter table Restaurants_2
drop column Restaurant_name ;

select top 5 * from Restaurants_2;

sp_help Restaurants_2;

use projects;

sp_help Restaurants_2;

select top 5 * from Restaurants_2;

-- Get top 5 Highest Rated reataurants

create procedure sp_City_Restaurants
	@City varchar(50)
as
begin 
	select *
	from Restaurants_2
	where City = @City
	order by Total_Rating desc;
end;

exec sp_City_Restaurants @City='Pune';

select * from Restaurants_2;

create procedure Get_all_Restaurants
	@ID int
as 
begin
	select * from Restaurants_2
	where ID = @ID;
end;

exec Get_all_Restaurants @ID =799;

CREATE PROCEDURE Get_all_Restaurants
    @ID INT
AS 
BEGIN
    SELECT * 
    FROM Restaurants_2
    WHERE ID = @ID;
END;














select * from sys.procedures; -- To see all stored procedures in system

sp_helptext'sp_TopRestaurants'; -- You can see the text of required Stored procedure.


select * from swiggy;

select * from Restaurants_2
order by ID ;

select * from Restaurants_2 e1
where exists (select null from Restaurants_2 e2
				where e1.ID=e2.Food_Type);    -- Selecting 0 Rows means there is no null value in city and Food_Type columns

use projects;

select * from Restaurants_2;

select City
from Restaurants_2
group by City,Avg_Rating, Restaurant_price
having Avg_Rating > 4.6
order by Restaurant_Price Desc ;

select ID, Area ,City, Food_Item
from Restaurants_2
where Food_Item = 'Pav Bhaji' and Restaurant_Price<200;

select * from sys.procedures;

sp_helptext 'sp_TopRestaurants';

select * from Restaurants_2;

select * 
from Restaurants_2 
where City in ('Mumbai','Pune');

select * from Restaurants_2;

alter table Restaurants_2
alter column Avg_Rating decimal(3,2);

select column_name
from information_schema.columns
where table_name ='Restaurants_2';

sp_help Restaurants_2;


bulk insert dbo.Hotels
from 'c\: write a file path'
with(
	firstrow = 2,
	rowterminator = ',',
	fieldterminator = '\n',
	tablock
	);


delete from Restaurants_2
where 






