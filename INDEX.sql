SELECT FirstName ,LastName FROM Customer WHERE FirstName = 'Thomas' and LastName= 'Hardy';


--select do the full scan in all tables while index scan is scan faster 


CREATE INDEX IN_Customer_FN 
ON Customer (FirstName);

drop index IN_Customer_FN ON Customer ;


CREATE INDEX Customer_FN_LS
ON Customer (FirstName,LastName);



CREATE INDEX Customer_FN_cc
ON Customer (FirstName);


CREATE INDEX Customer_FN_cc
ON Customer (FirstName) include (City);


drop index IN_Customer_FN_cc ON Customer ;

SELECT FirstName , LastName From Customer where FirstName='Thomas';

--VIEW 

CREATE OR ALTER VIEW CUS_VIEW AS 
SELECT ID ,FirstName,LastName ,City,Phone FROM Customer;

SELECT * FROM CUS_VIEW;

CREATE OR ALTER VIEW Cheap_pro_VIEW As 
SELECT * FROM Product wHERE UnitPrice <15;

Select * from Cheap_pro_VIEW;

Select ASCII ('A') , ASCII ('a') , ASCII('z'),ASCII (0) , ASCII(9);

SELECT CHAR (75) ,CHAR (77) ;

SELECT CONVERT (VARCHAR (47) , GETDATE ());
