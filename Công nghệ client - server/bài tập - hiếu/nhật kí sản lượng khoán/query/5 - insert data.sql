use NKSLKDB
go

insert into NhanCong(hoTen, ngaySinh, phongBan, chucVu, queQuan, luongBaoHiem) values
(N'Lã Công Ngọc', '1987-07-17', N'Nhân sự', N'Chủ tịch', N'Phú Yên', 1121549),
(N'Đinh Đức Ngọc', '1959-02-25', N'Thị trường', N'Cộng tác viên', N'Bến Tre', 2934302),
(N'Hoàng Minh Hải', '1980-09-13', N'Đào tạo', N'Chủ tịch', N'Đồng Tháp', 2026267),
(N'Phạm Nam Trà', '1952-09-26', N'Kế toán', N'Trưởng bộ phận', N'Hải Dương', 3371142),
(N'Đỗ Hữu Khánh', '1980-11-13', N'Nhân sự', N'Quản lý', N'Thái Bình', 2586667),
(N'Sái Ngọc Trà', '1961-04-20', N'Thị trường', N'Giám đốc', null, 4874874),
(N'Tống Đức Đại', '1969-04-08', N'Đào tạo', N'Trưởng phòng', null, 3085177),
(N'Đinh Hữu Khánh', '1952-05-17', N'Đào tạo', N'Trưởng bộ phận', null, 1201230),
(N'Triệu Văn Khánh', '1975-08-15', N'Quản lý', N'Nhân viên', null, 4346721),
(N'Kim Công Nam', '1984-06-07', N'Hành chính', N'Chủ tịch', null, 3952187),
(N'Tống Đức Nam', null, N'Hành chính', N'Phó phòng', N'Thừa Thiên Huế', 3095543),
(N'Sái Huy Huy', null, N'Nhân sự', N'Phó phòng', N'Hậu Giang', 1119325),
(N'Lý Minh Đinh', null, N'Tài chính', N'Chủ tịch', N'Lâm Đồng', 4363772),
(N'Lê Khánh Chiến', null, N'Hành chính', N'Trưởng phòng', N'Bình Phước', 4238500),
(N'Lã Văn Thanh', null, N'Nhân sự', N'Nhân viên', N'Tây Ninh', 4987237),
(N'Nguyễn Văn A', '1972-03-20', N'Thị trường', N'Chủ tịch', N'Ninh Bình', 4467021),
(N'Nguyễn Văn A', '1988-06-30', N'Hành chính', N'Trưởng phòng', N'Sơn La', 3861052),
(N'Nguyễn Văn A', '1972-10-28', N'Đào tạo', N'Cộng tác viên', N'Trà Vinh', 4557367),
(N'Nguyễn Văn A', '1964-10-15', N'Hành chính', N'Giám đốc', N'Bắc Kạn', 2785302),
(N'Nguyễn Văn A', '1975-04-20', N'Kinh doanh', N'Giám đốc', N'Ninh Thuận', 2458966),
(N'Triệu Khánh Tiến', '1971-04-14', N'Tài chính', N'Quản lý', N'Hà Nội', 2915099),
(N'Tống Thanh Sỹ', '1976-11-02', N'Kinh doanh', N'Quản lý', N'Hà Nội', 1041768),
(N'Triệu Minh Đinh', '1963-12-08', N'Đào tạo', N'Trưởng phòng', N'Hà Nội', 3606901),
(N'Trần Tùng Thắng', '1978-12-14', N'Nghiên cứu và Phát triển', N'Phó phòng', N'Hà Nội', 3424788),
(N'Kim Đức Nam', '1985-12-17', N'Nhân sự', N'Trưởng bộ phận', N'Hà Nội', 1889560)

insert into CongViec(tenCongViec, dinhMucKhoan, donViKhoan, heSoKhoan, dinhMucLaoDong, donGia) values 
(N'Đào Sản phẩm', 3.88, N'tấn', 1.95, 3.7, 100000),
(N'Khai phá Sản phẩm công nghiệp', 3.35, N'cân', 4.83, 1.8, 150000),
(N'Phát triển Đồ dùng gia dụng', 2.19, N'khối', 3.33, 3.71, 200000),
(N'Nghiên cứu Khoáng sản', 2.53, N'tấn', 4.19, 4.97, 150000),
(N'Khai thác Tài nguyên', 4.18, N'ký', 2.61, 4.11, 200000),
(N'Múc Than', 4.63, N'ký', 3.83, 3.57, 300000),
(N'Khai phá Vũ khí công nghệ cao', 0.44, N'lạng', 4.12, 1.04, 100000),
(N'Nghiên cứu Vũ khí hủy diệt', 4.5, N'lạng', 2.72, 2.6, 200000),
(N'Múc Nhựa', 4.54, N'ký', 0.5, 3.62, 250000),
(N'Đào Vàng', 2.59, N'cân', 4.7, 4.6, 300000)

