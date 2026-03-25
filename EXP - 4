Departments Table
CREATE TABLE DESC (
    deptno INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments (deptno, dept_name, location) VALUES (10, 'ACCOUNTING', 'New York');
INSERT INTO departments (deptno, dept_name, location) VALUES (20, 'RESEARCH', 'Dallas');
INSERT INTO departments (deptno, dept_name, location) VALUES (30, 'SALES', 'Chicago');
INSERT INTO departments (deptno, dept_name, location) VALUES (40, 'OPERATIONS', 'Boston');


Employee Table
CREATE TABLE EMP (
    emp_no INT PRIMARY KEY,
    birth_date DATE NOT NULL,
    first_name VARCHAR(14) NOT NULL,
    last_name VARCHAR(16) NOT NULL,
    gender varchar2(1) check ( gender in('M','F')) NOT NULL,
    hire_date DATE NOT NULL,
    salary FLOAT DEFAULT 7850.00,
    job VARCHAR(20) NOT NULL,
    deptno INT,
    manager_id INT,
    FOREIGN KEY (deptno) REFERENCES departments(deptno)
);
INSERT INTO emp (emp_no, birth_date, first_name, last_name, gender, hire_date, salary, job, deptno, manager_id) VALUES (7839, DATE '1955-11-17', 'John', 'Smith', 'M', DATE '1990-06-09', 5000.00, 'MANAGER', 10, NULL);
INSERT INTO emp (emp_no, birth_date, first_name, last_name, gender, hire_date, salary, job, deptno, manager_id) VALUES (7566, DATE '1960-02-21', 'James', 'Brown', 'M', DATE '1991-04-02', 2450.00, 'CLERK', 20, 7839);
INSERT INTO emp (emp_no, birth_date, first_name, last_name, gender, hire_date, salary, job, deptno, manager_id) VALUES (7654, DATE '1963-12-09', 'Scott', 'Allen', 'M', DATE '1989-06-04', 2975.00, 'SALESMAN', 30, 7839);
INSERT INTO emp (emp_no, birth_date, first_name, last_name, gender, hire_date, salary, job, deptno, manager_id) VALUES (7934, DATE '1970-12-03', 'Adam', 'Martin', 'M', DATE '1993-07-09', 1300.00, 'CLERK', 30, 7839);
INSERT INTO emp (emp_no, birth_date, first_name, last_name, gender, hire_date, salary, job, deptno, manager_id) VALUES (7788, DATE '1961-05-23', 'Alan', 'Walker', 'M', DATE '1990-09-14', 3000.00, 'ANALYST', 20, 7566);
INSERT INTO emp (emp_no, birth_date, first_name, last_name, gender, hire_date, salary, job, deptno, manager_id) VALUES (7902, DATE '1958-11-07', 'Alice', 'Jones', 'F', DATE '1988-12-12', 1600.00, 'CLERK', 30, 7654);
INSERT INTO emp (emp_no, birth_date, first_name, last_name, gender, hire_date, salary, job, deptno, manager_id) VALUES (7876, DATE '1962-01-14', 'George', 'Black', 'M', DATE '1989-01-20', 1100.00, 'CLERK', 40, 7566);
INSERT INTO emp (emp_no, birth_date, first_name, last_name, gender, hire_date, salary, job, deptno, manager_id) VALUES (7844, DATE '1965-09-28', 'Diana', 'White', 'F', DATE '1992-05-21', 2950.00, 'SALESMAN', 30, 7654);
INSERT INTO emp (emp_no, birth_date, first_name, last_name, gender, hire_date, salary, job, deptno, manager_id) VALUES (7900, DATE '1972-06-19', 'Bob', 'King', 'M', DATE '1991-08-18', 850.00, 'CLERK', 10, 7839);

SELECT * FROM PDEPARTMENT;

select * from employee;

display all emp names that starts with "a" and are at least 3 characers in lngth 
select First_name from emp where lower(first_name) like 'a%' and length(first_name) >= 3;

display departments having Dallas, Ney Yourk and Chicago location
select dept_name, location from departments where location='dallas' or location='new york' or location='chicago';
OR
select dep_name, location from departments where lower(location) in ('dallas', 'new york', 'chicago');

select first_name, job, salary from employee;

display the names of employees who are woking as ckerk, salesmen or analyst and drawing a salary more than 3000
select first_name, job, salary from employee where salary >= 3000 and lower(job) in ('clerk' , 'salesman', 'analyst');

display the names of employees who are not working as managers.
select first_name from employee where lower(job) != 'manager';

display the names of emp who earns highest salary 
select first_name, salary from employee where salary = (select max(salary) from employee);
 
display the employee number and name of emp working as clerk an earning highest salary amongst clerks
select emp_no, first_name, salary from employee where salary= (select max(salary) from employee where lower(job) = 'clerk');
