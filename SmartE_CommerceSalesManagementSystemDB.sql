Create database SmartE_CommerceSalesManagementSystemDB

use SmartE_CommerceSalesManagementSystemDB;

Create table Users(
Id int identity  not null Primary key,
Name Nvarchar (50) not null,
PhoneNo varchar (20) not null Unique,
Address nvarchar (max) not null,
EmailAdress varchar (50) unique

)

Insert into Users (Name,PhoneNo,Address,EmailAdress)
Values ('Mezanur','01880321944','Nort Gumdum','rmezanur521@gmail.com')

Insert into Users (Name,PhoneNo,Address,EmailAdress)
Values ('Tufile','01575427662','Coxs bazar','nrufile3453@gmail.com')

--join 
--select colums from table1 inner join table2 on table1.columname = table2.columnname
Select * from Products
select * from Users
Select * from Users left join Products on Users.Id = Products.Id
Select * from Users right join Products on Users.Id = Products.Id
Select * from Users inner join Products on Users.Id = Products.Id
Select * from Users full join Products on Users.Id = Products.Id


Create table Products(
Id int identity  not null Primary key,
SellerId int  not null foreign key references Users(Id),
Name Nvarchar (50) not null,
Price decimal (10,2) not null,
StockQty int 
)

insert into Products Values (2,'Mobile',21999.99,15),
(1,'$4 ports Hub',205.00,30)
Insert into Products Values (3,'Digital Watch',400.00,9),
(3,'Send Watch',1100.00,900)

Update Products set Name ='4 Ports Hub' where Id =3--Update
--Delete from Products where Id = 3

Select Name from Products--Onlye Products
Select * from Products Where Price = 100
Select * from Products Where Price >= 500
Select * from Products Where Price = 100 and StockQty = 10
Select * from Products Where Price = 100 or StockQty = 6
Select * from Products Where not Price = 100 or StockQty = 6 --not
Select * from Products Where Price in (100,500)
Select * from Products Where Price between 100 and 500
Select * from Products Where Price not between 100 and 500
Select * from Products order by Price asc
Select * from Products as Stock order by StockQty desc
Select top 4 Name from Products
Select top 4 * from Products
Select Min(Price) from Products
Select Max(StockQty ) as StuckQty from Products 
--Counts
Select count(*) Products
Select Sum(StockQty) from Products
--Average
Select Avg(StockQty) from Products
--Union
Select Name from Users
Union
Select Name from Products
Select Name from Users Union all Select Name from Products


select Name from Products Group by Name 
select * from Products
select count(SellerId), Name
from Products
Group by Name 
order by count(SellerId) desc

select count(Id), Name
from Products
Group by Name 
order by count(Id) asc


Create table Orders(
Id int identity  not null Primary key,
UserId int not null foreign key references Users(Id),
OrderDate dateTime ,
TotalAmount decimal (12,2) 
)

Insert into Orders Values (2,GETDATE(),21999.99),
(1,GetDate(),305.00)
Insert into Orders Values (2,GETDATE(),40000.00),
(2,GETDATE(),35000.00),
(3,GETDATE(),1800.00)
select * from Orders


Create table OrderDetails(
Id int identity  not null Primary key,
OrderId int not null foreign key references Orders(Id),
ProductId int not null foreign key references Products(Id),
Quantity int,
UnitPrice decimal (15,2)
)


insert into OrderDetails values (2,1,1,100.00),(2,3,1,205.00)
select * from OrderDetails


Create table Payments(
Id int identity  not null Primary key,
OrderId int not null foreign key references Orders(Id),
Amount decimal (15,2),
PaymentDate dateTime
)

Insert into Payments Values (2,100.00,GetDate()),(2,205.00,GETDATE())
Select * from Payments 


Create table Reviews(
Id int identity  not null Primary key,
UserId int not null foreign key references Users(Id),
ProductId int not null foreign key references Products(Id),
Comment Nvarchar (Max)
)

Insert into Reviews Values(1,1,'Very nice product')
Select * from Reviews

Create table InventoryLogs(
Id int identity  not null Primary key,
ProductId int not null foreign key references Products(Id),
ChangeQtuantity int not null,
Reason Nvarchar (Max),
LogDate dateTime
)

Insert into InventoryLogs  Values (1,9,'Sold',GetDate())
select * from InventoryLogs 

select * from Users
select * from Products
select * from Orders
select * from OrderDetails
select * from Payments
select * from Reviews
select * from InventoryLogs 