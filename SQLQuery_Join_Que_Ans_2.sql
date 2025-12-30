🔹 Basic JOIN Questions
use project1;

select * from Restaurants_2;
select * from Orders;
select * from Customers;

create nonclustered index ix_Rest_Rest_name
on Restaurants_2(Rest_name);

-- Write a query to display all orders with corresponding restaurant names.

 select r.Rest_name,o.Order_id,o.Customer_Name,o.Order_amount
 from Restaurants_2 r
 right join Orders o
 on r.Rest_id= o.Rest_id;

-- Show each customer’s name along with the restaurant they ordered from.

select o.Customer_Name, r.Rest_name, o.Order_amount
from Restaurants_2 r
inner join Orders o
on r.Rest_id= o.Rest_id;

--Display restaurant name, order ID, and order amount for all orders.

select r.Rest_name, o.Order_id, o.Order_amount
from Restaurants_2 r
join Orders o
on r.Rest_id = o.Rest_id;

--Find all restaurants that have received at least one order.

select distinct r.Rest_name 
from Restaurants_2 r
join Orders o
on r.Rest_id = o.Rest_id;

--List all customers who have placed at least one order.

select *from Customers;

select distinct c.Customer_Name
from Customers c
join Orders o
on c.Customer_Name= o.Customer_Name;

--Retrieve all restaurants that have not received any orders.

select r.Rest_id
from Restaurants_2 r
join Orders o
on r.Rest_id= o.Rest_id
where r.Rest_id is null;

--Display the restaurant name and total number of orders it received.

select r.Rest_name, o.Order_amount
from Restaurants_2 r
join Orders o
on r.Rest_id= o.Rest_id;

--Show all customers who ordered from “Vaishali”.

select o.Customer_Name
from Restaurants_2 r
join Orders o
on r.Rest_id= o.Rest_id
where r.Rest_name=  'Vaishali';

--List restaurant names and the customers who ordered from them.

select r.Rest_name,o.Customer_Name
from Restaurants_2 r
join Orders o
 on r.Rest_id = o.Rest_id;

--Display all restaurants and customers, including those without orders.

select r.Rest_name, o.Customer_Name
from Restaurants_2 r
join Orders o
on r.Rest_id = o.Rest_id;

--🔹 INNER JOIN Practice

--Get restaurant details along with the order amount and customer name.
select * from Restaurants_2;

select r.Rest_id, r.Rest_name, r.Area,r.City,r.Food_items,r.Food_type,o.Order_amount,o.Customer_Name,r.Review
from Restaurants_2 r
inner join Orders o
on r.Rest_id = o.Rest_id;

--Find all order details with restaurant city and customer city.

select * from orders; 
select * from Restaurants_2;
select * from Customers;

select o.Order_id,o.Customer_Name,o.Order_amount,o.Order_date,r.City
from Restaurants_2 r
inner join Orders o
on r.Rest_id=o.Rest_id;

--Retrieve the restaurant name and total amount of orders placed at it.

select r.Rest_name,o.Order_amount
from Restaurants_2 r
inner join Orders o
on r.Rest_id=o.Rest_id
order by o.Order_amount desc;

--List customers who placed an order greater than ₹1000 along with restaurant details.

select o.Customer_Name,r.Rest_price,Rest_name,r.Area, r.City,r.Food_type
from Restaurants_2 r
inner join Orders o
on r.Rest_id=o.Rest_id
where r.Rest_price>1000;

--Show restaurant name, customer name, and order date for all completed orders.
select * from Orders;
select r.Rest_name,o.Customer_Name,o.Order_date
from Restaurants_2 r
inner join Orders o
on r.Rest_id=o.Rest_id;

--Get customer names who have ordered from more than one restaurant.

select o.Customer_Name
from Orders o
group by o.Customer_Name
having count(o.Rest_id)>1; -- There are no customers who have orderd from more than one restaurant.

--Display restaurants where total revenue exceeds ₹2000.

select r.Rest_name,sum(o.Order_amount)as Total_Revenue
from Restaurants_2 r
inner join Orders o
on r.Rest_id=o.Rest_id
group by r.Rest_name
having sum(Order_amount)>2000; -- There is no Restaurant whose Total revenue is greater than 20000

--Find customers who have placed orders at “Baner” area restaurants.

select o.Customer_Name
from Restaurants_2 r
inner join Orders o
on r.Rest_id=o.Rest_id
where r.Area='Baner';

--List all orders along with restaurant and customer details sorted by date.

select * from Orders;
select r.Rest_name,o.Customer_Name,o.Order_id,o.Order_date
from Restaurants_2 r
inner join Orders o
on r.Rest_id=o.Rest_id
order by Order_date desc;

--Show the restaurant name and highest order amount for each restaurant.

