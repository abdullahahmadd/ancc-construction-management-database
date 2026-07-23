-- Executive KPI Dashboard
SELECT

    (SELECT COUNT(*)
     FROM employees
     WHERE is_active = TRUE) AS active_employees,

    (SELECT COUNT(*)
     FROM projects
     WHERE is_active = TRUE) AS active_projects,

    (SELECT COUNT(*)
     FROM clients) AS total_clients,

    (SELECT COUNT(*)
     FROM suppliers) AS total_suppliers,

    (SELECT COUNT(*)
     FROM purchase_orders) AS purchase_orders,

    (SELECT COUNT(*)
     FROM invoices) AS invoices,

    (SELECT COALESCE(SUM(total_amount),0)
     FROM purchase_orders) AS procurement_value,

    (SELECT COALESCE(SUM(total_amount),0)
     FROM invoices) AS invoiced_amount,

    (SELECT COALESCE(SUM(payment_amount),0)
     FROM payments) AS payments_received;

-- Project Status Summary
SELECT

    ps.status_name,

    COUNT(*) AS total_projects,

    ROUND(AVG(p.completion_percentage),2) AS average_completion,

    ROUND(SUM(p.budget),2) AS total_budget,

    ROUND(SUM(p.actual_cost),2) AS total_actual_cost

FROM projects p

JOIN project_statuses ps

ON p.project_status_id = ps.project_status_id

GROUP BY ps.status_name

ORDER BY total_projects DESC;

-- Branch Performance Report
SELECT

    b.branch_name,

    COUNT(DISTINCT p.project_id) AS projects,

    COUNT(DISTINCT e.employee_id) AS employees,

    ROUND(SUM(p.budget),2) AS total_budget,

    ROUND(SUM(p.actual_cost),2) AS total_cost

FROM branches b

LEFT JOIN projects p

ON b.branch_id = p.branch_id

LEFT JOIN employees e

ON b.branch_id = e.branch_id

GROUP BY b.branch_name

ORDER BY total_budget DESC;

-- Monthly Procurement Trend
SELECT

    TO_CHAR(order_date,'YYYY-MM') AS month,

    COUNT(*) AS purchase_orders,

    ROUND(SUM(total_amount),2) AS procurement_amount

FROM purchase_orders

GROUP BY

    TO_CHAR(order_date,'YYYY-MM')

ORDER BY month;

-- Revenue vs Payments
SELECT

    ROUND(

        (SELECT COALESCE(SUM(total_amount),0)

         FROM invoices),

        2

    ) AS invoiced,

    ROUND(

        (SELECT COALESCE(SUM(payment_amount),0)

         FROM payments),

        2

    ) AS payments_received,

    ROUND(

        (SELECT COALESCE(SUM(outstanding_amount),0)

         FROM invoices),

        2

    ) AS outstanding_balance;

-- Top Budget Projects
SELECT

    project_code,

    project_name,

    budget,

    actual_cost,

    completion_percentage

FROM projects

ORDER BY budget DESC

LIMIT 10;

