Experiment - 3

Aim - Consider the problem definition in practical 1. Write and execute SQL functions- aggregate, numeric, date, string.  

1. to display instructors from computer science department 
select * from instructor where dept_id = (select dept_id from department where name = 'Computer Science');
USING JOIN
select i.instructor_id, i.Name, i.salary, d.name from instructor i join department d on i.dept_id = d.dept_id where d.name = 'Computer Science';

2. select avg(salary) as AVG_SAL from instructor i join department d on i.dept_id = d.dept_id where d.name = 'Computer Science';
3. select d.name, avg(salary) as AVG_SAL from instructor i join department d on i.dept_id = d.dept_id where d.name = 'Computer Science' group by d.name;
4. select d.name , avg(i.salary) as AVG_SAL from department d join instructor i on d.dept_id = i.dept_id group by d.name;

5. What is the total salary of all teachers earning more than 30K?
select sum(salary) as total_sal from instructor where salary>30000 

6. List the number of students enrolled in each course

CREATE TABLE STUDENT (
    student_id NUMBER(38) PRIMARY KEY,
    name       VARCHAR2(50) NOT NULL,
    tot_cred   NUMBER(3)
);

INSERT INTO STUDENT VALUES (101, 'Arjun', 20);
INSERT INTO STUDENT VALUES (102, 'Meera', 22);
INSERT INTO STUDENT VALUES (106, 'Rahul', 18);
INSERT INTO STUDENT VALUES (107, 'Sneha', 19);
INSERT INTO STUDENT VALUES (108, 'Kiran', 21);

CREATE TABLE ENROLLMENT (
    enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    section_id INT NOT NULL,
    enrollment_date DATE,
    status VARCHAR(20) DEFAULT 'ENROLLED',
    FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
    FOREIGN KEY (section_id) REFERENCES SECTION(section_id)
);

INSERT INTO ENROLLMENT VALUES (1, 101, 1, DATE '2024-07-01', 'ENROLLED');
INSERT INTO ENROLLMENT VALUES (2, 102, 1, DATE '2024-07-01', 'ENROLLED');
INSERT INTO ENROLLMENT VALUES (3, 101, 2, DATE '2024-07-02', 'ENROLLED');
INSERT INTO ENROLLMENT VALUES (4, 102, 2, DATE '2024-07-02', 'ENROLLED');
INSERT INTO ENROLLMENT VALUES (5, 106, 3, DATE '2024-07-03', 'ENROLLED');
INSERT INTO ENROLLMENT VALUES (6, 107, 4, DATE '2024-07-03', 'ENROLLED');
INSERT INTO ENROLLMENT VALUES (7, 108, 5, DATE '2024-07-04', 'ENROLLED');
INSERT INTO ENROLLMENT VALUES (8, 101, 6, DATE '2024-07-04', 'ENROLLED');
INSERT INTO ENROLLMENT VALUES (9, 102, 7, DATE '2024-07-05', 'ENROLLED');
INSERT INTO ENROLLMENT VALUES (10,106, 8, DATE '2024-07-05', 'ENROLLED');

 SELECT C.course_id, COUNT(E.student_id) AS enrolled_students FROM COURSE C LEFT JOIN SECTION S ON C.course_id = S.course_id LEFT JOIN ENROLLMENT E ON S.section_id = E.section_id GROUP BY C.course_id, C.title ORDER BY C.course_id;

7. Display the length of the name of all the students 
select length(name) from student;

8. Retrieve total no of instructors 
select count(name) from instructor;

9. Add hiredate column in the instructor table. Insert 4 rows in the table. Display the names of instructor who are working for the past 5 years.
alter table instructor and hiredate date;
update instructor set hiredate = date '2021-01-30' where instructor_id = 1;
update instructor set hiredate = date '2021-01-13' where instructor_id = 2;
update instructor set hiredate = date '2021-01-23' where instructor_id = 3;
update instructor set hiredate = date '2021-01-25' where instructor_id = 4;
update instructor set hiredate = date '2021-01-13' where instructor_id = 5;
update instructor set hiredate = date '2021-01-13' where instructor_id = 6;
update instructor set hiredate = date '2021-01-23' where instructor_id = 7;
update instructor set hiredate = date '2021-01-3' where instructor_id = 8;

past 5 years 
select * from instructor where hiredate < add_months(sysdate, -60);


10. Display the list of instructor who have joined after 1st jan 2021 or before 30th jun 2022
select * from instructor where hiredate > date '2021-01-01' and hiredate < date '2022-06-30';

11. Display the name of those instructors who are going to retire 01-jan-24. If the maximum job period is 3 years.
select * from instructor where hiredate < date '2024-01-01' and hiredate < add_months(sysdate, -62);

12. Display those instructors whose salary contains at least 4 digits above 75000;
select name, salary from instructor where salary >= 75000 and length(salary) >= 4;

13. print a list of instructors displaying 'Less Salary' if less than 60000 if exactly 60000 display as 'Exact Salary' and if greater than 60000 display 'More Salary'.
select name from instructor when  salary<60000 then 'Less salary' when salary=60000 then 'Exact Salary' when salary>60000 then 'More Salary'



14. Display names of all the instructors concatenated with their department names.
select i.name || ' - ' || d.name from instructor i join department d on i.dept_id = d.dept_id;


15. Retrieve distinct number of instructors from each department. 
select count(*) from instructor i join department d on i.dept_id = d.dept_id group by d.name;


select count(Instructor_id) as inst_each_dept, d.name from instructor i join department d on i.dept_id = d.dept_id group by d.name;

select count(Instructor_id) as inst_each_dept, d.name from instructor i join department d on i.dept_id = d.dept_id group by d.name;

select name, dept_id from instructor;

select count(distinct Instructor_id) as inst_each_dept, d.name from instructor i join department d on i.dept_id = d.dept_id group by d.name;

16. Find the names of all instructors whose salary is greater than at least one instructorin the biology department 
select name, dept_id, salary from instructor;
select i.name, i.salary, d.name from instructor i join department d on i.dept_id = d.dept_id where i.salary > any (select salary from instructor where dept_id=4);

select i.name, i.salary from instructor i where i.salary >= (select i2.salary from instructor i2 join department d on i.dept_id = d.dept_id where d.name= 'Biology');
