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
Tasks 2: Select, Where, Between, AND, LIKE:

2.1. Write an SQL query to retrieve the names and emails of all customers.
```sql
select firstname,lastname,email from customers;
```
2.2. Write an SQL query to list all orders with their order dates and corresponding customer names.
```sql
select orderid,orderdate,firstname from orders,customers 
where orders.customerid=customers.customerid;
```

2.3.Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
```sql
insert into customers(customerid,firstname,lastname,email,address)
values (11,'xyz','abc','xyz@gmail.com','orissa');
```

2.4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
```sql
update products set price = price+ ((10*price)/100);
select * from products;
```

2.5. Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
```sql
delete from orders where orderid=2;
select * from orders;
select * from orderdetails;
```


2.6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.
```sql
insert into orders(orderid,customerid,orderdate,totalamount)
values(11,2,'2022-01-23',50000);
```

2.7. Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information.
```sql
update customers set email='divyagayatrimetta@gmail.com',address='telangana' where customerid=1;
select * from customers;
```
2.8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.

```sql
    update Orders
    set TotalAmount =
    (select (od.Quantity * p.Price) as TotalAmount from Products p
    join OrderDetails od on p.ProductID = od.ProductID where
    od.OrderID = Orders.OrderID);


    select * from orders;

    select * from orderdetails;
```

2.9. Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.
```sql
delete from orders where customerid=3;
select * from orders;
select * from orderdetails;
```

2.10. Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details
```sql
insert into products(productid,productname,description,price)
values(11,'Laptop','for technical things',60000);
```
2.11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.
```sql
alter table orders add column status varchar(30);
update orders set status='pending' ;
update orders set status='shipped' where orderid in ( 3,4,5,6);
select * from orders;
```

2.12. Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.

```sql
    --By creating a new column in the Customers Table

    alter table Customers
    add NoofOrders int;

    update Customers
    set NoofOrders = (select count(OrderId) from Orders where Orders.CustomerID = Customers.CustomerId);

   -- Without Creating a new column

    select CustomerId, count(OrderId) as NoofOrders from Orders group by CustomerID;
```
## Task 3
3.1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., -- customer name) for each order.
```sql
select orders.orderid,customers.* from orders 
inner join customers 
on orders.customerid = customers.customerid
group by orders.orderid;

select orderid,firstname from customers,orders where orders.customerid=customers.customerid;
```
3.2. Write an SQL query to find the total revenue generated by each electronic gadget product. 

```sql
    select ProductName, (od.Quantity * p.Price)
    as TotalRevenue from Products p inner join OrderDetails od
    on p.ProductID = od.ProductID;
```


3.3. Write an SQL query to list all customers who have made at least one purchase. Include their  names and contact information.
```sql
    select FirstName, LastName, Email, Address from Customers inner join Orders on Customers.CustomerID = Orders.CustomerID;
```


3.4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered.

```sql
    select ProductName, Quantity from Products inner join
    ( select top 1 Quantity, ProductID from OrderDetails order by Quantity desc ) as i
    on Products.ProductID = i.ProductID;
```
3.5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.
```sql
select productname,description from products;
```


3.6. Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value.

```sql
select * from orders;
select * from customers;
select customers.customerid, sum( orders.totalamount/customers.number_orders ) as average_order_value from customers
inner join orders
on customers.customerid = orders.customerid
group by customers.customerid;
```
 

3.7. Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.


```sql
    select top 1 FirstName, OrderID, TotalAmount from Customers inner join Orders
    on Customers.CustomerID = Orders.CustomerID order by TotalAmount desc;
```

3.8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered.


```sql
   select pr.ProductName, Quantity as NoOfTimes from Products pr inner join OrderDetails od on
    pr.ProductID = od.ProductID;
```


3.9. Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter

```sql
select customers.firstname ,products.productname
from  orders inner join orderdetails 
on orders.orderid= orderdetails.orderid inner join products
on products.productid = orderdetails.productid inner join customers
on customers.customerid = orders.customerid;
```
 


3.10. Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters
```sql
select * from orders;
select sum(orders.totalamount) 
from  orders where orders.orderdate between '2020-01-01' and '2023-12-30';
```

# Task-4:

4.1. Write an SQL query to find out which customers have not placed any orders.
```sql
    select FirstName, LastName from Customers where CustomerID not in (select CustomerID from Orders);
```

4.2. Write an SQL query to find the total number of products available for sale.


```sql
    select count(ProductName) as NumberOfProducts from Products where ProductID in
    (select ProductID from Inventory where QuantityInStock > 0);
```

4.3. Write an SQL query to calculate the total revenue generated by TechShop.
```sql
select * from orders;
select sum(totalamount) as total_rvenue from orders;
```

4.4. Write an SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter.

```sql
    declare @n int = 1;

    select Category, avg(Quantity) as AvgOrder from
    (select p.Category, od.Quantity from Products p join OrderDetails od on
    p.ProductID = od.ProductID where p.Category = @n) as i
    group by Category;
```
4.5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter

```sql
    Declare @c int = 10;

    select sum(TotalAmount) as TotalRevenue from Orders where CustomerID = @c;
```
4.6. Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed
```sql
select * from customers;
select firstname,number_orders from customers where number_orders = (select max(number_orders) from customers);
```
4.7. Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders 
```sql
select p.productname,p.description,o.quantity 
from products p inner join orderdetails o
on p.productid = o.productid
order by o.quantity desc limit 1;

select productname,description,quantity from products,orderdetails where quantity =  (select max(quantity) from orderdetails);

```


4.8. Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending.

 ```sql
 select c.firstname , o.totalamount 
 from customers c inner join orders o
 on c.customerid=o.customerid
 order by o.totalamount desc limit 1;
```
 
 
 4.9. Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.

```sql
select customers.customerid, sum( orders.totalamount/customers.number_orders ) as average_order_value from customers
inner join orders
on customers.customerid = orders.customerid
group by customers.customerid;
```

4.10. Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count

```sql
select customers.customerid,customers.firstname,count(orders.orderid) as number_orders from customers inner join orders 
on customers.CustomerID = orders.CustomerID 
group by customers.CustomerID 
order by customers.CustomerID;
```







