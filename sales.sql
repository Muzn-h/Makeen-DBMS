CREATE SEQUENCE CountBy1 
START WITH 0
INCREMENT BY 1 
Maxvalue 10;

select * FROM sys.sequences  WHERE NAME='CountBy1';

CREATE SEQUENCE DECSEQ 
AS decimal (3,0)
START WITH 125
INCREMENT BY 25
Minvalue 100
Maxvalue 200
CYCLE 
CACHE 3 ;

SELECT NEXT VALUE FOR DECSEQ ;


CREATE TABLE Orders(
OrderID INT PRIMARY KEY ,
Name varchar (20) NOT NULL ,
Oty int NOT NULL);

CREATE SEQUENCE TEST.COUNTBY1
START WITH 1 
INCREMENT BY 1 

INSERT Orders (OrderID,Name,Oty)
values (next value for CountBY1 ,'Tire' ,2 );
INSERT Orders (OrderID,Name,Oty)
values (next value for CountBY1 ,'Seat' ,1 );

Select * FROM Customer WHERE Id = 5 ; 

Select * FROM Customer WHERE ID = 'Roland' ; 

Select * FROM Customer WHERE FirstName='Roland' ; 

CREATE INDEX IND1 ON Customer (FirstName);

Select * FROM Customer WHERE FirstName='Roland' ; 




