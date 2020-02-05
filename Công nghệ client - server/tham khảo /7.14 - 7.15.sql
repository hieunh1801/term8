use NKSLK
go

--7.14
create function tinhTongLuong(@maNhanCong int)
returns float
as
begin
	return (select sum(dbo.tinhLuongNKSLK(@maNhanCong, NKSLK_ChiTiet.maNKSLK)) from NKSLK_ChiTiet, NKSLK
		where NKSLK_ChiTiet.maNKSLK = NKSLK.maNKSLK and maNhanCong = @maNhanCong)
end

select top 1 maNhanCong, dbo.tinhTongLuong(maNhanCong) from NhanCong order by dbo.tinhTongLuong(maNhanCong) desc;
select top 1 maNhanCong, dbo.tinhTongLuong(maNhanCong) from NhanCong order by dbo.tinhTongLuong(maNhanCong) asc;

--7.15

--
/*drop function tinhDauCuoiTuan
create function tinhDauCuoiTuan(@ngay date)
returns table
as
	return SELECT DATEADD(DAY, 2 - DATEPART(WEEKDAY, @ngay), CAST(@ngay AS DATE)) [ngayBatDau], 
	DATEADD(DAY, 8 - DATEPART(WEEKDAY, @ngay), CAST(@ngay AS DATE)) [ngayKetThuc]
go

create function chuNhatTiep(@ngay date)
returns date
as
	return 

select * from dbo.tinhDauCuoiTuan(getdate());

--hàm tính ngày của tuần, trả về ngày bắt đầu và ngày kết thúc của tuần
create function tinhNgayTuan(@soTuan int, @thang int, @nam int)
returns table
as
begin
	if @soTuan = 0
			
end

create function soGioTrongTuan(@maNhanCong int, @soTuan int, @thang int, @nam int)
returns float
as
begin
	
end*/

use master
go