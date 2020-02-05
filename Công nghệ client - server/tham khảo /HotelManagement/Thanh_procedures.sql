use dbQLKhachSan
go

--tbDichVu, tbNhanVien, tbPhieuDatPhong, tbPhieuDichVu.
/*
--Room
CREATE PROCEDURE prSelectsRoom
AS
	BEGIN
		SELECT * FROM tbPhong
	END
GO
CREATE PROCEDURE prSelectRoom(@Id INT)
AS
	BEGIN
		SELECT * FROM tbPhong WHERE Id = @id
	END
GO
CREATE PROCEDURE prUpdateRoom(@Id INT,@Number INT,@Floor INT,@Status BIT,@Category INT)
AS
	BEGIN
		UPDATE tbPhong SET Number = @Number, Floor = @Floor, Status = @Status, Category = @Category WHERE Id = @Id
	END
GO
CREATE PROCEDURE prPostRoom(@Number INT,@Floor INT,@Status BIT,@Category INT)
AS
	BEGIN
		INSERT INTO tbPhong(Number,Floor,Status,Category) VALUES (@Number,@Floor,@Status,@Category)
	END
GO
CREATE PROCEDURE prDeleteRoom(@Id int)
AS
	BEGIN
		DELETE tbPhong WHERE Id = @Id
	END
GO
*/
create proc prSelectsDichVu
as
begin
	select * from tbDichVu
end

create proc prSelectDichVu(@Id int)
as
begin
	select * from tbDichVu where Id = @Id
end

create proc prUpdateDichVu