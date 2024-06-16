CREATE DATABASE LaptopHub;
GO

USE LaptopHub;
GO

-- Create User Table
CREATE TABLE [User] (
    userName NVARCHAR(50) NOT NULL PRIMARY KEY,
    userId INT NOT NULL IDENTITY(1,1),
    fullName NVARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL CHECK (LEN(password) >= 8), -- Password must be at least 8 characters
    roleId INT NOT NULL,
    image NVARCHAR(MAX),
    birthday DATE,
    address NVARCHAR(255),
    phone NVARCHAR(20),
    status BIT NOT NULL
);

-- Create Wallet Table
CREATE TABLE Wallet (
    walletId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    userName NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES [User](userName),
    balance FLOAT
);

-- Create Transaction Table
CREATE TABLE [Transaction] (
    transactionId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    walletId INT NOT NULL FOREIGN KEY REFERENCES Wallet(walletId),
    amount FLOAT,
    createdDate DATE,
    transactionType NVARCHAR(50),
    status BIT
);

-- Create Order Table
CREATE TABLE [Order] (
    orderId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    date DATE NOT NULL,
    userName NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES [User](userName),
    totalMoney FLOAT NOT NULL,
    status BIT NOT NULL,
    transactionId INT FOREIGN KEY REFERENCES [Transaction](transactionId)
);

-- Create Shipment Table
CREATE TABLE Shipment (
    shipmentId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    orderId INT NOT NULL FOREIGN KEY REFERENCES [Order](orderId),
    status BIT,
    shipmentName NVARCHAR(100),
    shipmentDate DATE,
    deliveryDate DATE,
    carrier FLOAT,
    totalShip FLOAT
);
-- Create Supplier Table
CREATE TABLE Supplier (
    supplierId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    companyName NVARCHAR(100) NOT NULL UNIQUE,
    homePage NVARCHAR(255),
    country NVARCHAR(100),
    imageLogo NVARCHAR(MAX)
    
);

-- Create Category Table
CREATE TABLE Category (
    categoryId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    categoryName NVARCHAR(100) NOT NULL UNIQUE,
    description NVARCHAR(255),
    imageCat NVARCHAR(255)
);

-- Create Product Table
CREATE TABLE Product (
    productId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    supplierId INT NOT NULL FOREIGN KEY REFERENCES Supplier(supplierId),
    categoryId INT NOT NULL FOREIGN KEY REFERENCES Category(categoryId),
    productName NVARCHAR(100) NOT NULL,
    quantityPerUnit INT,
    unitPrice FLOAT,
    unitInStock INT,
    quantitySold INT,
    starRating SMALLINT,
    isDiscount BIT,
    description NVARCHAR(MAX),
    releaseDate DATE,
    discount FLOAT,
    status BIT NOT NULL
);

