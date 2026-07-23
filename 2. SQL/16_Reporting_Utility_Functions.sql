-- Create Employee Age Function
CREATE OR REPLACE FUNCTION fn_employee_age(
    p_employee_id INTEGER
)
RETURNS INTEGER
LANGUAGE plpgsql
AS
$$
DECLARE
    v_age INTEGER;
BEGIN

    SELECT
        EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth))
    INTO v_age
    FROM employees
    WHERE employee_id = p_employee_id;

    RETURN COALESCE(v_age, 0);

END;
$$;

-- Create Active Project Count Function
CREATE OR REPLACE FUNCTION fn_active_project_count()
RETURNS INTEGER
LANGUAGE plpgsql
AS
$$
DECLARE
    v_total INTEGER;
BEGIN

    SELECT COUNT(*)
    INTO v_total
    FROM projects
    WHERE is_active = TRUE;

    RETURN v_total;

END;
$$;

-- Create Client Invoice Value Function
CREATE OR REPLACE FUNCTION fn_client_invoice_value(
    p_client_id INTEGER
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
DECLARE
    v_total NUMERIC;
BEGIN

    SELECT
        COALESCE(SUM(total_amount),0)
    INTO v_total
    FROM invoices
    WHERE client_id = p_client_id;

    RETURN ROUND(v_total,2);

END;
$$;

-- Create Warehouse Inventory Value Function
CREATE OR REPLACE FUNCTION fn_warehouse_inventory_value(
    p_warehouse_id INTEGER
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
DECLARE
    v_total NUMERIC;
BEGIN

    SELECT
        COALESCE(SUM(i.quantity_on_hand * poi.unit_price),0)
    INTO v_total
    FROM inventory i
    JOIN purchase_order_items poi
        ON i.material_id = poi.material_id
    WHERE i.warehouse_id = p_warehouse_id;

    RETURN ROUND(v_total,2);

END;
$$;

SELECT fn_employee_age(1);

SELECT fn_active_project_count();

SELECT fn_client_invoice_value(1);

SELECT fn_warehouse_inventory_value(1);