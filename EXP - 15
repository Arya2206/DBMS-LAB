Experiment - 15
Aim: Consider database design of any banking software. Create tables accordingly and write a PL/SQL block trigger to do INSERT/UPDATE/DELETE operation only during week days. Raise an exception if the day is SAT or SUN.

(1) design a trigger to stop insertion or updation in the table for the days like sat or sun of any date (for practice purpose take the day as 'tue')


create or replace trigger no_ist_upd
before insert or update on emp2
declare
    v_day varchar2(10);
begin
    v_day := to_char(sysdate, 'dy');
    if v_day = 'tue' then
        raise_application_error(-20001, 'cant insert or update on the table on ' || v_day);
    end if;
end;
/

Trigger created.
