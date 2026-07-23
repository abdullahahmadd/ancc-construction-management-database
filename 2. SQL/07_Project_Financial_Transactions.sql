-- Insert Equipment Assignments
INSERT INTO equipment_assignments (
    equipment_id,
    project_id,
    assigned_to,
    assignment_date,
    expected_return_date,
    actual_return_date,
    assignment_status,
    remarks
)

SELECT

((gs-1)%5)+1,

((gs-1)%25)+1,

((gs-1)%50)+1,

CURRENT_DATE - FLOOR(RANDOM()*180)::INTEGER,

CURRENT_DATE + FLOOR(RANDOM()*90)::INTEGER,

CASE
WHEN gs%4=0
THEN CURRENT_DATE - FLOOR(RANDOM()*30)::INTEGER
ELSE NULL
END,

CASE
WHEN gs%5=0 THEN 'Returned'
WHEN gs%5=1 THEN 'Assigned'
WHEN gs%5=2 THEN 'Maintenance'
WHEN gs%5=3 THEN 'Assigned'
ELSE 'Lost'
END,

'System generated assignment'

FROM generate_series(1,300) gs;

-- Insert Contracts
INSERT INTO contracts (

contract_number,
project_id,
client_id,
contract_type_id,
contract_title,
contract_date,
start_date,
end_date,
contract_value,
retention_percentage,
status,
remarks

)

SELECT

'CON-2026-' || LPAD(gs::text,4,'0'),

gs,

((gs-1)%5)+1,

((gs-1)%5)+1,

'Construction Contract '||gs,

CURRENT_DATE-(gs*15),

CURRENT_DATE-(gs*15),

CURRENT_DATE+(365+gs*10),

ROUND((25000000+RANDOM()*175000000)::numeric,2),

10,

CASE
WHEN gs%5=0 THEN 'Completed'
WHEN gs%5=1 THEN 'Active'
WHEN gs%5=2 THEN 'Draft'
WHEN gs%5=3 THEN 'Expired'
ELSE 'Terminated'
END,

'Generated contract'

FROM generate_series(1,25) gs;

SELECT COUNT(*)
FROM contracts;

-- Insert Invoices
INSERT INTO invoices (

invoice_number,
contract_id,
project_id,
client_id,
invoice_date,
due_date,
subtotal,
vat_amount,
total_amount,
paid_amount,
outstanding_amount,
status,
remarks

)

SELECT

'INV-2026-' || LPAD((c.contract_id*100+i)::text,6,'0'),

c.contract_id,

c.project_id,

c.client_id,

CURRENT_DATE-(i*15),

CURRENT_DATE-(i*15)+30,

subtotal,

ROUND(subtotal*0.15,2),

ROUND(subtotal*1.15,2),

paid,

ROUND((subtotal*1.15)-paid,2),

CASE
WHEN paid=0 THEN 'Pending'
WHEN paid>=subtotal*1.15 THEN 'Paid'
ELSE 'Partially Paid'
END,

'Generated invoice'

FROM contracts c

CROSS JOIN generate_series(1,20) i

CROSS JOIN LATERAL (

SELECT

ROUND((50000+RANDOM()*500000)::numeric,2) subtotal,

ROUND((RANDOM()*600000)::numeric,2) paid

)x;

SELECT COUNT(*)
FROM invoices;

-- Insert Payments
INSERT INTO payments (

payment_reference,
invoice_id,
payment_method_id,
payment_date,
payment_amount,
transaction_reference,
remarks

)

SELECT

'PAY-'||LPAD(gs::text,8,'0'),

((gs-1)%500)+1,

((gs-1)%5)+1,

CURRENT_DATE-FLOOR(RANDOM()*180)::INTEGER,

ROUND((5000+RANDOM()*200000)::numeric,2),

'TXN-'||LPAD(gs::text,10,'0'),

'Generated payment'

FROM generate_series(1,1000) gs;

SELECT COUNT(*)
FROM payments;