update CongViec
set donGia = 126360*heSoKhoan*dinhMucLaoDong/dinhMucKhoan

--50 sản phẩm
insert into SanPham(tenSanPham, soDangKy, hanSuDung, quyCach, ngayDangKy) values
(N'Lốc Vàng Cá voi', 'wv6Rp4BPRq', '2033-12-04', 'MPnatsBs', '2019-02-15'),
(N'Lốc Sản phẩm nông nghiệp Mỡ muỗi', 'HNhZH9amFHwW9fxyOYUX', '2048-10-18', 'ReePYUmLv', '2019-08-06'),
(N'Khối Gỗ Cá', 'yEjQXxW4lbT4Gh9TNd', '2025-09-07', 'jJDq7', '2019-09-21'),
(N'Lốc Đồ dùng gia dụng Gan trời', 'Xi0DRmfHiE3hE', '2050-12-01', 'HQoSLV', '2019-12-25'),
(N'Khối Gỗ Thịt hổ', 'YvJdnoGPHTkEgm0Rp5aH', '2026-12-07', 'R2WfWyfM', '2019-06-25'),
(N'Thùng Khoáng sản Mỡ muỗi', 'YGpTNaE8WK', '2040-04-26', 'NAt2Enw57N', '2019-01-31'),
(N'Thùng Kim cương Gạo lứt', 'jq6dP8l1zPPWl', '2022-10-23', '8o0vOTvsv', '2019-08-21'),
(N'Túi Vàng Thịt hổ', 'lOD3z4gAY1me', '2032-01-27', '5AlO5', '2019-03-11'),
(N'Túi Vũ khí hủy diệt Cá', '492KtOvon2un2PZPOIle', '2025-10-17', 'QbKjG5ZS', '2019-07-20'),
(N'Khối Sản phẩm công nghiệp Thùng nhựa', 'PawelYpuK4NubGYr', '2023-08-04', 'OMn02', '2019-03-02'),
(N'Lốc Vũ khí hủy diệt 7Up', 'chgo0LpzTL88bt', '2039-02-02', 'FgKwQGYa', '2019-11-12'),
(N'Hộp Vũ khí công nghệ cao Thịt heo', 'sbxjnlapWtHPjkhGGgvs', '2041-07-19', 'OMuh3', '2019-10-26'),
(N'Hộp Vũ khí Thịt lợn', 'gtCgBJ46QT', '2025-11-09', 'NuyuI5v', '2019-01-22'),
(N'Hộp Gỗ Rau xanh', '4sdhrDcY1Gmd', '2030-08-17', 'dtoL5', '2019-01-20'),
(N'Lốc Than Thịt hổ', 'Nr1iYKemZ7VjvqqzHc', '2023-04-09', 'rYDK7VXZaa', '2019-07-05'),
(N'Thùng Than Gạo nếp', 'U3Dk6OnyxugkgAH4a', '2028-09-23', 'Jo8eZOK', '2019-01-28'),
(N'Can Gỗ Rau muống', 'r76tsJeqkOKdXF', '2038-04-02', '5S6qFQr', '2019-09-22'),
(N'Can Gang Cá', 'ihciDpvbf7SxEJUbCGeO', '2050-05-30', 'iWcew4Z', '2019-07-24'),
(N'Khối Sản phẩm Mỡ muỗi', '3YPUTuG9qap', '2041-08-12', 'MNC3fLFk', '2019-12-16'),
(N'Khối Vũ khí Pepsi', 'NYurs9F6OFvEaQPp', '2026-07-30', 'Ui6Gy', '2019-08-23'),
(N'Túi Gỗ Gạo', 'gxW4m2kGTry9UG8FNjx', '2025-10-13', '2vR4h', '2019-07-27'),
(N'Túi Gỗ Gạo nếp', 'fTAAVA3k40oddVNZ5vzB', '2030-12-01', 'i5eMWi', '2019-04-07'),
(N'Túi Tài nguyên Gan trời', '67LcduxcJYS', '2025-06-11', 'oAgxKxow9', '2019-08-12'),
(N'Túi Hóa chất 7Up', 'W9VvO5pQ673', '2033-02-01', '7Z78Uag', '2019-12-22'),
(N'Can Gỗ Rau xanh', 'u1OPp9qSVxQUA', '2032-12-15', 'n33iCd8', '2019-11-15'),
(N'Can Kim cương Cá', 'FTOuTq7ZtZxVVU3', '2024-04-28', 'QGF5ss', '2019-11-01'),
(N'Túi Sản phẩm Thịt heo', 'HqUIuv5uEaR', '2038-12-27', '4zAgM23', '2019-08-11'),
(N'Lốc Sản phẩm Cá mập', 'iQ9VAuTfsxVvjElt', '2034-06-28', 'bGP1N6bJG', '2019-05-04'),
(N'Lốc Sản phẩm nông nghiệp Đậu xanh', 'ymHM3QsbDy2Wah96', '2021-09-07', 'MEv3kS', '2019-09-05'),
(N'Can Sắt Hộp nhựa', '2GUhDic15B2OMU0gAWof', '2040-11-03', 'TSyhgG3Jx', '2019-02-19'),
(N'Thùng Vũ khí Cá mập', 'iscIBEhrcdlcNv0', '2043-11-23', 'EjScOv', '2019-07-19'),
(N'Hộp Kim cương Cá voi', 'MfU0AJaN84', '2036-09-20', 'I9QsAV', '2019-04-24'),
(N'Lốc Sản phẩm công nghiệp Rau xanh', 'PVH73n0ysZrTf', '2025-09-02', '8wwqOR', '2019-07-04'),
(N'Hộp Đồ dùng gia dụng Thịt lợn', 'srx8zMRpyILrm', '2023-08-15', 'Udd6QGTg7', '2019-05-04'),
(N'Can Nhựa Cá voi', 'bRdMMdqnVsN1fWx', '2047-02-28', 'Aq5bx', '2019-06-09'),
(N'Can Than Gạo nếp', 'loBnunKoPTT5oLpXd71c', '2033-05-26', 'thcKK', '2019-10-06'),
(N'Lốc Gang Cá voi', 'GWNkJTHQJpXRw4hJReb', '2025-01-27', '0sVI7Pp', '2019-01-13'),
(N'Khối Vàng Fanta', 'WB9S9dC20JWiF1tLEk', '2025-03-15', 'rtri9SpTgH', '2019-12-31'),
(N'Hộp Kim cương Sữa', 'fPVdlHuipPZu3KM', '2050-08-15', '5BqGEl', '2019-03-30'),
(N'Lốc Sản phẩm Gan trời', 'N21QRxorNHl0yvu', '2029-06-25', 'VWHOgMV30', '2019-05-07'),
(N'Hộp Vũ khí hóa học Sữa', '6aMahEuqtP', '2038-09-20', '412iwWJ6vC', '2019-05-18'),
(N'Túi Sắt Hộp nhựa', '52pBYU3ZvFPMuTTja', '2042-10-21', 'dB4kV', '2019-12-27'),
(N'Khối Nhựa Đậu xanh', 'cui6FKjQUpjOvl', '2029-11-05', 'uBliA', '2019-04-18'),
(N'Túi Vũ khí hủy diệt Gạo lứt', 'nze6sJFkvy0hOIW11', '2042-08-09', 'cQMpdC62l', '2019-03-07'),
(N'Khối Thép Gạo nếp', 'MWLeKyzDAJRD', '2048-04-07', 'uPR3S', '2019-08-01'),
(N'Can Gang Gan trời', 'ZFMoJdJnPq1', '2021-07-26', '7hYz4pD0', '2019-05-30'),
(N'Hộp Vũ khí Nước ngọt', 'BdkLpzFJ10qfxtaom', '2034-07-12', '4uuRe', '2019-01-27'),
(N'Lốc Thép Gạo tẻ', '61BjwdJs80d1R7AVGl', '2037-12-26', '8KgLlki', '2019-04-09'),
(N'Túi Tài nguyên Gạo', 'LwUuS7sKgA6rrqOfCSTS', '2024-10-08', 'EXtoqIg', '2019-07-12'),
(N'Lốc Sắt Gạo tẻ', 'jt0b4to8GL', '2048-09-07', 'Vn1bwAqlD7', '2019-12-08')
go


use master
go