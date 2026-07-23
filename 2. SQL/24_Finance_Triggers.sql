-- Update Payment Timestamp Trigger Function
CREATE OR REPLACE FUNCTION trg_payment_set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN

    NEW.updated_at := CURRENT_TIMESTAMP;

    RETURN NEW;

END;
$$;

CREATE TRIGGER trg_payment_set_updated_at

BEFORE UPDATE

ON payments

FOR EACH ROW

EXECUTE FUNCTION trg_payment_set_updated_at();

-- Recalculate Invoice Balance Trigger Function
CREATE OR REPLACE FUNCTION trg_recalculate_invoice_balance()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
DECLARE

    v_invoice_id INTEGER;

    v_paid NUMERIC;

BEGIN

    v_invoice_id :=
        COALESCE(
            NEW.invoice_id,
            OLD.invoice_id
        );

    SELECT

        COALESCE(
            SUM(payment_amount),
            0
        )

    INTO v_paid

    FROM payments

    WHERE invoice_id = v_invoice_id;

    UPDATE invoices

    SET

        paid_amount = ROUND(v_paid,2),

        outstanding_amount =
            ROUND(total_amount - v_paid,2),

        updated_at = CURRENT_TIMESTAMP

    WHERE invoice_id = v_invoice_id;

    RETURN COALESCE(NEW, OLD);

END;
$$;

CREATE TRIGGER trg_recalculate_invoice_balance

AFTER INSERT OR UPDATE OR DELETE

ON payments

FOR EACH ROW

EXECUTE FUNCTION trg_recalculate_invoice_balance();

-- Auto Update Invoice Status Trigger Function
CREATE OR REPLACE FUNCTION trg_update_invoice_status()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN

    IF NEW.outstanding_amount <= 0 THEN

        NEW.status := 'Paid';

    ELSIF NEW.paid_amount > 0 THEN

        NEW.status := 'Partially Paid';

    ELSE

        NEW.status := 'Unpaid';

    END IF;

    RETURN NEW;

END;
$$;

CREATE TRIGGER trg_update_invoice_status

BEFORE UPDATE

ON invoices

FOR EACH ROW

EXECUTE FUNCTION trg_update_invoice_status();

-- Finance Audit Trigger Function
CREATE OR REPLACE FUNCTION trg_payment_audit()
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

        COALESCE(
            NEW.payment_id,
            OLD.payment_id
        ),

        TG_OP,

        CURRENT_TIMESTAMP,

        '127.0.0.1',

        format(

            'Payment %s (ID: %s)',

            LOWER(TG_OP),

            COALESCE(
                NEW.payment_id,
                OLD.payment_id
            )

        )

    );

    IF TG_OP = 'DELETE' THEN
        RETURN OLD;
    END IF;

    RETURN NEW;

END;
$$;

CREATE TRIGGER trg_payment_audit

AFTER INSERT OR UPDATE OR DELETE

ON payments

FOR EACH ROW

EXECUTE FUNCTION trg_payment_audit();