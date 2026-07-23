-- Current Inventory Status
SELECT

    m.material_code,

    m.material_name,

    mc.category_name,

    w.warehouse_name,

    i.quantity_on_hand,

    i.minimum_stock,

    i.maximum_stock,

    m.unit_of_measure,

    m.unit_price,

    i.last_stock_update

FROM inventory i

JOIN materials m
ON i.material_id = m.material_id

JOIN material_categories mc
ON m.material_category_id = mc.material_category_id

JOIN warehouses w
ON i.warehouse_id = w.warehouse_id

ORDER BY
    w.warehouse_name,
    m.material_name;

-- Low Stock Materials
SELECT

    m.material_name,

    w.warehouse_name,

    i.quantity_on_hand,

    i.minimum_stock,

    (i.minimum_stock - i.quantity_on_hand) AS shortage_quantity

FROM inventory i

JOIN materials m

ON i.material_id = m.material_id

JOIN warehouses w

ON i.warehouse_id = w.warehouse_id

WHERE i.quantity_on_hand <= i.minimum_stock

ORDER BY shortage_quantity DESC;

-- Warehouse Inventory Summary
SELECT

    w.warehouse_name,

    COUNT(i.inventory_id) AS total_materials,

    SUM(i.quantity_on_hand) AS total_quantity,

    COUNT(*) FILTER (

        WHERE i.quantity_on_hand <= i.minimum_stock

    ) AS low_stock_items

FROM warehouses w

LEFT JOIN inventory i

ON w.warehouse_id = i.warehouse_id

GROUP BY w.warehouse_name

ORDER BY total_quantity DESC NULLS LAST;

-- Material Category Summary
SELECT

    mc.category_name,

    COUNT(m.material_id) AS materials,

    COALESCE(SUM(i.quantity_on_hand), 0) AS total_quantity

FROM material_categories mc

LEFT JOIN materials m

ON mc.material_category_id = m.material_category_id

LEFT JOIN inventory i

ON m.material_id = i.material_id

GROUP BY mc.category_name

ORDER BY total_quantity DESC;

-- Inventory Capacity Utilization
SELECT

    m.material_name,

    w.warehouse_name,

    i.quantity_on_hand,

    i.maximum_stock,

    ROUND(

        (i.quantity_on_hand * 100.0) /

        NULLIF(i.maximum_stock,0),

        2

    ) AS utilization_percentage

FROM inventory i

JOIN materials m

ON i.material_id = m.material_id

JOIN warehouses w

ON i.warehouse_id = w.warehouse_id

ORDER BY utilization_percentage DESC;

-- Materials by Warehouse
SELECT

    w.warehouse_name,

    STRING_AGG(

        m.material_name,

        ', '

        ORDER BY m.material_name

    ) AS materials

FROM warehouses w

JOIN inventory i

ON w.warehouse_id = i.warehouse_id

JOIN materials m

ON i.material_id = m.material_id

GROUP BY w.warehouse_name

ORDER BY w.warehouse_name;

-- Recently Updated Inventory
SELECT

    m.material_name,

    w.warehouse_name,

    i.quantity_on_hand,

    i.last_stock_update

FROM inventory i

JOIN materials m

ON i.material_id = m.material_id

JOIN warehouses w

ON i.warehouse_id = w.warehouse_id

ORDER BY i.last_stock_update DESC

LIMIT 10;

-- Inventory Dashboard
SELECT

    (SELECT COUNT(*) FROM warehouses) AS warehouses,

    (SELECT COUNT(*) FROM materials) AS materials,

    (SELECT COUNT(*) FROM inventory) AS inventory_records,

    (

        SELECT COUNT(*)

        FROM inventory

        WHERE quantity_on_hand <= minimum_stock

    ) AS low_stock_items,

    (

        SELECT SUM(quantity_on_hand)

        FROM inventory

    ) AS total_stock_quantity;


