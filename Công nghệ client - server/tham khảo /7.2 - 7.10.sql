use NKSLK
go

--7.2
select top 1 maCongViec, sum(maNKSLK) as soLuongNKSLK from DanhMucKhoan_ChiTiet
group by maCongViec
order by sum(maNKSLK) desc

--7.3
select top 1 * from CongViec order by donGia
select top 1 * from CongViec order by donGia desc

--7.4
select * from CongViec where donGia > (select avg(donGia) from CongViec)
select * from CongViec where donGia < (select avg(donGia) from CongViec)

--7.5
select * from SanPham where ngayDangKy < '2019-08-15'

--7.6
select * from SanPham where datediff(year, ngayDangKy, hanSuDung) >= 1

--7.7
select * from NhanCong order by phongBan, chucVu

--7.8
select *, datediff(year, ngaySinh, CURRENT_TIMESTAMP) as tuoi from NhanCong
where datediff(year, ngaySinh, CURRENT_TIMESTAMP) = 54 or datediff(year, ngaySinh, CURRENT_TIMESTAMP) = 49

--7.9
select *, datediff(year, ngaySinh, CURRENT_TIMESTAMP) as tuoi from NhanCong
where datediff(year, ngaySinh, CURRENT_TIMESTAMP) >= 30 and datediff(year, ngaySinh, CURRENT_TIMESTAMP) <= 45

--7.10
select * from NhanCong 
where maNhanCong in 
(select distinct(maNhanCong) from NKSLK_ChiTiet where gioBatDau = '22:00' and gioKetThuc = '6:00')

use master
go