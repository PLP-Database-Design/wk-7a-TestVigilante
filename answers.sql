-- Question 1 
-- Create the new normalized table
create table ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);
-- Insert atomic (normalized) values — one product per row
insert into ProductDetail_1NF (OrderID, CustomerName, Product) 
values
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Question 2
-- Create a separate table for Orders (eliminate partial dependency)
create table Orders (
    OrderID int primary key,
    CustomerName varchar(100)
);
-- Populate Orders table
insert into Orders (OrderID, CustomerName) 
values
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');
-- Create a new table for OrderLine (each product in an order)
create table OrderLine (
    OrderID int,
    Product varchar(50),
    Quantity int,
    foreign key (OrderID) references Orders(OrderID)
);

-- Populate OrderLine table
insert into OrderLine (OrderID, Product, Quantity) 
values
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);