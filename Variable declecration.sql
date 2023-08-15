BEGIN 
	PRINT 'WELECOM TO T-SQL'
END 

BEGIN 
DECLARE @VAR1 INT =5;
SET @VAR1 = 5;
PRINT @VAR1;

END

BEGIN 
DECLARE @NAME VARCHAR (20);
DECLARE @SAL NUMERIC (8,2);
SET @NAME ='ALI';
SET @SAL =700;
PRINT @NAME;
PRINT @SAL;
PRINT @NAME  +' EARNS ' +CAST (@SAL AS VARCHAR );
END

BEGIN 
DECLARE @WIDTH INT=6;
DECLARE @HEIGHT INT = 7;
SET  @WIDTH =6;
SET  @HEIGHT =7;
PRINT @WIDTH;
PRINT @HEIGHT;
PRINT 'THE AREA IS ' + CAST ((@WIDTH *   @HEIGHT) AS VARCHAR) ;

END


BEGIN 
DECLARE @FIRSTNAME VARCHAR (20);
DECLARE @LASTNAME VARCHAR (20);

SELECT @FIRSTNAME = FIRSTNAME ,@LASTNAME =LASTNAME
FROM CUSTOMER 
WHERE Id = 4 ;

PRINT 'CUSTOMER WITH ID 4 :' + @FIRSTNAME +' ' + @LASTNAME;
END 

BEGIN 
DECLARE @Average NUMERIC  ;
SELECT @Average = AVG (UnitPrice) FROM product ;
PRINT 'THE AVRAGE IS ' + CAST (@average AS VARCHAR) ;
END


BEGIN 
DECLARE @Price NUMERIC (12,2);
SELECT @Price = UnitPrice FROM product 
WHERE ID = 29 ;
IF @Price >=100
	PRINT 'The Product is Expensive '
ELSE 
	PRINT 'The Product is not Expensive';
END 


BEGIN 
DECLARE @UnitPrice NUMERIC (12,2)=30;
if @UnitPrice > 50
SELECT * FROM product 
WHERE UnitPrice>=50;
ELSE 
SELECT * FROM product 
WHERE UnitPrice<50;
END 

begin
SELECT CompanyName , FAX = 
	Case Country 
	when null then 'NOT FOUND '
	when'USA' THEN 'United State '
	else Country 
	end 
from Supplier;
END 

begin
SELECT CompanyName , FAX = 
	Case 
	when FAX IS NULL THEN 'NOT FOUND '
	else FAX 
	end 
from Supplier;
END 


BEGIN 
DECLARE @PRICE NUMERIC (12,2);
DECLARE @ID INT = 30;
WHILE @id<=40
	BEGIN 
		SELECT @Price =UnitPrice FROM Product
		WHERE Id = @id;
		IF @Price>=100
			PRINT 'The Product is Expensive'
		ELSE 
			PRINT 'The Product is not Expensive '
		SET @id = @id+1;
	END
END 



DECLARE @City NVARCHAR(50); 
DECLARE @Counter INT = 1; 

WHILE @Counter <= (SELECT COUNT(*) FROM Customer)
BEGIN
    SET @City = (SELECT City FROM Customer WHERE Id= @Counter);
    PRINT 'City: ' + @City;
    
    SET @Counter = @Counter + 1; 
END


DECLARE @COUNTER INT =1 ;
DECLARE @MAXCOUNT INT = 10;

WHILE @COUNTER <=@MAXCOUNT
BEGIN
    IF @COUNTER % 3 = 0
        PRINT 'COUNTER'+ CAST(@COUNTER AS VARCHAR);
    ELSE
        PRINT  'COUNTER: ' + CAST(@COUNTER AS VARCHAR);

    SET @COUNTER = @COUNTER + 1;

END 

BEGIN TRY 
	SELECT 1/0;
END TRY 
BEGIN CATCH 
	SELECT 
	 
	@@ERROR AS ERROR,
	ERROR_NUMBER()AS Errorliumber,
	ERROR_SEVERITY () AS ErrorServerity,
	ERROR_STATE()AS ERRORState,
	ERROR_PROCEDURE () AS ErrorProcedure,
	ERROR_LINE () AS Errorline ,
	ERROR_MESSAGE () AS EroorMessage;

END CATCH 



BEGIN TRY 
 
DECLARE @NAME VARCHAR (20);
DECLARE @SAL NUMERIC (8,2);
SET @NAME ='ALI';
SET @SAL =700;
PRINT @NAME;
PRINT @SAL;
PRINT @NAME  +' EARNS ' +@SAL  ;
END TRY 

