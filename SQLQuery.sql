use projects;

bulk insert dbo.swiggy
from 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\swiggy.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	rowterminator = '\n',
	tablock
	);

select * from swiggy;

-- Create a table named Restaurants with appropriate columns from the Swiggy dataset.

select * into Restaurants
from swiggy;

select * from Restaurants;

--Alter the Restaurants table to add a column Average_Rating.
alter table Restaurants
add Average_Ratings decimal(2,2);

--Modify the datatype Area column to VARCHAR(100).
alter table Restaurants
alter column Area varchar(100);

--Rename the column Food_Item to Rest_Specials.
exec sp_rename 'Restaurants.Food_Item','Rest_Specials';


-- Show all Restaurants with Avg_Ratings above 4.5
 select * from Restaurants
 where Avg_Rating >=4.5
 order by Avg_Rating desc;


 --Display the top 5 restaurants with the highest ratings.
 select top 5 * from Restaurants
 order by Avg_Rating desc;

--Find all restaurants that serve .
select * from Restaurants
where Food_Type = 'Vegetarian'
order by Restaurant_Price desc;

--Count how many restaurants are available in each city.
select City, count(*) as All_Restaurants
from Restaurants
group by City
order by All_Restaurants desc;

create table 
















































