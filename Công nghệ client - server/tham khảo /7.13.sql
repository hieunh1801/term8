use NKSLK
go

create function soGioCa3(@batDau time, @ketThuc time)
returns float
as
begin
	declare @soPhutNgay1 float,
		@soPhutNgay2 float;
	set @soPhutNgay1 = 0;
	set @soPhutNgay2 = 0;

	--thời gian là cùng 1 ngày
	if datediff(minute, @batDau, @ketThuc) >= 0
		--thời gian kết thúc là trước 22:00 thì trả về 0
		if datediff(minute, @ketThuc, '22:00') >= 0
			return 0;
		else
		begin
			set @soPhutNgay1 = datediff(minute, @batDau, @ketThuc);
			set @soPhutNgay1 = iif(@soPhutNgay1 > 120, 120, @soPhutNgay1);
		end

	--thời gian là khác ngày
	if datediff(minute, @batDau, @ketThuc) < 0
	begin
		set @soPhutNgay1 = datediff(minute, @batDau, '23:59');
		set @soPhutNgay2 = datediff(minute, '00:00', @ketThuc);

		--ca 3 bắt đầu từ 22 giờ nên tối đa ngày 1 chỉ có 2 tiếng = 120 phút, ngày 2 có 6 tiếng = 360 phút
		set @soPhutNgay1 = iif(@soPhutNgay1 > 120, 120, @soPhutNgay1);
		set @soPhutNgay2 = iif(@soPhutNgay2 > 360, 360, @soPhutNgay2);
	end
	
	return (@soPhutNgay1 + @soPhutNgay2)/60;
end

create function soGioCong(@maNhanCong int, @thang int, @nam int)
returns float
as
begin
	declare @soGioCa3 float,
		@soGioCaKhac float;
	
	set @soGioCa3 = (select sum(dbo.soGioCa3(gioBatDau, gioKetThuc)) from NKSLK_ChiTiet, NKSLK where
		month(ngay) = @thang and year(ngay) = @nam and maNhanCong = @maNhanCong);
	set @soGioCaKhac = (select sum(dbo.tinhThoiGian(gioBatDau, gioKetThuc)) from NKSLK_ChiTiet, NKSLK where
		month(ngay) = @thang and year(ngay) = @nam and maNhanCong = @maNhanCong) - @soGioCa3;

	return @soGioCa3 * 1.3 + @soGioCaKhac;
end

create function soNgayCong(@maNhanCong int, @thang int, @nam int)
returns float
as
begin
	return dbo.soGioCong(@maNhanCong, @thang, @nam) / 8;
end

select dbo.soNgayCong(1, 2, 2019)
go

use master
go