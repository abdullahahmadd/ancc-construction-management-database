-- Insert Users
INSERT INTO users (
    employee_id,
    role_id,
    username,
    password_hash,
    last_login,
    account_status
)

SELECT

employee_id,

CASE
    WHEN employee_id <= 2 THEN 1
    WHEN employee_id <= 5 THEN 4
    WHEN employee_id <= 10 THEN 5
    ELSE 8
END,

LOWER(first_name || '.' || last_name || employee_id),

'$2b$12$DemoPortfolioHashReplaceInProduction',

CURRENT_TIMESTAMP - (RANDOM() * INTERVAL '30 days'),

'Active'

FROM employees;

-- User Count
SELECT COUNT(*)
FROM users;

-- Insert Attendance
INSERT INTO attendance (

employee_id,
attendance_date,
check_in,
check_out,
attendance_status,
remarks

)

SELECT

e.employee_id,

d.work_day,

TIME '08:00'
+
(RANDOM()*INTERVAL '30 minutes'),

TIME '17:00'
+
(RANDOM()*INTERVAL '45 minutes'),

CASE

WHEN RANDOM()<0.92 THEN 'Present'
WHEN RANDOM()<0.96 THEN 'Leave'
WHEN RANDOM()<0.99 THEN 'Holiday'
ELSE 'Absent'

END,

'Generated attendance'

FROM employees e

CROSS JOIN (

SELECT day::date AS work_day

FROM generate_series(

CURRENT_DATE-730,

CURRENT_DATE,

INTERVAL '1 day'

) day

WHERE EXTRACT(ISODOW FROM day)<=5

)d;

SELECT COUNT(*)
FROM attendance;

-- Insert Timesheets
INSERT INTO timesheets (

employee_id,
project_id,
project_site_id,
work_date,
hours_worked,
overtime_hours,
work_description,
approved_by,
approval_date

)

SELECT

((gs-1)%50)+1,

((gs-1)%25)+1,

((gs-1)%60)+1,

CURRENT_DATE-FLOOR(RANDOM()*730)::INTEGER,

ROUND((6+RANDOM()*4)::numeric,2),

ROUND((RANDOM()*3)::numeric,2),

'Construction activities',

FLOOR(RANDOM()*10+1)::INTEGER,

CURRENT_DATE

FROM generate_series(1,100000) gs;

SELECT COUNT(*)
FROM timesheets;

SELECT
    COUNT(*) AS total_users
FROM users;

-- Insert Audit Logs
WITH user_list AS
(
    SELECT
        user_id,
        ROW_NUMBER() OVER (ORDER BY user_id) AS rn
    FROM users
),
total_users AS
(
    SELECT COUNT(*) AS total
    FROM user_list
)

INSERT INTO audit_logs
(
    user_id,
    table_name,
    record_id,
    action_type,
    action_timestamp,
    ip_address,
    action_details
)

SELECT

u.user_id,

CASE (gs % 8)

WHEN 0 THEN 'employees'
WHEN 1 THEN 'projects'
WHEN 2 THEN 'purchase_orders'
WHEN 3 THEN 'attendance'
WHEN 4 THEN 'timesheets'
WHEN 5 THEN 'contracts'
WHEN 6 THEN 'payments'
ELSE 'inventory'

END,

FLOOR(RANDOM()*10000 + 1)::INTEGER,

CASE (gs % 5)

WHEN 0 THEN 'INSERT'
WHEN 1 THEN 'UPDATE'
WHEN 2 THEN 'DELETE'
WHEN 3 THEN 'LOGIN'
ELSE 'LOGOUT'

END,

CURRENT_TIMESTAMP
-
(RANDOM() * INTERVAL '730 days'),

'192.168.1.' || ((gs % 250) + 1),

'System generated audit log'

FROM generate_series(1,350000) gs

CROSS JOIN total_users t

JOIN user_list u
ON u.rn = ((gs - 1) % t.total) + 1;

-- Audit Log Count
SELECT COUNT(*)
FROM audit_logs;

-- Audit Log Summary
SELECT

action_type,

COUNT(*) AS total

FROM audit_logs

GROUP BY action_type

ORDER BY action_type;

-- Audit Table Summary
SELECT

table_name,

COUNT(*) AS total

FROM audit_logs

GROUP BY table_name

ORDER BY table_name;

