Experiment - 13
Aim: Write a trigger to demonstrate the use of Row level trigger and Statement level trigger.

-----------------------------------------------------------------------------------------------------
Statement Level Trigger

CREATE OR REPLACE TRIGGER trig_st
BEFORE UPDATE ON st_info
BEGIN
DBMS_OUTPUT.PUT_LINE('This is statement level trigger fired');
END;
/

SET SERVEROUTPUT ON;

UPDATE st_info
SET total = sub1 + sub2 + sub3 + sub4;

-- OUTPUT:
-- This is statement level trigger fired

-------------------------------------------------------------------------------------------------------


Row Level Trigger

CREATE OR REPLACE TRIGGER trig_row
BEFORE UPDATE ON st_info
FOR EACH ROW
BEGIN
DBMS_OUTPUT.PUT_LINE('This is row level trigger fired');
END;
/

UPDATE st_info
SET total = sub1 + sub2 + sub3 + sub4
WHERE sub1 > 80;

-- OUTPUT:
-- This is row level trigger fired
-- This is row level trigger fired

-------------------------------------------------------------------------------------------------------

Trigger for Marks Validation (Conditional Statement)

CREATE OR REPLACE TRIGGER trig_marks
BEFORE INSERT ON st_info
FOR EACH ROW
BEGIN
IF (:NEW.sub1 < 0 OR :NEW.sub1 > 100) OR
(:NEW.sub2 < 0 OR :NEW.sub2 > 100) OR
(:NEW.sub3 < 0 OR :NEW.sub3 > 100) OR
(:NEW.sub4 < 0 OR :NEW.sub4 > 100) THEN

DBMS_OUTPUT.PUT_LINE('Marks are out of valid range (0-100)');

ELSE
DBMS_OUTPUT.PUT_LINE('Marks are valid');
END IF;
END;
/

SET SERVEROUTPUT ON;

INSERT INTO st_info
VALUES (1, 'John', 120, 85, 90, 95, NULL, NULL, NULL);

-- OUTPUT:
-- Marks are out of valid range (0-100)
------------------------------------------------------------------------------------------------------

Error Handling

SHOW ERRORS;

-- ERROR:
-- ORA-04098: trigger is invalid and failed re-validation

-- REASON:
-- Syntax error or missing :NEW keyword
