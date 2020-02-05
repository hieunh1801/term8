USE master
GO
drop DATABASE testting
go 

CREATE DATABASE testting
GO

---- tạo ràng buộc trên domain 
EXEC sp_addtype zipcode, 'char(10)', NULL 
EXEC sp_addtype longstring, 'varchar(50)', NULL
EXEC sp_droptype zipcode -- xóa kiểu dữ liệu

----- Tạo ràng buộc trên 
-- DMLOP(MaLop, TenLop), 
-- SinhVien(MaSV, MaLop, Hoten, Ngaysinh, Diachi)
CREATE TABLE [dbo].[DMLOP] (
    [MaLop] [varchar](10)  NOT NULL ,	
    [TenLop] [nvarchar] (50) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SinhVien] ( 
    [MaSV] [varchar] (10)  NOT NULL ,
    [MaLop] [varchar] (10)  NULL ,
    [Hoten] [nvarchar] (39)  NOT NULL , 
    [Diachi] [nvarchar] (50)  NULL , 
    [NgaySinh] [datetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DMLOP] ADD CONSTRAINT [PK_DMLOP] PRIMARY KEY  CLUSTERED ( [MaLop])  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SinhVien] ADD CONSTRAINT [PK_SinhVien] PRIMARY KEY  CLUSTERED ([MaSV])  ON [PRIMARY] 
GO


-- Ví dụ: Trigger
USE test
go
CREATE TABLE NhanVien
(   
    MA_NV  VARCHAR(5)  ,   
    HOTENNV varchar(30) NOT NULL,   
    DIACHI varchar(50) NOT NULL,   
    Luong Money,   
    PhuCap Money,   
    Tong  Money	
)
GO
Create Trigger trig1 ON  
NhanVien FOR insert, update
As 
	if  update(luong) or update (phucap)
	Update nhanvien set tong= luong+phucap


-- Vis du trigger 
CREATE TABLE emp_mgr  (
    emp CHAR(2) PRIMARY KEY, 
    mgr CHAR(2) NULL,  
    NoOfReports INT DEFAULT 0,-- so nhan vien cap duoi  
    CONSTRAINT fk_emp FOREIGN KEY (mgr) REFERENCES emp_mgr (emp) 
) 