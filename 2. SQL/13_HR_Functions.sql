-- Create Employee Full Name Function
CREATE OR REPLACE FUNCTION fn_employee_full_name(
    p_employee_id INTEGER
)
RETURNS TEXT
LANGUAGE plpgsql
AS
$$
DECLARE
    v_full_name TEXT;
BEGIN

    SELECT
        first_name || ' ' || last_name
    INTO v_full_name
    FROM employees
    WHERE employee_id = p_employee_id;

    RETURN v_full_name;

END;
$$;

-- Create Annual Salary Function
CREATE OR REPLACE FUNCTION fn_annual_salary(
    p_employee_id INTEGER
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
DECLARE
    v_salary NUMERIC;
BEGIN

    SELECT COALESCE(basic_salary, 0) + COALESCE(allowance, 0)
    INTO v_salary
    FROM employees
    WHERE employee_id = p_employee_id;

    RETURN v_salary * 12;

END;
$$;

-- Create Employee Work Hours Function
CREATE OR REPLACE FUNCTION fn_total_work_hours(
    p_employee_id INTEGER
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
DECLARE
    v_total_hours NUMERIC;
BEGIN

    SELECT
        COALESCE(SUM(hours_worked + overtime_hours),0)
    INTO v_total_hours
    FROM timesheets
    WHERE employee_id = p_employee_id;

    RETURN v_total_hours;

END;
$$;

-- Create Department Employee Count Function
CREATE OR REPLACE FUNCTION fn_department_employee_count(
    p_department_id INTEGER
)
RETURNS INTEGER
LANGUAGE plpgsql
AS
$$
DECLARE
    v_total INTEGER;
BEGIN

    SELECT COUNT(*)
    INTO v_total
    FROM employees
    WHERE department_id = p_department_id;

    RETURN v_total;

END;
$$;

SELECT fn_employee_full_name(1);

SELECT fn_annual_salary(1);

SELECT fn_total_work_hours(1);

SELECT fn_department_employee_count(1);

