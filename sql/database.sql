-- database.sql

CREATE TABLE Customer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(150),
    birthDate DATE
);

CREATE TABLE Employee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    position VARCHAR(50)
);

CREATE TABLE Sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dateTime DATETIME,
    totalPrice DECIMAL(10, 2),
    discount DECIMAL(10, 2),
    channel ENUM('In-store', 'Event', 'Online'),
    employeeId INT,
    FOREIGN KEY (employeeId) REFERENCES Employee(id)
);

CREATE TABLE Product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    type ENUM('Diamond', 'Setting'),
    price DECIMAL(10, 2),
    material VARCHAR(100),
    size VARCHAR(50),
    weight DECIMAL(10, 2),
    certificateId VARCHAR(100)
);

CREATE TABLE Diamond (
    id INT PRIMARY KEY AUTO_INCREMENT,
    caratSize DECIMAL(5, 2),
    shape ENUM('Round', 'Princess', 'Emerald'),
    color ENUM('D', 'E', 'F', 'G', 'H'),
    clarity ENUM('FL', 'IF', 'VVS1', 'VVS2'),
    productId INT,
    FOREIGN KEY (productId) REFERENCES Product(id)
);

CREATE TABLE Setting (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type ENUM('Ring', 'Necklace', 'Bracelet', 'Earrings'),
    material VARCHAR(100),
    size VARCHAR(50),
    weight DECIMAL(10, 2),
    price DECIMAL(10, 2),
    productId INT,
    FOREIGN KEY (productId) REFERENCES Product(id)
);

CREATE TABLE SalesItem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    salesId INT,
    productId INT,
    quantity INT,
    unitPrice DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    discount DECIMAL(10, 2),
    FOREIGN KEY (salesId) REFERENCES Sales(id),
    FOREIGN KEY (productId) REFERENCES Product(id)
);
