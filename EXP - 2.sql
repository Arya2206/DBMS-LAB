Experiment No - 2

CREATE TABLE UNIVERSITY (
    university_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
INSERT INTO UNIVERSITY (university_id, name) VALUES  (1, 'Example University');
INSERT INTO UNIVERSITY (university_id, name) VALUES  (2, 'Another University');
INSERT INTO UNIVERSITY (university_id, name) VALUES  (3, 'Third University');
INSERT INTO UNIVERSITY (university_id, name) VALUES  (4, 'Fourth University');
INSERT INTO UNIVERSITY (university_id, name) VALUES  (5, 'Fifth University');
INSERT INTO UNIVERSITY (university_id, name) VALUES (6, 'Sixth University');
INSERT INTO UNIVERSITY (university_id, name) VALUES  (7, 'Seventh University');



CREATE TABLE DEPARTMENT (
    dept_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    building VARCHAR(50),
    budget DECIMAL(12, 2),
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES UNIVERSITY(university_id)
);
INSERT INTO DEPARTMENT (dept_id, name, building, budget, university_id) VALUES 
(1, 'Computer Science', 'Taylor', 100000, 1);
INSERT INTO DEPARTMENT (dept_id, name, building, budget, university_id) VALUES 
(2, 'Mathematics', 'Watson', 90000, 1);
INSERT INTO DEPARTMENT (dept_id, name, building, budget, university_id) VALUES 
(3, 'Physics', 'Newton', 95000, 1);
INSERT INTO DEPARTMENT (dept_id, name, building, budget, university_id) VALUES 
(4, 'Biology', 'Darwin', 85000, 1);
INSERT INTO DEPARTMENT (dept_id, name, building, budget, university_id) VALUES 
(5, 'Chemistry', 'Curie', 92000, 1);
INSERT INTO DEPARTMENT (dept_id, name, building, budget, university_id) VALUES 
(6, 'English', 'Shakespeare', 80000, 1);
INSERT INTO DEPARTMENT (dept_id, name, building, budget, university_id) VALUES 
(7, 'History', 'Roosevelt', 78000, 1);
CREATE TABLE INSTRUCTOR (
    instructor_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    dept_id NUMBER,
    is_hod CHAR(1) DEFAULT 'N' CHECK (is_hod IN ('Y', 'N')),
    salary NUMBER(10, 2),
    CONSTRAINT fk_instructor_dept
        FOREIGN KEY (dept_id)
        REFERENCES DEPARTMENT(dept_id)
);
INSERT INTO INSTRUCTOR (instructor_id, name, dept_id, is_hod, salary)
VALUES (1, 'John Doe', 1, 'Y', 80000);
INSERT INTO INSTRUCTOR (instructor_id, name, dept_id, is_hod, salary)
VALUES (2, 'Jane Smith', 1, 'N', 75000);
INSERT INTO INSTRUCTOR (instructor_id, name, dept_id, is_hod, salary)
VALUES (3, 'Bob Johnson', 2, 'Y', 82000);
INSERT INTO INSTRUCTOR (instructor_id, name, dept_id, is_hod, salary)
VALUES (4, 'Alice Brown', 2, 'N', 76000);
INSERT INTO INSTRUCTOR (instructor_id, name, dept_id, is_hod, salary)
VALUES (5, 'Charlie Davis', 3, 'Y', 81000);
INSERT INTO INSTRUCTOR (instructor_id, name, dept_id, is_hod, salary)
VALUES (6, 'Eva Wilson', 3, 'N', 77000);
INSERT INTO INSTRUCTOR (instructor_id, name, dept_id, is_hod, salary)
VALUES (7, 'Frank Miller', 4, 'Y', 79000);




CREATE TABLE COURSE (
    course_id VARCHAR(8) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    dept_id INT,
    credits INT,
    FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id)
);

INSERT INTO COURSE (course_id, title, dept_id, credits) VALUES 
('CS-101', 'Introduction to Programming', 1, 3);
INSERT INTO COURSE (course_id, title, dept_id, credits) VALUES 
('CS-201', 'Data Structures', 1, 4);
INSERT INTO COURSE (course_id, title, dept_id, credits) VALUES 
('MATH-101', 'Calculus I', 2, 4);
INSERT INTO COURSE (course_id, title, dept_id, credits) VALUES 
('MATH-201', 'Linear Algebra', 2, 3);
INSERT INTO COURSE (course_id, title, dept_id, credits) VALUES 
('PHY-101', 'Mechanics', 3, 4);
INSERT INTO COURSE (course_id, title, dept_id, credits) VALUES 
('PHY-201', 'Quantum Physics', 3, 4);
INSERT INTO COURSE (course_id, title, dept_id, credits) VALUES 
('BIO-101', 'Introduction to Biology', 4, 4);



