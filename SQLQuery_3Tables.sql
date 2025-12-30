use project1;

create table Restaurants_2(
Rest_id int identity(1,1) primary key,
Rest_name varchar(50),
Area varchar(100),
City varchar(50),
Rest_price int,
Food_items varchar(100),
Food_type varchar(100),
Delivery_time datetime,
Review varchar(200)
);

create table Orders(
Order_id int primary key,
Rest_id int foreign key references Restaurants_2(Rest_id),
Customer_Name varchar(100),
Order_amount int,
Order_date datetime
);


create table Customers (
    Customer_ID int,
    Customer_Name varchar(100) NOT NULL,
    Contact_No varchar(15),
    Email varchar(100),
    City varchar(50),
    Registration_Date datetime default getdate()
);

insert into Customers (Customer_ID, Customer_Name, Contact_No, Email, City)
values
(1001,'Rohit Sharma', '9876543210', 'rohit@gmail.com', 'Pune'),
(1002,'Neha Patil', '9823456710', 'neha@gmail.com', 'Pune'),
(1003,'Amit Joshi', '9998765432', 'amitj@gmail.com', 'Pune'),
(1004,'Sneha Kulkarni', '9756482310', 'sneha.k@gmail.com', 'Pune'),
(1005,'Rajiv Deshmukh', '9612457890', 'rajiv.d@gmail.com', 'Pune'),
(1006,'Mitali Jadhav', '9845123698', 'mitali.j@gmail.com', 'Pune'),
(1007,'Kiran More', '9900112233', 'kiran.more@gmail.com', 'Pune'),
(1008,'Anita Bhosale', '9765423100', 'anita.b@gmail.com', 'Pune'),
(1009,'Rahul Pawar', '9812345678', 'rahulp@gmail.com', 'Pune'),
(1010,'Pratiksha Naik', '9898989898', 'pratiksha@gmail.com', 'Pune');

insert into Restaurants_2 (Rest_name, Area, City, Rest_price, Food_items, Food_type, Delivery_time, Review)
values
('Vaishali', 'FC Road', 'Pune', 500, 'South Indian, Coffee', 'Vegetarian', '2025-10-01 10:30:00', 'Very good ambience and taste'),
('Roopali', 'Deccan', 'Pune', 450, 'Dosa, Idli, Wada', 'Vegetarian', '2025-10-02 09:15:00', 'Quick service and clean'),
('German Bakery', 'Koregaon Park', 'Pune', 900, 'Bakery, Sandwiches, Coffee', 'Continental', '2025-10-03 08:45:00', 'Good for brunch'),
('Spice Garden', 'Baner', 'Pune', 800, 'North Indian, Biryani', 'Non-Veg', '2025-10-03 12:30:00', 'Excellent biryani and service'),
('Blue Nile', 'Camp', 'Pune', 950, 'Biryani, Kebabs', 'Non-Veg', '2025-10-04 13:15:00', 'Authentic taste and large portions'),
('Sukanta', 'JM Road', 'Pune', 600, 'Thali, Sweet Dish', 'Vegetarian', '2025-10-04 11:00:00', 'Delicious Maharashtrian Thali'),
('Chaitanya Paranthas', 'Kothrud', 'Pune', 550, 'Parathas, Lassi', 'Vegetarian', '2025-10-05 09:45:00', 'Best for breakfast'),
('Barbeque Nation', 'Viman Nagar', 'Pune', 1200, 'Buffet, Grill, Desserts', 'Mixed', '2025-10-05 13:00:00', 'Great buffet experience'),
('Darshan', 'Prabhat Road', 'Pune', 700, 'Pizza, Pasta, Coffee', 'Vegetarian', '2025-10-06 10:00:00', 'Consistent quality for years'),
('Malaka Spice', 'Baner', 'Pune', 1300, 'Asian, Thai, Malaysian', 'Non-Veg', '2025-10-07 12:00:00', 'Amazing fusion dishes and decor');



insert into Orders (Order_id, Rest_id, Customer_Name, Order_amount, Order_date)
values
(101, 1, 'Rohit Sharma', 600, '2025-10-08 12:15:00'),
(102, 2, 'Neha Patil', 450, '2025-10-08 09:30:00'),
(103, 3, 'Amit Joshi', 950, '2025-10-09 08:45:00'),
(104, 4, 'Sneha Kulkarni', 850, '2025-10-09 13:20:00'),
(105, 5, 'Rajiv Deshmukh', 1000, '2025-10-09 19:00:00'),
(106, 6, 'Mitali Jadhav', 650, '2025-10-10 11:10:00'),
(107, 7, 'Kiran More', 500, '2025-10-10 09:40:00'),
(108, 8, 'Anita Bhosale', 1300, '2025-10-10 14:10:00'),
(109, 9, 'Rahul Pawar', 700, '2025-10-11 10:30:00'),
(110, 10, 'Pratiksha Naik', 1400, '2025-10-11 12:15:00');




select * from Orders;

select * from Restaurants_2;

select * from Customers;

select Rest_name, Area,City, Rest_price
from Restaurants_2
order by Rest_price desc;

select Rest_name,Rest_price
from Restaurants_2
where Area= 'Baner';







