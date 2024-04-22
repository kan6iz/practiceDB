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


--             DDL

-- Insert data into the Author table
INSERT INTO Author (author_ID, DoB, nationality, Fname, Lname)
VALUES 
    (1, '1990-05-15', 'American', 'John', 'Doe'),
    (2, '1985-09-20', 'British', 'Jane', 'Smith'),
    (3, '1978-03-10', 'French', 'Michael', 'Johnson');

-- Insert data into the Staff table
INSERT INTO Staff (salary, position, Fname, Lname)
VALUES 
    (50000.00, 'Manager', 'David', 'Brown'),
    (40000.00, 'Assistant', 'Emily', 'Taylor'),
    (60000.00, 'Supervisor', 'James', 'Wilson');

-- Insert data into the Customer table
INSERT INTO Customer (username, gender, email, phone_NO, staff_No)
VALUES 
    ('user1', 'Male', 'user1@example.com', '123456789', 1),
    ('user2', 'Female', 'user2@example.com', '987654321', 2),
    ('user3', 'Male', 'user3@example.com', '111222333', 3);

-- Insert data into the Cart table
INSERT INTO Cart (cusUser, name, cart_info)
VALUES 
    ('user1', 'Book1', 'Details of Book1'),
    ('user2', 'Book2', 'Details of Book2'),
    ('user3', 'Book3', 'Details of Book3');

-- Insert data into the Book table
INSERT INTO Book (price, ISBN, genre, name)
VALUES 
    (29.99, '12345678', 'Fiction', 'Book1'),
    (19.99, '23456789', 'Science', 'Book2'),
    (14.99, '34567890', 'Novel', 'Book3');

-- Insert data into the Author_Book table
INSERT INTO Author_Book (author_ID, ISBN)
VALUES 
    (1, '12345678'),
    (2, '23456789'),
    (3, '34567890');



--            DML

-- Update data in the Customer table
UPDATE Customer
SET email = 'newemail@example.com'
WHERE username = 'user1';

-- Retrieve the count of customers for each gender
SELECT gender, COUNT(*) AS customer_count
FROM Customer
GROUP BY gender;


-- Retrieve data from the Customer table
SELECT username, email
FROM Customer;
