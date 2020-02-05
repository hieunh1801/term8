use CNCS_191023
go

--trigger trên bảng NKSLK để kiểm tra đã tồn tại NKSLK hay chưa
--khi insert vào 

--Bảng Dữ liệu Công việc Khoán gồm các cột sau
--Mã khoán
--Tên khoán
--Hệ số lương
--Định mức khoán
--Đơn vị khoán, Công đoạn (Tổ sản xuất)
--Định mức lao động
--Đơn giá

--Viết một trigger trên bảng Công việc Khoán để kiểm tra đã tồn tại công việc Khoán hay chưa
--khi insert vào bảng một Công việc Khoán mới.
--Nếu đã tồn tại → thông báo lỗi, ngược lại insert dữ liệu vào bảng.
--Biết công việc khoán được gọi là trùng khi có mã khoán trùng

create table DuLieuCongViecKhoan
(
	maKhoan int,
	tenKhoan nvarchar(50),
	heSoLuong float,
	dinhMucKhoan float,
	donViKhoan nvarchar(20),
	dinhMucLaoDong float,
	donGia float
)
go

alter trigger kiemTraTonTai on DuLieuCongViecKhoan
instead of insert
as
begin
	if ((select count(*) from DuLieuCongViecKhoan where maKhoan = (select maKhoan from inserted)) > 0)
	begin
		print(N'Không thể có dữ liệu công việc khoán trùng mã khoán.')
	end
	else
	begin
		insert into DuLieuCongViecKhoan
			select inserted.maKhoan, inserted.tenKhoan, inserted.heSoLuong, 
				inserted.dinhMucKhoan, inserted.donViKhoan, inserted.dinhMucLaoDong,
				inserted.donGia from inserted
	end
end
select * from DuLieuCongViecKhoan
insert into DuLieuCongViecKhoan(maKhoan) values (2)