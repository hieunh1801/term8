use CST_HotelManagement
go

insert into Customer(Name, Gender, PhoneNumber, IdCardNumber) values
(N'Nguyễn Văn A', 1, '0123456789', '1099052552'),
(N'Nguyễn Văn B', 1, '0123456789', '1099052552'),
(N'Nguyễn Thị C', 0, '0123456789', '1099052552'),
(N'Nguyễn Thị D', 0, '0123456789', '1099052552'),
(N'Lê Văn E', 1, '0123456789', '1099052552');

insert into Account(Username, [Password]) values
('user01', '123'),
('user02', '123'),
('user03', '123'),
('user04', '123'),
('user05', '123');

insert into [Service](Name, UnitName, Price) values
(N'Thuê xe máy', 'lần', 100000),
(N'Thuê xe đạp', 'lần', 50000),
(N'Nước ngọt Coca', 'chai', 20000),
(N'Nước ngọt Fanta', 'chai', 20000),
(N'Nước lọc', 'chai', 10000);

insert into Room(Number, [Floor], [Description], [Status], Price) values
(1, 2, N'Phòng 1 Tầng 2…', 0, 200000),
(2, 2, N'Phòng 2 Tầng 2…', 0, 300000),
(3, 2, N'Phòng 3 Tầng 2…', 0, 400000),
(1, 3, N'Phòng 1 Tầng 3…', 0, 350000),
(2, 3, N'Phòng 2 Tầng 3…', 0, 250000);

insert into Booking([Status], Account_Id, Customer_Id) values
(1, 1, 1),
(0, 1, 2);

insert into Booking_Detail(Booking_Id, Room_Id, CheckinDay, CheckoutDay) values
(1, 1, '2019-01-01', '2019-01-03'),
(1, 2, '2019-01-01', '2019-01-03'),
(1, 3, '2019-01-01', '2019-01-03'),
(2, 1, '2019-01-01', '2019-01-03');

insert into Invoice(TotalPrice, Account_Id, Customer_Id, Booking_Id) values
(0, 1, 1, 1),
(0, 1, 2, 1),
(0, 1, 3, 1);

insert into InvoiceService_Detail(Invoice_Id, Service_Id, Quantity, Price) values
(1, 1, 1, 100000),
(1, 1, 2, 100000),
(1, 2, 3, 50000),

(2, 3, 1, 20000),
(2, 4, 2, 220000),

(3, 5, 3, 12000),
(3, 4, 1, 20000),
(3, 5, 2, 20000),
(3, 5, 3, 20000);

insert into InvoiceRoom_Detail(Invoice_Id, Room_Id, CheckinDay, CheckoutDay, Price, DayCount) values
(1, 1, '2019-01-01', '2019-01-02', 200000, 1),
(1, 2, '2019-01-01', '2019-01-03', 320000, 2),
(1, 3, '2019-01-01', '2019-01-03', 380000, 2),

(2, 1, '2019-02-01', '2019-01-02', 200000, 1),
(2, 2, '2019-02-01', '2019-01-03', 320000, 2),
(2, 3, '2019-02-01', '2019-01-03', 380000, 2),

(3, 1, '2019-03-01', '2019-01-02', 200000, 1),
(3, 2, '2019-03-01', '2019-01-03', 320000, 2),
(3, 3, '2019-03-01', '2019-01-03', 380000, 2);

insert into Booking_Detail(Booking_Id, Room_Id, CheckinDay, CheckoutDay, DepositAmount) values
(1, 1, '2019-11-01', '2019-11-02', 100000),
(2, 2, '2019-12-01', '2019-12-02', 200000);

use master
go