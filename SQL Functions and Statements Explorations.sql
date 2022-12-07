/*
SQL Functions and Statements Explorations

Created a Database named 'Employee'. 

Created 2 (two) Tables From Scratch named "EmployeeInfo" and "EmployeeDetails"

Skills used: Create, NOT NULL, Insert Into, Select, Like, BETWEEN, OR, IN, NOT, AND, Select Into, Update, Union, Union All, Except, Intercept and Joins(Full Outer, Inner, Left Outer and Right Outer), 

*/

--Created a Database

CREATE DATABASE Employee

--Created a table, added NOT NULL and inserted values

CREATE TABLE EmployeeInfo(
EmployeeID int NOT NULL,
FirstName varchar (50),
LastName varchar (50),
Age int,
Gender varchar (50),
JobTitle varchar (50),
Salary int,
)

INSERT INTO EmployeeInfo
VALUES (1001,'Mary','Njoku', 28,'Female', 'Cashier', 35000),
(1002,'Martha','Okon', 27,'Female', 'Marketer', 40000),
(1003,'Benjamin','Noble', 34,'Male', 'Accountant', 60000),
(1004,'Onyinye','Obi', 30,'Female', 'HR', 90000),
(1005,'Ese','Oseni', 33,'Female', 'Janitor', 15000),
(1006,'Felix','Akindele', 24,'Male', 'Salesman', 37000),
(1007,'Amos','Kome', 35,'Male', 'Manager', 70000),
(1008,'Jerry','Akpan', 29,'Male', 'Salesman', 35000),
(1009,'Mariam','Abayomi', 31,'Female', 'Receptionist', 45000),
(1010,'Blessing','Monday', 25,'Female', 'Accountant', 55000),
(1011,'Samuel','Balogun', 38,'Male', 'HR', 85000),
(1012,'Mishael','Benson', 33,'Male', 'Analyst', 80000)

SELECT * FROM EmployeeInfo


/*Using Like, BETWEEN, OR, IN, NOT, AND Operator*/

--Show Employees whose LastName Begins with 'O'

SELECT * FROM EmployeeInfo
WHERE LastName LIKE 'O%'

--Show Employees Whose FirstName has 'a' in the second Position

SELECT * FROM EmployeeInfo
WHERE FirstName LIKE '_a%'

--Show Details of Employees whose Salary lies between 40000 and 80000

SELECT * FROM EmployeeInfo
WHERE Salary BETWEEN 40000 AND 80000

--Show Details of Employees whose Jobtitle is Salesman and Accountant
--Use This

SELECT * FROM EmployeeInfo
WHERE JobTitle = 'Salesman' OR JobTitle ='Accountant'

--OR This

SELECT * FROM EmployeeInfo
WHERE JobTitle IN ('Salesman','Accountant')

--Show Details of Male Employees(that are not Female)

SELECT * FROM EmployeeInfo
WHERE NOT Gender='Female'

--Female Employees From 30 and above

SELECT * FROM EmployeeInfo
WHERE Gender='Female' AND Age >= 30


/* Using Select Into, Insert Into, Update and Case Statement*/

--Use Select Into Statement to copy EmployeeID and FirstName From EmployeeInfo Table Into EmployeeDetails Table. 

SELECT  EmployeeID, FirstName INTO EmployeeDetails 
FROM EmployeeInfo

SELECT * FROM EmployeeDetails

--INSERT new data into EmployeeDetails Table

INSERT INTO EmployeeDetails
VALUES(1013,'Funmi'),
(1014,'Stella'),
(1015,'Johnson'),
(1016,'Paul')

--Change the FirstNames of 3 rows by using Update and Case Statement

UPDATE EmployeeDetails
SET FirstName= 
(CASE 
When EmployeeID=1001 THEN 'Onyinye'
When EmployeeID=1002 THEN 'Mariam'
When EmployeeID=1005 THEN 'Blessing'
END)
WHERE EmployeeID IN (1001,1002,1005)

--INSERT new data into EmployeeInfo Table

INSERT INTO EmployeeInfo (EmployeeID,FirstName,Gender,JobTitle)
VALUES(1014,'Faith','Female', 'HR'),
(1017,'Philip','Male','Janitor')

INSERT INTO EmployeeInfo (EmployeeID,LastName,Age)
VALUES (1018,'Nelson',26),
(1019,'Cole',30)


/*Show the Differences in Union, Union All, Except and Intercept*/

--Remember, both tables must have similar columns and equal number of columns/fields.
--Use EmployeeID and FirstName columns which both tables have

--UNION

SELECT EmployeeID, FirstName FROM EmployeeInfo
UNION
SELECT EmployeeID, FirstName FROM EmployeeDetails

--UNION ALL

SELECT EmployeeID, FirstName FROM EmployeeInfo
UNION ALL
SELECT EmployeeID, FirstName FROM EmployeeDetails

--EXCEPT

SELECT EmployeeID, FirstName FROM Employeeinfo
EXCEPT
SELECT EmployeeID, FirstName FROM EmployeeDetails

--INTERSECT

SELECT EmployeeID, FirstName FROM EmployeeInfo
INTERSECT
SELECT EmployeeID, FirstName FROM EmployeeDetails


/*Show the Differences in the types of Joins*/
--Use Alias to rename the tables

--FULL OUTER JOIN

SELECT * FROM EmployeeInfo a
FULL OUTER JOIN EmployeeDetails b ON
a.EmployeeID=b.EmployeeID

--INNER JOIN

SELECT * FROM EmployeeInfo a
INNER JOIN EmployeeDetails b ON
a.EmployeeID=b.EmployeeID

--LEFT OUTER JOIN

SELECT * FROM EmployeeInfo a
LEFT OUTER join EmployeeDetails b ON
a.EmployeeID=b.EmployeeID

--RIGHT OUTER JOIN

SELECT * FROM EmployeeInfo a
RIGHT OUTER join EmployeeDetails b ON
a.EmployeeID=b.EmployeeID

--Drop Tables

DROP TABLE EmployeeInfo
DROP TABLE EmployeeDetails