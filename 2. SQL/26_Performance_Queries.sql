-- Employee Lookup Performance
EXPLAIN ANALYZE

SELECT

    employee_id,
    employee_code,
    first_name,
    last_name,
    employment_status

FROM employees

WHERE employee_code = 'EMP-0001';

-- Project Dashboard Performance
EXPLAIN ANALYZE

SELECT

    p.project_name,

    c.client_name,

    CONCAT(e.first_name,' ',e.last_name) AS project_manager,

    ps.status_name,

    p.budget,

    p.actual_cost,

    p.completion_percentage

FROM projects p

JOIN clients c

ON p.client_id = c.client_id

JOIN employees e

ON p.project_manager_id = e.employee_id

JOIN project_statuses ps

ON p.project_status_id = ps.project_status_id

WHERE p.is_active = TRUE;

-- Procurement Report Performance
EXPLAIN ANALYZE

SELECT

    po.po_number,

    s.supplier_name,

    p.project_name,

    po.total_amount,

    po.status,

    po.order_date

FROM purchase_orders po

JOIN suppliers s

ON po.supplier_id = s.supplier_id

JOIN projects p

ON po.project_id = p.project_id

WHERE po.status = 'Approved';

-- Invoice Summary Performance
EXPLAIN ANALYZE

SELECT

    i.invoice_number,

    c.client_name,

    i.total_amount,

    i.paid_amount,

    i.outstanding_amount,

    i.status

FROM invoices i

JOIN clients c

ON i.client_id = c.client_id

WHERE i.status <> 'Paid';

-- Inventory Performance
EXPLAIN ANALYZE

SELECT

    w.warehouse_name,

    m.material_name,

    i.quantity_on_hand,

    i.minimum_stock,

    i.maximum_stock

FROM inventory i

JOIN warehouses w

ON i.warehouse_id = w.warehouse_id

JOIN materials m

ON i.material_id = m.material_id

WHERE i.quantity_on_hand <= i.minimum_stock;

-- Audit Log Search Performance
EXPLAIN ANALYZE

SELECT

    audit_log_id,

    table_name,

    action_type,

    action_timestamp

FROM audit_logs

WHERE table_name = 'employees'

ORDER BY action_timestamp DESC

LIMIT 100;

-- Timesheet Performance
EXPLAIN ANALYZE

SELECT

    CONCAT(e.first_name,' ',e.last_name) AS employee,

    p.project_name,

    SUM(t.hours_worked) AS total_hours,

    SUM(t.overtime_hours) AS overtime

FROM timesheets t

JOIN employees e

ON t.employee_id = e.employee_id

JOIN projects p

ON t.project_id = p.project_id

GROUP BY

    employee,

    p.project_name

ORDER BY total_hours DESC;

-- Refresh Planner Statistics
ANALYZE;

-- Reclaim Space
VACUUM ANALYZE;

-- Full Database Optimization (maintenance window only)
VACUUM FULL;

-- Update Optimizer Statistics
REINDEX DATABASE ancc_construction_db;

