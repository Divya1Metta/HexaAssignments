-- Coding Challenge - Car Rental System – SQL


--SQL Schema:
--1. Vehicle Table:
--• vehicleID (Primary Key)
--• make
--• model
--• year
--• dailyRate
--• status (available, notAvailable)
--• passengerCapacity
--• engineCapacity



Create Database Challenge;
use Challenge;
drop table if exists CustomerTable;
drop table if exists VehicleTable;
drop table if exists LeaseTable;
drop table if exists PaymentTable;


create table VehicleTable
(

  VehicleID  int Primary Key,
  Make varchar(30),
  Model varchar(30),
  Year int,
  DailyRate int,
  status varchar(30),
  passengerCapacity int,
  engineCapacity int
);

--2. Customer Table:
--• customerID (Primary Key)
--• firstName
--• lastName
--• email
--• phoneNumber


 create table CustomerTable
(
  CustomerID  int Primary Key,
  FirstName varchar(30),
  LastName varchar(30),
  Email varchar(30),
  PhoneNumber varchar(30),
  
);

--3.  Lease Table:
--• leaseID (Primary Key)
--• vehicleID (Foreign Key referencing Vehicle Table)
--• customerID (Foreign Key referencing Customer Table)
--• startDate
--• endDate
--• type (to distinguish between DailyLease and MonthlyLease)

create table LeaseTable
(
  LeaseID  int Primary Key,
  VehicleID  int,
  CustomerID int,
  StartDate Date,
  EndDate Date,
  Type varchar(30),
  foreign key(VehicleID ) references VehicleTable(VehicleID ) ,
  foreign key(CustomerID) references CustomerTable(CustomerID),
);

-- Payment Table:
--• paymentID (Primary Key)
--• leaseID (Foreign Key referencing Lease Table)
--• paymentDate
--• amount

create table PaymentTable
(

  PaymentID  int Primary Key,
  LeaseID  int,
  PaymentDate Date,
  Amount int
  foreign key(LeaseID) references LeaseTable(LeaseID),
);


-- Values Insertion for VehicleTable

insert into VehicleTable(vehicleID,make,model,year,dailyRate,status,passengerCapacity,engineCapacity)
values(1, 'Toyota', 'Camry', 2022 ,50.00, 1 ,4, 1450),
(2, 'Honda', 'Civic', 2023, 45.00, 1, 7, 1500),
(3, 'Ford', 'Focus', 2022, 48.00, 0, 4, 1400),
(4, 'Nissan', 'Altima', 2023, 52.00, 1, 7, 1200),
(5, 'Chevrolet', 'Malibu', 2022, 47.00, 1, 4, 1800),
(6, 'Hyundai', 'Sonata' ,2023 ,49.00 ,0 ,7 ,1400),
(7, 'BMW', '3Series', 2023, 60.00, 1, 7, 2499),
(8, 'Mercedes', 'C-Class', 2022, 58.00, 1 ,8 ,2599),
(9, 'Audi' ,'A4', 2022, 55.00, 0 ,4 ,2500),
(10 ,'Lexus', 'ES', 2023, 54.00, 1, 4 ,2500);

select * from VehicleTable

  -- Values Insertion for CustomerTable
insert into CustomerTable(CustomerID ,firstName ,lastName, email ,phoneNumber)
values(1, 'John','Doe' ,'johndoe@example.com', 555-555-5555),
(2 ,'Jane' ,'Smith' ,'janesmith@example.com' ,555-123-4567),
(3 ,'Robert', 'Johnson', 'robert@example.com', 555-789-1234),
(4 ,'Sarah' ,'Brown', 'sarah@example.com', 555-456-7890),
(5 ,'David' ,'Lee' ,'david@example.com' ,555-987-6543),
(6 ,'Laura' ,'Hall', 'laura@example.com' ,555-234-5678),
(7, 'Michael' ,'Davis' ,'michael@example.com', 555-876-5432),
(8, 'Emma', 'Wilson', 'emma@example.com', 555-432-1098),
(9 ,'William', 'Taylor' ,'william@example.com' ,555-321-6547),
(10 ,'Olivia', 'Adams', 'olivia@example.com', 555-765-4321);

select * from CustomerTable

  
 -- Values Insertion for LeaseTable
insert into LeaseTable(leaseID,vehicleID,customerID ,startDate, endDate,type )
values(1 ,1 ,1, '2023-01-01', '2023-01-05', 'Daily'),
(2 ,2, 2, '2023-02-15', '2023-02-28', 'Monthly'),
(3, 3, 3 ,'2023-03-10', '2023-03-15' ,'Daily'),
(4, 4 ,4 ,'2023-04-20', '2023-04-30', 'Monthly'),
(5 ,5 ,5 ,'2023-05-05' ,'2023-05-10' ,'Daily'),
(6 ,4 ,3 ,'2023-06-15','2023-06-30', 'Monthly'),
(7 ,7, 7,' 2023-07-01' ,'2023-07-10' ,'Daily'),
(8 ,8 ,8, '2023-08-12', '2023-08-15', 'Monthly'),
(9, 3 ,3 ,'2023-09-07' ,'2023-09-10' ,'Daily'),
(10 ,10, 10, '2023-10-10', '2023-10-31', 'Monthly');

