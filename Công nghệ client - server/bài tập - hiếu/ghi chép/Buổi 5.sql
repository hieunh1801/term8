-- select ra bảng sau - sử dụng truy vấn của buổi 4
-- ngày     | họ tên| thời gian| ca 3| tổng thời gian
-- 202014/13| Hiếu  | 16       | 3   | 
-- tổng thời gian = thời gian + 0.3*ca 3
-- Lấy ra thông tin chi tiết của ngày 
select nkslk.maNKSLK, nkslk.ngay, ct.gioBatDau, ct.gioKetThuc, ct.maNhanCong, ct.maChiTiet
from NKSLK as nkslk 
    inner join NKSLK_ChiTiet as ct on nkslk.maNKSLK = ct.maNKSLK
where (nkslk.ngay = '2020-01-13' and ct.gioKetThuc >= '05:00:00') -- ngày cần select
    or (nkslk.ngay = '2020-01-14' and ct.gioBatDau < '05:00:00')  -- ngày tiếp theo
    and ct.maNhanCong=1
GO


-- Function tinh tong so gio lam viec trong 1 ngay của công nhân -----------------------
create function tong_so_gio(@ngay1 date, @maNhanCong int)
returns float
as
begin
    declare @ngay2 date 
    set @ngay2 = dateadd(day, 1, @ngay1)
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
        and ct.maNhanCong = @maNhanCong

    open cursorChiTietNKSL
    fetch next from cursorChiTietNKSL into @ngay, @gioBatDau, @gioKetThuc -- lay ra dong so 1

    while @@FETCH_STATUS = 0
    begin
        if DATEDIFF(DAY, @ngay, @ngay1) = 0
            -- tinh tong so gio
            if DATEDIFF(MINUTE,'05:00:00', @gioKetThuc) >=0
                if DATEDIFF(MINUTE, @gioBatDau, '05:00:00') > 0 
                    set @total += DATEDIFF(MINUTE, '05:00:00', @gioKetThuc)
            else 
                set @total += DATEDIFF(MINUTE,@gioBatDau, @gioKetThuc)
            
        if DATEDIFF(DAY, @ngay, @ngay2) = 0
            -- tinh tong so gio
            if (DATEDIFF(MINUTE, @gioBatDau, '05:00:00') > 0) and (DATEDIFF(MINUTE,'05:00:00', @gioKetThuc) >=0)
                set @total += DATEDIFF(MINUTE, @gioBatDau, '05:00:00')     
            else 
                set @total += DATEDIFF(MINUTE,@gioBatDau, @gioKetThuc)
        -- Tro toi dong ke tiep
        fetch next from cursorChiTietNKSL into @ngay, @gioBatDau, @gioKetThuc
    end
    close cursorChiTietNKSL       -- dong Cursor
    deallocate cursorChiTietNKSL  -- giai phong tai nguyen
    return @total/60
end 
go

-- Function tinh tong so gio ca 3 cua cong nhan -----------------------
create function tong_so_gio_ca3(@ngay1 date, @maNhanCong int)
returns float
as
begin
    declare @ngay2 date 
    set @ngay2 = dateadd(day, 1, @ngay1)
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
        and ct.maNhanCong = @maNhanCong

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
          
            
        if DATEDIFF(DAY, @ngay, @ngay2) = 0
            -- tinh so gio ca 3
            if DATEDIFF(MINUTE, '05:00:00', @gioBatDau) < 0
                if DATEDIFF(MINUTE,'05:00:00', @gioKetThuc) < 0
                    set @tongSoGioCa3 += DATEDIFF(MINUTE, @gioBatDau, @gioKetThuc)
                else 
                    set @tongSoGioCa3 += DATEDIFF(MINUTE, @gioBatDau, '05:00:00')
     
        -- Tro toi dong ke tiep
        fetch next from cursorChiTietNKSL into @ngay, @gioBatDau, @gioKetThuc
    end
    close cursorChiTietNKSL       -- dong Cursor
    deallocate cursorChiTietNKSL  -- giai phong tai nguyen
    return @tongSoGioCa3/60
end 
go

-- select table cuoosi
select DISTINCT nkslk.ngay, 
	nc.hoTen, 
	[dbo].[tong_so_gio](nkslk.ngay, nc.maNhanCong) as soGio, 
	[dbo].[tong_so_gio_ca3](nkslk.ngay, nc.maNhanCong) as soGioCa3,
	([dbo].[tong_so_gio](nkslk.ngay, nc.maNhanCong) + [dbo].[tong_so_gio_ca3](nkslk.ngay, nc.maNhanCong)*0.3) as tongSoGio
from NKSLK as nkslk 
    inner join NKSLK_ChiTiet as ct on nkslk.maNKSLK = ct.maNKSLK
    inner join NhanCong as nc on nc.maNhanCong = ct.maNhanCong
where ct.maNhanCong = 1
order by nkslk.ngay




select * 
from NKSLK as nksl, NKSLK_ChiTiet as ct 
where nksl.maNKSLK = ct.maNKSLK
and nksl.ngay = '2020-01-15'