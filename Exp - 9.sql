Exp - 9
Aim - Procedures to Handle Tables

 1) Create Table: st_info
# ------------------------------------------------

CREATE TABLE st_info (
    roll NUMBER,
    name VARCHAR2(30),
    sub1 NUMBER,
    sub2 NUMBER,
    sub3 NUMBER,
    sub4 NUMBER,
    total NUMBER,
    perc NUMBER(5,2),
    result VARCHAR2(10)
);

# ------------------------------------------------
# 2) Insert Student Data
# ------------------------------------------------

INSERT INTO st_info (roll, name, sub1, sub2, sub3, sub4, total, perc, result)
VALUES (1,'Amit',75,68,70,80,NULL,NULL,NULL);

INSERT INTO st_info (roll, name, sub1, sub2, sub3, sub4, total, perc, result)
VALUES (2,'Rahul',60,65,58,72,NULL,NULL,NULL);

INSERT INTO st_info (roll, name, sub1, sub2, sub3, sub4, total, perc, result)
VALUES (3,'Priya',82,78,85,80,NULL,NULL,NULL);

INSERT INTO st_info (roll, name, sub1, sub2, sub3, sub4, total, perc, result)
VALUES (4,'Neha',55,60,62,58,NULL,NULL,NULL);

INSERT INTO st_info (roll, name, sub1, sub2, sub3, sub4, total, perc, result)
VALUES (5,'Rohit',45,50,48,52,NULL,NULL,NULL);

INSERT INTO st_info (roll, name, sub1, sub2, sub3, sub4, total, perc, result)
VALUES (6,'Anita',90,88,92,85,NULL,NULL,NULL);

INSERT INTO st_info (roll, name, sub1, sub2, sub3, sub4, total, perc, result)
VALUES (7,'Karan',70,72,68,75,NULL,NULL,NULL);

INSERT INTO st_info (roll, name, sub1, sub2, sub3, sub4, total, perc, result)
VALUES (8,'Sneha',65,60,67,63,NULL,NULL,NULL);

INSERT INTO st_info (roll, name, sub1, sub2, sub3, sub4, total, perc, result)
VALUES (9,'Vikas',50,55,60,58,NULL,NULL,NULL);

INSERT INTO st_info (roll, name, sub1, sub2, sub3, sub4, total, perc, result)
VALUES (10,'Pooja',78,82,80,76,NULL,NULL,NULL);


# ------------------------------------------------
# 3) Procedure: Display Student Data by Roll Number
# ------------------------------------------------

CREATE OR REPLACE PROCEDURE show_st(rno NUMBER)
AS
  s_roll  st_info.roll%TYPE;     # variable for roll number
  s_name  st_info.name%TYPE;     # variable for student name
  s_sub1  st_info.sub1%TYPE;     # variable for sub1 marks
  s_sub2  st_info.sub2%TYPE;     # variable for sub2 marks
  s_sub3  st_info.sub3%TYPE;     # variable for sub3 marks
  s_sub4  st_info.sub4%TYPE;     # variable for sub4 marks
BEGIN
  # select student info into variables
  SELECT roll, name, sub1, sub2, sub3, sub4
  INTO s_roll, s_name, s_sub1, s_sub2, s_sub3, s_sub4
  FROM st_info
  WHERE roll = rno;

  # display output using DBMS_OUTPUT
  DBMS_OUTPUT.PUT_LINE('Roll No : ' || s_roll);
  DBMS_OUTPUT.PUT_LINE('Name of the student : ' || s_name);
  DBMS_OUTPUT.PUT_LINE('Marks of Sub1 : ' || s_sub1);
  DBMS_OUTPUT.PUT_LINE('Marks of Sub2 : ' || s_sub2);
  DBMS_OUTPUT.PUT_LINE('Marks of Sub3 : ' || s_sub3);
  DBMS_OUTPUT.PUT_LINE('Marks of Sub4 : ' || s_sub4);
END;
/

# ------------------------------------------------
# 4) Execute Procedure for Roll Number 1
# ------------------------------------------------

SET SERVEROUTPUT ON;
EXEC show_st(1);

# OUTPUT:
# Roll No : 1
# Name of the student : Amit
# Marks of Sub1 : 75
# Marks of Sub2 : 68
# Marks of Sub3 : 70
# Marks of Sub4 : 80
# PL/SQL procedure successfully completed.
