--CTEs_Recursive

-- Employee Hierarchy
WITH RECURSIVE employee_hierarchy AS (

    SELECT

        employee_id,

        manager_id,

        employee_code,

        CONCAT(first_name, ' ', last_name) AS employee_name,

        1 AS hierarchy_level,

        CONCAT(first_name, ' ', last_name) AS reporting_path

    FROM employees

    WHERE manager_id IS NULL

    UNION ALL

    SELECT

        e.employee_id,

        e.manager_id,

        e.employee_code,

        CONCAT(e.first_name, ' ', e.last_name),

        eh.hierarchy_level + 1,

        eh.reporting_path || ' → ' ||
        CONCAT(e.first_name, ' ', e.last_name)

    FROM employees e

    INNER JOIN employee_hierarchy eh

        ON e.manager_id = eh.employee_id

)

SELECT *

FROM employee_hierarchy

ORDER BY reporting_path; 

-- Project Cost Analysis
WITH project_summary AS (

    SELECT

        project_id,

        project_name,

        budget,

        estimated_cost,

        actual_cost,

        budget - actual_cost AS remaining_budget

    FROM projects

)

SELECT *

FROM project_summary

ORDER BY remaining_budget DESC; 

-- Monthly Procurement Summary
WITH monthly_procurement AS (

    SELECT

        DATE_TRUNC('month', order_date) AS procurement_month,

        COUNT(*) AS purchase_orders,

        SUM(total_amount) AS total_value

    FROM purchase_orders

    GROUP BY DATE_TRUNC('month', order_date)

)

SELECT *

FROM monthly_procurement

ORDER BY procurement_month; 

-- Running Project Budget
WITH project_budget AS (

    SELECT

        project_name,

        start_date,

        budget

    FROM projects

)

SELECT

    project_name,

    start_date,

    budget,

    SUM(budget) OVER (

        ORDER BY start_date

    ) AS cumulative_budget

FROM project_budget

ORDER BY start_date; 


--Window_Functions

-- Employee Salary Ranking
SELECT

    employee_id,

    employee_code,

    CONCAT(first_name,' ',last_name) AS employee_name,

    department_id,

    basic_salary,

    ROW_NUMBER() OVER (

        PARTITION BY department_id

        ORDER BY basic_salary DESC

    ) AS row_number,

    RANK() OVER (

        PARTITION BY department_id

        ORDER BY basic_salary DESC

    ) AS salary_rank,

    DENSE_RANK() OVER (

        PARTITION BY department_id

        ORDER BY basic_salary DESC

    ) AS dense_salary_rank

FROM employees;

-- Project Budget Ranking
SELECT

    project_name,

    budget,

    actual_cost,

    completion_percentage,

    RANK() OVER (

        ORDER BY budget DESC

    ) AS budget_rank

FROM projects;


-- Running Total of Payments
SELECT

    payment_date,

    payment_reference,

    payment_amount,

    SUM(payment_amount)

    OVER(

        ORDER BY payment_date

    ) AS running_total

FROM payments

ORDER BY payment_date;

-- Running Hours by Employee
SELECT

    employee_id,

    work_date,

    hours_worked,

    SUM(hours_worked)

    OVER(

        PARTITION BY employee_id

        ORDER BY work_date

    ) AS cumulative_hours

FROM timesheets

ORDER BY

    employee_id,

    work_date;

-- Previous and Next Payment
SELECT

    payment_reference,

    payment_date,

    payment_amount,

    LAG(payment_amount)

    OVER(

        ORDER BY payment_date

    ) AS previous_payment,

    LEAD(payment_amount)

    OVER(

        ORDER BY payment_date

    ) AS next_payment

FROM payments;

-- Department Salary Statistics
SELECT

    department_id,

    employee_id,

    CONCAT(first_name,' ',last_name) AS employee_name,

    basic_salary,

    AVG(basic_salary)

    OVER(

        PARTITION BY department_id

    ) AS department_average_salary,

    MAX(basic_salary)

    OVER(

        PARTITION BY department_id

    ) AS highest_salary,

    MIN(basic_salary)

    OVER(

        PARTITION BY department_id

    ) AS lowest_salary

FROM employees

ORDER BY

    department_id,

    basic_salary DESC;


--Ranking_Analytics

-- Top 5 Highest Budget Projects
SELECT

    project_name,

    budget,

    actual_cost,

    completion_percentage

FROM projects

ORDER BY budget DESC

LIMIT 5;

-- Employee Salary Quartiles
SELECT

    employee_id,

    CONCAT(first_name,' ',last_name) AS employee_name,

    department_id,

    basic_salary,

    NTILE(4)

    OVER(

        ORDER BY basic_salary DESC

    ) AS salary_quartile

FROM employees;

