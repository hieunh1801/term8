-- Bài tập - Đề bài:

-- Dùng TSQL để tính thời gian làm việc của một người khi biết danh mục khoán đã được thực hiện bởi người đó trong ngày. 
-- In ra thời gian làm việc trong ngày của người đó và thời gian tham gia vào ca 3 (22h - 6h).
--ví dụ:
--7h-14h: 28/8/2019: Làm việc X
--8h-11h: 28/8/2019: Làm việc Y
--17h-23h: 28/8/2019: Làm việc Z
--15h-17h: 26/8/2019: Làm việc V
--2h-5h: 29/8/2019: Làm việc U

--Kết quả: 28/8/2019: Thời gian làm việc: 13h, thời gian ca 3: 1h

-- Phân tích:
-- input(maNhanCong, ngay)
-- output:
    -- message: kết quả: 28/02/2019
    -- Bài 1: tính tổng thời gian làm việc: 13h
    -- Bài 2: tính thời gian làm việc ca 3
    -- output: danh sách h, công việc

-- các trường hợp:
    -- Tính Ca 3: tính từ 22h -> 5h hôm sau
    -- Một lúc làm nhiều công việc. Trùng h.
    -- Thời gian làm việc của 1 ngày. từ 5h sáng tới 5h sáng hôm sau.
        -- VD: 5h ngày 28/01/2019 => 5h ngày 29/01/2019: tính cho ngày 28/01/2019

-- Cách 1: tạo bảng tạm => đếm số giờ. tạo bảng tạm: stt, nhân viên, ngày, số giờ (ghi mốc giờ: 7h, 8h)
-- Cách 2: sort lại theo thứ tự @gioBatDau => trừ đi các khoảng trống ở giữa (không bị trùng). 
    -- Cột giờ => lưu lại từ 6 => 30h
    -- Order theo ngày
-------------------- Insert data
insert into NKSLK(ngay) values('2020-01-14') -- 31
insert into NKSLK_ChiTiet(maNKSLK, maNhanCong, gioBatDau, gioKetThuc)
values
(31, 1, '7:00:00', '14:00:00'),
(31, 1, '8:00:00', '11:00:00'),
(31, 1, '17:00:00', '23:00:00'),
(31, 1, '15:00:00', '17:00:00'),
(32, 1, '2:00:00', '5:00:00')

--------------------
select * from NKSLK
select * from NKSLK_ChiTiet

-- chi tiết công việc đã làm trong ngày 2020-01-13
select nkslk.maNKSLK, nkslk.ngay, ct.gioBatDau, ct.gioKetThuc, ct.maNhanCong, ct.maChiTiet
from NKSLK as nkslk 
    inner join NKSLK_ChiTiet as ct on nkslk.maNKSLK = ct.maNKSLK
where (nkslk.ngay = '2020-01-13' and ct.gioKetThuc >= '05:00:00') -- ngày cần select
    or (nkslk.ngay = '2020-01-14' and ct.gioBatDau < '05:00:00')  -- ngày tiếp theo
    and ct.maNhanCong=1

-- Khai báo biến để lưu nội dung đọc -----------------------
use NKSLKDB
go 

declare @ngay1 date
declare @ngay2 date 
set @ngay1 = '2020-01-13'
set @ngay2 = '2020-01-14'

declare @ngay date       -- bien luu noi dung doc
declare @gioBatDau time  -- bien luu noi dung doc
declare @gioKetThuc time -- bien luu noi dung doc

declare @total float     -- bien luu tong so gio ket qua cuoi cung
set @total = 0

declare @tongSoGioCa3 float -- bien luu tong so gio ca 3
set @tongSoGioCa3 = 0

declare cursorChiTietNKSL cursor FOR
    select  nkslk.ngay, ct.gioBatDau, ct.gioKetThuc
    from NKSLK as nkslk 
        inner join NKSLK_ChiTiet as ct on nkslk.maNKSLK = ct.maNKSLK
    where (nkslk.ngay = @ngay1 and ct.gioKetThuc >= '05:00:00')
        or (nkslk.ngay = @ngay2 and ct.gioBatDau < '05:00:00')     

open cursorChiTietNKSL
fetch next from cursorChiTietNKSL into @ngay, @gioBatDau, @gioKetThuc -- lay ra dong so 1

while @@FETCH_STATUS = 0
begin
    if DATEDIFF(DAY, @ngay, @ngay1) = 0
        -- tinh so gio ca 3
        if DATEDIFF(MINUTE, '22:00:00', @gioKetThuc) > 0
            if DATEDIFF(MINUTE,'22:00:00', @gioBatDau) > 0
                set @tongSoGioCa3 += DATEDIFF(MINUTE, @gioBatDau, @gioKetThuc)
            else 
                set @tongSoGioCa3 += DATEDIFF(MINUTE, '22:00:00', @gioKetThuc)
        -- tinh tong so gio
        if DATEDIFF(MINUTE,'05:00:00', @gioKetThuc) >=0
            if DATEDIFF(MINUTE, @gioBatDau, '05:00:00') > 0 
                set @total += DATEDIFF(MINUTE, '05:00:00', @gioKetThuc)
        else 
            set @total += DATEDIFF(MINUTE,@gioBatDau, @gioKetThuc)
        
    if DATEDIFF(DAY, @ngay, @ngay2) = 0
        -- tinh so gio ca 3
        if DATEDIFF(MINUTE, '05:00:00', @gioBatDau) < 0
            if DATEDIFF(MINUTE,'05:00:00', @gioKetThuc) < 0
                set @tongSoGioCa3 += DATEDIFF(MINUTE, @gioBatDau, @gioKetThuc)
            else 
                set @tongSoGioCa3 += DATEDIFF(MINUTE, @gioBatDau, '05:00:00')
        
        -- tinh tong so gio
        if (DATEDIFF(MINUTE, @gioBatDau, '05:00:00') > 0) and (DATEDIFF(MINUTE,'05:00:00', @gioKetThuc) >=0)
            set @total += DATEDIFF(MINUTE, @gioBatDau, '05:00:00')     
        else 
            set @total += DATEDIFF(MINUTE,@gioBatDau, @gioKetThuc)
    -- Tro toi dong ke tiep
    fetch next from cursorChiTietNKSL into @ngay, @gioBatDau, @gioKetThuc
end
print 'Tong so gio'
print @total/60
print 'Tong so gio ca 3'
print @tongSoGioCa3/60

close cursorChiTietNKSL       -- dong Cursor
deallocate cursorChiTietNKSL  -- giai phong tai nguyen

