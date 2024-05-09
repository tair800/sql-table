create table Department(
Id int  IDENTITY(1,1) PRIMARY KEY NOT NULL,
FullName  nvarchar(225) NOT NULL,
Age int NOT NULL check (Age >= 0),
Email nvarchar(225) NOT NULL UNIQUE ,
Salary decimal(6,2) NOT NULL CHECK(Salary>=300 AND Salary <=2000)
)
insert into Department Values
('David Wilson', 40, 'david@example.com', 1000),
('John Doe', 35, 'john@example.com', 900.50),
('Jane Smith', 28, 'jane@example.com', 1500.75),
('Michael Johnson', 42, 'michael@example.com', 1800.30);

SELECT * FROM Department --task 1
UPDATE Department SET salary=990 WHERE id=1 --task 2
SELECT * FROM Department WHERE Salary between 500 and 1500 --task 3
SELECT FullName,email,salary FROM Department ORDER BY salary desc

