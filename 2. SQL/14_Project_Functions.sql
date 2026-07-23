-- Create Project Duration Function
CREATE OR REPLACE FUNCTION fn_project_duration(
    p_project_id INTEGER
)
RETURNS INTEGER
LANGUAGE plpgsql
AS
$$
DECLARE
    v_duration INTEGER;
BEGIN

    SELECT
        (COALESCE(actual_end_date, expected_end_date) - start_date)
    INTO v_duration
    FROM projects
    WHERE project_id = p_project_id;

    RETURN COALESCE(v_duration, 0);

END;
$$;

-- Create Budget Utilization Function
CREATE OR REPLACE FUNCTION fn_budget_utilization(
    p_project_id INTEGER
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
DECLARE
    v_percentage NUMERIC;
BEGIN

    SELECT
        CASE
            WHEN budget = 0 THEN 0
            ELSE ROUND((actual_cost / budget) * 100, 2)
        END
    INTO v_percentage
    FROM projects
    WHERE project_id = p_project_id;

    RETURN COALESCE(v_percentage, 0);

END;
$$;

-- Create Project Completion Function
CREATE OR REPLACE FUNCTION fn_project_completion(
    p_project_id INTEGER
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
DECLARE
    v_completion NUMERIC;
BEGIN

    SELECT completion_percentage
    INTO v_completion
    FROM projects
    WHERE project_id = p_project_id;

    RETURN COALESCE(v_completion, 0);

END;
$$;

-- Create Project Manager Function
CREATE OR REPLACE FUNCTION fn_project_manager_name(
    p_project_id INTEGER
)
RETURNS TEXT
LANGUAGE plpgsql
AS
$$
DECLARE
    v_manager_name TEXT;
BEGIN

    SELECT
        e.first_name || ' ' || e.last_name
    INTO v_manager_name
    FROM projects p
    JOIN employees e
        ON p.project_manager_id = e.employee_id
    WHERE p.project_id = p_project_id;

    RETURN v_manager_name;

END;
$$;

SELECT fn_project_duration(1);

SELECT fn_budget_utilization(1);

SELECT fn_project_completion(1);

SELECT fn_project_manager_name(1);

