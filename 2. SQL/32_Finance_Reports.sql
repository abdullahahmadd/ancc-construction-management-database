-- Invoice Summary
SELECT

    i.invoice_number,

    c.client_name,

    p.project_name,

    i.invoice_date,

    i.due_date,

    i.status,

    ROUND(i.total_amount,2) AS invoice_amount,

    ROUND(i.outstanding_amount,2) AS outstanding_amount

FROM invoices i

JOIN clients c

ON i.client_id = c.client_id

JOIN projects p

ON i.project_id = p.project_id

ORDER BY i.invoice_date DESC; 

-- Monthly Revenue
SELECT

    TO_CHAR(invoice_date,'YYYY-MM') AS invoice_month,

    COUNT(*) AS invoices,

    ROUND(SUM(total_amount),2) AS total_revenue,

    ROUND(AVG(total_amount),2) AS average_invoice

FROM invoices

GROUP BY

    TO_CHAR(invoice_date,'YYYY-MM')

ORDER BY invoice_month;

-- Client Revenue
SELECT

    c.client_name,

    COUNT(i.invoice_id) AS invoices,

    ROUND(SUM(i.total_amount),2) AS total_revenue,

    ROUND(AVG(i.total_amount),2) AS average_invoice

FROM clients c

LEFT JOIN invoices i

ON c.client_id = i.client_id

GROUP BY c.client_name

ORDER BY total_revenue DESC NULLS LAST;

-- Payment Summary
SELECT

    p.payment_reference,

    pm.method_name,

    p.payment_date,

    ROUND(p.payment_amount,2) AS payment_amount,

    p.transaction_reference

FROM payments p

JOIN payment_methods pm

ON p.payment_method_id = pm.payment_method_id

ORDER BY p.payment_date DESC;

-- Monthly Payment Collection
SELECT

    TO_CHAR(payment_date,'YYYY-MM') AS payment_month,

    COUNT(*) AS payments,

    ROUND(SUM(payment_amount),2) AS total_collection,

    ROUND(AVG(payment_amount),2) AS average_payment

FROM payments

GROUP BY

    TO_CHAR(payment_date,'YYYY-MM')

ORDER BY payment_month;

-- Outstanding Invoices
SELECT

    invoice_number,

    invoice_date,

    due_date,

    total_amount,

    paid_amount,

    outstanding_amount,

    status

FROM invoices

WHERE outstanding_amount > 0

ORDER BY outstanding_amount DESC;

-- Payment Method Analysis
SELECT

    pm.method_name,

    COUNT(p.payment_id) AS total_payments,

    ROUND(SUM(p.payment_amount),2) AS collected_amount,

    ROUND(AVG(p.payment_amount),2) AS average_payment

FROM payment_methods pm

LEFT JOIN payments p

ON pm.payment_method_id = p.payment_method_id

GROUP BY pm.method_name

ORDER BY collected_amount DESC NULLS LAST;

-- Project Financial Summary
SELECT

    pr.project_code,

    pr.project_name,

    ROUND(COALESCE(SUM(i.total_amount),0),2) AS invoiced_amount,

    ROUND(COALESCE(SUM(i.paid_amount),0),2) AS received_amount,

    ROUND(COALESCE(SUM(i.outstanding_amount),0),2) AS outstanding_amount

FROM projects pr

LEFT JOIN invoices i

ON pr.project_id = i.project_id

GROUP BY

    pr.project_code,

    pr.project_name

ORDER BY invoiced_amount DESC;

