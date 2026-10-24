Exp - 7
Aim - To study control loops in PL/SQL


1. sum of first 10 numbers using while loop
create or replace procedure SumFirst10Numbers_WhileLoop AS
i NUMBER :=1;
sum1 NUMBER := 0;
BEGIN 
WHILE i<= 10 LOOP
sum1 := sum1 + i;
i:= i+1;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Sum of first 10 numbers using WHILE loop : ' || sum1);
END;

2. sum of first 10 even numbers using a for loop
CREATE OR REPLACE PROCEDURE SumFirst10EvenNumbers_ForLoop AS
sum1 NUMBER :=0;
BEGIN
FOR i IN 1.. 10 LOOP
sum1 := sum1 +(2*i);
END LOOP;
DBMS_OUTPUT.PUT_LINE('Sum of first 10 even numbers using FOR loop:' || sum1);
END;
