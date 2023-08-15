/*Create Table Student (
StudentID INT NOT Null primary key ,
name [NVARCHAR](50) NOT NULL ,
Location [NVARCHAR](50) NOT NULL ,
Email [NVARCHAR](50) NOT NULL );

EXEC SP_HELP 'Student';

insert into  Student VALUES (2,'Reem','Muscat','reem.a@makeen.com');
select * from Student; 


alter database makeenDB modify name = MAKEEN_NEW_DB;
alter Table Student ADD Phone NUMERIC (8);
Exec sp_help 'student';

ALTER TABLE Phone alter column 
Phone NUMERIC (11,0);
*/

/*select TABLE_NAME,
		CONSTRAINT_TYPE ,CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME='STUDENT';
*/
--ALTER TABLE Student DROP CONSTRAINT StudentID;


--SELECT convert (time ,SYSDATETIME()) as Today ;

/*
CREATE TABLE STUD1(
STUD1_ID INT NOT Null primary key ,
Name [NVARCHAR](50) NOT NULL );

CREATE TABLE STUD2(
STUD2_ID INT NOT Null primary key ,
Name2 [NVARCHAR](50) NOT NULL );


insert into  STUD1 VALUES (6,'Muzn');
insert into STUD1 VALUES (8,'Amira');


*/
--insert into STUD2 (STUD2_ID , Name2) select STUD1_ID, Name from STUD1;
/*SELECT * FROM STUD1;
SELECT * FROM STUD2;*/

CREATE TABLE PRODUCT (
Pro_ID INT NOT Null primary key ,
Pro_Name [NVARCHAR](50) NOT NULL ,
Pro_Countity INT NOT Null,
Pro_price INT NOT Null );

INSERT INTO PRODUCT VALUES (1,'WATER',4 ,100);


Select Pro_Countity * Pro_price As Total_Result FROM PRODUCT  WHERE Pro_Name = 'WATER';

SELECT *FROM PRODUCT;