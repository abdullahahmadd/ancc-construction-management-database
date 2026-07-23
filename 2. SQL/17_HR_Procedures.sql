-- Create Hire Employee Procedure
CREATE OR REPLACE PROCEDURE sp_hire_employee(

    p_employee_code VARCHAR,
    p_employee_number VARCHAR,
    p_first_name VARCHAR,
    p_last_name VARCHAR,
    p_gender VARCHAR,
    p_date_of_birth DATE,
    p_nationality_id INTEGER,
    p_iqama_number VARCHAR,
    p_email VARCHAR,
    p_phone VARCHAR,
    p_branch_id INTEGER,
    p_department_id INTEGER,
    p_job_position_id INTEGER,
    p_manager_id INTEGER,
    p_city_id INTEGER,
    p_hire_date DATE,
    p_basic_salary NUMERIC,
    p_allowance NUMERIC

)
LANGUAGE plpgsql
AS
$$
BEGIN

    INSERT INTO employees(

        employee_code,
        employee_number,
        first_name,
        last_name,
        gender,
        date_of_birth,
        nationality_id,
        iqama_number,
        email,
        phone,
        branch_id,
        department_id,
        job_position_id,
        manager_id,
        city_id,
        hire_date,
        basic_salary,
        allowance,
        employment_status,
        is_active,
        created_at

    )

    VALUES(

        p_employee_code,
        p_employee_number,
        p_first_name,
        p_last_name,
        p_gender,
        p_date_of_birth,
        p_nationality_id,
        p_iqama_number,
        p_email,
        p_phone,
        p_branch_id,
        p_department_id,
        p_job_position_id,
        p_manager_id,
        p_city_id,
        p_hire_date,
        p_basic_salary,
        p_allowance,
        'Active',
        TRUE,
        CURRENT_TIMESTAMP

    );

END;
$$;  

-- Create Update Employee Salary Procedure
CREATE OR REPLACE PROCEDURE sp_update_employee_salary(

    p_employee_id INTEGER,
    p_basic_salary NUMERIC,
    p_allowance NUMERIC

)
LANGUAGE plpgsql
AS
$$
BEGIN

    UPDATE employees

    SET

        basic_salary = p_basic_salary,
        allowance = p_allowance,
        updated_at = CURRENT_TIMESTAMP

    WHERE employee_id = p_employee_id;

END;
$$;

-- Create Transfer Employee Procedure
CREATE OR REPLACE PROCEDURE sp_transfer_employee(

    p_employee_id INTEGER,
    p_department_id INTEGER,
    p_manager_id INTEGER

)
LANGUAGE plpgsql
AS
$$
BEGIN

    UPDATE employees

    SET

        department_id = p_department_id,
        manager_id = p_manager_id,
        updated_at = CURRENT_TIMESTAMP

    WHERE employee_id = p_employee_id;

END;
$$;

-- Create Terminate Employee Procedure
CREATE OR REPLACE PROCEDURE sp_terminate_employee(

    p_employee_id INTEGER,
    p_termination_date DATE

)
LANGUAGE plpgsql
AS
$$
BEGIN

    UPDATE employees

    SET

        termination_date = p_termination_date,
        employment_status = 'Terminated',
        is_active = FALSE,
        updated_at = CURRENT_TIMESTAMP

    WHERE employee_id = p_employee_id;

END;
$$;

CALL sp_update_employee_salary(

    1,
    9000,
    1500

); 

CALL sp_transfer_employee(

    1,
    2,
    5

);

CALL sp_terminate_employee(

    1,
    CURRENT_DATE

);

