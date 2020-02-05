# Nhật kí sản lượng khoán

**Tóm tắt yêu cầu:** thiết kế hệ thống phục vụ quản lý **nhật kí sản lượng khoán** **NKSLK** trong ngày của mỗi công nhân trong tổ sản xuất.

1. Dùng script tạo CSDL mới. 
	- Size=40MB. Max size=50MB. Filegrowth là 10%. 
	- File log kích thước 10MB, kích thước tối đa - 15MB. filegrowth là 1MB
2. Chỉnh sửa DB để file dữ liệu có kích thước 45MB và file log có kích thước tối đa là 18MB

3. Tạo table

```
- Bảng NhatKiSanLuongKhoan: lưu thông tin về nhật kí sản lượng của công nhân
	- ngày thực hiện khoán
	- giờ bắt đầu
	- giờ kết thúc
	
- Bảng DanhMucToCongNhanThucHienKhoan

- Bảng DanhMucCongViecToCongNhanDaLam
	- mã công việc
	- sản lượng thực tế đạt được
	- số lô sản phẩm
	- sản phẩm áp dụng
	
- DanhMucCongViec: lưu danh mục công việc
	- mã công việc
	- tên công việc
	- định mức khoán
	- đơn vị khoán
	- hệ số khoán
	- định mức lao động
	- đơn giá = (126360 x (hệ số khoán) x (định mức lao động))/định mức khoán
	
- DanhMucCongNhan: lưu thông tin công nhân
	- mã công nhân
	- họ tên
	- ngày tháng năm sinh
	- phòng ban
	- chức vụ
	- quê quán
	- lương hợp đồng
	- lương bảo hiểm

- DanhMucSanPham:
	- mã sản phẩm
	- tên sản phẩm
	- số đăng kí
	- hạn sử dụng
	- quy cách
	- ngày đăng kí
```



