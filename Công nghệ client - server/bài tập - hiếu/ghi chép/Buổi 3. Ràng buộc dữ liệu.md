# Bài 3: Các phương pháp đảm bảo toàn vẹn dữ liệu
- Slide 4
## Giới thiệu về ràng buộc
- __Tổng quan:__
    - Các biện pháp ràng buộc
    - 1 - Ràng buộc miền: bằng việc định nghĩa kiểu dữ liệu cho cột
    - 2 - Ràng buộc khóa: khóa chính, khóa ngoại
    - 3 - Ràng buộc bằng trigger

- Tại sao phải ràng buộc ?
    
- Khi ràng buộc thì sẽ như thế nào?
    - Các câu lệnh thao tác dữ liệu trên bảng vi phạm ràng buộc sẽ không được thực hiện và SQL Server sẽ trả về lỗi.
    - Các ràng buộc có thể được thay đổi ở mức xây dựng, sửa đổi CSDL
    - Nếu thêm ràng buộc cho bảng đã có dữ liệu, nhưng dữ liệu không thoả mãn ràng buộc thì ràng buộc đó sẽ: hoặc là không có hiệu lực hoặc là một số dữ liệu trong bảng sẽ bị mất. 
        - Ví dụ:
            - mất dữ liệu: từ varchar(10) => varchar(5)
            - ràng buộc sẽ bị lỗi và không có hiệu lực: từ null => not null

- Phân biệt:
    - domain integrity(column): ràng buộc trên trường dữ liệu
    - entity integrity(row): ràng buộc trên thực thể
    - referential integrity(between tables): ràng buộc giữa các khóa

- 1: Ràng buộc trên miền dữ liệu. __Domain__
    - Domain, miền dữ liệu là dữ liệu của cột trong table.
    - VD: person(name, age) => ràng buộc trên miền dữ liệu là chỉ ra (hay định nghĩa):
        - name: 
            + kiểu dữ liệu: varchar(50).
            + not null: không cho phép để trống
    - Ràng buộc bằng - kiểu dữ liệu
        - VARCHAR(n)
        - NVARCHAR(n)
        - NUMERIC (m,n)
        - DATETIME
        - TEXT; NTEXT
    - Ràng buộc khác:
        - not null: không cho phép null
        - unique key: tập dữ liệu không được trùng
        - primary key: không chấp nhận null và không được trùng
        - foreign key: khóa null hoặc phải tồn tại rồi

## Thêm các ràng buộc
### Thêm kiểu dữ liệu
```sql
-- Cú pháp
sp_addtype type, system_data_type [,'NULL' | 'NOT NULL'] 
sp_droptype type 
sp_droptype [ @typename = ] 'type' 

-- ví dụ
use khohang
---- Thêm một ràng buộc dữ liệu mới
-- sp_addtype: thêm kiểu dữ liệu mới
-- zipcode: tên kiểu dữ liệu
-- kiểu dữ liệu của hệ thống
EXEC sp_addtype zipcode, 'char(10)', NULL 
EXEC sp_addtype longstring, 'varchar(50)', NULL
----  Xóa ràng buộc dữ liệu
EXEC sp_droptype zipcode
```

## Ràng buộc trên thực thể: Entity integerity sử dụng Trigger 
- Trigger được sử dụng mỗi khi mà bảng phát sinh thêm, sửa, xóa.
- Khi một sự kiện phát sinh => trigger sẽ được sử dụng => giống kiểu 
- Có 2 kiểu trigger:
    - kích hoạt theo sự kiện: __for__. khi phát sinh sự kiện nào đó thì ta phát sinh hành động trong trigger
    - thay thế cho sự kiện: __instead of__ - thường được dùng trên view