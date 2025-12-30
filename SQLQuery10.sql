use projects;

bulk insert dbo.swiggy
from 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\swiggy.csv'
with (
	 firstrow =2,
	 fieldterminator =',',
	 rowterminator = '\n',
	 tablock
	 );

select * into Hotels
from swiggy;

select * from Hotels;

alter table Hotels
alter column Avg_Rating decimal(3,2);

