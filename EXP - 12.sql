Experiment - 12
Aim: Write a PL\SQL functions
•	To find the largest number amongst given two numbers.
•	To find the total number of employees from emp relation given the employee number.
•	To return the email id of the employee consisting of firstname and lastname.

-- 1. Create the function
CREATE OR REPLACE FUNCTION find_largest(num1 IN NUMBER, num2 IN NUMBER) 
RETURN NUMBER 
IS 
    result NUMBER;
BEGIN 
    IF num1 > num2 THEN 
        result := num1; 
    ELSE 
        result := num2; 
    END IF; 
    RETURN result; 
END;
/

-- 2. Execute and display output
DECLARE 
    a NUMBER := 45; 
    b NUMBER := 89; 
    res NUMBER; 
BEGIN 
    res := find_largest(a, b); 
    DBMS_OUTPUT.PUT_LINE('The largest number between ' || a || ' and ' || b || ' is: ' || res); 
END;
/


2. Function: Add Two Numbers

CREATE OR REPLACE FUNCTION Add_Num(a IN INT, b IN INT)
RETURN INT
IS
c INT;
BEGIN
c := a + b;
RETURN c;
END;
/

SELECT Add_Num(12, 14) FROM dual;

-- OUTPUT:
-- ADD_NUM(12,14)
-- 26

-------------------------------------------------------------------------------

3. Function: Square of a Number

CREATE OR REPLACE FUNCTION Sqrt_Num(a IN INT)
RETURN INT
IS
c INT;
BEGIN
c := a * a;
RETURN c;
END;
/

SELECT Sqrt_Num(12) FROM dual;

-- OUTPUT:
-- SQRT_NUM(12)
-- 144
