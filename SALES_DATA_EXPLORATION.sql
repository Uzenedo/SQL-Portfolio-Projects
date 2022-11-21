/*
Sales Data Exploration

Created a Database named 'First_Project'. 

Imported two(2) Tables from Microsoft Excel named 'INPUTDATA' and ' MASTERDATA'

Skills used: Select, Join, Group By, Order By, Aggregate Functions, Temp Tables,  CTE

*/

SELECT * FROM INPUTDATA
SELECT * FROM MASTERDATA


-- Inner Join both tables

SELECT PRODUCT,CATEGORY,QUANTITY,SALE_TYPE,PAYMENT_MODE,BUYING_PRICE,SELLING_PRICE
FROM MASTERDATA
INNER JOIN INPUTDATA ON MASTERDATA.PRODUCT_ID=INPUTDATA.PRODUCT_ID


-- Using Temp-Table to perform calculations from previous query

CREATE TABLE #SALES_DATA(
PRODUCT nvarchar(255),
CATEGORY nvarchar(255),
QUANTITY float,
SALES_TYPE nvarchar(255),
PAYMENT_MODE nvarchar(255),
BUYING_PRICE money,
SELLING_PRICE money
)

INSERT INTO #SALES_DATA
SELECT PRODUCT,CATEGORY,QUANTITY,SALE_TYPE,PAYMENT_MODE,BUYING_PRICE,SELLING_PRICE
FROM MASTERDATA
INNER JOIN INPUTDATA ON MASTERDATA.PRODUCT_ID=INPUTDATA.PRODUCT_ID

SELECT * FROM #SALES_DATA


--Using Aggregate Function to calculate Top 100 profits IN DESC

SELECT TOP 100 *,(SELLING_PRICE - BUYING_PRICE)*QUANTITY AS PROFIT
FROM #SALES_DATA
ORDER BY (SELLING_PRICE - BUYING_PRICE)*QUANTITY DESC


--NO. of Quantity Sold BY Product

SELECT PRODUCT, SUM(QUANTITY) AS QUANTITY_SOLD
FROM #SALES_DATA
GROUP BY PRODUCT
ORDER BY PRODUCT

SELECT SUM(QUANTITY) AS TOTAL_QUANTITY
FROM #SALES_DATA


--Method of Payment by Category

SELECT CATEGORY, PAYMENT_MODE, COUNT(PAYMENT_MODE) AS METHOD_OF_PAYMENT
FROM #SALES_DATA
GROUP BY PAYMENT_MODE,CATEGORY


--Total Sales by Category and Sales_type 

SELECT CATEGORY, SALES_TYPE, SUM(SELLING_PRICE*QUANTITY) AS TOTAL_SALES
FROM #SALES_DATA
GROUP BY CATEGORY, SALES_TYPE
ORDER BY SALES_TYPE


--Sum of Sales_Type by Quantity

SELECT SALES_TYPE, SUM(QUANTITY) AS TOTAL_QUANTITY
FROM #SALES_DATA
GROUP BY SALES_TYPE

--Using CTE For calculating Total sales and Profit by Product

WITH SALES_DATASET AS

(SELECT *,(SELLING_PRICE - BUYING_PRICE)*QUANTITY AS PROFIT, SELLING_PRICE * QUANTITY AS TOTAL_SALES
FROM #SALES_DATA
)
SELECT PRODUCT, SUM(TOTAL_SALES) AS TOTAL_SALES, SUM (PROFIT) AS PROFIT
FROM SALES_DATASET
GROUP BY PRODUCT


