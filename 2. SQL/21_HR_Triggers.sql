-- Update Employee Timestamp Trigger Function
CREATE OR REPLACE FUNCTION trg_employee_set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN

    NEW.updated_at := CURRENT_TIMESTAMP;

    RETURN NEW;

END;
$$;

CREATE TRIGGER trg_employee_set_updated_at

BEFORE UPDATE

ON employees

FOR EACH ROW

EXECUTE FUNCTION trg_employee_set_updated_at();

-- Validate Employee Termination Date
CREATE OR REPLACE FUNCTION trg_validate_termination_date()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN

    IF NEW.termination_date IS NOT NULL

       AND NEW.termination_date < NEW.hire_date THEN

        RAISE EXCEPTION
        'Termination date cannot be earlier than hire date.';

    END IF;

    RETURN NEW;

END;
$$;

CREATE TRIGGER trg_validate_termination_date

BEFORE INSERT OR UPDATE

ON employees

FOR EACH ROW

EXECUTE FUNCTION trg_validate_termination_date(); 

-- Auto Deactivate Employee Trigger
CREATE OR REPLACE FUNCTION trg_auto_deactivate_employee()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN

    IF NEW.termination_date IS NOT NULL THEN

        NEW.is_active := FALSE;

        NEW.employment_status := 'Terminated';

    END IF;

    RETURN NEW;

END;
$$;

CREATE TRIGGER trg_auto_deactivate_employee

BEFORE UPDATE

ON employees

FOR EACH ROW

EXECUTE FUNCTION trg_auto_deactivate_employee(); 

-- Employee Audit Trigger Function
CREATE OR REPLACE FUNCTION trg_employee_audit()
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

        1,

        TG_TABLE_NAME,

        COALESCE(NEW.employee_id, OLD.employee_id),

        TG_OP,

        CURRENT_TIMESTAMP,

        '127.0.0.1',

        'Employee record ' || LOWER(TG_OP)

    );

    IF TG_OP = 'DELETE' THEN
        RETURN OLD;
    END IF;

    RETURN NEW;

END;
$$;

CREATE TRIGGER trg_employee_audit

AFTER INSERT OR UPDATE OR DELETE

ON employees

FOR EACH ROW

EXECUTE FUNCTION trg_employee_audit();