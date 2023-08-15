
Create Table Course (
c_id INT NOT NULL primary key ,
c_Name [NVARCHAR](50) );


Create Table STUDENT (
StudentID INT NOT Null primary key ,
s_firstname[NVARCHAR](50) NOT NULL ,
s_lastname [NVARCHAR](50) NOT NULL ,);


insert into  Student VALUES (2,'Reem','alajmi');
insert into  Student VALUES (5,'Ahmed','almm');



ALTER TABLE Course ADD CONSTRAINT S_COURSE_FK FOREIGN KEY (c_id) REFERENCES Course (c_id);


select TABLE_NAME,
		CONSTRAINT_TYPE ,CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME='STUDENT';


