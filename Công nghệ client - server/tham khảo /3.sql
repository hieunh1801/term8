use NKSLK
go

--Nhật ký Sản lượng khoán
create table NKSLK
(
	maNKSLK int, --mã Nhật ký Sản lượng khoán
	ngay date, --ngày
	--ca tinyint --ca 1, 2, 3
	--ca 1: 6 - 14h
	--ca 2: 14 - 22h
	--ca 3: 22 - 6h
)
go

--Nhật ký Sản lượng khoán_Chi tiết
create table NKSLK_ChiTiet
(
	maChiTiet int, --mã Chi tiết
	maNKSLK int, --mã Nhật ký Sản lượng khoán
	maNhanCong int, --mã Nhân công
	gioBatDau time, --giờ Bắt đầu
	gioKetThuc time, --giờ Kết thúc
)
go

--Danh mục khoán:
--danh sách các công việc được giao cho một nhân công, hoặc một nhóm nhân công
--không cần thiết phải tạo, nếu như nối luôn Chi tiết của Danh mục khoán vào Nhật ký Sản lượng
/*create table DanhMucKhoan
(
	maDMK int, --mã danh mục khoán
	tenDMK nvarchar(50), --tên danh mục khoán
)*/

--Danh mục khoán_Chi tiết:
--các công việc đã hoàn thành trong Nhật ký Sản lượng
create table DanhMucKhoan_ChiTiet
(
	maChiTiet int, --mã Chi tiết
	maNKSLK int, --mã Nhật ký Sản lượng khoán
	maCongViec int, --mã Công việc
	sanLuongThucTe float, --sản lượng Thực tế
	soLoSanPham varchar(20), --số lô Sản phẩm
	maSanPham int --mã Sản phẩm/áp dụng cho Sản phẩm
)

--Công việc
create table CongViec
(
	maCongViec int, --mã Công việc
	tenCongViec nvarchar(50), --tên Công việc
	dinhMucKhoan float, --Định mức khoán
	donViKhoan nvarchar(20), --Đơn vị khoán
	heSoKhoan float, --Hệ số khoán
	dinhMucLaoDong float, --Định mức lao động
	donGia float --Đơn giá = 126 360*Hệ số khoán*Định mức lao động/Định mức khoán
)

--nhân công
create table NhanCong
(
	maNhanCong int, --mã nhân công
	hoTen nvarchar(50), --họ tên
	ngaySinh date, --ngày sinh
	phongBan nvarchar(50), --phòng ban
	chucVu nvarchar(50), --chức vụ
	queQuan nvarchar(50), --quê quán
	luongBaoHiem float --lương bảo hiểm
)

--sản phẩm
create table SanPham
(
	maSanPham int, --mã sản phẩm
	tenSanPham nvarchar(50), --tên sản phẩm
	soDangKy varchar(20), --số đăng ký
	hanSuDung date, --hạn sử dụng
	quyCach nvarchar(20), --quy cách
	ngayDangKy date --ngày đăng ký
)

use master
go