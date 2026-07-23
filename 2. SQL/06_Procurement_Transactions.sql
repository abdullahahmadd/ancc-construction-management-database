-- Insert Purchase Orders
INSERT INTO purchase_orders (
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
    remarks
)
SELECT

'PO-2026-' || LPAD(gs::text,6,'0'),

((gs-1)%5)+1,

((gs-1)%25)+1,

((gs-1)%50)+1,

CURRENT_DATE - FLOOR(RANDOM()*365)::INTEGER,

CURRENT_DATE + FLOOR(RANDOM()*30)::INTEGER,

subtotal,

ROUND(subtotal * 0.15,2),

discount,

ROUND(subtotal + (subtotal*0.15) - discount,2),

CASE
WHEN gs%6=0 THEN 'Completed'
WHEN gs%6=1 THEN 'Approved'
WHEN gs%6=2 THEN 'Ordered'
WHEN gs%6=3 THEN 'Draft'
WHEN gs%6=4 THEN 'Partially Received'
ELSE 'Cancelled'
END,

'System generated purchase order'

FROM (

SELECT
gs,

ROUND((10000 + RANDOM()*190000)::numeric,2) AS subtotal,

ROUND((RANDOM()*5000)::numeric,2) AS discount

FROM generate_series(1,500) gs

)x;

-- Purchase Order Count
SELECT COUNT(*)
FROM purchase_orders;

-- View Purchase Orders
SELECT

po_number,
supplier_id,
project_id,
ordered_by,
subtotal,
vat_amount,
total_amount,
status

FROM purchase_orders
ORDER BY purchase_order_id;

-- Insert Purchase Order Items
INSERT INTO purchase_order_items (
    purchase_order_id,
    material_id,
    quantity,
    unit_price,
    discount_percentage,
    vat_percentage,
    line_total,
    received_quantity,
    remarks
)

SELECT
    po.purchase_order_id,

    m.material_id,

    qty,

    price,

    discount,

    15,

    ROUND(
        (
            (qty * price)
            - ((qty * price) * (discount / 100))
            + ((qty * price) * 0.15)
        )::numeric,
        2
    ),

    FLOOR(qty * RANDOM())::INTEGER,

    'Generated line item'

FROM purchase_orders po

CROSS JOIN LATERAL (

    SELECT material_id
    FROM materials
    ORDER BY RANDOM()
    LIMIT 5

) m

CROSS JOIN LATERAL (

    SELECT
        FLOOR(RANDOM() * 90 + 10)::INTEGER AS qty,
        ROUND((RANDOM() * 4000 + 50)::numeric,2) AS price,
        ROUND((RANDOM() * 10)::numeric,2) AS discount

) d;


-- Purchase Order Item Count
SELECT COUNT(*)
FROM purchase_order_items;

-- Average Items Per PO
SELECT

purchase_order_id,

COUNT(*) AS items

FROM purchase_order_items

GROUP BY purchase_order_id

ORDER BY purchase_order_id;

--Duplicate check
SELECT
    purchase_order_id,
    material_id,
    COUNT(*)
FROM purchase_order_items
GROUP BY purchase_order_id, material_id
HAVING COUNT(*) > 1;

