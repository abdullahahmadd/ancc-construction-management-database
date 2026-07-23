-- Create Employee Directory View
CREATE OR REPLACE VIEW vw_employee_directory AS

SELECT

e.employee_id,
e.employee_code,
e.employee_number,

e.first_name || ' ' || e.last_name AS employee_name,

jp.position_title,

d.department_name,

b.branch_name,

c.city_name,

e.phone,
e.email,

e.hire_date,

e.basic_salary,

e.employment_status

FROM employees e

JOIN job_positions jp
ON e.job_position_id = jp.job_position_id

JOIN departments d
ON e.department_id = d.department_id

JOIN branches b
ON e.branch_id = b.branch_id

JOIN cities c
ON e.city_id = c.city_id;

-- Create Employee Department Summary View
CREATE OR REPLACE VIEW vw_department_employee_summary AS

SELECT

d.department_name,

COUNT(*) AS total_employees,

ROUND(AVG(e.basic_salary),2) AS average_salary,

MIN(e.basic_salary) AS minimum_salary,

MAX(e.basic_salary) AS maximum_salary

FROM employees e

JOIN departments d

ON e.department_id=d.department_id

GROUP BY d.department_name;

-- Create Attendance Summary View
CREATE OR REPLACE VIEW vw_attendance_summary AS

SELECT

e.employee_code,

e.first_name || ' ' || e.last_name AS employee_name,

COUNT(*) FILTER
(WHERE attendance_status='Present') AS present_days,

COUNT(*) FILTER
(WHERE attendance_status='Absent') AS absent_days,

COUNT(*) FILTER
(WHERE attendance_status='Leave') AS leave_days,

COUNT(*) FILTER
(WHERE attendance_status='Holiday') AS holiday_days

FROM attendance a

JOIN employees e

ON a.employee_id=e.employee_id

GROUP BY

e.employee_code,

employee_name;

-- Create Employee Work Hours Summary View
CREATE OR REPLACE VIEW vw_employee_work_hours AS

SELECT

e.employee_code,

e.first_name || ' ' || e.last_name AS employee_name,

COUNT(t.timesheet_id) AS total_entries,

ROUND(SUM(t.hours_worked),2) AS total_hours,

ROUND(SUM(t.overtime_hours),2) AS overtime_hours,

ROUND(AVG(t.hours_worked),2) AS average_daily_hours

FROM employees e

JOIN timesheets t

ON e.employee_id=t.employee_id

GROUP BY

e.employee_code,

employee_name;

-- View Employee Directory
SELECT *
FROM vw_employee_directory
LIMIT 20;

-- View Department Summary
SELECT *
FROM vw_department_employee_summary;

-- View Attendance Summary
SELECT *
FROM vw_attendance_summary
LIMIT 20; 

-- View Work Hours Summary
SELECT *
FROM vw_employee_work_hours
LIMIT 20;

