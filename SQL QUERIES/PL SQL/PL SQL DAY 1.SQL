BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello Shreya');
END;  

DECLARE
   student_name varchar2(50):='Shreya';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello ' || student_name);
END;    

Number : number(10), number(10,2)

DECLARE
    RANGE_OF_SALARY number;

BEGIN
    SELECT max(salary) - min(salary) into RANGE_OF_SALARY from hr.employees;
    DBMS_OUTPUT.PUT_LINE(RANGE_OF_SALARY);
END;

DECLARE
    max_salary number;
    min_salary number;

BEGIN
    SELECT max(salary), min(salary) max_salary,min_salary into  from hr.employees;
    DBMS_OUTPUT.PUT_LINE(max_salary-min_salary );
END;
