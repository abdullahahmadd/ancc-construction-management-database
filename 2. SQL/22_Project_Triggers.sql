-- Update Project Timestamp Trigger Function
CREATE OR REPLACE FUNCTION trg_project_set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN

    NEW.updated_at := CURRENT_TIMESTAMP;

    RETURN NEW;

END;
$$;

CREATE TRIGGER trg_project_set_updated_at

BEFORE UPDATE

ON projects

FOR EACH ROW

EXECUTE FUNCTION trg_project_set_updated_at();

-- Validate Project Budget Trigger Function
CREATE OR REPLACE FUNCTION trg_validate_project_budget()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN

    IF NEW.actual_cost > NEW.budget THEN

        RAISE EXCEPTION
        'Actual project cost cannot exceed project budget.';

    END IF;

    RETURN NEW;

END;
$$;

CREATE TRIGGER trg_validate_project_budget

BEFORE INSERT OR UPDATE

ON projects

FOR EACH ROW

EXECUTE FUNCTION trg_validate_project_budget();

-- Auto Close Project Trigger Function
CREATE OR REPLACE FUNCTION trg_auto_close_project()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN

    IF NEW.completion_percentage >= 100 THEN

        NEW.actual_end_date := COALESCE(NEW.actual_end_date, CURRENT_DATE);

        NEW.is_active := FALSE;

    END IF;

    RETURN NEW;

END;
$$;

CREATE TRIGGER trg_auto_close_project

BEFORE UPDATE

ON projects

FOR EACH ROW

EXECUTE FUNCTION trg_auto_close_project();

-- Project Audit Trigger Function
CREATE OR REPLACE FUNCTION trg_project_audit()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN

    INSERT INTO audit_logs (

        user_id,
        table_name,
        record_id,
        action_type,
        action_timestamp,
        ip_address,
        action_details

    )

    VALUES (

        (SELECT MIN(user_id) FROM users),

        TG_TABLE_NAME,

        COALESCE(NEW.project_id, OLD.project_id),

        TG_OP,

        CURRENT_TIMESTAMP,

        '127.0.0.1',

        format(
            'Project %s (ID: %s)',
            LOWER(TG_OP),
            COALESCE(NEW.project_id, OLD.project_id)
        )

    );

    IF TG_OP = 'DELETE' THEN
        RETURN OLD;
    END IF;

    RETURN NEW;

END;
$$;

CREATE TRIGGER trg_project_audit

AFTER INSERT OR UPDATE OR DELETE

ON projects

FOR EACH ROW

EXECUTE FUNCTION trg_project_audit();

