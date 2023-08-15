/*1. Retrieve all columns from the "Customers" table:*/
SELECT * FROM Customers;


/*2. Retrieve the "ProductName" column from the "Products" table:*/
SELECT ProductName FROM Products;


/*3. Retrieve the "OrderID" and "OrderDate" columns from the "Orders" table,
ordered by "OrderDate" in descending order:*/
SELECT OrderID,OrderDate FROM Orders ORDER BY OrderDate DESC;

/*4. Retrieve the "CompanyName" column from the "Suppliers" table, 
where the "Country" is "USA":*/
SELECT CompanyName FROM  Suppliers WHERE Country = 'USA';


/*5. Retrieve the "CategoryName" column from the "Categories" table, 
ordered by "CategoryName" in alphabetical order:*/
SELECT CategoryName from Categories ORDER BY CategoryName ASC;


/*6. Retrieve the "CompanyName" and "ShipCity" columns from the "Shippers" table, joining it with the Orders
table to obtain the Shipper's city for each order*/

SELECT s.CompanyName, o.ShipCity
FROM Shippers s
JOIN Orders o ON s.ShipperID = S.ShipperID;



/*7. Retrieve the "FirstName" and "LastName" columns from the "Employees" table, 
where the "Country" is not "USA":*/

SELECT FirstName , LastName FROM  Employees WHERE Country != 'USA';

/*8. Retrieve the "CustomerID" and "CompanyName" columns from the "Customers" table, 
where the "City" is either "London" or "Paris":*/

SELECT CustomerID , CompanyName FROM  Customers WHERE City = 'London' or City ='Paris' ;


/*9. Retrieve the "OrderID" and "ProductName" columns from the "Order Details" table, 
where the "Quantity" is greater than 10:*/


SELECT
    (SELECT ProductName FROM Products WHERE ProductID = od.ProductID) AS ProductName,
    od.OrderID
FROM [Order Details] od
WHERE od.Quantity > 10;



/*10. Retrieve the "EmployeeID" and "Title" columns from the "Employees" table, 
where the "Title" contains the word "Manager":*/

SELECT EmployeeID, Title
FROM Employees
WHERE Title LIKE '%Manager%';


/*11. Retrieve the "SupplierID" and "CompanyName" columns from the "Suppliers" table, 
where the "CompanyName" starts with the letter "A":*/

SELECT SupplierID, CompanyName
FROM Suppliers
WHERE CompanyName LIKE 'A%';



/*12. Retrieve the "ProductID" and "UnitPrice" columns from the "Products" table, 
where the "UnitPrice" is between 10 and 20:*/

SELECT ProductID, UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 10 AND 20;


/*13. Retrieve the "ShipCountry" and the count of orders shipped to each country from the "Orders" table, 
grouped by "ShipCountry":*/

SELECT ShipCountry, COUNT(*) AS OrderCount
FROM Orders
GROUP BY ShipCountry;


/*14. Retrieve the "CustomerID" and the sum of "Quantity" from the "Order Details" table, grouped by "CustomerID", 
ordered by the sum in descending order:*/

SELECT sum (Quantity) as TotalQ ,CustomerID From "Order Details",Customers
GROUP BY CustomerID ORDER BY TotalQ DESC;



/*15. Retrieve the "ProductName" and the average of "UnitPrice" from the "ProductName" table, grouped by "ProductName", 
ordered by the average in descending order:*/

SELECT avg(UnitPrice) as totalavg, ProductName from Products
GROUP BY ProductName ORDER BY totalavg DESC ;


/*16. Retrieve the "OrderID" and "OrderDate" columns from the "Orders" table, 
where the "OrderDate" is in the year 1997 and the "ShipCity" is "Berlin":*/

SELECT OrderID , OrderDate 
FROM Orders 
WHERE YEAR (OrderDate) = 1997 AND ShipCity='Berlin';


