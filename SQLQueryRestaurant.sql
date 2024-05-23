create database restaurant
use restaurant

create table meals(
id int primary key identity,
[name] nvarchar(25),
price decimal(10,2)
)

create table [tables](
id int primary key identity,
[no] nvarchar(25),
price decimal(10,2)
)

create table Orders(
id int primary key identity,
mealId int foreign key references meals(id),
tableId int foreign key references [tables](id),
date datetime2
)

INSERT INTO meals ([name], price) 
VALUES 
('Meal 1', 10.50),
('Meal 2', 15.75),
('Meal 3', 20.25),
('Meal 4', 25.00),
('Meal 5', 30.50);

INSERT INTO [tables] ([no], price) 
VALUES 
('Table 1', 10.00),
('Table 2', 15.00),
('Table 3', 20.00),
('Table 4', 25.00),
('Table 5', 30.00);

select t.*,(select count(*) from orders where tableId=t.id  ) orderCount from tables t

select m.*,(select count(*) from orders where mealId=m.id) OrderCount from meals m

select o.*,m.name from orders o
join meals m 
on 
 o.tableId=m.id

 select o.*,m.name ,t.no tableNo from orders o
 join meals m
 on 
 o.mealId=m.id
 join tables t
 on
 o.tableId=t.id

select t.id,t.no,sum(m.price) PriceCount from tables t
 join orders o
 on
 t.id=o.tableId
 join meals m
 on
 o.mealId=m.id
 group by
 t.id,t.no

 select DATEDIFF(MINUTE,min(date),max(date)) dateDifference from tables t 
 join orders o
 on
 o.tableId=t.id
 where t.Id=1

 select * from orders where DATEDIFF(minute,[date],GETDATE())<1
 select * from tables t where not exists (select id from Orders o where t.id=o.tableId)

 -- Sample Users table
CREATE TABLE Users (
    id INT PRIMARY KEY,
    Firstname NVARCHAR(50),
    Lastname NVARCHAR(50),
    Email NVARCHAR(100),
    -- other columns...
);

-- Insert sample data into Users table
INSERT INTO Users (id, Firstname, Lastname, Email)
VALUES 
(1, 'John', 'Doe', 'john@example.com'),
(2, 'Alice', 'Smith', 'alice@example.com'),
(3, 'Bob', 'Johnson', 'bob@example.com');

-- Select only Firstname, Lastname, and Email columns, sorted alphabetically by Firstname
SELECT Firstname, Lastname, Email
FROM Users
ORDER BY Firstname;
SELECT SUBSTRING('DOTNET', 1, 3) AS 'Substring'