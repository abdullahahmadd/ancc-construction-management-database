-- Create Purchase Order Summary View
CREATE OR REPLACE VIEW vw_purchase_order_summary AS

SELECT

po.purchase_order_id,

po.po_number,

po.order_date,

s.supplier_name,

p.project_name,

e.first_name || ' ' || e.last_name
AS ordered_by,

po.subtotal,

po.vat_amount,

po.discount_amount,

po.total_amount,

po.status

FROM purchase_orders po

JOIN suppliers s
ON po.supplier_id = s.supplier_id

JOIN projects p
ON po.project_id = p.project_id

JOIN employees e
ON po.ordered_by = e.employee_id;

-- Create Supplier Performance View
CREATE OR REPLACE VIEW vw_supplier_performance AS

SELECT

s.supplier_id,

s.supplier_name,

COUNT(po.purchase_order_id)
AS total_purchase_orders,

ROUND(SUM(po.total_amount),2)
AS total_purchase_value,

ROUND(AVG(po.total_amount),2)
AS average_order_value

FROM suppliers s

LEFT JOIN purchase_orders po

ON s.supplier_id = po.supplier_id

GROUP BY

s.supplier_id,
s.supplier_name;

-- Create Material Purchase Analysis View
CREATE OR REPLACE VIEW vw_material_purchase_analysis AS

SELECT

m.material_code,

m.material_name,

mc.category_name,

COUNT(poi.purchase_order_item_id)
AS total_orders,

SUM(poi.quantity)
AS total_quantity,

ROUND(SUM(poi.line_total),2)
AS total_purchase_value

FROM purchase_order_items poi

JOIN materials m

ON poi.material_id = m.material_id

JOIN material_categories mc

ON m.material_category_id = mc.material_category_id

GROUP BY

m.material_code,
m.material_name,
mc.category_name;

-- Create Warehouse Inventory Summary View
CREATE OR REPLACE VIEW vw_warehouse_inventory_summary AS

SELECT

w.warehouse_name,

COUNT(i.inventory_id)
AS total_materials,

SUM(i.quantity_on_hand)
AS total_quantity,

ROUND(SUM(i.quantity_on_hand * m.unit_price),2)
AS inventory_value

FROM inventory i

JOIN warehouses w

ON i.warehouse_id = w.warehouse_id

JOIN materials m

ON i.material_id = m.material_id

GROUP BY

w.warehouse_name;

-- View Purchase Order Summary
SELECT *
FROM vw_purchase_order_summary
LIMIT 20; 

-- View Supplier Performance
SELECT *
FROM vw_supplier_performance
ORDER BY total_purchase_value DESC; 

-- View Material Purchase Analysis
SELECT *
FROM vw_material_purchase_analysis
ORDER BY total_purchase_value DESC;

-- View Warehouse Inventory Summary
SELECT *
FROM vw_warehouse_inventory_summary
ORDER BY inventory_value DESC; 

