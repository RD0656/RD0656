create database scenario;
use scenario;

/* We are getting duplicate contractor payments in the system.
   Same contractor_id, same project_id, but multiple rows with different timestamps. Latest one is valid. 
   How will you fix this permanently?”  */

   /* 1] First i will find the duplicate entries with ROW_NUMBER()
	  2] keep the latest records by payment_date
	  3] DElete old records 
	  4] apply unique constraint to prevent recurrence */

with cte as(
	select payment_id,
			row_number() over(partition by contractor_id,project_id order by payment_date) as dr
			from contractors
			)
			delete from cte where dr>1;

