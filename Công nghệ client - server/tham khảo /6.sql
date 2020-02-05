﻿use NKSLK
go

--10 bản ghi làm riêng
insert into NKSLK(ngay) values ('2018-09-25'),
('2018-07-01'),
('2019-04-04'),
('2019-01-24'),
('2019-10-19'),
('2019-11-08'),
('2018-03-17'),
('2019-03-13'),
('2019-03-07'),
('2018-12-14');

insert into NKSLK_ChiTiet(maNKSLK, maNhanCong, gioBatDau, gioKetThuc) values(1, 5, '14:00:00', '22:00:00'),
(2, 6, '6:00:00', '14:00:00'),
(3, 19, '6:00:00', '14:00:00'),
(4, 11, '22:00:00', '6:00:00'),
(5, 23, '6:00:00', '14:00:00'),
(6, 24, '6:00:00', '14:00:00'),
(7, 1, '22:00:00', '6:00:00'),
(8, 7, '14:00:00', '22:00:00'),
(9, 4, '22:00:00', '6:00:00'),
(10, 5, '22:00:00', '6:00:00');

--10 bản ghi làm chung
insert into NKSLK(ngay) values ('2018-03-09'),
('2018-03-08'),
('2018-11-03'),
('2018-06-28'),
('2018-06-05'),
('2018-07-25'),
('2019-09-11'),
('2019-11-29'),
('2019-06-23'),
('2018-06-19');

insert into NKSLK_ChiTiet(maNKSLK, maNhanCong, gioBatDau, gioKetThuc) values(11, 3, '22:00:00', '6:00:00'),
(11, 2, '22:00:00', '6:00:00'),
(11, 22, '14:00:00', '22:00:00'),
(11, 11, '6:00:00', '14:00:00'),
(11, 25, '22:00:00', '6:00:00'),
(12, 11, '22:00:00', '6:00:00'),
(12, 22, '6:00:00', '14:00:00'),
(12, 11, '22:00:00', '6:00:00'),
(12, 23, '22:00:00', '6:00:00'),
(13, 7, '14:00:00', '22:00:00'),
(13, 11, '14:00:00', '22:00:00'),
(13, 7, '22:00:00', '6:00:00'),
(13, 10, '6:00:00', '14:00:00'),
(13, 23, '22:00:00', '6:00:00'),
(14, 8, '22:00:00', '6:00:00'),
(14, 5, '22:00:00', '6:00:00'),
(14, 7, '22:00:00', '6:00:00'),
(14, 17, '22:00:00', '6:00:00'),
(14, 12, '14:00:00', '22:00:00'),
(14, 1, '14:00:00', '22:00:00'),
(14, 17, '22:00:00', '6:00:00'),
(15, 14, '14:00:00', '22:00:00'),
(15, 6, '22:00:00', '6:00:00'),
(15, 7, '6:00:00', '14:00:00'),
(15, 24, '22:00:00', '6:00:00'),
(15, 8, '14:00:00', '22:00:00'),
(15, 19, '14:00:00', '22:00:00'),
(16, 4, '14:00:00', '22:00:00'),
(16, 21, '14:00:00', '22:00:00'),
(16, 7, '6:00:00', '14:00:00'),
(16, 4, '6:00:00', '14:00:00'),
(17, 17, '14:00:00', '22:00:00'),
(17, 11, '14:00:00', '22:00:00'),
(17, 17, '22:00:00', '6:00:00'),
(17, 9, '6:00:00', '14:00:00'),
(17, 7, '14:00:00', '22:00:00'),
(17, 13, '6:00:00', '14:00:00'),
(17, 2, '6:00:00', '14:00:00'),
(17, 15, '22:00:00', '6:00:00'),
(17, 1, '6:00:00', '14:00:00'),
(17, 22, '22:00:00', '6:00:00'),
(18, 23, '22:00:00', '6:00:00'),
(18, 22, '6:00:00', '14:00:00'),
(18, 1, '6:00:00', '14:00:00'),
(18, 6, '14:00:00', '22:00:00'),
(18, 10, '22:00:00', '6:00:00'),
(18, 17, '14:00:00', '22:00:00'),
(18, 13, '22:00:00', '6:00:00'),
(18, 19, '14:00:00', '22:00:00'),
(18, 11, '6:00:00', '14:00:00'),
(18, 6, '14:00:00', '22:00:00'),
(19, 6, '22:00:00', '6:00:00'),
(19, 2, '14:00:00', '22:00:00'),
(19, 23, '22:00:00', '6:00:00'),
(19, 19, '6:00:00', '14:00:00'),
(19, 25, '22:00:00', '6:00:00'),
(19, 13, '6:00:00', '14:00:00'),
(19, 25, '14:00:00', '22:00:00'),
(19, 14, '22:00:00', '6:00:00'),
(20, 13, '22:00:00', '6:00:00'),
(20, 4, '6:00:00', '14:00:00'),
(20, 6, '22:00:00', '6:00:00'),
(20, 21, '6:00:00', '14:00:00'),
(20, 14, '22:00:00', '6:00:00'),
(20, 23, '6:00:00', '14:00:00');

