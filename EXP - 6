Exp - 6
Aim:  To study PL/SQL Procedure and write procedures for:
i.	Swapping of two numbers without using third variable,
ii.	Largest amongst three numbers.
iii.	Area of circle by radius as an argument.


#hello World program using procedures
CREATE PROCEDURE Hello_world
    AS
    BEGIN
       DBMS_OUTPUT.PUT_LINE('Hello World');
    END;
    /


#Now to execute above program
EXEC hello_world;
add 'welcome to SIT' after 'hello world!'
CREATE OR REPLACE PROCEDURE Hello 
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World!');
    DBMS_OUTPUT.PUT_LINE('Welcome to SIT');
END;
/
   
# addition of two numbers 
 CREATE OR REPLACE PROCEDURE add_numbers 
AS
    num1 NUMBER := 5;
    num2 NUMBER := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('RESULT: ' || (num1 + num2));
END;
/


1. Swapping of two numbers without using third variable

CREATE OR REPLACE PROCEDURE swap_numbers 
AS
    num1 NUMBER := 5;
    num2 NUMBER := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Before Swap: num1 = ' || num1 || ', num2 = ' || num2);

    -- Swapping without third variable
    num1 := num1 + num2;
    num2 := num1 - num2;
    num1 := num1 - num2;

    DBMS_OUTPUT.PUT_LINE('After Swap: num1 = ' || num1 || ', num2 = ' || num2);
END;
/
 #to execute 
SET SERVEROUTPUT ON;
EXEC swap_numbers;

2. Largest amongst three numbers.
CREATE OR REPLACE PROCEDURE largest_of_three 
AS
    num1 NUMBER := 25;
    num2 NUMBER := 40;
    num3 NUMBER := 30;
    largest NUMBER;
BEGIN
    IF (num1 >= num2) AND (num1 >= num3) THEN
        largest := num1;
    ELSIF (num2 >= num1) AND (num2 >= num3) THEN
        largest := num2;
    ELSE
        largest := num3;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Numbers: ' || num1 || ', ' || num2 || ', ' || num3);
    DBMS_OUTPUT.PUT_LINE('Largest number is: ' || largest);
END;
/

 #to execute 
SET SERVEROUTPUT ON;
EXEC largest_of_three;

-- Procedure to calculate area of circle
CREATE OR REPLACE PROCEDURE area_of_circle (p_radius IN NUMBER) IS
    v_area NUMBER;
BEGIN
    -- Formula: Area = π * r^2
    v_area := 3.14159 * p_radius * p_radius;

    DBMS_OUTPUT.PUT_LINE('Radius: ' || p_radius);
    DBMS_OUTPUT.PUT_LINE('Area of Circle: ' || v_area);
END;
/
