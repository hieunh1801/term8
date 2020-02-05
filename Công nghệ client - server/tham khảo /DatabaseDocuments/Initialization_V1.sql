use master
go

if exists (select name from sys.databases where name = 'CST_HotelManagement')
	drop database CST_HotelManagement

create database CST_HotelManagement
go

use CST_HotelManagement
go

/*Bảng hệ thống?*/

create table Menu
(
	Id int primary key identity(1,1),
	Name nvarchar(20),
	ParentId int,
	Icon varchar(20),
	URL varchar(30),
	I int
)
go


--Khách hàng
create table Customer
(
	Id int primary key identity(1,1),
	Name nvarchar(50),
	Gender int,
	--[Address] nvarchar(100),
	PhoneNumber varchar(13),
	IdCardNumber varchar(10), --Số chứng minh nhân dân
)
go

/*Các bảng thông tin*/
--Nhân viên, kiêm đăng nhập
create table Account
(
	Id int primary key identity(1,1),
	Name nvarchar(50),
	Gender int,
	[Address] nvarchar(50),
	PhoneNumber varchar(13),

	DateOfBirth date,
	Hometown nvarchar(50),

	Username varchar(20),
	[Password] varchar(32), --Lưu lại 32 ký tự được băm
	AvatarURL varchar(200),
)
go

--Đặt phòng
create table Booking
(
	Id int primary key identity(1,1), 
	DateCreated datetime default getdate(),
	[Status] bit,

	Account_Id int foreign key references Account(Id),
	Customer_Id int foreign key references Customer(Id)
)
go

--Hóa đơn
create table Invoice
(
	Id int primary key identity(1,1),
	DateCreated datetime default getdate(),
	TotalPrice int,
	
	Account_Id int foreign key references Account(Id),
	Customer_Id int foreign key references Customer(Id),
	Booking_Id int foreign key references Booking(Id)
)
go

--Dịch vụ
create table [Service]
(
	Id int primary key identity(1,1),
	Name nvarchar(50),
	UnitName nvarchar(20),
	Price int
)
go

--Phòng
create table Room
(
	Id int primary key identity(1,1),
	Number int,
	[Floor] int,
	[Description] nvarchar(250),
	[Status] int,
	Price int
)
go

/*Các bảng chi tiết và ánh xạ*/
--Chi tiết Dịch vụ của Hóa đơn
create table InvoiceService_Detail
(
	Id int primary key identity(1,1),
	Invoice_Id int foreign key references Invoice(Id), 
	Service_Id int foreign key references [Service](Id),
	Quantity int,
	Price int
)
go

--Chi tiết Thuê phòng của Hóa đơn
create table InvoiceRoom_Detail
(
	Id int primary key identity(1,1),
	Invoice_Id int foreign key references Invoice(Id),
	Room_Id int foreign key references Room(Id),
	CheckinDay datetime,
	CheckoutDay datetime,
	Price int,
	DayCount int
)

--Chi tiết Đặt phòng
create table Booking_Detail
(
	Id int primary key identity(1,1),
	Booking_Id int foreign key references Booking(Id),
	Room_Id int foreign key references Room(Id),
	CheckinDay datetime,
	CheckoutDay datetime,
	DepositAmount int
)
go