/*17. Retrieve the "CustomerID" and the minimum "OrderDate" from the "Orders" table, 
grouped by "CustomerID":*/

SELECT CustomerID, MIN(OrderDate) AS MinOrderDate
FROM Orders
GROUP BY CustomerID;

/*18. Retrieve the "OrderID" and the maximum "RequiredDate" from the "Orders" table, 
where the "ShipCountry" is either "France" or "Spain":*/

SELECT OrderID, MAX(RequiredDate) AS RequiredDate
FROM Orders
WHERE ShipCountry = 'France' or ShipCountry = 'Spain'
Group by OrderID;

/*19. Retrieve the "ProductID" and the sum of "Quantity" from the "Order Details" table, grouped by "ProductID", 
where the sum is greater than 100:*/

SELECT ProductID, sum (Quantity) as TotalQuantity 
From [Order Details]
GROUP BY ProductID 
HAVING sum (Quantity) >100 ;


/*20. Retrieve the "EmployeeID" and the count of orders handled by each employee from the "Employees" table, grouped by "EmployeeID", 
ordered by the count in descending order:*/

SELECT EmployeeID, COUNT(*) AS OrderCount
FROM Orders
GROUP BY EmployeeID
ORDER BY OrderCount DESC;

/*21. Retrieve the customer ID, company name, and total revenue for customers who have made at least 5 orders, 
ordered by total revenue in descending order.*/

SELECT c.CustomerID, c.CompanyName, 
    (SELECT SUM(od.Quantity * od.UnitPrice)
     FROM [Order Details] od
     WHERE od.OrderID IN (SELECT o.OrderID FROM Orders o WHERE o.CustomerID = c.CustomerID))AS TotalRevenue
FROM Customers c
WHERE (SELECT COUNT(*) FROM Orders o WHERE o.CustomerID = c.CustomerID) >= 5
ORDER BY TotalRevenue DESC;


/*22. Retrieve the employee ID, first name, last name, and the number of orders they have taken, 
for employees who have taken orders in the year 1996, ordered by the number of orders in descending order.*/
SELECT e.EmployeeID, e.FirstName, e.LastName,
    (SELECT COUNT(*)
     FROM Orders o
     WHERE o.EmployeeID = e.EmployeeID AND YEAR(o.OrderDate) = 1996
    ) AS NumberOfOrders
FROM Employees e
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.EmployeeID = e.EmployeeID AND YEAR(o.OrderDate) = 1996
)
ORDER BY NumberOfOrders DESC;


/*23. Retrieve the product name, unit price, and the number of times each product has been ordered, 
for products that have been ordered more than 100 times, ordered by the number of times ordered in descending order.*/
SELECT p.ProductName, p.UnitPrice,
    (SELECT COUNT(*)
     FROM [Order Details] od
     WHERE od.ProductID = p.ProductID
    ) AS NumberOfTimesOrdered
FROM Products p
WHERE (SELECT COUNT(*)
       FROM [Order Details] od
       WHERE od.ProductID = p.ProductID
      ) > 100
ORDER BY NumberOfTimesOrdered DESC;



/*24. Retrieve the employee ID, first name, last name, and the total revenue generated from the orders they have taken, 
for employees who have generated revenue exceeding $100,000, ordered by total revenue in descending order.*/

SELECT e.EmployeeID, e.FirstName, e.LastName,
    (SELECT SUM(od.Quantity * od.UnitPrice)
     FROM Orders o, [Order Details] od
     WHERE o.OrderID = od.OrderID
       AND o.EmployeeID = e.EmployeeID
    ) AS TotalRevenue
FROM Employees e
WHERE (SELECT SUM(od.Quantity * od.UnitPrice)
       FROM Orders o
       JOIN [Order Details] od ON o.OrderID = od.OrderID
       WHERE o.EmployeeID = e.EmployeeID
      ) > 100000
ORDER BY TotalRevenue DESC;



