Employees Table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10, 2),
    manager_id INT
);

Departments Table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

Projects Table
CREATE TABLE Projects (
    proj_id INT PRIMARY KEY,
    proj_name VARCHAR(50),
    dept_id INT
);



Assignments Table
CREATE TABLE Assignments (
    emp_id INT,
    proj_id INT,
    hours_worked INT,
    PRIMARY KEY (emp_id, proj_id),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (proj_id) REFERENCES Projects(proj_id)
);

Populate Tables with Sample Data

Employees Table Data
INSERT INTO Employees (emp_id, emp_name, dept_id, salary, manager_id) VALUES (1, 'John', 101, 5000.00, NULL);
INSERT INTO Employees (emp_id, emp_name, dept_id, salary, manager_id) VALUES (2, 'Alice', 102, 3000.00, 1);
INSERT INTO Employees (emp_id, emp_name, dept_id, salary, manager_id) VALUES (3, 'Robert', 101, 4000.00, 1);
INSERT INTO Employees (emp_id, emp_name, dept_id, salary, manager_id) VALUES (4, 'Michael', 103, 7000.00, NULL);
INSERT INTO Employees (emp_id, emp_name, dept_id, salary, manager_id) VALUES (5, 'Susan', 102, 3500.00, 2);
INSERT INTO Employees (emp_id, emp_name, dept_id, salary, manager_id) VALUES (6, 'Nancy', 104, 4200.00, NULL);
INSERT INTO Employees (emp_id, emp_name, dept_id, salary, manager_id) VALUES (7, 'David', 103, 3900.00, 4);
INSERT INTO Employees (emp_id, emp_name, dept_id, salary, manager_id) VALUES (8, 'Laura', 101, 5200.00, 3);

Departments Table Data
INSERT INTO Departments (dept_id, dept_name, location) VALUES (101, 'Finance', 'New York');
INSERT INTO Departments (dept_id, dept_name, location) VALUES (102, 'HR', 'Chicago');
INSERT INTO Departments (dept_id, dept_name, location) VALUES (103, 'IT', 'Dallas');
INSERT INTO Departments (dept_id, dept_name, location) VALUES (104, 'Marketing', 'San Francisco');

Projects Table Data
INSERT INTO Projects (proj_id, proj_name, dept_id) VALUES (201, 'Project A', 101);
INSERT INTO Projects (proj_id, proj_name, dept_id) VALUES (202, 'Project B', 103);
INSERT INTO Projects (proj_id, proj_name, dept_id) VALUES (203, 'Project C', 102);
INSERT INTO Projects (proj_id, proj_name, dept_id) VALUES (204, 'Project D', 104);

Assignments Table Data
INSERT INTO Assignments (emp_id, proj_id, hours_worked) VALUES (1, 201, 30);
INSERT INTO Assignments (emp_id, proj_id, hours_worked) VALUES (2, 203, 40);
INSERT INTO Assignments (emp_id, proj_id, hours_worked) VALUES (3, 201, 20);
INSERT INTO Assignments (emp_id, proj_id, hours_worked) VALUES (4, 202, 50);
INSERT INTO Assignments (emp_id, proj_id, hours_worked) VALUES (5, 203, 35);
INSERT INTO Assignments (emp_id, proj_id, hours_worked) VALUES (6, 204, 25);
INSERT INTO Assignments (emp_id, proj_id, hours_worked) VALUES (7, 202, 45);

retrive and disply he list of employees along with the department names (A intersection B)
select e.emp_name, d.dept_name from Employees e inner join departments d on e.dept_id = d.dept_id;

left join (all A + matching B)
select e.emp_name, p.proj_name from Employees e left join assignments a on e.emp_id = a.emp_id left join projects p on a.proj_id = p.proj_id;

right join (all B + matching A)
select e.emp_name, p.proj_name from Employees e right join assignments a on e.emp_id = a.emp_id right join projects p on a.proj_id = p.proj_id;

full outer join (full A  + full B)
select e.emp_name, d.dept_name from employees e full outer join departments d on e.dept_id = d.dept_id;

self join
select e.emp_name as employe, m.emp_name as manager from employee e
left join employees m on e.manager_id = m.emp_id;

cross join
select e.emp_name, p.proj_name from employees e cross join projects p;
