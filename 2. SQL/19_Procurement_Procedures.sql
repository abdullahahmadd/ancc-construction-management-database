-- Create Purchase Order Procedure
CREATE OR REPLACE PROCEDURE sp_create_purchase_order(

    p_po_number VARCHAR,
    p_supplier_id INTEGER,
    p_project_id INTEGER,
    p_ordered_by INTEGER,
    p_order_date DATE,
    p_expected_delivery_date DATE,
    p_remarks TEXT

)

LANGUAGE plpgsql

AS
$$
BEGIN

    INSERT INTO purchase_orders(

        po_number,
        supplier_id,
        project_id,
        ordered_by,
        order_date,
        expected_delivery_date,
        subtotal,
        vat_amount,
        discount_amount,
        total_amount,
        status,
        remarks,
        is_active,
        created_at

    )

    VALUES(

        p_po_number,
        p_supplier_id,
        p_project_id,
        p_ordered_by,
        p_order_date,
        p_expected_delivery_date,
        0,
        0,
        0,
        0,
        'Pending',
        p_remarks,
        TRUE,
        CURRENT_TIMESTAMP

    );

END;
$$;

-- Create Purchase Order Item Procedure
CREATE OR REPLACE PROCEDURE sp_add_purchase_order_item(

    p_purchase_order_id INTEGER,
    p_material_id INTEGER,
    p_quantity NUMERIC,
    p_unit_price NUMERIC,
    p_discount_percentage NUMERIC,
    p_vat_percentage NUMERIC,
    p_remarks TEXT

)

LANGUAGE plpgsql

AS
$$
DECLARE

    v_line_total NUMERIC;

BEGIN

    v_line_total :=

    ((p_quantity * p_unit_price)

    - ((p_quantity * p_unit_price)
        * p_discount_percentage / 100))

    +

    (((p_quantity * p_unit_price)

    - ((p_quantity * p_unit_price)
        * p_discount_percentage / 100))

        * p_vat_percentage / 100);

    INSERT INTO purchase_order_items(

        purchase_order_id,
        material_id,
        quantity,
        unit_price,
        discount_percentage,
        vat_percentage,
        line_total,
        received_quantity,
        remarks,
        created_at

    )

    VALUES(

        p_purchase_order_id,
        p_material_id,
        p_quantity,
        p_unit_price,
        p_discount_percentage,
        p_vat_percentage,
        ROUND(v_line_total,2),
        0,
        p_remarks,
        CURRENT_TIMESTAMP

    );

END;
$$;

-- Create Purchase Order Status Procedure
CREATE OR REPLACE PROCEDURE sp_update_purchase_order_status(

    p_purchase_order_id INTEGER,
    p_status VARCHAR

)

LANGUAGE plpgsql

AS
$$
BEGIN

    UPDATE purchase_orders

    SET

        status = p_status,
        updated_at = CURRENT_TIMESTAMP

    WHERE purchase_order_id = p_purchase_order_id;

END;
$$;

-- Create Receive Material Procedure
CREATE OR REPLACE PROCEDURE sp_receive_inventory(

    p_warehouse_id INTEGER,
    p_material_id INTEGER,
    p_quantity NUMERIC

)

LANGUAGE plpgsql

AS
$$
BEGIN

    UPDATE inventory

    SET

        quantity_on_hand = quantity_on_hand + p_quantity,
        last_stock_update = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP

    WHERE warehouse_id = p_warehouse_id
      AND material_id = p_material_id;

END;
$$;  

CALL sp_update_purchase_order_status(
    1,
    'Approved'
);

CALL sp_receive_inventory(
    1,
    1,
    50
);   

