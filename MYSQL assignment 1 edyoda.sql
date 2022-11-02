CREATE DATABASE EDYODA;
SHOW DATABASES;
USE EDYODA;

CREATE TABLE SalesPeople(
Snum INT  NOT NULL PRIMARY KEY,
Sname VARCHAR (255),
City VARCHAR (255),
Comm INT,
UNIQUE (Sname)
);
SELECT * FROM SalesPeople;

INSERT INTO SalesPeople (Snum,Sname,City,Comm)
VALUES (1001, 'Peel', 'London' ,12),
(1002,  'Serres', 'Sanjose' ,13),
(1004, 'Motika', 'London' ,11),
(1007, 'Rifkin', 'Barcelona' ,15),
(1003, 'Axelrod', 'Newyork' ,10);


CREATE TABLE Customers (
Cnum INT NOT NULL PRIMARY KEY,
Cname VARCHAR (255),
City VARCHAR (255) NOT NULL,
Snum INT NOT NULL ,
FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);
SELECT * FROM Customers;
INSERT INTO Customers (Cnum,Cname,City,Snum)
VALUES (2001,  'Hoffman', 'London', 1001),
(2002,  'Giovanni', 'Rome', 1003),
(2003 , 'Liu', 'Sanjose', 1002),
(2004 , 'Grass', 'Berlin', 1002),
(2006 ,'Clemens', 'London', 1001),
(2008,'Cisneros', 'Sanjose', 1007),
(2007, 'Pereira', 'Rome', 1004);


CREATE TABLE Orders (
Onum INT PRIMARY KEY,
Amt INT,
Odate DATE,
Cnum INT NOT NULL,
CONSTRAINT fk FOREIGN  KEY(Cnum) REFERENCES Customers (Cnum),
Snum INT NOT NULL,
 CONSTRAINT fk FOREIGN KEY(Snum) REFERENCES SalesPeople (Snum)
);
SELECT * FROM Orders;
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum)
VALUES (3001, 18.69, '1990-10-3', 2008, 1007),
(3003, 767.19, '1990-10-3', 2001, 1001),
(3002, 1900.10, '1990-10-3', 2007, 1004),
(3005 , 5160.45,'1990-10-3',  2003, 1002),
(3006 , 1098.16, '1990-10-3',  2008, 1007),
(3009, 1713.23, '1990-10-4', 2002, 1003),
(3007,  75.75 , '1990-10-4',2004, 1002),
(3008,  4273.00, '1990-10-5' ,2006, 1001),
(3010,  1309.95, '1990-10-6', 2004, 1002),
(3011 , 9891.88,'1990-10-6', 2006, 1001);


SELECT COUNT(Sname) AS Sname FROM SalesPeople
WHERE Sname like'%a';


SELECT COUNT(Sname) AS Sname FROM SalesPeople
WHERE Sname like'%A';


SELECT COUNT(City) FROM SalesPeople
WHERE City='newyork';


SELECT * FROM SalesPeople
WHERE City='london'and 'paris';

SELECT * from Orders
WHERE Amt>2000;

SELECT Odate,Snum from Orders;