BEGIN CATCH 
	SELECT 
	@@ERROR AS ERROR,
	ERROR_NUMBER()AS Errorliumber,
	ERROR_SEVERITY () AS ErrorServerity,
	ERROR_STATE()AS ERRORState,
	ERROR_PROCEDURE () AS ErrorProcedure,
	ERROR_LINE () AS Errorline ,
	ERROR_MESSAGE () AS EroorMessage;

END CATCH 




BEGIN 
DECLARE @CustomerId INT ;
DECLARE @fName NVARCHAR (40);
DECLARE @City NVARCHAR (40);

DECLARE v_customer_cursor CURSOR FOR 
	SELECT Id,FirstName , City 
	FROM Customer WHERE  Country ='UK';
OPEN v_customer_cursor;
FETCH NEXT FROM v_customer_cursor
INTO  @CustomerId,@fName,@City;
while @@FETCH_STATUS = 0 
begin 
print 'Customer:' + CAST (@CustomerId AS VARCHAR )+ 
'=>' + @fName + 'from' +@City;

FETCH NEXT FROM v_customer_cursor
INTO @CustomerId,@fName,@City;
END
CLOSE v_customer_cursor;
DEALLOCATE v_customer_cursor;
END 


/*FETCH ALL PRODUCT HAVE DISCOUNT WITH THE PRICE AND THE NAME OF THE COMPANY */

BEGIN 
DECLARE @ProductName NVARCHAR(50);
DECLARE @UnitPrice DECIMAL(10, 2);
DECLARE @CompanyName NVARCHAR(50);

DECLARE DISCOUNT_PRODUCT_CURSOR CURSOR FOR 

SELECT p.ProductName, p.UnitPrice, s.CompanyName
    FROM Product p, Supplier s
    WHERE p.ISDiscontinued = 1 AND p.SupplierID = s.ID;
OPEN DISCOUNT_PRODUCT_CURSOR;

FETCH NEXT FROM DISCOUNT_PRODUCT_CURSOR
INTO  @ProductName,@UnitPrice,@CompanyName;
while @@FETCH_STATUS = 0 
BEGIN
    PRINT 'Product: ' + @ProductName + ', Price: ' + CAST(@UnitPrice AS NVARCHAR(10)) + ', Company: ' + @CompanyName;

    FETCH NEXT FROM DISCOUNT_PRODUCT_CURSOR INTO @ProductName, @UnitPrice, @CompanyName;
END

CLOSE DISCOUNT_PRODUCT_CURSOR;
DEALLOCATE DISCOUNT_PRODUCT_CURSOR;
END 



BEGIN 
DECLARE @SupplierID INT ;
DECLARE @Fax nvarchar(30);

DECLARE UPDATE_FAX_CURSOR CURSOR FOR 
SELECT Id,Fax
FROM Supplier
WHERE Country = 'UK' 

OPEN UPDATE_FAX_CURSOR;

FETCH NEXT FROM UPDATE_FAX_CURSOR
INTO  @SupplierID,@Fax;
while @@FETCH_STATUS = 0 
BEGIN
    
    SET @Fax='Not Found';
	UPDATE Supplier SET Fax = @Fax WHERE Country='UK';
    PRINT ' supplier: ' + CAST (@SupplierID AS VARCHAR )+
	'The Fax'+@Fax;
    FETCH NEXT FROM UPDATE_FAX_CURSOR INTO @SupplierID, @Fax;
END

CLOSE UPDATE_FAX_CURSOR;
DEALLOCATE UPDATE_FAX_CURSOR;
END 



select fax from Supplier where Country = 'UK';



BEGIN 
DECLARE @CustomerID nvarchar(5);
DECLARE @Phone nvarchar(24);

DECLARE customer_phone_cursor  CURSOR FOR 
SELECT CustomerID,Phone
FROM Customers
where Phone LIKE '%555%';

OPEN customer_phone_cursor;

FETCH NEXT FROM customer_phone_cursor
INTO  @CustomerID,@Phone;
while @@FETCH_STATUS = 0 
BEGIN
        PRINT 'Customer ' + @CustomerID + ' has phone number: ' + @Phone;
        FETCH NEXT FROM customer_phone_cursor INTO @CustomerID, @Phone;
    END
CLOSE customer_phone_cursor;
DEALLOCATE customer_phone_cursor;
END 






