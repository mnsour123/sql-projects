
CREATE DATABASE OnlineShopping;
USE OnlineShopping;


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(50)
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    stock INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(50),
    payment_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);


INSERT INTO Categories(category_name)
VALUES ('Electronics'), ('Clothing'), ('Books');

INSERT INTO Customers(first_name,last_name,email,phone,city)
VALUES
('John','Smith','john@gmail.com','9876543210','New York'),
('Emma','Wilson','emma@gmail.com','9876543211','Chicago'),
('David','Brown','david@gmail.com','9876543212','Boston');

INSERT INTO Products(product_name,category_id,price,stock)
VALUES
('Laptop',1,800.00,20),
('Smartphone',1,600.00,40),
('T-Shirt',2,25.00,100),
('SQL Book',3,45.00,60),
('Headphones',1,100.00,50);

INSERT INTO Orders(customer_id,order_date,total_amount)
VALUES
(1,'2025-01-10',845.00),
(2,'2025-01-12',625.00),
(3,'2025-01-15',145.00);

INSERT INTO Order_Details(order_id,product_id,quantity,price)
VALUES
(1,1,1,800),
(1,4,1,45),
(2,2,1,600),
(2,3,1,25),
(3,5,1,100),
(3,4,1,45);

INSERT INTO Payments(order_id,payment_date,payment_method,payment_status)
VALUES
(1,'2025-01-10','Credit Card','Paid'),
(2,'2025-01-12','UPI','Paid'),
(3,'2025-01-15','Cash','Pending');

