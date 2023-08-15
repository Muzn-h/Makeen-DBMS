--LAB 4 
/*5)	Using the ‘insert’ statements, add at least 3 rows to each table. */


INSERT INTO book (bk_id, bk_title, bk_edition, bk_#ofPages, bk_totalCopies, bk_remCopies)
VALUES (5001, 'Data Structures', 2, 400, 120, 90);

INSERT INTO book (bk_id, bk_title, bk_edition, bk_#ofPages, bk_totalCopies, bk_remCopies)
VALUES (5002, 'Algorithm Design', 3, 350, 80, 60);

INSERT INTO book (bk_id, bk_title, bk_edition, bk_#ofPages, bk_totalCopies, bk_remCopies)
VALUES (5003, 'Introduction to Programming', 1, 250, 100, 100);
SELECT * FROM book;


INSERT INTO bookTopic (tp_bkid, tp_desc)
VALUES (1001, 'Database Concepts');

INSERT INTO bookTopic (tp_bkid, tp_desc)
VALUES (1001, 'Normalization');

INSERT INTO bookTopic (tp_bkid, tp_desc)
VALUES (1002, 'SQL Queries');
SELECT * FROM bookTopic;

INSERT INTO borrower (br_id, br_name, br_dept, br_mobile#, br_city, br_house#, br_type)
VALUES (5000, 'Ahmed', 'COMP', 99887766, 'Muscat', '123', 'S');

INSERT INTO borrower (br_id, br_name, br_dept, br_mobile#, br_city, br_house#, br_type)
VALUES (6000, 'Layla', 'INFS', 91112233, 'Seeb', '456', 'S');

INSERT INTO borrower (br_id, br_name, br_dept, br_mobile#, br_city, br_house#, br_type)
VALUES (7000, 'Yousef', 'FINA', NULL, 'Muscat', '789', 'S');
SELECT * FROM borrower;

INSERT INTO CBlink (li_crCode, li_bkId, li_usage)
VALUES ('COMP4201', 1001, 'T');

INSERT INTO CBlink (li_crCode, li_bkId, li_usage)
VALUES ('COMP4201', 1002, 'R');

INSERT INTO CBlink (li_crCode, li_bkId, li_usage)
VALUES ('COMP4202', 1002, 'T');
SELECT * FROM CBlink;

INSERT INTO college (cl_code, cl_name, cl_dean)
VALUES ('ENG', 'Engineering', 'Dr. Smith');

INSERT INTO college (cl_code, cl_name, cl_dean)
VALUES ('BUS', 'Business', 'Prof. Johnson');

INSERT INTO college (cl_code, cl_name, cl_dean)
VALUES ('LAW', 'Law', 'Dr. Williams');

SELECT * FROM college;

INSERT INTO course (cr_code, cr_title, cr_CH, cr_#ofSec, cr_dept)
VALUES ('MATH101', 'Introduction to Mathematics', 3, 1, 'SCI');

INSERT INTO course (cr_code, cr_title, cr_CH, cr_#ofSec, cr_dept)
VALUES ('PHYS201', 'Physics for Engineers', 4, 2, 'SCI');

INSERT INTO course (cr_code, cr_title, cr_CH, cr_#ofSec, cr_dept)
VALUES ('BUS200', 'Introduction to Business', 3, 1, 'BUS');

SELECT * FROM course;

INSERT INTO department (dp_code, dp_name, dp_hod, dp_col)
VALUES ('MATH', 'Mathematics', 'Dr. Smith', 'SCI');

INSERT INTO department (dp_code, dp_name, dp_hod, dp_col)
VALUES ('ENG', 'Engineering', 'Dr. Johnson', 'ENG');

INSERT INTO department (dp_code, dp_name, dp_hod, dp_col)
VALUES ('PSYCH', 'Psychology', 'Dr. Williams', 'ART');
SELECT * FROM department;


INSERT INTO employee (em_id, em_office#, em_ext#)
VALUES (5001, '25A', 2225);

INSERT INTO employee (em_id, em_office#, em_ext#)
VALUES (5002, '17B', 1502);

INSERT INTO employee (em_id, em_office#, em_ext#)
VALUES (5003, '10C', 3201);

SELECT * FROM employee;


INSERT INTO issuing (is_brID, is_bkID, is_dateTaken, is_dateReturn)
VALUES (92120, 1001, '2023-08-01', '2023-08-15');

INSERT INTO issuing (is_brID, is_bkID, is_dateTaken, is_dateReturn)
VALUES (10021, 1002, '2023-08-02', '2023-08-17');

INSERT INTO issuing (is_brID, is_bkID, is_dateTaken, is_dateReturn)
VALUES (92120, 3002, '2023-08-03', NULL);

SELECT * FROM issuing;


INSERT INTO regist (re_brID, re_crCode, re_semester)
VALUES (92120, 'COMP4201', 'FL2023');

INSERT INTO regist (re_brID, re_crCode, re_semester)
VALUES (10021, 'COMP4202', 'FL2023');

INSERT INTO regist (re_brID, re_crCode, re_semester)
VALUES (92120, 'BIOL1000', 'FL2023');

SELECT * FROM regist;


INSERT INTO student (st_id, st_major, st_cohort)
VALUES (5001, 'Computer Science', 2022);

INSERT INTO student (st_id, st_major, st_cohort)
VALUES (5002, 'Information Systems', 2023);

INSERT INTO student (st_id, st_major, st_cohort)
VALUES (5003, 'Biology', 2021);

SELECT * FROM student;

/*6)	Write SQL queries to answer the queries from ‘a-d’ and either ‘e’ or ‘f’:  
(a)	Retrieve full information stored in one table. 	*/
SELECT * FROM college;
/*(b)	Retrieve from any table the records which satisfy certain criteria. 	*/
SELECT * FROM book
WHERE bk_edition >= 2;
/*
(c)	Using any table which contains a numeric field, retrieve the record which has the maximum value for that field. */
SELECT * FROM issuing WHERE is_dateTaken = (SELECT MAX(is_dateTaken) FROM issuing);
/*
(d)	List related information from two tables. The list must contain at least one field from each table. 	*/
SELECT br_name, (SELECT dp_name FROM department WHERE dp_code = br_dept) AS department_name
FROM borrower;

/*
(e)	Produce a statistical list (Query) of two columns only, which aggregates the records within a table based on the values stored in one textual-field (the 1st column) while the 2nd column lists aggregated information using one of these functions: ‘COUNT’, ‘SUM’, or ‘AVERAGE’. 	*/
*/
SELECT bk_title, SUM(bk_#ofPages) AS total_pages
FROM book
GROUP BY bk_title;
/*
(f)	Produce a calculated list (Query) based on a single table. The list must have at least two columns, one of them is textual column while the 2nd column is calculated (e.g., summed-up) from other fields.*/

SELECT bk_title, SUM(bk_totalCopies) AS total_copies, SUM(bk_remCopies) AS remaining_copies
FROM book
GROUP BY bk_title;

/*
Display the title of the book (from the BOOK table) and the title of the course (from the COURSE table) for all books that are assigned to any course.*/
SELECT b.bk_title AS BookTitle, c.cr_title AS CourseTitle
FROM book b, course c, CBlink cb
WHERE b.bk_id = cb.li_bkId AND c.cr_code = cb.li_crCode;

/*
Write a T-SQL query to fetch book names having total copies greater than 50 and less than or equal to 100.*/

DECLARE @MinCopies INT = 50;
DECLARE @MaxCopies INT = 100;
SELECT bk_title, bk_totalCopies
FROM book
WHERE bk_totalCopies > @MinCopies AND bk_totalCopies <= @MaxCopies;
/*
Based on the borrower table select the unique department code values that represented for the borrower from Seeb city and order by the result in descending order by department code.  */
SELECT DISTINCT br_dept
FROM borrower
WHERE br_city = 'Seeb'
ORDER BY br_dept DESC;

