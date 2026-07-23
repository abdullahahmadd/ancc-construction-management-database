-- Update Purchase Order Timestamp Trigger Function
CREATE OR REPLACE FUNCTION trg_purchase_order_set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN

    NEW.updated_at := CURRENT_TIMESTAMP;

    RETURN NEW;

END;
$$;

CREATE TRIGGER trg_purchase_order_set_updated_at

BEFORE UPDATE

ON purchase_orders

FOR EACH ROW

EXECUTE FUNCTION trg_purchase_order_set_updated_at();

-- Recalculate Purchase Order Total Trigger Function
CREATE OR REPLACE FUNCTION trg_recalculate_purchase_order_total()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
DECLARE

    v_purchase_order_id INTEGER;

    v_subtotal NUMERIC;

    v_vat NUMERIC;

    v_discount NUMERIC;

BEGIN

    v_purchase_order_id :=
        COALESCE(
            NEW.purchase_order_id,
            OLD.purchase_order_id
        );

    SELECT

        COALESCE(
            SUM(quantity * unit_price),
            0
        ),

        COALESCE(
            SUM(quantity * unit_price * vat_percentage / 100),
            0
        ),

        COALESCE(
            SUM(quantity * unit_price * discount_percentage / 100),
            0
        )

    INTO

        v_subtotal,
        v_vat,
        v_discount

    FROM purchase_order_items

    WHERE purchase_order_id = v_purchase_order_id;

    UPDATE purchase_orders

    SET

        subtotal = ROUND(v_subtotal,2),

        vat_amount = ROUND(v_vat,2),

        discount_amount = ROUND(v_discount,2),

        total_amount =
            ROUND(
                v_subtotal
                - v_discount
                + v_vat,
                2
            ),

        updated_at = CURRENT_TIMESTAMP

    WHERE purchase_order_id = v_purchase_order_id;

    RETURN COALESCE(NEW, OLD);

END;
$$;

CREATE TRIGGER trg_recalculate_purchase_order_total

AFTER INSERT OR UPDATE OR DELETE

ON purchase_order_items

FOR EACH ROW

EXECUTE FUNCTION trg_recalculate_purchase_order_total();

-- Update Inventory Timestamp Trigger Function
CREATE OR REPLACE FUNCTION trg_inventory_set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN

    NEW.last_stock_update := CURRENT_TIMESTAMP;

    NEW.updated_at := CURRENT_TIMESTAMP;

    RETURN NEW;

END;
$$;

CREATE TRIGGER trg_inventory_set_updated_at

BEFORE UPDATE

ON inventory

FOR EACH ROW

EXECUTE FUNCTION trg_inventory_set_updated_at();

-- Procurement Audit Trigger Function
CREATE OR REPLACE FUNCTION trg_purchase_order_audit()
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
            NEW.purchase_order_id,
            OLD.purchase_order_id
        ),

        TG_OP,

        CURRENT_TIMESTAMP,

        '127.0.0.1',

        format(

            'Purchase Order %s (ID: %s)',

            LOWER(TG_OP),

            COALESCE(
                NEW.purchase_order_id,
                OLD.purchase_order_id
            )

        )

    );

    IF TG_OP='DELETE' THEN
        RETURN OLD;
    END IF;

    RETURN NEW;

END;
$$;

CREATE TRIGGER trg_purchase_order_audit

AFTER INSERT OR UPDATE OR DELETE

ON purchase_orders

FOR EACH ROW

EXECUTE FUNCTION trg_purchase_order_audit();