/*25. Retrieve the customer ID, company name, and the number of distinct products they have ordered, 
for customers who have ordered products from more than 5 different categories, ordered by the number of distinct products in descending order.*/
SELECT c.CustomerID, c.CompanyName,
       COUNT(DISTINCT od.ProductID) AS NumberOfDistinctProducts
FROM Customers c, Orders o, [Order Details] od, Products p
WHERE c.CustomerID = o.CustomerID
  AND o.OrderID = od.OrderID
  AND od.ProductID = p.ProductID
GROUP BY c.CustomerID, c.CompanyName
HAVING COUNT(DISTINCT p.CategoryID) > 5
ORDER BY NumberOfDistinctProducts DESC;


/*26. Retrieve the employee ID, first name, last name, and the number of orders they have taken, 
for employees who have taken orders in the month of February, sorted by the number of orders in descending order.*/

SELECT e.EmployeeID, e.FirstName, e.LastName,
       (SELECT COUNT(*)
        FROM Orders o
        WHERE o.EmployeeID = e.EmployeeID
          AND MONTH(o.OrderDate) = 2
       ) AS NumberOfOrders
FROM Employees e
WHERE e.EmployeeID IN (
    SELECT DISTINCT o.EmployeeID
    FROM Orders o
    WHERE MONTH(o.OrderDate) = 2
)
ORDER BY NumberOfOrders DESC;

/*27. Retrieve the product ID, product name, and the total revenue generated from the sales of each product, 
for products that have generated revenue exceeding the average revenue of all products, ordered by total revenue in descending order.*/

SELECT p.ProductID, p.ProductName,
       SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM Products p, [Order Details] od
WHERE od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING SUM(od.Quantity * od.UnitPrice) > (
    SELECT AVG(sub.TotalRevenue)
    FROM (
        SELECT SUM(od2.Quantity * od2.UnitPrice) AS TotalRevenue
        FROM [Order Details] od2
        GROUP BY od2.ProductID
    ) sub
)
ORDER BY TotalRevenue DESC;



/*28. Retrieve the category name and the average unit price of products within each category, 
for categories that have at least 10 products, ordered by the average unit price in descending order.*/

SELECT c.CategoryName, 
       AVG(p.UnitPrice) AS AverageUnitPrice
FROM Categories c, Products p
WHERE c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
HAVING COUNT(p.ProductID) >= 10
ORDER BY AverageUnitPrice DESC;


/*29. Retrieve the customer ID, company name, and the total quantity of products ordered by each customer, 
for customers who have ordered a total quantity exceeding 1000, ordered by the total quantity in descending order.*/
SELECT c.CustomerID, c.CompanyName, TotalQuantity
FROM Customers c, (
    SELECT o.CustomerID, SUM(od.Quantity) AS TotalQuantity
    FROM Orders o, [Order Details] od
    WHERE o.OrderID = od.OrderID
    GROUP BY o.CustomerID
    HAVING SUM(od.Quantity) > 1000
) AS SubQuery
WHERE c.CustomerID = SubQuery.CustomerID
ORDER BY SubQuery.TotalQuantity DESC;




/*30. Retrieve the supplier company name and the number of products supplied by each supplier, 
for suppliers who have supplied more products than the average number of products supplied by all suppliers, ordered by the number of products supplied in descending order.*/
SELECT s.CompanyName, ProductCount
FROM Suppliers s, (
    SELECT SupplierID, COUNT(*) AS ProductCount
    FROM Products
    GROUP BY SupplierID
    HAVING COUNT(*) > (
        SELECT AVG(ProductCount) AS AvgProductCount
        FROM (
            SELECT COUNT(*) AS ProductCount
            FROM Products
            GROUP BY SupplierID
        ) AS SupplierProductCounts
    )
) AS SupplierProductCount
WHERE s.SupplierID = SupplierProductCount.SupplierID
ORDER BY ProductCount DESC;