select r.Rest_name,max(o.Order_amount) as Highest_Order
from Restaurants_2 r
inner join Orders o
on r.Rest_id= o.Rest_id
group by r.Rest_name;

select * from Orders;

--Display all restaurants and any corresponding order details (include restaurants with no orders).

select r.Rest_name,o.Order_id,o.Order_amount
from Restaurants_2 r
join Orders o
on r.Rest_id=o.Rest_id;

--Show all customers and their orders (include customers who haven’t placed any).

select c.Customer_Name,o.Order_amount
from Orders o
join Customers c
on o.Customer_Name=c.Customer_Name;

--Retrieve all restaurants that don’t have any related customers (no orders).

select r.Rest_name,c.Customer_Name
from Restaurants_2 r
left join Orders o
on r.Rest_id=o.Rest_id
left join Customers c
on o.Customer_Name=c.Customer_Name
where r.Rest_id is null;

select Rest_name,Area,City
from Restaurants_2
where Rest_id not in (select Rest_id from Orders);

--List all customers and their last order date (include customers with no orders).

select c.Customer_Name,max(o.order_date) as Last_order_date
from Orders o
left join Customers c
on o.Customer_Name=o.Customer_Name
group by c.Customer_Name;

--Find restaurants that have never received an order from a specific city (e.g., “Pune”).





/*Display all orders even if the restaurant record is missing (simulate RIGHT JOIN scenario).

Show customers who haven’t placed any orders and restaurants with zero orders.

Retrieve all customers and the total orders they made (include zero).

List restaurants with null order details using a LEFT JOIN.

Find restaurants without matching entries in the Orders table.

🔹 MULTI-TABLE JOINS

Get restaurant name, customer name, and order date using all three tables.

Show each order along with the restaurant’s area and customer’s contact number.

Display all customers who ordered from “Vegetarian” restaurants.

Find all orders placed in restaurants located in the same city as the customer.

Show customer names and all restaurants they ordered from more than once.

Retrieve total revenue per restaurant grouped by area.

List top 3 restaurants with highest revenue along with customer details.

Display each restaurant, the number of customers who ordered, and their names.

Find total number of unique customers per restaurant.*/

--Show customers who have ordered from both vegetarian and non-veg restaurants.

select o.Customer_Name    /* Wrong way */
from Restaurants_2 r
join Orders o
on r.Rest_id=o.Rest_id
where r.Food_type='Vegetarian'and r.Food_type='Non_Veg'; /* We can't use AND operator like this
                                                            This query will show zero columns
                                                            Because one Restaurant cannot be both Vegetariian and non-veg*/

SELECT DISTINCT Customer_Name
FROM Orders
WHERE Customer_Name IN (
    SELECT o.Customer_Name
    FROM Orders o
    WHERE o.Rest_id IN (SELECT r.Rest_id FROM Restaurants_2 r WHERE r.Food_type = 'Vegetarian')
)
AND Customer_Name IN (
    SELECT o.Customer_Name
    FROM Orders o
    WHERE o.Rest_id IN (SELECT r.Rest_id FROM Restaurants_2 r WHERE r.Food_type = 'Non-Veg')
); 
-- This is a Right way to use AND operator in WHERE Clause 


select * from Restaurants_2;

SELECT o.Customer_Name
FROM Orders o
JOIN Restaurants_2 r 
ON o.Rest_id = r.Rest_id
GROUP BY o.Customer_Name
HAVING COUNT(DISTINCT r.Food_type) > 1;


--🔹 ADVANCED JOIN SCENARIOS
use project1;
select * from Restaurants_2;
select * from Orders;


--Find restaurants and customers who share the same city.

select r.Rest_name,r.City,o.Customer_Name
from Restaurants_2 r
join Orders o
on r.Rest_id=o.Rest_id;


/*Retrieve restaurant details for customers who spent more than ₹2000 in total.

List the restaurant with maximum orders placed by a single customer.

Display all restaurant-customer pairs where order amount is above restaurant price.

Find customers who ordered from restaurants on the same day multiple times.

Show restaurants and customers where order date matches restaurant delivery time date.

Get customers who have ordered from all restaurants in a specific area.

Find restaurants that share customers with other restaurants (common customers).

Show restaurant names and total distinct customer count per restaurant.

Display customers who ordered from restaurants with reviews containing “excellent”.

1️⃣ Find each restaurant’s highest, lowest, and average order amount.
2️⃣ Retrieve customers who have spent more than the average order amount across all restaurants.
3️⃣ Show restaurants that have received orders from customers in more than one city.
4️⃣ List restaurants where the total revenue is greater than ₹3000 and the number of unique customers is more than 3.
5️⃣ Find customers who have placed orders at restaurants with at least 2 different food types.
6️⃣ Display top 2 restaurants in each area based on total revenue.
7️⃣ Show each customer’s total number of orders, total amount spent, and their favorite restaurant (by most orders).
8️⃣ Retrieve restaurants that have received no orders in the past 30 days.
9️⃣ Find customers who have ordered from restaurants that share the same area.
10️⃣ Display restaurant names and customers where both belong to the same city and the restaurant’s price is above average.


--Frequently asked questions in interviews*/

