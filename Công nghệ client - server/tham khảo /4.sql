use NKSLK
go

--đặt khóa chính cho các bảng

alter table NKSLK
drop column maNKSLK
alter table NKSLK
add maNKSLK int identity (1,1)
primary key(maNKSLK)
go

alter table NKSLK_ChiTiet
drop column maChiTiet
alter table NKSLK_ChiTiet
add maChiTiet int identity (1,1)
primary key(maChiTiet)
go

alter table DanhMucKhoan_ChiTiet
drop column maChiTiet
alter table DanhMucKhoan_ChiTiet
add maChiTiet int identity (1,1)
primary key(maChiTiet)
go

alter table CongViec
drop column maCongViec
alter table CongViec
add maCongViec int identity (1,1)
primary key(maCongViec)
go

alter table NhanCong
drop column maNhanCong
alter table NhanCong
add maNhanCong int identity (1,1)
primary key(maNhanCong)
go

alter table SanPham
drop column maSanPham
alter table SanPham
add maSanPham int identity (1,1)
primary key(maSanPham)
go

--đặt khóa ngoại

alter table NKSLK_ChiTiet
add
	constraint fk_maNKSLK foreign key (maNKSLK) references NKSLK(maNKSLK),
	constraint fk_maNhanCong foreign key (maNhanCong) references NhanCong(maNhanCong)
go

alter table DanhMucKhoan_ChiTiet
add
	constraint fk_maNKSLK_2 foreign key (maNKSLK) references NKSLK(maNKSLK),
	constraint fk_maCongViec foreign key (maCongViec) references CongViec(maCongViec),
	constraint fk_maSanPham foreign key (maSanPham) references SanPham(maSanPham)
go

--đặt chỉ mục

--create index ind_ca on NKSLK_ChiTiet(ca);

create index ind_maNKSLK on NKSLK_ChiTiet(maNKSLK);
create index ind_maNhanCong on NKSLK_ChiTiet(maNhanCong);

create index ind_maNKSLK_2 on DanhMucKhoan_ChiTiet(maNKSLK);
create index ind_maCongViec on DanhMucKhoan_ChiTiet(maCongViec);
create index ind_maSanPham on DanhMucKhoan_ChiTiet(maSanPham);

create index ind_phongBan on NhanCong(phongBan);
create index ind_chucVu on NhanCong(chucVu);

create index ind_donViKhoan on CongViec(donViKhoan);

use master
go