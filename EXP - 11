Experiment - 11
Aim: Write a PL/SQL function to find the reverse of a number.

FUNCTIONS

syntax:
CREATE OR REPLACE FUNCTION func_name(
	arg1 datatype,
	arg2 datatype) 
return 
AS
	var Number := 0;
BEGIN
	computation
END function1
	return var
END
/
--------------------------------------------------------
CREATE OR REPLACE FUNCTION func_name (
    a IN NUMBER,
    b IN NUMBER
)
RETURN NUMBER
AS
    c NUMBER;
BEGIN
    c := a + b;
    RETURN c;
END;
/
o/p: Function created.

SELECT func_name(5, 3) AS result FROM dual;

o/p:     RESULT
       ----------
               8
----------------------------------

CREATE OR REPLACE FUNCTION square (
    a IN NUMBER
)
RETURN NUMBER
AS
    c NUMBER;
BEGIN
    c := a*a;
    RETURN c;
END;
/

SELECT square(5) AS result FROM dual;
o/p:     RESULT
       ----------
              25

-----------------------------------------------------------------

DIFFERENCE BW PROCEDURE AND FUNCTION 
           PROCEDURE                                      FUNCTION
1. it doesn't return any value                      1. returns value of datatype give
2. we dont need to store temp values                2. temp table dual
3. execute proc_name (arguments)                    3. select func_name(arg) from dual;
