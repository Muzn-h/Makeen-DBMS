create table Courses (
c_id CHAR (8) CONSTRAINT c_courseid_pk PRIMARY KEY ,
c_name VARCHAR (20));


ALTER table Student add s_firstname CHAR (30) ;
ALTER table Student add s_lastname CHAR (30) ;
ALTER table Student add s_mobile_no CHAR (10) ;
ALTER table Student add s_gender CHAR (1);
ALTER table Student add s_fees numeric (10) 
ALTER TABLE Student add c_id CHAR (8);

ALTER table Student add CONSTRAINT s_student_course_fk
FOREIGN KEY (c_id) REFERENCES COURSES (c_id);