-- 1]Display all orders with their corresponding restaurant names.
use project1;

select r.Rest_name,o.Order_id
from Restaurants_2 r
right join Orders o
on r.Rest_id=o.Rest_id;

--2️⃣ Show each customer’s name along with the restaurant they ordered from.

select o.Customer_Name,r.Rest_name,o.Order_id
from Restaurants_2 r
right join Orders o
on r.Rest_id=o.Rest_id;

--3️⃣ Display restaurant name, order ID, and order amount for all orders.

select r.Rest_name, o.Order_id,o.Order_amount
from Restaurants_2 r
right join Orders o
on r.Rest_id= o.Rest_id;

--4️⃣ Find all restaurants that have received at least one order.

SELECT DISTINCT  r.Rest_name
FROM Restaurants_2 r
JOIN Orders o
ON r.Rest_id = o.Rest_id;

--5️⃣ Retrieve all restaurants that have not received any orders.

select r.Rest_name
from Restaurants_2 r
join Orders o
on r.Rest_id= o.Rest_id
where r.Rest_id is null;

--6️⃣ Show all customers who ordered from a specific restaurant (e.g., “Vaishali”).

select o.Customer_Name
from Restaurants_2 r
right join Orders o
on r.Rest_id=o.Rest_id
where r.Rest_name='Vaishali';

--7️⃣ Display restaurant name and total number of orders it received.

select r.Rest_name, count(o.Order_id) as Total_Orders
from Restaurants_2 r
left join Orders o
on r.Rest_id=o.Rest_id
group by r.Rest_name;

--8️⃣ List restaurant names and total revenue from all orders.

select * from Orders;

select r.Rest_name, sum(o.Order_amount) as Total_Revenue
from Restaurants_2 r
inner join Orders o
on r. Rest_id=o.Rest_id
group by r.Rest_name;

--9️⃣ Show each order along with the restaurant’s area and customer’s city.

select o.Order_id,r.Area,r.City
from Restaurants_2 r
right join Orders o
on r.Rest_id=o.Rest_id;

--10️⃣ Get restaurant name and highest order amount for each restaurant.

select r.Rest_name,max(o.Order_amount) as Highest_order
from Restaurants_2 r
left join Orders o
on r.Rest_id=o.Rest_id
group by r.Rest_name;

--11️⃣ Display all restaurants and their corresponding orders (including those with none).
use project1;
select * from Orders;

select r.Rest_name,o.Order_id
from Restaurants_2 r
left join  Orders o
on r.Rest_id=o.Rest_id;

--12️⃣ Show all customers and their orders (including customers who haven’t ordered).

select * from Customers;

select 




--13️⃣ Retrieve total revenue per restaurant grouped by area.

select top 3 r.Rest_name,r.Area, sum(o.Order_amount)as Total_Revenue
from Restaurants_2 r
left join Orders o
on r.Rest_id=o.Rest_id
group by r.Area,r.Rest_name
order by Total_Revenue Desc;

--14️⃣ Find customers who ordered from “Vegetarian” restaurants.

select o.Customer_Name
from Restaurants_2 r
right join Orders o
on r.Rest_id=o.Rest_id
where r.Food_type='Vegetarian';




--15️⃣ Show customers who ordered from more than one restaurant.
--16️⃣ Display top 3 restaurants with the highest total revenue.


select top 3 r.Rest_name,r.Area, sum(o.Order_amount)as Total_Revenue
from Restaurants_2 r
left join Orders o
on r.Rest_id=o.Rest_id
group by r.Area,r.Rest_name
order by Total_Revenue Desc;


--17️⃣ Find total number of unique customers per restaurant.

select r.Rest_name, count( distinct o.Customer_Name) as Unique_Customers
from Restaurants_2 r
join Orders o
on r.Rest_id=o.Rest_id
group by r.Rest_name
order by Unique_Customers;

--18️⃣ Display restaurant name, customer name, and order date for all orders.

select r.Rest_name, o.Customer_Name,o.Order_date
from Restaurants_2 r
join Orders o
on r.Rest_id=o.Rest_id;

select * from Customers;

--19️⃣ Find customers who ordered from restaurants in their own city.
--20️⃣ Display customers who ordered from restaurants with reviews containing the word “excellent”.


