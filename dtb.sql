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

