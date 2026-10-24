Exp - 10
Aim - Write a PL\SQL procedure to demonstrate the use of Exceptions. 

basic syntax:
C/R procedure   Exception(var in datatype)
AS
val1 exception
val2 exception
begin 
code
when val 1 exception
	true state
when val2 exception
	true state
end exception
end 

SYSTEM DEFINED
1. division by 0
2. not found
3. not in range

1) find name and salary from employee where employee_name is given as input.  
 
CREATE OR REPLACE PROCEDURE GetEmployeeSalary (
    id in NUMBER
)
AS
    f_name employee.first_name%TYPE;
    l_name employee.last_name%TYPE;
    e_salary employee.salary%TYPE; #declaration of variables against the fields of the field types
BEGIN
    SELECT first_name, last_name, salary
    INTO f_name, l_name, e_salary
    FROM employee
    WHERE emp_no = id;

    DBMS_OUTPUT.PUT_LINE('First Name: ' || f_name);
    DBMS_OUTPUT.PUT_LINE('Last Name: ' || l_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || e_salary);
when 
    DBMS_OUTPUT.PUT_LINE('ID not found');
END GetEmployeeSalary;
END
/

Run this:
SET SERVEROUTPUT ON;

EXEC GetEmployeeSalary('John');
----------------------------------------------------------------------------------------
EXCEPTION TYPES 
1. System Defined -> tables-> exceptions like no_data_found, max_row_found etc.
2. User Defined -> out of range

FOR NO_DATA_FOUND CODE:

CREATE OR REPLACE PROCEDURE GetEmployeeSalary (
    id IN NUMBER
)
AS
    v_name employees.emp_name%TYPE;
    v_salary employees.salary%TYPE;
BEGIN
    SELECT emp_name, salary
    INTO v_name, v_salary
    FROM employees
    WHERE emp_id = id;

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('ID not found');
END;
/

Run this:
SET SERVEROUTPUT ON;

EXEC GetEmployeeSalary('3');

o/p: Name: Robert
     Salary: 4000 

PL/SQL procedure successfully completed.
--------------------------------------------------------------------
MAX_ROWS_FOUND:

CREATE OR REPLACE PROCEDURE GetEmployeeSalary (
    id IN NUMBER
)
AS
    v_name employees.emp_name%TYPE;
    v_salary employees.salary%TYPE;
BEGIN
    SELECT emp_name, salary
    INTO v_name, v_salary
    FROM employees
    WHERE emp_id = id;

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);

EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Multiple employees found with same ID');
END;
/

SET SERVEROUTPUT ON;

EXEC GetEmployeeSalary(3);

o/p: Name: Robert
     Salary: 4000
-------------------------------------------------------------------------------------------- 
CREATE OR REPLACE PROCEDURE GetExcep( M1 IN NUMBER, M2 IN NUMBER, M3 IN NUMBER)
AS
	INVALID_MARKS EXCEPTION;
BEGIN 
	IF M1<0 OR M1>100 OR M2<0 OR M2>100 OR M3<0 OR M3>100 THEN 
		RAISE INVALID_MARKS;
	ELSIF M1 >= 50 AND M2 >= 50 AND M3 >= 50 THEN 
		DBMS_OUTPUT.PUT_LINE('RESULT = PASS');
	ELSE
		DBMS_OUTPUT.PUT_LINE('RESULT=FAIL');
	END IF;
EXCEPTION
	WHEN INVALID_MARKS THEN 
		DBMS_OUTPUT.PUT_LINE('ENTER VALID MARKS IN THE RANGE 0-100');
END;
/

EXEC GetExcep(80, 90, 75);
EXEC GetExcep(40, 60, 70);
EXEC GetExcep(-10, 50, 60);

o/p: 
SQL> EXEC GetExcep(80, 90, 75);
RESULT = PASS

PL/SQL procedure successfully completed.

SQL> EXEC GetExcep(40, 60, 70);
RESULT=FAIL

PL/SQL procedure successfully completed.

SQL> EXEC GetExcep(-10, 50, 60);
ENTER VALID MARKS IN THE RANGE 0-100

PL/SQL procedure successfully completed.
---------------------------------------------------------------------------------------

CREATE TABLE route_header(
route_id NUMBER(5),
origin VARCHAR2(20),
destination VARCHAR2(20),
fare NUMBER(7,2),
distance NUMBER(3),
capacity NUMBER(3)
);

DATA INSERTION:
INSERT INTO route_header VALUES (102, 'trichy', 'madurai', 33,450, 56);
INSERT INTO route_header VALUES (103, 'madurai', 'madras', 33,250, 50);
INSERT INTO route_header VALUES (104, 'madurai', 'madras', 33,250, 50);
INSERT INTO route_header VALUES (105, 'madurai', 'madras', 33,250, 50);

PROCEDURES:
CREATE OR REPLACE PROCEDURE route_header_proc1 (routeid route_header.route_id%type) AS
a NUMBER(7,2);
b NUMBER(4);
BEGIN
SELECT fare, distance INTO a, b FROM route_header WHERE route_id = routeid;

IF b<500 THEN
UPDATE route_header SET fare =190.98 WHERE route_id = routeid;
ELSEIF b BETWEEN 501 AND 1000 THEN
UPDATE route_header SET fare = 800.00 WHERE route_id = routeid;
ELSEIF b>1000 THEN
DBMS_OUTPUT.PUT_LINE('Sorry, distance too large');
END IF;
END;
