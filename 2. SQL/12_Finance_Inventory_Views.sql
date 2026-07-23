-- Create Invoice Summary View
CREATE OR REPLACE VIEW vw_invoice_summary AS

SELECT

i.invoice_id,

i.invoice_number,

p.project_name,

c.client_name,

i.invoice_date,

i.due_date,

i.total_amount,

i.paid_amount,

i.outstanding_amount,

i.status

FROM invoices i

JOIN projects p
ON i.project_id = p.project_id

JOIN clients c
ON i.client_id = c.client_id;

-- Create Payment Summary View
CREATE OR REPLACE VIEW vw_payment_summary AS

SELECT

pay.payment_id,

pay.payment_reference,

i.invoice_number,

pm.method_name AS payment_method,

pay.payment_date,

pay.payment_amount,

pay.transaction_reference,

pay.remarks

FROM payments pay

JOIN invoices i
ON pay.invoice_id = i.invoice_id

JOIN payment_methods pm
ON pay.payment_method_id = pm.payment_method_id;

-- Create Outstanding Invoice Dashboard View
CREATE OR REPLACE VIEW vw_outstanding_invoice_dashboard AS

SELECT

invoice_number,

invoice_date,

due_date,

total_amount,

paid_amount,

outstanding_amount,

status

FROM invoices

WHERE outstanding_amount > 0;

-- Create Inventory Stock Status View
CREATE OR REPLACE VIEW vw_inventory_stock_status AS

SELECT

w.warehouse_name,

m.material_name,

i.quantity_on_hand,

i.minimum_stock,

i.maximum_stock,

CASE

WHEN i.quantity_on_hand <= i.minimum_stock
THEN 'Low Stock'

WHEN i.quantity_on_hand >= i.maximum_stock
THEN 'Over Stock'

ELSE 'Normal'

END AS stock_status,

i.last_stock_update

FROM inventory i

JOIN warehouses w
ON i.warehouse_id = w.warehouse_id

JOIN materials m
ON i.material_id = m.material_id;

-- View Invoice Summary
SELECT *
FROM vw_invoice_summary
LIMIT 20;

-- View Payment Summary
SELECT *
FROM vw_payment_summary
LIMIT 20;

-- Outstanding Invoices
SELECT *
FROM vw_outstanding_invoice_dashboard;

-- Inventory Stock Status
SELECT *
FROM vw_inventory_stock_status
ORDER BY warehouse_name, material_name;

