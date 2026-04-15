Experiment - 16
Aim: Consider any employee management system. Create table accordingly and write a trigger which will not allow the insertion if the salary is 10 times more than the minimum salary or 10 times lesser than the maximum salary.


create or eeplace procedure ,in-max-sal
as
min_salary emp2.salary % type
max_salary emp2.salary %type
begin slect min(salary), max(salary into min_salary, max_salary function emp2;
min_salary = max_salary/10;
max_salary = max_salary * 10;
end;
/

the trigger for the above code: 
CREATE OR REPLACE TRIGGER in_max_sal
BEFORE INSERT OR UPDATE ON emp2
FOR EACH ROW
DECLARE
    min_salary emp2.salary%TYPE;
    max_salary emp2.salary%TYPE;
BEGIN
    -- Get min and max salary from table
    SELECT MIN(salary), MAX(salary)
    INTO min_salary, max_salary
    FROM emp2;

    -- Modify values
    min_salary := max_salary / 10;
    max_salary := max_salary * 10;

    -- Apply logic (example: enforce range)
    IF :NEW.salary < min_salary THEN
        :NEW.salary := min_salary;
    ELSIF :NEW.salary > max_salary THEN
        :NEW.salary := max_salary;
    END IF;
END;
/
