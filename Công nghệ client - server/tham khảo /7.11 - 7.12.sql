use NKSLK
go

--7.11
select * from NhanCong, NKSLK_ChiTiet, NKSLK, DanhMucKhoan_ChiTiet, SanPham, CongViec
where NhanCong.maNhanCong = NKSLK_ChiTiet.maNhanCong
and NKSLK_ChiTiet.maNKSLK = NKSLK.maNKSLK and NKSLK.maNKSLK = DanhMucKhoan_ChiTiet.maNKSLK
and DanhMucKhoan_ChiTiet.maSanPham = SanPham.maSanPham
and DanhMucKhoan_ChiTiet.maCongViec = CongViec.maCongViec
and month(NKSLK.ngay) = 6 and year(NKSLK.ngay) = 2019
order by NhanCong.maNhanCong

--7.12
create function tinhThoiGian(@gioBatDau time, @gioKetThuc time)
returns float
as
begin
	declare @tongSoPhut float

	if datediff(minute, @gioBatDau, @gioKetThuc) < 0
		set @tongSoPhut = datediff(minute, @gioBatDau, '23:59') + datediff(minute, '00:00', @gioKetThuc);
	else
		set @tongSoPhut = datediff(minute, @gioBatDau, @gioKetThuc);

	return @tongSoPhut
end
go

create function tinhLuongNKSLK(@maCongNhan int, @maNKSLK int)
returns float
as
begin
	--tổng thời gian cá nhân và tổng thời gian nhóm
	declare @tongThoiGianCaNhan float,
		@tongThoiGianNhom float;
	set @tongThoiGianNhom = (select sum(dbo.tinhThoiGian(gioBatDau, gioKetThuc)) from NKSLK_ChiTiet where maNKSLK = @maNKSLK);
	set @tongThoiGianCaNhan = (
		select sum(dbo.tinhThoiGian(gioBatDau, gioKetThuc)) from NKSLK_ChiTiet where maNKSLK = @maNKSLK
			and maNhanCong = @maCongNhan and maNKSLK = @maNKSLK
	);

	declare @tongTien float;
	set @tongTien = (
		select sum(sanLuongThucTe * donGia) from DanhMucKhoan_ChiTiet, CongViec
		where maNKSLK = @maNKSLK and DanhMucKhoan_ChiTiet.maCongViec = congViec.maCongViec
	);

	return @tongTien * @tongThoiGianCaNhan / @tongThoiGianNhom;
end

create function tinhLuongThang(@maNhanCong int, @thang int, @nam int)
returns float
as
begin
	--danh sách nhật ký sản lượng khoán mà công nhân tham gia
	declare @danhSachNKSLK table (maNKSLK int);
	insert into @danhSachNKSLK select NKSLK.maNKSLK from NKSLK, NKSLK_ChiTiet, NhanCong
	where NKSLK.maNKSLK = NKSLK.maNKSLK and NKSLK_ChiTiet.maNhanCong = NhanCong.maNhanCong
	and month(NKSLK.ngay) = @thang and year(NKSLK.ngay) = @nam;

	declare @tongLuongThang float;

	set @tongLuongThang = (select sum(dbo.tinhLuongNKSLK(maNhanCong, NKSLK_ChiTiet.maNKSLK)) from NKSLK_ChiTiet, NKSLK
	where NKSLK_ChiTiet.maNKSLK = NKSLK.maNKSLK and maNhanCong = @maNhanCong
	and month(NKSLK.ngay) = @thang and year(NKSLK.ngay) = @nam);

	return @tongLuongThang;
end

select dbo.tinhLuongThang(1, 9, 2019)
go

use master
go