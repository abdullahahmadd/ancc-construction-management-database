-- Create Project Overview View
CREATE OR REPLACE VIEW vw_project_overview AS

SELECT

p.project_id,
p.project_code,
p.project_name,

c.client_name,

b.branch_name,

e.first_name || ' ' || e.last_name
AS project_manager,

ps.status_name,

p.project_type,

p.start_date,
p.expected_end_date,
p.actual_end_date,

p.budget,
p.estimated_cost,
p.actual_cost,

p.completion_percentage

FROM projects p

JOIN clients c
ON p.client_id = c.client_id

JOIN branches b
ON p.branch_id = b.branch_id

JOIN employees e
ON p.project_manager_id = e.employee_id

JOIN project_statuses ps
ON p.project_status_id = ps.project_status_id;

-- Create Project Budget Analysis View
CREATE OR REPLACE VIEW vw_project_budget_analysis AS

SELECT

project_code,

project_name,

budget,

estimated_cost,

actual_cost,

(budget-estimated_cost)
AS estimated_variance,

(budget-actual_cost)
AS actual_variance,

completion_percentage

FROM projects;

-- Create Project Manager Performance View
CREATE OR REPLACE VIEW vw_project_manager_performance AS

SELECT

e.employee_id,

e.employee_code,

e.first_name || ' ' || e.last_name
AS project_manager,

COUNT(p.project_id)
AS total_projects,

ROUND(SUM(p.budget),2)
AS total_budget,

ROUND(AVG(p.completion_percentage),2)
AS average_completion

FROM employees e

JOIN projects p

ON e.employee_id=p.project_manager_id

GROUP BY

e.employee_id,
e.employee_code,
project_manager;

-- Create Project Status Dashboard View
CREATE OR REPLACE VIEW vw_project_status_dashboard AS

SELECT

ps.status_name,

COUNT(*)
AS total_projects,

ROUND(AVG(p.completion_percentage),2)
AS average_completion,

ROUND(SUM(p.budget),2)
AS total_budget

FROM projects p

JOIN project_statuses ps

ON p.project_status_id=ps.project_status_id

GROUP BY

ps.status_name;

-- View Project Overview
SELECT *
FROM vw_project_overview
LIMIT 20;

-- View Budget Analysis
SELECT *
FROM vw_project_budget_analysis
ORDER BY budget DESC;

-- View Project Manager Performance
SELECT *
FROM vw_project_manager_performance
ORDER BY total_budget DESC;

-- View Project Status Dashboard
SELECT *
FROM vw_project_status_dashboard
ORDER BY total_budget DESC;