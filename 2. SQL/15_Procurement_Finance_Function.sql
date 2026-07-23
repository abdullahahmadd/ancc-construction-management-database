-- Create Purchase Order Total Function
CREATE OR REPLACE FUNCTION fn_purchase_order_total(
    p_purchase_order_id INTEGER
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
DECLARE
    v_total NUMERIC;
BEGIN

    SELECT
        COALESCE(SUM(line_total), 0)
    INTO v_total
    FROM purchase_order_items
    WHERE purchase_order_id = p_purchase_order_id;

    RETURN ROUND(v_total, 2);

END;
$$;

-- Create Supplier Purchase Value Function
CREATE OR REPLACE FUNCTION fn_supplier_purchase_value(
    p_supplier_id INTEGER
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
DECLARE
    v_total NUMERIC;
BEGIN

    SELECT
        COALESCE(SUM(total_amount), 0)
    INTO v_total
    FROM purchase_orders
    WHERE supplier_id = p_supplier_id;

    RETURN ROUND(v_total, 2);

END;
$$;

-- Create Outstanding Invoice Function
CREATE OR REPLACE FUNCTION fn_outstanding_invoice_amount(
    p_invoice_id INTEGER
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
DECLARE
    v_amount NUMERIC;
BEGIN

    SELECT
        outstanding_amount
    INTO v_amount
    FROM invoices
    WHERE invoice_id = p_invoice_id;

    RETURN COALESCE(v_amount, 0);

END;
$$;

-- Create Material Stock Function
CREATE OR REPLACE FUNCTION fn_material_stock(
    p_material_id INTEGER
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
DECLARE
    v_stock NUMERIC;
BEGIN

    SELECT
        COALESCE(SUM(quantity_on_hand), 0)
    INTO v_stock
    FROM inventory
    WHERE material_id = p_material_id;

    RETURN v_stock;

END;
$$;

SELECT fn_purchase_order_total(1);

SELECT fn_supplier_purchase_value(1);

SELECT fn_outstanding_invoice_amount(1);

SELECT fn_material_stock(1);