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
(   1,    -- BookID - int
    1, -- CustomerID - int
    1, -- BookCode - int
    '20210106', -- Date - datetime
    30, -- Price - int
    12 -- Amount - int
    ),
(   2,    -- BookID - int
    1, -- CustomerID - int
    2, -- BookCode - int
    '20210106', -- Date - datetime
    40, -- Price - int
    13  -- Amount - int
    ),
(   3,    -- BookID - int
    2, -- CustomerID - int
    3, -- BookCode - int
    '20210107', -- Date - datetime
    50, -- Price - int
    14  -- Amount - int
    ),
(   4,    -- BookID - int
    2, -- CustomerID - int
    4, -- BookCode - int
    '20210107', -- Date - datetime
    60, -- Price - int
    15  -- Amount - int
    ),
(   5,    -- BookID - int
    3, -- CustomerID - int
    5, -- BookCode - int
    '20210108', -- Date - datetime
    70, -- Price - int
    16  -- Amount - int
    ),
(   6,    -- BookID - int
    3, -- CustomerID - int
    5, -- BookCode - int
    '20210108', -- Date - datetime
    70, -- Price - int
    16 -- Amount - int
    ),
(   7,    -- BookID - int
   4, -- CustomerID - int
    4, -- BookCode - int
    '20210109', -- Date - datetime
    60, -- Price - int
    15  -- Amount - int
    ),
(   8,    -- BookID - int
    4, -- CustomerID - int
    3, -- BookCode - int
    '20210109', -- Date - datetime
    50, -- Price - int
    14  -- Amount - int
    ),
(   9,    -- BookID - int
    5, -- CustomerID - int
    2, -- BookCode - int
    '20210110', -- Date - datetime
    40, -- Price - int
    13  -- Amount - int
    ),
(   10,    -- BookID - int
    5, -- CustomerID - int
    1, -- BookCode - int
    '20210110', -- Date - datetime
    30, -- Price - int
    12 -- Amount - int
    )
-- Yêu cầu 2 
CREATE VIEW Book_Lisr AS
SELECT Book.BookCode, TiTle, Book.Price, Amount FROM dbo.BookSold
JOIN dbo.Book
ON Book.BookCode = BookSold.BookCode
-- Yêu Cầu 3 
CREATE VIEW CustomerDetail AS
SELECT BookSold.CustomerID, Customer.CustomerName, Customer.Address, Book.Title, Amount FROM dbo.BookSold
JOIN dbo.Book
ON Book.BookCode = BookSold.BookCode
JOIN dbo.Customer
ON Customer.CustomerID = BookSold.CustomerID
--yÊU Câù 4
CREATE VIEW Customer_LastMoth AS
SELECT BookSold.CustomerID, Customer.CustomerName, Customer.Address, Book.Title FROM dbo.BookSold
JOIN dbo.Book
ON Book.BookCode = BookSold.BookCode
JOIN dbo.Customer
ON Customer.CustomerID = BookSold.CustomerID
WHERE DATEDIFF(MONTH, BookSold.Date, GETDATE() ) = 1
--Yêu cầu 5
create view Bill as
select BookSold.CustomerID, Customer.CustomerName, sum(BookSold.Price * BookSold.Amount) as TotalPay from BookSold
join Customer
on Customer.CustomerID = BookSold.CustomerID
group by BookSold.CustomerID, Customer.CustomerName