-- Create OrderDetails Table
CREATE TABLE OrderDetails (
    orderId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT,
    unitPrice FLOAT,
    discount FLOAT,
    PRIMARY KEY (orderId, productId),
    FOREIGN KEY (orderId) REFERENCES [Order](orderId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);

-- Create ImageProduct Table
CREATE TABLE ImageProduct (
    imageId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    productId INT NOT NULL FOREIGN KEY REFERENCES Product(productId),
    imageUrl NVARCHAR(MAX),
    description NVARCHAR(255)
);

 -- insert customer account into User Table
insert into [User] (userName,fullName,password,roleId,image,birthday,address,phone,status)
values
(N'anh', N'Quốc Anh', 'password123', 1, NULL, '2004-05-10', N'Đà Nẵng', N'0945548214', 1),
(N'thang', N'Minh Thắng', 'password123', 1, NULL, '2004-04-24', N'Đà Nẵng', N'0945362464', 1),
(N'hung', N'Vũ Hưng', 'password123', 1, NULL, '2004-12-04', N'Đà Nẵng', N'0925548249', 1),
(N'vu', N'Nguyên Vũ', 'password123', 1, NULL, '2004-06-21', N'Huế', N'0945612355', 1),
(N'duy', N'Đông Duy', 'password123', 1, NULL, '2002-05-23', N'Hà Nội', N'0975165486', 1),
(N'khiem', N'Viết Khiêm', 'password123', 1, NULL, '2004-05-14', N'Sài Gòn', N'0961451426', 1),
(N'huy', N'Hoảng Huy', 'password123', 1, NULL, '2004-06-17', N'Quảng Bình', N'0987458474', 1),
(N'duong', N'Hoàng Dương', 'password123', 1, NULL, '2004-09-04', N'Nghệ An', N'0931414547', 1),
(N'tuan', N'Quốc Tuấn', 'password123', 1, NULL, '2004-02-08', N'Hà Tĩnh', N'0465321884', 1),
(N'cuong', N'Minh Cường', 'password123', 1, NULL, '2004-01-02', N'daklak', N'0964668561', 1),
(N'dung', N'Mạnh Dũng', 'password123', 1, NULL, '2004-06-17', N'Hà Nội', N'0986165454', 1),
(N'bao', N'Đình Bảo', 'password123', 1, NULL, '2004-07-18', N'Quảng Nam', N'0978946512', 1),
(N'dong', N'Trịnh Đông', 'password123', 1, NULL, '2004-03-25', N'Nghệ An', N'0465123654', 1),
(N'anhh', N'Mai Anh', 'password123', 1, NULL, '2004-07-29', N'Kỳ Anh', N'0915668512', 1),
(N'linh', N'Dương Linh', 'password123', 1, NULL, '2004-02-01', N'Hà Tĩnh', N'0916548756', 1),
(N'suong', N'Huệ Sương', 'password123', 1, NULL, '2004-04-08', N'Cà Mau', N'0951326511', 1),
(N'nhy', N'Yến Nhy', 'password123', 1, NULL, '2004-06-13', N'Huế', N'0946532165', 1),
(N'quynh', N'Thúy Quỳnh', 'password123', 1, NULL, '2004-04-10', N'Hà Nội', N'0948532145', 1),
(N'ha', N'Thu Hà', 'password123', 1, NULL, '2004-12-11', N'DakLak', N'0921355454', 1),
(N'tung', N'Sơn Tùng', 'password123', 1, NULL, '2004-10-22', N'Sài Gòn', N'0945784654', 1),
(N'chau', N'Châu Bùi', 'password123', 1, NULL, '2004-11-26', N'Quảng Bình', N'0987965491', 1),
(N'nhi', N'Đoàn Nhi', 'password123', 1, NULL, '2004-10-12', N'Đà Nẵng', N'0942357946', 1),
(N'tu', N'Cẩm Tú', 'password123', 1, NULL, '2004-03-28', N'Hà Nội', N'0945548214', 1);
go
-- insert admin account into User table
insert into [User](userName,fullName,password,roleId,image,birthday,address,phone,status)
values
(N'Admin1', N'Kim Tú', 'password123', 2, NULL, '2004-06-04', N'Đà Nẵng', N'0942216514', 1),
(N'Admin2', N'Mỹ Duyên', 'password123', 2, NULL, '2004-03-28', N'Đà Nẵng', N'0949865445', 1),
(N'Admin3', N'Nguyên Vũ', 'password123', 2, NULL, '2004-07-01', N'Đà Nẵng', N'0949352145', 1),
(N'Admin4', N'Hoàng Dương', 'password123', 2, NULL, '2004-09-13', N'Đà Nẵng', N'0978621445', 1),
(N'Admin5', N'Đình Quang', 'password123', 2, NULL, '2004-08-23', N'Đà Nẵng', N'0946543151', 1);
-- Insert Balance into Wallet Table
INSERT INTO Wallet (userName, balance) VALUES
(N'anh', 10000000.0),
(N'thang', 15000000.0),
(N'hung', 2000000.0),
(N'vu', 2500000.0),
(N'duy', 3000000.0),
(N'khiem', 3500000.0),
(N'huy', 4000000.0),
(N'duong', 45000000.0),
(N'tuan', 5000000.0),
(N'cuong', 5500000.0),
(N'dung', 6000000.0),
(N'bao', 6500000.0),
(N'dong', 7000000.0),
(N'anhh', 7500000.0),
(N'linh', 8000000.0),
(N'suong', 850000.0),
(N'nhy', 900000.0),
(N'quynh', 9500000.0),
(N'ha', 1000000.0),
(N'tung', 1050000.0),
(N'chau', 1100000.0),
(N'nhi', 1150000.0),
(N'tu', 120000.0);