select * from LeaseTable


  
 -- Values Insertion for PaymentTable
insert into PaymentTable(paymentID, leaseID, paymentDate, amount)
values(1, 1 ,'2023-01-03', 200.00),
(2 ,2 ,'2023-02-20' ,1000.00),
(3, 3, '2023-03-12', 75.00),
(4 ,4, '2023-04-25' ,900.00),
(5, 5, '2023-05-07', 60.00),
(6 ,6, '2023-06-18', 1200.00),
(7, 7, '2023-07-03' ,40.00),
(8 ,8 ,'2023-08-14' ,1100.00),
(9, 9, '2023-09-09' ,80.00),
(10 ,10 ,'2023-10-25' ,1500.00);

select * from PaymentTable

--1. Update the daily rate for a Mercedes car to 68.

update VehicleTable
set dailyRate= 68
where vehicleID=8

--2. Delete a specific customer and all associated leases and payments

declare @n int = 1;

delete from PaymentTable where leaseID = 
(select leaseID from LeaseTable where customerID = @n);

delete from LeaseTable where customerID = @n;

delete from CustomerTable where customerID = @n;

--3. Rename the "paymentDate" column in the Payment table to "transactionDate".

Alter table PaymentTable
rename COLUMN paymentDate to transactionDate;

--4. Find a specific customer by email.

select * from CustomerTable where email = 'michael@example.com';

--5. Get active leases for a specific customer. 

select l.leaseID, l.vehicleID, l.startDate, l.endDate from LeaseTable l 
join PaymentTable p on l.leaseID=p.leaseID where p.paymentDate < l.endDate and 
l.customerID = 2;

--6. Find all payments made by a customer with a specific phone number. 


select p.*, l.leaseID from PaymentTable p join LeaseTable l
on p.leaseID = l.leaseID join CustomerTable c
on l.customerID = c.customerID where c.phoneNumber='555-123-4567';

--7. Calculate the average daily rate of all available cars. 

select avg(dailyRate) as averagedaily from VehicleTable where status =1;

--8. Find the car with the highest daily rate.

select vehicleID, make, model from VehicleTable order by dailyRate desc
offset 0 rows fetch next 1 rows only;

--9. Retrieve all cars leased by a specific customer. 


select distinct v.vehicleID, v.make, v.model from VehicleTable v join LeaseTable l on
v.vehicleID = l.vehicleID where l.customerID = 5;

--10. Find the details of the most recent lease.

select * from LeaseTable order by startDate desc offset 0 rows 
fetch next 1 rows only;

--11. List all payments made in the year 2023.

select * from PaymentTable where year(paymentDate)='2023';

--12. Retrieve Car Details and Their Total Payments. 



select v.make, v.model, v.year, sum(p.amount) as TotalAmount from VehicleTable v
join LeaseTable l on v.vehicleID = l.vehicleID 
join PaymentTable p on p.leaseID = l.leaseID group by v.make, v.model,v.year;

--13. Retrieve customers who have not made any payments. 



select * from CustomerTable where customerID not in 
(select customerID from Lease join PaymentTable on LeaseTable.leaseID = PaymentTable.leaseID);

--14. Calculate Total Payments for Each Customer. 

select c.customerID, c.firstName, c.lastName, sum(v.dailyRate * DATEDIFF(DAY,l.startDate,l.endDate)) 
as TotalSpent from CustomerTable c join Lease l 
on c.customerID = l.customerID
join VehicleTable v on v.vehicleID = l.vehicleID group by c.customerID,c.firstName,c.lastName;


--15. List Car Details for Each Lease. 


select l.leaseID, v.vehicleID, v.make, v.model, v.engineCapacity,v.passengerCapacity 
from LeaseTable l join VehicleTable v on l.vehicleID = v.vehicleID;

--16. Retrieve Details of Active Leases with Customer and Car Information.


select l.leaseID, c.* from Lease l join CustomerTable C on
l.customerID = c.customerID join PaymentTable p on
l.leaseID = p.leaseID where p.paymentDate < l.endDate;

17. Find the Customer Who Has Spent the Most on Leases.
  
select * from CustomerTable where customerID = 
(select l.customerID from LeaseTable l where leaseID = 
(select top 1 leaseID from PaymentTable group by leaseID order by sum(amount) desc));

  
18. List All Cars with Their Current Lease Information.

select v.make, v.model,v.dailyRate, l.startDate, l.endDate,l.type from VehicleTable v
join LeaseTable l on v.vehicleID = l.vehicleID;
