#******************************* DATABASES - 2 OP -  Exam 20.11.2019**************************************************************************************
/* Total: 50 Points, To Pass: 20 Points
1. Import the database 'examdb201.sql'  to get all tables required for the exam. 
2.	All required tables for the exam should be created in the same database that is your working database in the exam is  'examdb201'
3. You need to upload your database and SQL queries. After completing all tasks, you will export your database and upload to the Moodle
along with your SQL queries.  
4. None of the submission via email will be accepted. If you fail to submit exam for any reason, you will have to participate the re-exam that will be organized later.
*/
#****************************************************************************************************************************************************************************
/* 1.  Write a SQL statement to create a table named 'grades' including columns st_id, course_name,
 grade, completion_date and email_id . You need to ensure that the grade can not exceed the upper limit of 5 
 that is the grade should be between 0 & 5.Make sure that the column email_id will not contain any duplicate value.
 st_id is a primary key with autoincrement feature. 
 The column course_name can not contain any Null value. Insert 2 random records into the table. (6 Points) */
create table  grades 
(st_id int auto_increment primary key,
course_name varchar(25) not null,
grade int check(grade <= 5),
completion_date date,
email_id varchar(50) unique);

insert into grades (course_name, grade, completion_date, email_id) values
('Database', '3', '2020-11-20', 'SB209'),
('Database', '4', '2020-11-20', 'RT975');

select * from grades;

/* 2. Write a SQL statement to create a table 'employees123', that has columns: job_id, job_title,job_location, fname, lname, min_salary and max_salary . 
job_id is unique and auto incremental. min_salary by default should be 1000 and max_salary by default should be 5000. 
Make sure that only 2 countries "Finland &  Sweden" can be entered in the column job_location - 4 Points */
create table employees123
(job_id int auto_increment unique primary key, 
job_title varchar(25),
job_location varchar(25) check(job_location = 'Finalnd' or 'Sweden'), 
fname varchar(30), 
lname varchar(30), 
min_salary int default 1000,
max_salary int default 5000);
describe employees123;

/* 3. Write a SQL statement to create a copy of  employees table and name it as employees_dup with all structure and data.  - 2 Points  */
create table employees_dup as select * from employees;
select * from employees_dup;


/*4. Write a SQL statement to insert 4 random records into the table employees.  - 2 Points */
describe employees;
select * from employees; 
insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values
('207', 'Porty', 'Miller', 'PMILLER', '818.949.0000', '2020-01-01', 'SH-CLERK', '4000.00', '0.10', '123', '50'),
('208', 'Portwood', 'Game', 'PGAME', '818.791.1234', '2020-01-30', 'SH-CLERK', '2500.00', '0.00', '123', '50'),
('209', 'Sleeping', 'Beauty', 'SBEAUTY', '919.343.9999', '2020-03-01', 'SH-CLERK', '3000.00', '0.00', '123', '50'),
('210', 'Eve', 'Catzy', 'ECATZY', '123.456.7890', '2020-10-01', 'SH-CLERK', '1000.00', '0.00', '123', '50');

/*5. Write a SQL statement to create a copy of a table “grades” as grades_cp. 
 - Add columns fname, lname, group and starting_date to the table grades_cp.
- for  “group” assign the default value as “BBCAP20”
- for "starting_date" assign the default value as "2020-10-11"
- Insert 3 random records into the grades_cp table.
  - 5 Points*/
create table grades_cp like grades;
describe grades_cp;  
alter table grades_cp add column fname varchar(30), add column lname varchar(30), add column group_id varchar(30), add column starting_date date;
alter table grades_cp modify group_id varchar(30) default 'BBCAP20';
alter table grades_cp modify starting_date date default '2020-10-11';

insert into grades_cp (course_name, grade, email_id) values
('Database', '5', 'OB298'),
('Database','3', 'BB084'),
('Database','0', 'TP937'); 
select * from grades_cp;



/* 6. Write a SQL statement to create a table named employees90 that includes all employees whose JOB_ID is IT_PROG.  - 2 points*/
create table employees90 as select * from employees where job_id = 'IT_PROG'; 
select * from employees90;


/*7. Use the grades table.  Write a SQL statement to add an index named st_index on st_id column.  - 2 Point */
create index st_index on grades (st_id); 


/* 8 Use the locations table for following tasks:
- Update POSTAL_CODE for Roma to 999   - 2 Points
- Update LOCATION_ID by adding 10 to the current LOCATION_ID for all location IDs that is less than 1500 (example if the current location id is 1000 it should be 1010)  - 2 Points
- Update LOCATION_ID for all cities. If you are not able to update the ids ,
please write the reason why you were not able to update. - 2 Points */
select * from locations; 
describe locations;
update locations set postal_code = '999' where city = 'Roma';
update locations set location_id = location_id + 10 where location_id < 1500; 
update locations set location_id = location_id + 50 limit 10000; 



/*9  Write a SQL statement to to get FIRST_NAME, LAST_NAME, SALARY & DEPARTMENT NAME 
FOR EMPLOYESS WHOSE SALARY IS LESS THAN 15000. (Hint: Left Join and use appropriate tables) - 5 Points */
select * from employees;
select * from departments;
select employees.first_name, employees.last_name, employees.salary, departments.department_name
from employees left join departments on departments.department_id = employees.department_id where employees.salary < 15000;




/* 10 Write  a SQL statement  to create a temporary table 'temp11' that has employees' information "first_name, lastname, email and department_id". 
The department_id for the employees must be 90. - 2 Points */
create temporary table temp11 as select first_name, last_name, email, department_id from employees where department_id = 90;


/* 11. Write  a SQL statement to get the minimum salary of an employee working 
as an IT programmer (JOB_ID = IT_PROG) from employees table. - 2 Points */
select min(salary) from employees where job_id = 'IT_PROG'; 



/* 12. Write  a SQL statement to print the average salary based on job ids (JOB_ID) . - 2 Points */
select avg(salary) from employees job_id;

