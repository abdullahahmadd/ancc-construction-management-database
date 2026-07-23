-- Project Portfolio Summary
SELECT

    p.project_code,

    p.project_name,

    c.client_name,

    ps.status_name,

    p.start_date,

    p.expected_end_date,

    p.budget,

    p.actual_cost,

    p.completion_percentage

FROM projects p

JOIN clients c
ON p.client_id = c.client_id

JOIN project_statuses ps
ON p.project_status_id = ps.project_status_id

ORDER BY p.project_name;

-- Projects by Status
SELECT

    ps.status_name,

    COUNT(*) AS total_projects,

    ROUND(AVG(p.completion_percentage),2) AS average_completion

FROM projects p

JOIN project_statuses ps

ON p.project_status_id = ps.project_status_id

GROUP BY ps.status_name

ORDER BY total_projects DESC;

-- Project Budget Analysis
SELECT

    project_code,

    project_name,

    budget,

    actual_cost,

    ROUND(

        budget - actual_cost,

        2

    ) AS remaining_budget,

    completion_percentage

FROM projects

ORDER BY remaining_budget DESC;

-- Highest Budget Projects
SELECT

    project_code,

    project_name,

    budget,

    completion_percentage

FROM projects

ORDER BY budget DESC

LIMIT 10;

-- Project Manager Workload
SELECT

    CONCAT(

        e.first_name,

        ' ',

        e.last_name

    ) AS project_manager,

    COUNT(*) AS total_projects,

    ROUND(

        SUM(p.budget),

        2

    ) AS managed_budget

FROM projects p

JOIN employees e

ON p.project_manager_id = e.employee_id

GROUP BY

    project_manager

ORDER BY managed_budget DESC;

-- Branch Project Summary
SELECT

    b.branch_name,

    COUNT(*) AS total_projects,

    ROUND(

        SUM(p.budget),

        2

    ) AS total_budget,

    ROUND(

        AVG(p.completion_percentage),

        2

    ) AS average_completion

FROM branches b

JOIN projects p

ON b.branch_id = p.branch_id

GROUP BY b.branch_name

ORDER BY total_budget DESC;

-- Projects Near Completion
SELECT

    project_code,

    project_name,

    completion_percentage,

    expected_end_date

FROM projects

WHERE completion_percentage >= 80

ORDER BY completion_percentage DESC;

-- Project Cost Variance
SELECT

    project_code,

    project_name,

    budget,

    actual_cost,

    ROUND(

        actual_cost - budget,

        2

    ) AS cost_variance

FROM projects

ORDER BY cost_variance DESC;


--Procurement_Reports

-- Purchase Order Summary
SELECT

    po.po_number,

    s.supplier_name,

    p.project_name,

    po.order_date,

    po.expected_delivery_date,

    po.status,

    ROUND(po.total_amount,2) AS total_amount

FROM purchase_orders po

JOIN suppliers s
ON po.supplier_id = s.supplier_id

JOIN projects p
ON po.project_id = p.project_id

ORDER BY po.order_date DESC;

-- Monthly Procurement Summary
SELECT

    TO_CHAR(order_date,'YYYY-MM') AS procurement_month,

    COUNT(*) AS total_purchase_orders,

    ROUND(SUM(total_amount),2) AS procurement_value,

    ROUND(AVG(total_amount),2) AS average_purchase_order

FROM purchase_orders

GROUP BY

    TO_CHAR(order_date,'YYYY-MM')

ORDER BY procurement_month;

-- Supplier Purchase Analysis
SELECT

    s.supplier_name,

    COUNT(po.purchase_order_id) AS purchase_orders,

    ROUND(SUM(po.total_amount),2) AS total_purchase_value,

    ROUND(AVG(po.total_amount),2) AS average_purchase_order

FROM suppliers s

JOIN purchase_orders po

ON s.supplier_id = po.supplier_id

GROUP BY s.supplier_name

ORDER BY total_purchase_value DESC;

-- Top 10 Purchase Orders
SELECT

    po_number,

    order_date,

    total_amount,

    status

FROM purchase_orders

ORDER BY total_amount DESC

LIMIT 10;

-- Project Procurement Cost
SELECT

    p.project_code,

    p.project_name,

    COUNT(po.purchase_order_id) AS purchase_orders,

    ROUND(SUM(po.total_amount),2) AS procurement_cost

FROM projects p

LEFT JOIN purchase_orders po

ON p.project_id = po.project_id

GROUP BY

    p.project_code,

    p.project_name

ORDER BY procurement_cost DESC NULLS LAST;

-- Purchase Order Status Report
SELECT

    status,

    COUNT(*) AS total_purchase_orders,

    ROUND(SUM(total_amount),2) AS total_value

FROM purchase_orders

GROUP BY status

ORDER BY total_purchase_orders DESC;

-- Supplier Performance
SELECT

    s.supplier_name,

    COUNT(po.purchase_order_id) AS completed_orders,

    MIN(po.order_date) AS first_order,

    MAX(po.order_date) AS latest_order,

    ROUND(SUM(po.total_amount),2) AS total_business

FROM suppliers s

LEFT JOIN purchase_orders po

ON s.supplier_id = po.supplier_id

GROUP BY s.supplier_name

ORDER BY total_business DESC NULLS LAST;

-- Largest Procurement Projects
SELECT

    p.project_name,

    ROUND(SUM(po.total_amount),2) AS procurement_value

FROM projects p

JOIN purchase_orders po

ON p.project_id = po.project_id

GROUP BY p.project_name

ORDER BY procurement_value DESC

LIMIT 10;

