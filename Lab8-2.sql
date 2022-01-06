--Bài tập lab8-2
if exists (select * from sys.databases where name = 'RiverPlate')
	drop database RiverPlate
create database RiverPlate
use RiverPlate
-- Tạo bảng Student
CREATE TABLE Student (
	StudentNo INT PRIMARY KEY , --Mã Sinh Viên 
	StudentName NVARCHAR(200),-- Tên Sinh Viên 
	StudentAddress NVARCHAR(200), --Địa chỉ 
	PhoneNo INT --Sđt
)
--Tạo bảng DEPARTMENT 
CREATE TABLE Department (
	DeptNo INT PRIMARY KEY, --MÃ SỐ NHÓM LÀM VIỆC 
	DeptName NVARCHAR(300),-- Tên Nhóm 
	ManagerName CHAR(30) --Tên Người Quản Lý 
)
--Tạo bảng ASSIGNMENT 
CREATE TABLE Assignment(
	AssignmentNo INT PRIMARY KEY ,--Mã Số BT 
	Description NVARCHAR(200)
)
--Tạo Bảng Works_Assign 
CREATE TABLE Works_Assign(
	JobID INT PRIMARY KEY, --Mã số công việc 
	StudentNo INT, --Mã số sinh viên 
	AssignmentNo INT , --Mã số bài tập 
	TotalHours INT , -- Tổng số giờ đc phân bố đề bài tập 
	JobDetail XML  -- chi tiết công việc đc giao 
)
-- yêu cầu 1 
CREATE INDEX IX_Student ON dbo.Student(StudentNo)
-- Yêu cầu 2 
ALTER INDEX IX_Student ON  dbo.Student DISABLE
--Yêu cầu 3 
CREATE NONCLUSTERED  INDEX IX_Dept ON dbo.Department(DeptNo, DeptName, ManagerName)