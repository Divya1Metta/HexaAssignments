# SQL ASSIGNMENT

## Task:1. Database Design:

1.1 Create the database named "TechShop"

``` sql
create database TechShop;
use Techshop;
```
1.2 Define the schema for the Customers, Products, Orders, OrderDetails and Inventory tables based on the provided schema.

  ```sql
drop table if exists Customers;
create table Customers
(
  CustomerID  int Primary Key,
  FirstName varchar(30),
  LastName varchar(30),
  Email varchar(30),
  Phone varchar(30),
  Address varchar(30)
);
```

``` sql
drop table if exists Products;
create table Products
(
   ProductID int Primary Key,
   ProductName varchar(30),
   Description varchar(50),
   Price numeric(9,2)
);
```

```sql
drop table if exists orders;
create table orders
(
   OrderID int Primary Key,
   CustomerID int,
   OrderDate varchar(30),
   TotalAmount numeric(9,2),
   foreign key(customerid) references customers(customerid) on delete cascade
);
```


```sql
drop table if exists Orderdetails;
create table Orderdetails
(
  OrderDetailID int Primary Key,
  OrderID int,
  ProductID int,
  Quantity int,
  foreign key(orderid) references orders(orderid) on delete cascade,
  foreign key(productid) references products(productid) on delete cascade
);
```

```sql
drop table if exists Inventory;
create table Inventory
(
  InventoryID int Primary Key,
  ProductID int,
  LastStockUpdate varchar(30),
  foreign key(productid) references products(productid)
);
```
1.3. Create an ERD (Entity Relationship Diagram) for the database.

![WhatsApp Image 2024-04-30 at 18 47 45](https://github.com/Divya1Metta/HexaAssignments/assets/147889571/8bed4afa-9edb-40e0-aac1-b30dcdaafa27)


1.4.Create appropriate Primary Key and Foreign Key constraints for referential integrity.
```sql
drop database if exists TechShop;
create database TechShop;
use TechShop;

drop table if exists customers;
create table customers
(
  CustomerID  int Primary Key,
  FirstName varchar(30),
  LastName varchar(30),
  Email varchar(30),
  Phone varchar(30),
  Address varchar(30)
);

drop table if exists products;
create table products
(
   ProductID int Primary Key,
   ProductName varchar(30),
   Description varchar(50),
   Price numeric(9,2)
);

drop table if exists orders;
create table orders
(
   OrderID int Primary Key,
   CustomerID int,
   OrderDate varchar(30),
   TotalAmount numeric(9,2),
   foreign key(customerid) references customers(customerid) on delete cascade
);

drop table if exists orderdetails;
create table orderdetails
(
  OrderDetailID int Primary Key,
  OrderID int,
  ProductID int,
  Quantity int,
  foreign key(orderid) references orders(orderid) on delete cascade,
  foreign key(productid) references products(productid) on delete cascade
);

drop table if exists inventory;
create table inventory
(
  InventoryID int Primary Key,
  ProductID int,
  QuantityInStock int,
  LastStockUpdate varchar(30),
  foreign key(productid) references products(productid)
);

```


1.5. Insert at least 10 sample records into each of the following tables.

a. Customers

b. Products

c. Orders

d. OrderDetails


```sql
use Techshop;
delete from customers;
insert into customers(customerid,firstname,lastname,phone,email,address)
values(1,'sadhana','madina','9347498559','sadhanamadina@gmail.com','tekkali'),
(2,'pramoditha','duba','9346789132','pramoduba@gmail.com','srikakulam'),
(3,'mayuri','sunkara','1234567891','mayurisunkari@gmail.com','Narsannapeta'),
(4,'divya','metta','9345612345','divyametta@gmail.com','kotabommali'),
(5,'vineela','bade','9343497559','vineelabade@gmail.com','tekkali'),
(6,'likki','silla','9347412345','slikkisilla@gmail.com','palakonda'),
(7,'dhana','maddi','5432498559','dhanamaddi@gmail.com','Vizag'),
(8,'hana','seepana','9347498559','hanaseepana@gmail.com','hyderabad'),
(9,'sana','lukalapu','6303572442','sanalukalapu@gmail.com','chennai'),
(10,'mishika','mandaloi','8347998359','mishikamandaloi@gmail.com','indore');
```
b. Products

```sql
delete from products;

insert into products(productid,productname,description,price)
values(1,'Laptop','hp',60000),
(2,'mobile','one plus',25000),
(3,'AC','bluestar',40000),
(4,'fridge','lg',80000),
(5,'washing machine','samsung',40000),
(6,'micro oven','lg',10000),
(7,'Induction stove','pigeon',5000),
(8,'bed','duroflex',70000),
(9,'sofa','xyz',50000),
(10,'TV','sony',50000);

```

c. Orders
```sql
delete from orders;

insert into orders(orderid,customerid,orderdate)
values(1,2,'2022-01-23'),
(2,1,'2022-08-20'),
(3,1,'2023-09-13'),
(4,3,'2023-04-03'),
(5,10,'2021-01-22'),
(6,5,'2021-06-28'),
(7,8,'2024-02-23'),
(8,7,'2024-03-03'),
(9,3,'2020-11-23'),
(10,8,'2020-01-11');

```
d. OrderDetails
```sql
delete from orderdetails;

insert into orderdetails(orderdetailid,orderid,productid,quantity)
values(1,1,2,4),
(2,2,1,14),
(3,2,8,11),
(4,6,10,9),
(5,7,7,6),
(6,9,6,25),
(7,10,9,10),
(8,2,3,9),
(9,3,2,22),
(10,3,1,35);

```
e. Inventory
```sql
delete from inventory;

insert into inventory(inventoryid,productid,laststockupdate)
values(1,2,'2024-01-23'),
(2,1,'2023-11-20'),
(3,3,'2023-09-13'),
(4,8,'2023-12-22'),
(5,6,'2023-09-30'),
(6,8,'2024-02-27'),
(7,9,'2024-03-03'),
(8,10,'2024-03-13'),
(9,1,'2024-04-23'),
(10,3,'2024-04-13');

```
