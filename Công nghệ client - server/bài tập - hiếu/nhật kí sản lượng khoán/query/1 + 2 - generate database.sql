use master
go

if exists (select * from sys.databases where name='NKSLKDB')
	drop database NKSLKDB
go
-- 1.

create database NKSLKDB
on
(
	name='NKSLKDB',
	filename='/home/hieunguyen/Database/NKSLKDB.mdf',
	size = 40MB,
	maxsize = 50MB,
	filegrowth = 10%
)
log on
(
	name='NKSLKDB_log',
	filename='/home/hieunguyen/Database/NKSLKDB_log.ldf',
	size = 10MB,
	maxsize = 15MB,
	filegrowth = 1MB
)
go

-- 2.

alter database NKSLKDB
modify file (name='NKSLKDB', size=45MB)
go

alter database NKSLKDB
modify file (name='NKSLKDB_log', maxsize=18MB)
go



