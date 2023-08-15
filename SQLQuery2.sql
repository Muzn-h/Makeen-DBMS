CREATE TABLE emolpyee(
e_id int ,
e_name varchar (15),
constraint pk_id_emp primary key (e_id));

ALTER TABLE emolpyee alter column e_id int not null ;
ALTER TABLE emolpyee add constraint e_pk  primary key (e_id);
ALTER table emoployee add age INT ;
ALTER TABLE emolpyee add constraint emp_age  check (age>23);

