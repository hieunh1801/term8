use NKSLK
go

--hiển thị NKSLK trong tháng, tuần của một nhân viên bất kỳ
--tuần tính từ:
--	ngày thứ hai đến ngày chủ nhật (tuần chẵn),
--	hoặc từ ngày 01 đến ngày chủ nhật (nếu ngày 01 khác thứ hai)
--	hoặc từ ngày thứ hai đến ngày cuối tháng (nếu ngày cuối tháng khác chủ nhật) (tuần lẻ)

--hiển thị NKSLK trong tháng của một nhân viên bất kỳ
select * from NKSLK
where month(ngay) = 2 and year(ngay) = 2019
and NhanCong.maNhanCong = 2
and NKSLK.maNKSLK = NKSLK_ChiTiet.maNKSLK
and NKSLK_ChiTiet.maNhanCong = NhanCong.maNhanCong

select * from DanhMucKhoan_ChiTiet, CongViec where maNKSLK = 17 and DanhMucKhoan_ChiTiet.maCongViec = CongViec.maCongViec

select * from NKSLK, NKSLK_ChiTiet where NKSLK_ChiTiet.maNhanCong = 2 and month(NKSLK.ngay) = 2 and year(NKSLK.ngay) = 2019

select * from NKSLK_ChiTiet where maNKSLK = 17
--hiển thị NKSLK trong tuần của một nhân viên bất kỳ
/*select * from NKSLK, NKSLK_ChiTiet, NhanCong
where month(ngay) = 11
and NhanCong.maNhanCong = 4
and NKSLK.maNKSLK = NKSLK_ChiTiet.maNKSLK
and NKSLK_ChiTiet.maNhanCong = NhanCong.maNhanCong*/

use master
go