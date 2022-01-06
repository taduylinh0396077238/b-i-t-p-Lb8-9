IF EXISTS (SELECT* FROM sys.databases WHERE name ='Lab9_11')
	DROP DATABASE Lab9_11
CREATE DATABASE Lab9_11
GO 
USE Lab9_11
GO 
CREATE TABLE Customer (
	CustomerID INT PRIMARY KEY IDENTITY(1,1),
	CustomerName VARCHAR(50),
	Address VARCHAR(100),
	Phone VARCHAR(12)
)
CREATE TABLE Book(
	BookCode INT PRIMARY KEY,
	Category VARCHAR(50),
	Author VARCHAR(50),
	Publisher VARCHAR(50),
	Title VARCHAR(100),
	Price INT ,
	InStore INT
)
CREATE TABLE BookSold(
	BookID INT PRIMARY KEY,
	CustomerID INT FOREIGN KEY REFERENCES dbo.Customer(CustomerID),
	BookCode INT FOREIGN KEY REFERENCES dbo.Book(BookCode),
	Date DATETIME,
	Price INT,
	Amount INT

)
INSERT INTO dbo.Customer
(
    CustomerName,
    Address,
    Phone
)
VALUES
(   'Duy Linh ', -- CustomerName - varchar(50)
    'Thai Nguyen  ', -- Address - varchar(100)
    '0396077238'  -- Phone - varchar(12)
    ),
(   'Viết Qúy ', -- CustomerName - varchar(50)
    'Thai Binh ', -- Address - varchar(100)
    '0977603809'  -- Phone - varchar(12)
    ),
(   'Quang Anh ', -- CustomerName - varchar(50)
    'Ninh Binh ', -- Address - varchar(100)
    '0343955258'  -- Phone - varchar(12)
    ),
(   'Khanh Nguyen ', -- CustomerName - varchar(50)
    'Ha Noi', -- Address - varchar(100)
    '0987678933' -- Phone - varchar(12)
    ),
(   'Kien Lon', -- CustomerName - varchar(50)
    'Bac Ninh ', -- Address - varchar(100)
    '0987678938' -- Phone - varchar(12)
    )
INSERT INTO dbo.Book
(
    BookCode,
    Category,
    Author,
    Publisher,
    Title,
    Price,
    InStore
)
VALUES
(   1,    -- BookCode - int
    'Khoa Hoc', -- Category - varchar(50)
    'Bacham', -- Author - varchar(50)
    'Duy Linh', -- Publisher - varchar(50)
    'Tien Nghich', -- Title - varchar(100)
    30, -- Price - int
    20  -- InStore - int
    ),
(   2,    -- BookCode - int
    'Than Dong', -- Category - varchar(50)
    'BonCham', -- Author - varchar(50)
    'Vu Quy', -- Publisher - varchar(50)
    'Bao Cong ', -- Title - varchar(100)
    40, -- Price - int
    30  -- InStore - int
    ),
(   3,    -- BookCode - int
    'Suzuka', -- Category - varchar(50)
    'NamCham', -- Author - varchar(50)
    'Quang Anh', -- Publisher - varchar(50)
    'Nhat Ban', -- Title - varchar(100)
    50, -- Price - int
    40  -- InStore - int
    ),
(   4,    -- BookCode - int
    'Nobita', -- Category - varchar(50)
    'SauCham', -- Author - varchar(50)
    'Duy Linh', -- Publisher - varchar(50)
    'Nhat Ban', -- Title - varchar(100)
    60, -- Price - int
    50  -- InStore - int
    ),
(   5,    -- BookCode - int
    'Chaien', -- Category - varchar(50)
    'BayCham', -- Author - varchar(50)
    'Duy Linh ', -- Publisher - varchar(50)
    'Nhat Ban', -- Title - varchar(100)
    70, -- Price - int
    60 -- InStore - int
    )
INSERT INTO dbo.BookSold
(
    BookID,
    CustomerID,
    BookCode,
    Date,
    Price,
    Amount
)
VALUES
(   0,    -- BookID - int
    NULL, -- CustomerID - int
    NULL, -- BookCode - int
    NULL, -- Date - datetime
    NULL, -- Price - int
    NULL  -- Amount - int
    )
