Experiment - 17
Aim: Consider Employee management system database designed in practical no 16. Write a PL/SQL trigger to fire when there is an updation of salary of any Empno and record the Empno, Dept. No and Old Salary, 
date on which salary is modified in the table SAL_MOD (Empno, Dname, Old_Sal, Mod_Date).

AUDIT

original file -> audit file
command: create table emp2_Aud AS
select * from emp2 where 1=2;
o/p: Table created.

select * from emp2_Aud;
o/p: no rows selected

select * from emp2;
o/p: EMPNO NAME                                                 CATEGORY
---------- -------------------------------------------------- ----------
    SALARY
----------
         1 ARYA                                                        2


         2 RUBY                                                        3


         3 THOR                                                        1

SQL> desc emp2;
o/p: Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                     NOT NULL NUMBER
 NAME                                               VARCHAR2(50)
 CATEGORY                                           NUMBER
 SALARY                                             NUMBER


SQL> desc emp2_Aud;
o/p: Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                              NUMBER
 NAME                                               VARCHAR2(50)
 CATEGORY                                           NUMBER
 SALARY                                             NUMBER

add new salary and date of modification in aud table. they should be same as old salary from table emp2
ALTER TABLE emp2_Aud
ADD (
OLD_SALARY NUMBER,
MODIFIED_DATE DATE
);
o/p: table altered 

desc emp2_Aud;
o/p:  Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                              NUMBER
 NAME                                               VARCHAR2(50)
 CATEGORY                                           NUMBER
 SALARY                                             NUMBER
 OLD_SALARY                                         NUMBER
 MODIFIED_DATE                                      DATE 

CREATE OR REPLACE TRIGGER emp2_Aud_Trig
AFTER UPDATE OF salary ON emp2
FOR EACH ROW
BEGIN
    INSERT INTO emp2_Aud (
        empno,
        name,
        category,
        salary,
        old_salary,
        modified_date
    )
    VALUES (
        :OLD.empno,
        :OLD.name,
        :OLD.category,
        :OLD.salary,      -- old salary stored in salary column
        :OLD.salary,      -- old salary again (as per your requirement)
        SYSDATE
    );
END;
/ 

o/p: trigger created

create table emp2_aud1 
as
select * from emp2 where 1=2;

ALTER TABLE emp2_Aud1
ADD (
NEW_SALARY NUMBER,
MODIFIED_DATE DATE
);

o/p: Table altered.

SQL> desc emp2_aud1;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                              NUMBER
 NAME                                               VARCHAR2(50)
 CATEGORY                                           NUMBER
 SALARY                                             NUMBER
 NEW_SALARY                                         NUMBER
 MODIFIED_DATE                                      DATE

CREATE OR REPLACE TRIGGER aud_sal
AFTER UPDATE OF salary ON emp2
FOR EACH ROW
BEGIN
    INSERT INTO emp2_aud1 
    (empno, name, category, salary, new_salary, modified_date)
    VALUES 
    (:OLD.empno, :OLD.name, :OLD.category, :OLD.salary, :NEW.salary, SYSDATE);
END;
/
 
BEGIN
    FOR rec IN (
        SELECT empno, name, category, salary, new_salary, modified_date 
        FROM emp2_aud1
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Emp No: ' || rec.empno ||
            ', Name: ' || rec.name ||
            ', Category: ' || rec.category ||
            ', Old Salary: ' || rec.salary ||
            ', New Salary: ' || rec.new_salary ||
            ', Date: ' || rec.modified_date
        );
    END LOOP;
END;
/
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------


SQL> CREATE TABLE EMP2_AUD AS SELECT *FROM EMP2 WHERE 1=2;

Table created.

SQL> SELECT *FROM EMP2;

     EMPNO NAME                                                 CATEGORY
---------- -------------------------------------------------- ----------
    SALARY
----------
         5 PRACTICE USER                                               2
     25000

         1 JOHN DOE


         2 BOB BROWN                                                   1
      9000


     EMPNO NAME                                                 CATEGORY
---------- -------------------------------------------------- ----------
    SALARY
----------
         3 ALICE GREEN                                                 2
     25000


SQL> SELECT *FROM EMP2_AUD;

no rows selected

SQL> DESC EMP2;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                     NOT NULL NUMBER(38)
 NAME                                               VARCHAR2(50)
 CATEGORY                                           NUMBER(38)
 SALARY                                             NUMBER

SQL> DESC EMP2_AUD;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                              NUMBER(38)
 NAME                                               VARCHAR2(50)
 CATEGORY                                           NUMBER(38)
 SALARY                                             NUMBER


TO ADD NEW SALARY AND MODIFICATION DATE IN AUDIT TABLE

SQL> ALTER TABLE EMP2_AUD ADD NEW_SALARY NUMBER;

Table altered.

SQL> ALTER TABLE EMP2_AUD ADD MOD_DATE DATE;

Table altered.

SQL> DESC EMP2_AUD;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                              NUMBER(38)
 NAME                                               VARCHAR2(50)
 CATEGORY                                           NUMBER(38)
 SALARY                                             NUMBER
 NEW_SALARY                                         NUMBER
 MOD_DATE                                           DATE
---------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER EMP2_AUD_TRI
AFTER UPDATE OF SALARY ON EMP2
FOR EACH ROW
BEGIN
    INSERT INTO EMP2_AUD 
    (EMPNO, NAME, CATEGORY, SALARY, NEW_SALARY, MOD_DATE) 
    VALUES 
    (:OLD.EMPNO, :OLD.NAME, :OLD.CATEGORY, :OLD.SALARY, :NEW.SALARY, SYSDATE);
END;
/

Trigger created.
