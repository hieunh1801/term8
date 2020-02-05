--exec as user = 'sa';
use master
go

/*
Đăng nhập vào MS SQL Server với sa. Tạo một user mới tên User01 với tên đăng nhập là User01 và mật khẩu đăng nhập là Abc123456@
- Cấp quyền cho User01 được quyền truy xuất trên một bảng nào đó trong cơ sở dữ liệu
- Đăng nhập vào với User01 và tạo một user mới User02. Cấp các quyền cho User02 bằng lệnh Grant
- Đòi lại các quyền đã cấp cho User02 bằng User01.
- Đòi lại các quyền đã cấp cho User02 bằng sa.
*/

/*==================================*/
--Tạo cơ sở dữ liệu
if exists (select * from sys.databases where name = 'cst_040919')
drop database cst_040919
go

create database cst_040919
go

use cst_040919
go

create table test_table
(
	column_1 int,
	column_2 nvarchar(50)
)
go

/*==================================*/
--Tạo đăng nhập
if exists (select * from sys.server_principals where name = 'User01')
	drop login User01
go

create login User01 with password = 'Abc123456@'
go

/*==================================*/
--Tạo người dùng
if exists (select * from sys.sysusers where name = 'User01')
	drop user User01
go

create user User01 for login User01
go

--Gán quyền
grant select on test_table to User01
go

grant alter any User to User01
go

use master
go

grant alter any login to User01
go

/*==================================*/
--Đăng nhập vào bằng User01, tạo User02, cấp quyền bằng lệnh Grant
--exec as user = 'User01';

use cst_040919
go

if exists (select * from sys.server_principals where name = 'User02')
	drop login User02
go

create login User02 with password = 'Abc123456@'
go

if exists (select * from sys.sysusers where name = 'User02')
	drop user User02
go

create user User02 for login User02
go

grant select on test_table to User02
go

/*==================================*/
--Đòi quyền đã cấp
--exec as user='User01';

revoke select on test_table from User02
go

