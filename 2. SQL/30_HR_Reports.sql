-- Employee Distribution by Department
SELECT

    d.department_name,

    COUNT(e.employee_id) AS total_employees,

    COUNT(*) FILTER (
        WHERE e.is_active = TRUE
    ) AS active_employees,

    COUNT(*) FILTER (
        WHERE e.is_active = FALSE
    ) AS inactive_employees

FROM departments d

LEFT JOIN employees e

ON d.department_id = e.department_id

GROUP BY d.department_name

ORDER BY total_employees DESC;

-- Employee Distribution by Branch
SELECT

    b.branch_name,

    COUNT(e.employee_id) AS total_employees,

    ROUND(AVG(e.basic_salary),2) AS average_salary,

    ROUND(SUM(e.basic_salary),2) AS monthly_payroll

FROM branches b

LEFT JOIN employees e

ON b.branch_id = e.branch_id

GROUP BY b.branch_name

ORDER BY monthly_payroll DESC;

-- Department Payroll Summary
SELECT

    d.department_name,

    COUNT(*) AS employees,

    ROUND(SUM(e.basic_salary),2) AS total_basic_salary,

    ROUND(SUM(e.allowance),2) AS total_allowance,

    ROUND(SUM(e.basic_salary + e.allowance),2) AS gross_payroll

FROM employees e

JOIN departments d

ON e.department_id = d.department_id

GROUP BY d.department_name

ORDER BY gross_payroll DESC;

-- Employee Attendance Summary
SELECT

    e.employee_code,

    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,

    COUNT(a.attendance_id) AS total_attendance,

    COUNT(*) FILTER (
        WHERE a.attendance_status = 'Present'
    ) AS present_days,

    COUNT(*) FILTER (
        WHERE a.attendance_status = 'Absent'
    ) AS absent_days,

    COUNT(*) FILTER (
        WHERE a.attendance_status = 'Late'
    ) AS late_days,

    ROUND(

        COUNT(*) FILTER (
            WHERE a.attendance_status = 'Present'
        ) * 100.0 /

        COUNT(a.attendance_id),

        2

    ) AS attendance_percentage

FROM employees e

JOIN attendance a

ON e.employee_id = a.employee_id

GROUP BY

    e.employee_code,

    employee_name

ORDER BY attendance_percentage DESC,
         present_days DESC;

-- Employee Timesheet Summary
SELECT

    e.employee_code,

    CONCAT(e.first_name,' ',e.last_name) AS employee_name,

    COUNT(t.timesheet_id) AS entries,

    SUM(t.hours_worked) AS total_hours,

    ROUND(AVG(t.hours_worked),2) AS average_hours

FROM employees e

JOIN timesheets t

ON e.employee_id = t.employee_id

GROUP BY

    e.employee_code,

    employee_name

ORDER BY total_hours DESC;

-- Recently Hired Employees
SELECT

    employee_code,

    CONCAT(first_name,' ',last_name) AS employee_name,

    hire_date,

    employment_status,

    basic_salary

FROM employees

ORDER BY hire_date DESC

LIMIT 10;

-- Manager Team Size
SELECT

    CONCAT(m.first_name,' ',m.last_name) AS manager_name,

    COUNT(e.employee_id) AS direct_reports

FROM employees m

LEFT JOIN employees e

ON m.employee_id = e.manager_id

GROUP BY manager_name

HAVING COUNT(e.employee_id) > 0

ORDER BY direct_reports DESC;

-- Employee Nationality Distribution
SELECT

    c.country_name,

    COUNT(*) AS employees

FROM employees e

JOIN countries c

ON e.nationality_id = c.country_id

GROUP BY c.country_name

ORDER BY employees DESC;

