-- Create Project Procedure

CREATE OR REPLACE PROCEDURE sp_create_project(

    p_project_code VARCHAR,
    p_project_name VARCHAR,
    p_client_id INTEGER,
    p_branch_id INTEGER,
    p_project_manager_id INTEGER,
    p_project_status_id INTEGER,
    p_project_type VARCHAR,
    p_start_date DATE,
    p_expected_end_date DATE,
    p_budget NUMERIC,
    p_estimated_cost NUMERIC,
    p_project_address TEXT,
    p_city_id INTEGER,
    p_latitude NUMERIC,
    p_longitude NUMERIC,
    p_remarks TEXT

)
LANGUAGE plpgsql
AS
$$
BEGIN

    INSERT INTO projects(

        project_code,
        project_name,
        client_id,
        branch_id,
        project_manager_id,
        project_status_id,
        project_type,
        start_date,
        expected_end_date,
        budget,
        estimated_cost,
        actual_cost,
        completion_percentage,
        project_address,
        city_id,
        latitude,
        longitude,
        remarks,
        is_active,
        created_at

    )

    VALUES(

        p_project_code,
        p_project_name,
        p_client_id,
        p_branch_id,
        p_project_manager_id,
        p_project_status_id,
        p_project_type,
        p_start_date,
        p_expected_end_date,
        p_budget,
        p_estimated_cost,
        0,
        0,
        p_project_address,
        p_city_id,
        p_latitude,
        p_longitude,
        p_remarks,
        TRUE,
        CURRENT_TIMESTAMP

    );

END;
$$;

-- Create Update Project Progress Procedure

CREATE OR REPLACE PROCEDURE sp_update_project_progress(

    p_project_id INTEGER,
    p_completion_percentage NUMERIC

)
LANGUAGE plpgsql
AS
$$
BEGIN

    UPDATE projects

    SET

        completion_percentage = p_completion_percentage,
        updated_at = CURRENT_TIMESTAMP

    WHERE project_id = p_project_id;

END;
$$; 

-- Create Update Project Cost Procedure
CREATE OR REPLACE PROCEDURE sp_update_project_cost(

    p_project_id INTEGER,
    p_actual_cost NUMERIC

)
LANGUAGE plpgsql
AS
$$
BEGIN

    UPDATE projects

    SET

        actual_cost = p_actual_cost,
        updated_at = CURRENT_TIMESTAMP

    WHERE project_id = p_project_id;

END;
$$; 

-- Create Close Project Procedure
CREATE OR REPLACE PROCEDURE sp_close_project(

    p_project_id INTEGER,
    p_actual_end_date DATE

)
LANGUAGE plpgsql
AS
$$
BEGIN

    UPDATE projects

    SET

        actual_end_date = p_actual_end_date,
        completion_percentage = 100,
        is_active = FALSE,
        updated_at = CURRENT_TIMESTAMP

    WHERE project_id = p_project_id;

END;
$$;

CALL sp_update_project_progress(
    1,
    75
); 

CALL sp_update_project_cost(
    1,
    1250000
);

CALL sp_close_project(
    1,
    CURRENT_DATE
); 
