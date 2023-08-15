select min (orderDate) from "Order";


SELECT FirstName from Customer ORDER BY FirstName DESC;


SELECT FirstName from Customer ORDER BY FirstName ASC;

SELECT COUNT (id) from "Order" where CustomerId = 2 ;

SELECT COUNT (CustomerId),FirstName from "Order",Customer where "Order".Customerid = Customer.id group by FirstName;


SELECT COUNT (CustomerId),FirstName from "Order",Customer where "Order".Customerid = Customer.id AND "Order".OrderDate < '2013-01-01' Group by FirstName ;

SELECT COUNT (CustomerId),FirstName from "Order",Customer where "Order".Customerid = Customer.id AND "Order".OrderDate < '2013-01-01' GROUP BY FirstName ORDER BY FirstName DESC ;


SELECT COUNT (CustomerId),FirstName from "Order",Customer
where "Order".Customerid = Customer.id AND "Order".OrderDate < '2013-01-01' 
GROUP BY FirstName
HAVING COUNT (CustomerId)>5 
ORDER BY FirstName DESC;



select Top 6 MAX (TotalAmount) AS Total_Price ,FirstName , LastName 
From "Order" o ,Customer c 
where o.CustomerId = c.Id 
Group BY FirstName,LastName 
ORDER BY Total_Price ASC;


SELECT AVG(P.UnitPrice) AS Average_UnitPrice, S.CompanyName
FROM Supplier S
JOIN Product P ON S.Id = P.SupplierId
GROUP BY S.CompanyName
ORDER BY Average_UnitPrice ASC;


SELECT Country, COUNT(*) AS CompanyCount
FROM Customer
GROUP BY Country;




SELECT CompanyName c, (SELECT SUM(TotalAmount) FROM "Order" WHERE s.Id = Id) AS TotalRevenue
FROM Supplier s;




select top 1 p.productName, max(o.Quantity)as higtest , c.FirstName, c.LastName from Product p ,OrderItem o, Customer c, "Order" oo
where p.Id = ProductId and oo.Id = o.OrderId  and oo.CustomerId = c.Id
group by  p.ProductName,c.FirstName,c.LastName
order by higtest DESC; 


SELECT * FROM Customer
WHERE FirstName like '_o%'; --second letter 


SELECT * FROM Customer 
where FirstName like 'J%' --First letter 

SELECT * FROM Customer 
where FirstName like '%s' --last letter 

SELECT * FROM Customer 
where FirstName like '%s%' -- any where

SELECT * FROM Customer 
where FirstName like '__s%' -- in 3rd position 

SELECT * FROM Customer 
where Country IN ('Uk' ,'Mexico')-- in 3rd position 

SELECT FirstName FROM Customer WHERE phone like '%555%';

select * from Customer 
where id between 2 and 4 ;


