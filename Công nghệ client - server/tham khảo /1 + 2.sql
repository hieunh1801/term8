use master
go

if exists (select * from sys.databases where name='NKSLK')
	drop database NKSLK
go
-- 1.

create database NKSLK
on 
(
	name='NKSLK',
	filename='C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\NKSLK.mdf',
	size = 40MB, 
	maxsize = 50MB, 
	filegrowth = 10%
)
log on
(
	name='NKSLK_log',
	filename='C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\NKSLK.ldf',
	size = 10MB,
	maxsize = 15MB,
	filegrowth = 1MB
)
go

-- 2.

alter database NKSLK
modify file (name='NKSLK', size=45MB)
go

alter database NKSLK
modify file (name='NKSLK_log', maxsize=18MB)
go

use master
go