CREATE TABLE SECTION (
    section_id INT PRIMARY KEY,
    course_id VARCHAR(8),
    sec_id INT,
    semester VARCHAR(6),
    year INT,
    building VARCHAR(50),
    room_number VARCHAR(10),
    time_slot_id VARCHAR(4),
    FOREIGN KEY (course_id) REFERENCES COURSE(course_id)
);

INSERT INTO SECTION (section_id, course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES  (1, 'CS-101', 1, 'Fall', 2023, 'Taylor', '3128', 'A');
INSERT INTO SECTION (section_id, course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES (2, 'CS-201', 1, 'Spring', 2024, 'Taylor', '3114', 'B');
INSERT INTO SECTION (section_id, course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES (3, 'MATH-101', 1, 'Fall', 2023, 'Watson', '2230', 'C');
INSERT INTO SECTION (section_id, course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES (4, 'MATH-201', 1, 'Spring', 2024, 'Watson', '2245', 'D');
INSERT INTO SECTION (section_id, course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES (5, 'PHY-101', 1, 'Fall', 2023, 'Newton', '1320', 'E');
INSERT INTO SECTION (section_id, course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES (6, 'PHY-201', 1, 'Spring', 2024, 'Newton', '1310', 'F');
INSERT INTO SECTION (section_id, course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES (7, 'BIO-101', 1, 'Fall', 2023, 'Darwin', '2110', 'G');



CREATE TABLE TEACHES (
    instructor_id INT,
    section_id INT,
    PRIMARY KEY (instructor_id, section_id),
    FOREIGN KEY (instructor_id) REFERENCES INSTRUCTOR(instructor_id),
    FOREIGN KEY (section_id) REFERENCES SECTION(section_id)
);
INSERT INTO TEACHES (instructor_id, section_id) VALUES (1, 1);
INSERT INTO TEACHES (instructor_id, section_id) VALUES (2, 2);
INSERT INTO TEACHES (instructor_id, section_id) VALUES (3, 3);
INSERT INTO TEACHES (instructor_id, section_id) VALUES (4, 4);
INSERT INTO TEACHES (instructor_id, section_id) VALUES (5, 5);
INSERT INTO TEACHES (instructor_id, section_id) VALUES (6, 6);
INSERT INTO TEACHES (instructor_id, section_id) VALUES (7, 7);




CREATE TABLE STUDENT (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    tot_cred INT
);
INSERT INTO STUDENT (student_id, name, tot_cred) VALUES (1, 'Mike Johnson', 60);
INSERT INTO STUDENT (student_id, name, tot_cred) VALUES (2, 'Sarah Lee', 45);
INSERT INTO STUDENT (student_id, name, tot_cred) VALUES (3, 'Tom Brown', 30);
INSERT INTO STUDENT (student_id, name, tot_cred) VALUES (4, 'Emily Davis', 75);
INSERT INTO STUDENT (student_id, name, tot_cred) VALUES (5, 'David Wilson', 90);
INSERT INTO STUDENT (student_id, name, tot_cred) VALUES (6, 'Lisa Anderson', 15);
INSERT INTO STUDENT (student_id, name, tot_cred) VALUES (7, 'Chris Taylor', 105);


CREATE TABLE TAKES (
    student_id INT,
    section_id INT,
    grade VARCHAR(2),
    PRIMARY KEY (student_id, section_id),
    FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
    FOREIGN KEY (section_id) REFERENCES SECTION(section_id)
);




INSERT INTO TAKES (student_id, section_id, grade) VALUES (1, 1, 'A');
INSERT INTO TAKES (student_id, section_id, grade) VALUES  (1, 3, 'B');
INSERT INTO TAKES (student_id, section_id, grade) VALUES (2, 2, 'A');
INSERT INTO TAKES (student_id, section_id, grade) VALUES (2, 4, 'B');
INSERT INTO TAKES (student_id, section_id, grade) VALUES (3, 1, 'B');
INSERT INTO TAKES (student_id, section_id, grade) VALUES  (3, 5, 'A');
INSERT INTO TAKES (student_id, section_id, grade) VALUES (4, 2, 'A'); 
INSERT INTO TAKES (student_id, section_id, grade) VALUES (4, 6, 'B');
INSERT INTO TAKES (student_id, section_id, grade) VALUES (5, 3, 'A');
INSERT INTO TAKES (student_id, section_id, grade) VALUES  (5, 7, 'A');
INSERT INTO TAKES (student_id, section_id, grade) VALUES (6, 4, 'B');
INSERT INTO TAKES (student_id, section_id, grade) VALUES  (6, 1, 'A');
INSERT INTO TAKES (student_id, section_id, grade) VALUES (7, 5, 'A');
INSERT INTO TAKES (student_id, section_id, grade) VALUES  (7, 2, 'B');




CREATE TABLE TIME_SLOT (
    time_slot_id VARCHAR2(4) PRIMARY KEY,
    day CHAR(1),
    start_time DATE,
    end_time DATE
);

INSERT INTO TIME_SLOT (time_slot_id, day, start_time, end_time)
VALUES ('A', 'M', TO_DATE('09:00', 'HH24:MI'), TO_DATE('10:30', 'HH24:MI'));

INSERT INTO TIME_SLOT (time_slot_id, day, start_time, end_time)
VALUES ('B', 'T', TO_DATE('10:30', 'HH24:MI'), TO_DATE('12:00', 'HH24:MI'));

INSERT INTO TIME_SLOT (time_slot_id, day, start_time, end_time)
VALUES ('C', 'W', TO_DATE('13:00', 'HH24:MI'), TO_DATE('14:30', 'HH24:MI'));

INSERT INTO TIME_SLOT (time_slot_id, day, start_time, end_time)
VALUES ('D', 'R', TO_DATE('15:00', 'HH24:MI'), TO_DATE('16:30', 'HH24:MI'));

INSERT INTO TIME_SLOT (time_slot_id, day, start_time, end_time)
VALUES ('E', 'F', TO_DATE('11:00', 'HH24:MI'), TO_DATE('12:30', 'HH24:MI'));

INSERT INTO TIME_SLOT (time_slot_id, day, start_time, end_time)
VALUES ('F', 'M', TO_DATE('14:00', 'HH24:MI'), TO_DATE('15:30', 'HH24:MI'));


CREATE TABLE CLASSROOM (
    building VARCHAR(50),
    room_number VARCHAR(10),
    capacity INT,
    PRIMARY KEY (building, room_number)
);

INSERT INTO CLASSROOM (building, room_number, capacity) VALUES ('Taylor', '3128', 50);
INSERT INTO CLASSROOM (building, room_number, capacity) VALUES ('Taylor', '3114', 40);
INSERT INTO CLASSROOM (building, room_number, capacity) VALUES ('Watson', '2230', 60);
INSERT INTO CLASSROOM (building, room_number, capacity) VALUES ('Watson', '2245', 45);
INSERT INTO CLASSROOM (building, room_number, capacity) VALUES ('Newton', '1320', 55);
INSERT INTO CLASSROOM (building, room_number, capacity) VALUES ('Newton', '1310', 50);
INSERT INTO CLASSROOM (building, room_number, capacity) VALUES ('Darwin', '2110', 40);


1. alter table department modify name varchar2(30);
alter table department modify building varchar2(30) not null;


2. how to rename the field name:
alter table tablename rename field to newfield;

3. check both the tables i.e instructor and department 
select * from department;
select * from instructor;

4. Increase the salary of each instructor in the Comp Sci. department by 10%
update instructor set salary = salary + salary * .1 where dept_id  = (select dept_id from department where name = 'Computer Science');
update instructor set salary = salary + salary * .2 where dept_id  = (select dept_id from department where name = 'History');

select * from instructor;

5. Give a 5% salary raise to those instructors who earn less than 80000
update instructor set salary = salary + salary * 5/100 where salary < 80000;

6. condition is salary is above 80000 but below 85000 deduce 5%
update instructor set salary = salary - salary * 5/100 where salary > 80000 and salary < 85000;

7. (a) Create a new course "CS-001", titled "Weekly Seminar", with 1 credits.
desc course;
select * from course;
insert into course (course_id, title, dept_id, credits) values ('CS-001', 'Weekly Seminar', 1,1);

  (b) Create a section of this course in Fall 2017, with sec_id of 1, and with the location of this section not yet specified.
insert into section (section_id, course_id, sec_id, semester, year) values (8,'CS-001', 1, 'FALL', 2017);

select * from section;

# To create a sequence 
 create sequence emp start with 1 increment by 1:

8.create any table, use sequence for insertion of the rows and drop the sequence. 

now create table:
create table emp (emp_id int, name varchar2(20), mobile int);
insert into emp  values (emp_seq.nextval, 'xyz', 9226237900);
insert into emp  values (emp_seq.nextval, 'xyz1', 9226237900);
insert into emp  values (emp_seq.nextval, 'xyz2', 9226237900);
insert into emp  values (emp_seq.nextval, 'xyz3', 9226237900);
insert into emp  values (emp_seq.nextval, 'xyz4', 9226237900);
insert into emp  values (emp_seq.nextval, 'xyz5', 9226237900);
insert into emp  values (emp_seq.nextval, 'xyz6', 9226237900);
insert into emp  values (emp_seq.nextval, 'xyz7', 9226237900);
insert into emp  values (emp_seq.nextval, 'xyz8', 9226237900);
insert into emp  values (emp_seq.nextval, 'xyz9', 9226237900);
insert into emp (emp_id, name, mobile) values (emp_seq.nextval, 'xyz10', 9226237900);

select max(emp_id) from emp;

drop sequence emp_seq;

#to rename the table: rename emp to employee;
#to rename the field: alter table employee rename column mobile to mobilenumber;

9. Add a new column PINCODE with not null constraints to the above existing table.

alter table employee add (PINCODE VARCHAR2(10) DEFAULT '000000' NOT NULL);
truncate table employee;
select * from employee;
alter table employee add pincode number not null;