--10 bản ghi làm chung, có người muộn
insert into NKSLK(ngay) values 
('2019-02-10'),
('2019-07-27'),
('2018-01-30'),
('2019-12-31'),
('2019-10-21'),
('2018-04-04'),
('2018-05-07'),
('2019-01-06'),
('2018-11-08'),
('2018-05-03');

insert into NKSLK_ChiTiet(maNKSLK, maNhanCong, gioBatDau, gioKetThuc) values
(21, 15, '14:00:00', '22:00:00'),
(21, 20, '7:00:00', '15:00:00'),
(21, 7, '7:00:00', '15:00:00'),
(21, 24, '7:00:00', '15:00:00'),
(21, 22, '7:00:00', '15:00:00'),
(21, 7, '7:00:00', '15:00:00'),
(22, 2, '7:00:00', '15:00:00'),
(22, 21, '22:00:00', '6:00:00'),
(22, 10, '6:00:00', '14:00:00'),
(22, 12, '6:00:00', '14:00:00'),
(22, 2, '22:00:00', '6:00:00'),
(22, 22, '15:00:00', '23:00:00'),
(22, 16, '22:00:00', '6:00:00'),
(23, 4, '7:00:00', '15:00:00'),
(23, 16, '6:00:00', '14:00:00'),
(23, 14, '14:00:00', '22:00:00'),
(23, 5, '14:00:00', '22:00:00'),
(23, 20, '22:00:00', '6:00:00'),
(23, 17, '6:00:00', '14:00:00'),
(23, 19, '23:00:00', '7:00:00'),
(23, 9, '23:00:00', '7:00:00'),
(23, 17, '22:00:00', '6:00:00'),
(23, 21, '7:00:00', '15:00:00'),
(24, 1, '22:00:00', '6:00:00'),
(24, 15, '6:00:00', '14:00:00'),
(24, 24, '14:00:00', '22:00:00'),
(24, 4, '7:00:00', '15:00:00'),
(24, 16, '23:00:00', '7:00:00'),
(24, 4, '7:00:00', '15:00:00'),
(24, 16, '23:00:00', '7:00:00'),
(24, 7, '7:00:00', '15:00:00'),
(24, 10, '23:00:00', '7:00:00'),
(24, 5, '23:00:00', '7:00:00'),
(25, 10, '15:00:00', '23:00:00'),
(25, 16, '23:00:00', '7:00:00'),
(25, 22, '23:00:00', '7:00:00'),
(25, 24, '7:00:00', '15:00:00'),
(25, 24, '7:00:00', '15:00:00'),
(25, 12, '23:00:00', '7:00:00'),
(25, 2, '23:00:00', '7:00:00'),
(25, 20, '7:00:00', '15:00:00'),
(25, 2, '15:00:00', '23:00:00'),
(26, 22, '22:00:00', '6:00:00'),
(26, 25, '22:00:00', '6:00:00'),
(26, 18, '14:00:00', '22:00:00'),
(26, 17, '15:00:00', '23:00:00'),
(26, 11, '23:00:00', '7:00:00'),
(26, 17, '23:00:00', '7:00:00'),
(26, 7, '23:00:00', '7:00:00'),
(26, 5, '22:00:00', '6:00:00'),
(26, 24, '7:00:00', '15:00:00'),
(26, 23, '23:00:00', '7:00:00'),
(27, 22, '7:00:00', '15:00:00'),
(27, 9, '7:00:00', '15:00:00'),
(27, 10, '14:00:00', '22:00:00'),
(27, 24, '14:00:00', '22:00:00'),
(28, 11, '22:00:00', '6:00:00'),
(28, 10, '15:00:00', '23:00:00'),
(28, 19, '23:00:00', '7:00:00'),
(28, 6, '14:00:00', '22:00:00'),
(28, 25, '15:00:00', '23:00:00'),
(28, 8, '23:00:00', '7:00:00'),
(28, 22, '23:00:00', '7:00:00'),
(28, 2, '14:00:00', '22:00:00'),
(28, 11, '23:00:00', '7:00:00'),
(29, 6, '15:00:00', '23:00:00'),
(29, 6, '15:00:00', '23:00:00'),
(29, 24, '6:00:00', '14:00:00'),
(29, 18, '6:00:00', '14:00:00'),
(29, 20, '23:00:00', '7:00:00'),
(29, 8, '14:00:00', '22:00:00'),
(29, 4, '7:00:00', '15:00:00'),
(29, 9, '22:00:00', '6:00:00'),
(29, 2, '23:00:00', '7:00:00'),
(29, 21, '15:00:00', '23:00:00'),
(30, 5, '23:00:00', '7:00:00'),
(30, 5, '7:00:00', '15:00:00'),
(30, 12, '14:00:00', '22:00:00'),
(30, 4, '6:00:00', '14:00:00'),
(30, 21, '23:00:00', '7:00:00'),
(30, 2, '14:00:00', '22:00:00');

