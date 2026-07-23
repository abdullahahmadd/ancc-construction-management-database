-- Executive KPI Dashboard
CREATE MATERIALIZED VIEW mv_executive_dashboard AS

SELECT

    COUNT(DISTINCT e.employee_id) AS total_employees,

    COUNT(DISTINCT p.project_id) AS total_projects,

    COUNT(DISTINCT c.client_id) AS total_clients,

    COUNT(DISTINCT s.supplier_id) AS total_suppliers,

    COALESCE(SUM(p.budget),0) AS total_project_budget,

    COALESCE(SUM(p.actual_cost),0) AS total_actual_cost

FROM employees e

CROSS JOIN projects p

CROSS JOIN clients c

CROSS JOIN suppliers s;

-- Project Performance Dashboard
CREATE MATERIALIZED VIEW mv_project_performance AS

SELECT

    p.project_id,

    p.project_code,

    p.project_name,

    c.client_name,

    CONCAT(e.first_name,' ',e.last_name) AS project_manager,

    ps.status_name,

    p.budget,

    p.actual_cost,

    ROUND(

        (p.actual_cost / NULLIF(p.budget,0)) * 100,

        2

    ) AS budget_utilization,

    p.completion_percentage

FROM projects p

JOIN clients c

ON p.client_id = c.client_id

JOIN employees e

ON p.project_manager_id = e.employee_id

JOIN project_statuses ps

ON p.project_status_id = ps.project_status_id;

-- Procurement Dashboard
CREATE MATERIALIZED VIEW mv_procurement_dashboard AS

SELECT

    s.supplier_name,

    COUNT(po.purchase_order_id) AS purchase_orders,

    SUM(po.total_amount) AS total_purchase_value,

    AVG(po.total_amount) AS average_order_value,

    MAX(po.order_date) AS latest_purchase

FROM purchase_orders po

JOIN suppliers s

ON po.supplier_id = s.supplier_id

GROUP BY

    s.supplier_name;

-- Finance Dashboard
CREATE MATERIALIZED VIEW mv_finance_dashboard AS

SELECT

    c.client_name,

    COUNT(i.invoice_id) AS invoices,

    SUM(i.total_amount) AS total_invoice_value,

    SUM(i.paid_amount) AS total_paid,

    SUM(i.outstanding_amount) AS outstanding_balance

FROM invoices i

JOIN clients c

ON i.client_id = c.client_id

GROUP BY

    c.client_name;


REFRESH MATERIALIZED VIEW mv_executive_dashboard;

REFRESH MATERIALIZED VIEW mv_project_performance;

REFRESH MATERIALIZED VIEW mv_procurement_dashboard;

REFRESH MATERIALIZED VIEW mv_finance_dashboard;

CREATE INDEX idx_mv_project_performance
ON mv_project_performance(project_id);

SELECT *

FROM mv_executive_dashboard;


SELECT *

FROM mv_project_performance

LIMIT 20;


SELECT *

FROM mv_procurement_dashboard

ORDER BY total_purchase_value DESC;


SELECT *

FROM mv_finance_dashboard

ORDER BY outstanding_balance DESC;




	