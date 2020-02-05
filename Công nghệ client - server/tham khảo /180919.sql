/*
Đọc slide lecture9 để tìm hiểu về chức năng và cách tạo, sử dụng của function trong sql
Trong các hệ thống quản lý, chức năng tìm kiếm đóng vai trò quan trọng trong việc quản lý các tập tin

Từ từ khóa tìm kiếm có thể là tiếng Việt có dấu hoặc không có dấu
Dùng kiến thức đã học tìm kiếm các bản ghi trong NKSLK theo tên công nhân

*/

alter function timKiem(@hoTen nvarchar(50))
returns table
as
	return (select * from NhanCong,  where hoTen COLLATE Latin1_general_CI_AI like concat('%', @hoTen, '%') COLLATE Latin1_general_CI_AI
		--or hoTen COLLATE Latin1_general_CI_AS like concat('%', @hoTen, '%') COLLATE Latin1_general_CI_AS)
go

select * from timKiem(N'thành')

select char(66)