insert into DanhMucKhoan_ChiTiet(maNKSLK, maCongViec, sanLuongThucTe, soLoSanPham, maSanPham) values (16, 2, 4.13, 't8sA8Vuqf0cHEM5e2', 10),
(6, 5, 2.55, 'XhxfNtDFNoS', 9),
(22, 2, 0.23, 'tFnjqnaGYYGH', 36),
(29, 7, 8.41, 'PvGRQX0ePg', 28),
(10, 5, 6.03, 'KD1eumO9O2rJwrnFJq', 8),
(14, 9, 7.88, 'gf5wu1PJZbgqqV', 26),
(11, 8, 1.38, 'cEVMqwThijmFOe3s5e', 15),
(24, 7, 1.7, '9veqwKYhhX', 19),
(29, 9, 8.71, 'Ajfn9xaWaAYWn', 26),
(21, 4, 5.69, 'CuiAU9Y9UFCKZ5UiPtcY', 42),
(24, 9, 3.4, 'NRS1l8uBuW7w3nwF8K', 2),
(24, 7, 3.76, 'BszInQJzZTtA70', 21),
(19, 5, 5.1, 'Dc45PU4fCveWyBZ', 4),
(8, 5, 9.87, 'N9dklZM2qWcPyh', 22),
(17, 2, 8.05, 'xVOvZMxwPVdstTXvtz', 17),
(24, 4, 8.21, 'mjUywYqukG', 44),
(22, 8, 3.21, 'aMaSp783kG4y1pHi', 14),
(3, 9, 6.17, 'DyhWVGl3AFCht', 5),
(23, 3, 4.22, 'voeeb9EM7et91G7', 26),
(2, 9, 3.04, 'rCZ55dl5SCjq12f2', 4), 
(24, 9, 7.64, 'zOhYxeJ3HfitEL', 16),
(26, 10, 1.52, 'plh1pEd1XdKEk', 40),
(23, 9, 1.5, 'iOA5MXW3Zv00dIGue', 33),
(12, 8, 3.82, 'vULGVHkp4Up2Gq4K', 48),
(18, 9, 8.59, 'DuPg7JOMBtgFouT0otLr', 50),
(10, 8, 7.86, 'UsFjhm8cjY358cWObgB4', 32),
(1, 5, 8.37, 'kOdvTHyHdO22', 34),
(12, 4, 2.89, 'Ya5VjNnc09wqU', 4),
(27, 6, 1.85, 'TJ15nH8W67i0MQJNiQ', 17),
(2, 2, 2.37, 'REfDTUViJsGWTrv', 29),
(17, 8, 6.7, 'zvtAu9f9gF', 13),
(25, 5, 2.56, '0KSSSQwF5VQk', 36),
(18, 7, 1.66, 'gCtrsrQLWi6Wy1F6e', 47),
(5, 8, 9.85, 'HLm3JNdvSJkT', 22),
(17, 7, 2.06, 'yecyGfgQlayRT2P0UO', 46),
(26, 2, 8.25, 'jc3Aw7dqPGBefuzcInH', 28),
(28, 7, 2.69, 'vrBRwV5J2szsA', 13),
(20, 1, 0.88, '37obZz5Ip0mN', 18),
(16, 10, 6.14, 'TZRW52afz89', 4),
(25, 7, 5.46, 'VUi6oc5BmlTQyClZ', 17),
(7, 10, 6.21, 'wX3wEx3g0qy', 2),
(7, 10, 7.78, '7BU1wHkqal3krv0V', 32),
(1, 5, 7.89, 'FWjvQBttGJsb', 2),
(25, 2, 2.56, 'EpIwTf6HvRpci', 37),
(18, 1, 0.62, 'q2livNbwX5L', 16),
(28, 3, 6.17, 'WXh2uxPA1H7Z', 31),
(6, 10, 3.6, 'Cvum0xdOFZn2Av', 16),
(9, 3, 3.98, 'wuViECAzWjZcJs2ct', 24),
(18, 4, 6.26, 'WauNBYa2cDD', 50),
(13, 3, 3.58, 'FqiNdMB1scr6oJLo', 16),
(11, 1, 8.89, 'Apdcn6QZui03GGHcEsa', 46),
(19, 5, 1.67, 'QWcyBF0wdHoD6EX', 15),
(25, 9, 3.1, 'SgTAW9VE0I9B1jn0', 5),
(12, 4, 5.41, 'MGjaMo5CWHharwA', 41),
(24, 9, 1.04, 'ZU5yNXGO9sav', 6),
(14, 1, 0.58, 'ybqGN9CxSRcFW3o', 17),
(15, 9, 0.11, '1PhKR6KBWBewk5T', 31),
(29, 7, 0.78, '01wIRdwuRD', 43),
(29, 9, 2.58, 'ztXF9k1y1VWcoTCykq', 36),
(14, 4, 1.15, 'TB2QgN9derAMsnurRLmT', 1),
(28, 2, 2.76, 'ldg8uaD6IaW3Xl982o9', 17),
(5, 4, 3.2, 'GPg49tX2z77XqhJH', 43),
(11, 2, 2.19, '01STRGBYDbuB', 43),
(4, 3, 7.95, 'okFzr6VTaJWw4PD2Hl', 35),
(30, 8, 4.87, 'b1qfd8qMMJeH', 44),
(25, 8, 5.76, 'Bwt3cZiVbm5WfxsiJ', 39),
(9, 9, 9.07, '29H7gSS0X7zLW', 26),
(5, 10, 0.33, 'wIEqXbDxfU22WYpmGJH', 5),
(3, 8, 1.84, 'f7HNHXuZn9A6irrEn', 11),
(21, 1, 5.89, 'TgyH4OuZt9VGhDM7WUiO', 23),
(16, 1, 9.02, 'uoH8mtqR38v3V9ZLzd', 14),
(22, 3, 8.54, '5RnSgIFZg1wPHfyrZVa', 36),
(8, 3, 0.47, 'UzCbpiKuNRJ9mgBJmEZI', 4),
(15, 5, 5.64, 'n9zXu68tnOpdVlaNEBU', 37),
(14, 1, 3.04, 'IKtFE3NqF5AeeaHgNt4', 31),
(1, 6, 1.16, 'WSDpaJSJiNUY', 14),
(13, 8, 6.33, 'TYTw7eDo57QT', 40),
(20, 8, 4.45, 'tnrtP9laqPasaXjqwZ', 12),
(11, 5, 6.77, 'jVXSkkZh72PH', 47),
(23, 4, 9.04, '3vPbMfa1opHhCFy', 37),
(21, 2, 0.59, 'wWZe6B91rMuNw', 48),
(30, 10, 1.79, 'ekDUluo3C76Zjv7', 26),
(30, 10, 2.73, 'CIXIwrzbvpaDN0i1G', 10),
(17, 7, 1.95, 'VhZLMwI6ejFmKF', 47),
(9, 5, 4.48, 'rggcuX9UCZI0nf5', 41),
(9, 5, 6.52, '3fIApuRTehe', 50),
(9, 2, 9.5, 'DqBtmHkkRWBCu', 13),
(10, 6, 5.06, 'Y9cVrX0WzHVLsw', 21),
(29, 2, 7.43, 'emnH9NMMgwS41tvT', 46),
(1, 10, 6.6, 'KCiwOpHpMo', 7),
(13, 3, 3.17, 'BcyDF1t3hBgvPSVEOQRI', 40),
(28, 6, 4.81, 'lnqp9RadncX', 32),
(5, 9, 8.01, '8cBSTlVvUyoFc1', 43),
(4, 2, 9.56, '1hE4wlH9X2q', 11),
(24, 6, 7.61, 'yTgrFsTlUlw', 19),
(24, 7, 6.68, 'ssP6xbmHUs1xwQVIp', 14),
(5, 3, 0.3, 'IzeKbA0z7ROgzQ', 18),
(8, 3, 9.35, 'E7vJtqjQLiHlgWsMdJR', 22),
(24, 3, 0.71, 'JY6RWEgyRMjuf0TFLVs', 45),
(19, 3, 6.94, 'npQra2HmAJkF', 26)
go


use master
go