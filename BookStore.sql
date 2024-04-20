-- Create the Author table
CREATE TABLE Author (
    author_ID INT PRIMARY KEY,
    DoB DATE,
    nationality VARCHAR(50),
    Fname VARCHAR(50),
    Lname VARCHAR(50)
);
-- Create the Staff table
CREATE TABLE Staff (
    staff_No INT PRIMARY KEY AUTO_INCREMENT,
    salary DECIMAL(10, 2),
    position VARCHAR(50),
    Fname VARCHAR(50),
    Lname VARCHAR(50)
);

-- Create the Customer table
CREATE TABLE Customer (
    username VARCHAR(50) PRIMARY KEY,
    gender VARCHAR(10),
    email VARCHAR(100),
    phone_NO VARCHAR(20),
    staff_No INT,
    FOREIGN KEY (staff_No) REFERENCES Staff(staff_No)
);

-- Create the Cart table
CREATE TABLE Cart (
    cusUser VARCHAR(50),
    cartID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    cart_info VARCHAR(255),
    FOREIGN KEY (cusUser) REFERENCES Customer(username)
);

-- Create the Book table
CREATE TABLE Book (
    price DECIMAL(10, 2),
    ISBN VARCHAR(8) PRIMARY KEY,
    genre ENUM('Fiction','Science','Novel','Young Adult','Biography','Self-help'),
    name VARCHAR(100)
);

-- Create the Author_Book table
CREATE TABLE Author_Book (
    author_ID INT PRIMARY KEY,
    ISBN VARCHAR(20),
    FOREIGN KEY (author_ID) REFERENCES Author(author_ID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);
