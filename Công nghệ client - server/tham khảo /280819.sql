--bài tập?
--raise error

--dùng TSQL để tính thời gian làm việc của một người khi biết danh mục khoán đã được thực hiện bởi người đó trong ngày. In ra thời gian làm việc trong ngày của người đó và thời gian tham gia vào ca 3 (22h - 6h).
--ví dụ:
--7h-14h: 28/8/2019: Làm việc X
--8h-11h: 28/8/2019: Làm việc Y
--17h-23h: 28/8/2019: Làm việc Z
--15h-17h: 26/8/2019: Làm việc V
--2h-5h: 29/8/2019: Làm việc U

--Kết quả: 28/8/2019: Thời gian làm việc: 13h, thời gian ca 3: 1h

select top 1 * from NKSLK_ChiTiet

-- insert into NKSLK_ChiTiet(maNKSLK, maNhanCong, gioBatDau, gioKetThuc) values()

select * from NKSLK, NKSLK_ChiTiet
where NKSLK.maNKSLK = NKSLK_ChiTiet.maNKSLK

select * from NKSLK, NKSLK_ChiTiet 
where maNhanCong = 1
and NKSLK.maNKSLK = NKSLK_ChiTiet.maNKSLK
and ngay = '2019-11-29'

declare @gioBatDau time,
	@gioKetThuc time;
(select @gioBatDau = gioBatDau, 
@gioKetThuc = gioKetThuc 
	from NKSLK, NKSLK_ChiTiet 
	where maNhanCong = 1
	and NKSLK.maNKSLK = NKSLK_ChiTiet.maNKSLK
	and ngay = '2019-11-29');

--TH1: giờ bắt đầu ở ngày 1, và giờ kết thúc ở ngày 2
--TH2: giờ bắt đầu ở ngày 1, và giờ kết thúc cũng ở ngày 1
--TH3: giờ bắt đầu ở ngày 2, và giờ kết thúc cũng ở ngày 2

declare /*@gioBatDauCa3 time,
	@gioKetThucCa3 time,*/
	@tongThoiGian time,
	@thoiGianNgay1 float,
	@thoiGianNgay2 float;

--TH1:
if @gioBatDau >= @gioKetThuc
begin
	set @thoiGianNgay1 = datediff(MINUTE, @gioBatDau, '23:59')/60.0;
	set @thoiGianNgay1 = IIF(@thoiGianNgay1 > 2, 2, @thoiGianNgay1);

	set @thoiGianNgay2 = datediff(MINUTE, '0:00', @gioKetThuc)/60.0;
	set @thoiGianNgay2 = IIF(@thoiGianNgay2 > 6, 6, @thoiGianNgay2);
end
--TH2:
if @gioBatDau < @gioKetThuc
begin
	set @thoiGianNgay1 = datediff(MINUTE, @gioBatDau, @gioKetThuc)/60.0;
end

select @thoiGianNgay1 + @thoiGianNgay2;

--end