-- Project Budget Percentile
SELECT

    project_name,

    budget,

    PERCENT_RANK()

    OVER(

        ORDER BY budget

    ) AS budget_percentile

FROM projects;

-- Payment Distribution
SELECT

    payment_reference,

    payment_amount,

    CUME_DIST()

    OVER(

        ORDER BY payment_amount

    ) AS cumulative_distribution

FROM payments;

-- Supplier Purchase Analysis
SELECT

    s.supplier_name,

    SUM(po.total_amount) AS total_purchase_value,

    RANK()

    OVER(

        ORDER BY SUM(po.total_amount) DESC

    ) AS supplier_rank

FROM suppliers s

JOIN purchase_orders po

ON s.supplier_id = po.supplier_id

GROUP BY

    s.supplier_name

ORDER BY supplier_rank;

-- Department Salary Percentile
SELECT

    department_id,

    CONCAT(first_name,' ',last_name) AS employee_name,

    basic_salary,

    PERCENT_RANK()

    OVER(

        PARTITION BY department_id

        ORDER BY basic_salary

    ) AS department_percentile

FROM employees

ORDER BY

    department_id,

    basic_salary; 

-- Projects Over Budget
SELECT

    project_name,

    budget,

    actual_cost,

    ROUND(

        actual_cost - budget,

        2

    ) AS budget_overrun

FROM projects

WHERE actual_cost > budget

ORDER BY budget_overrun DESC;


--Pivot_JSON_Array

-- Project Status Pivot Report
SELECT

    b.branch_name,

    COUNT(
        CASE
            WHEN ps.status_name = 'Planning'
            THEN 1
        END
    ) AS planning_projects,

    COUNT(
        CASE
            WHEN ps.status_name = 'In Progress'
            THEN 1
        END
    ) AS in_progress_projects,

    COUNT(
        CASE
            WHEN ps.status_name = 'Completed'
            THEN 1
        END
    ) AS completed_projects,

    COUNT(*) AS total_projects

FROM projects p

JOIN branches b
ON p.branch_id = b.branch_id

JOIN project_statuses ps
ON p.project_status_id = ps.project_status_id

GROUP BY b.branch_name

ORDER BY b.branch_name;

-- Department Salary Summary
SELECT

    d.department_name,

    COUNT(*) AS employees,

    ROUND(AVG(e.basic_salary),2) AS average_salary,

    MAX(e.basic_salary) AS highest_salary,

    MIN(e.basic_salary) AS lowest_salary,

    SUM(e.basic_salary) AS payroll

FROM employees e

JOIN departments d

ON e.department_id = d.department_id

GROUP BY d.department_name

ORDER BY payroll DESC; 

-- Employee Directory JSON
SELECT

    json_agg(

        json_build_object(

            'employee_id', employee_id,

            'employee_code', employee_code,

            'employee_name',
            CONCAT(first_name,' ',last_name),

            'email', email,

            'phone', phone,

            'status', employment_status

        )

    ) AS employees_json

FROM employees;

-- Project Summary JSON
SELECT

    json_agg(

        json_build_object(

            'project_code', project_code,

            'project_name', project_name,

            'budget', budget,

            'actual_cost', actual_cost,

            'completion', completion_percentage

        )

    ) AS projects_json

FROM projects;

-- Department Employees Array
SELECT

    d.department_name,

    array_agg(

        CONCAT(

            e.first_name,

            ' ',

            e.last_name

        )

        ORDER BY e.first_name

    ) AS employees

FROM departments d

JOIN employees e

ON d.department_id = e.department_id

GROUP BY d.department_name

ORDER BY d.department_name;

-- Department Employee List
SELECT

    d.department_name,

    string_agg(

        CONCAT(

            e.first_name,

            ' ',

            e.last_name

        ),

        ', '

        ORDER BY e.first_name

    ) AS employee_list

FROM departments d

JOIN employees e

ON d.department_id = e.department_id

GROUP BY d.department_name

ORDER BY d.department_name; 

-- Purchase Order Summary JSON
SELECT

    po.po_number,

    json_agg(

        json_build_object(

            'material_id', poi.material_id,

            'quantity', poi.quantity,

            'unit_price', poi.unit_price,

            'line_total', poi.line_total

        )

        ORDER BY poi.purchase_order_item_id

    ) AS purchase_order_items

FROM purchase_orders po

JOIN purchase_order_items poi

ON po.purchase_order_id = poi.purchase_order_id

GROUP BY

    po.purchase_order_id,

    po.po_number

ORDER BY po.po_number;

-- Active vs Inactive Employees
SELECT

    COUNT(*) FILTER (
        WHERE is_active = TRUE
    ) AS active_employees,

    COUNT(*) FILTER (
        WHERE is_active = FALSE
    ) AS inactive_employees

FROM employees;

