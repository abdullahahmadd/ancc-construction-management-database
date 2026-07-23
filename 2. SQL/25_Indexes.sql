-- Employee Indexes
CREATE INDEX idx_employees_employee_code
ON employees(employee_code);

CREATE INDEX idx_employees_department
ON employees(department_id);

CREATE INDEX idx_employees_branch
ON employees(branch_id);

CREATE INDEX idx_employees_manager
ON employees(manager_id);

CREATE INDEX idx_employees_status
ON employees(employment_status);

CREATE INDEX idx_employees_active
ON employees(is_active);

-- Project Indexes
CREATE INDEX idx_projects_client
ON projects(client_id);

CREATE INDEX idx_projects_manager
ON projects(project_manager_id);

CREATE INDEX idx_projects_status
ON projects(project_status_id);

CREATE INDEX idx_projects_branch
ON projects(branch_id);

CREATE INDEX idx_projects_active
ON projects(is_active);

CREATE INDEX idx_projects_start_date
ON projects(start_date);

-- Purchase Order Indexes
CREATE INDEX idx_purchase_orders_supplier
ON purchase_orders(supplier_id);

CREATE INDEX idx_purchase_orders_project
ON purchase_orders(project_id);

CREATE INDEX idx_purchase_orders_ordered_by
ON purchase_orders(ordered_by);

CREATE INDEX idx_purchase_orders_status
ON purchase_orders(status);

CREATE INDEX idx_purchase_orders_order_date
ON purchase_orders(order_date);

-- Purchase Order Item Indexes
CREATE INDEX idx_purchase_order_items_po
ON purchase_order_items(purchase_order_id);

CREATE INDEX idx_purchase_order_items_material
ON purchase_order_items(material_id);

-- Invoice Indexes
CREATE INDEX idx_invoices_client
ON invoices(client_id);

CREATE INDEX idx_invoices_project
ON invoices(project_id);

CREATE INDEX idx_invoices_contract
ON invoices(contract_id);

CREATE INDEX idx_invoices_status
ON invoices(status);

CREATE INDEX idx_invoices_date
ON invoices(invoice_date);

-- Payment Indexes
CREATE INDEX idx_payments_invoice
ON payments(invoice_id);

CREATE INDEX idx_payments_method
ON payments(payment_method_id);

CREATE INDEX idx_payments_date
ON payments(payment_date);

-- Inventory Indexes
CREATE INDEX idx_inventory_material
ON inventory(material_id);

CREATE INDEX idx_inventory_warehouse
ON inventory(warehouse_id);

CREATE INDEX idx_inventory_stock_update
ON inventory(last_stock_update);

-- Timesheet Indexes
CREATE INDEX idx_timesheets_employee
ON timesheets(employee_id);

CREATE INDEX idx_timesheets_project
ON timesheets(project_id);

CREATE INDEX idx_timesheets_work_date
ON timesheets(work_date);

-- Audit Log Indexes
CREATE INDEX idx_audit_logs_table
ON audit_logs(table_name);

CREATE INDEX idx_audit_logs_record
ON audit_logs(record_id);

CREATE INDEX idx_audit_logs_timestamp
ON audit_logs(action_timestamp);

CREATE INDEX idx_audit_logs_user
ON audit_logs(user_id);

-- Composite Indexes
CREATE INDEX idx_projects_status_active
ON projects(project_status_id, is_active);

CREATE INDEX idx_purchase_orders_supplier_status
ON purchase_orders(supplier_id, status);

CREATE INDEX idx_invoices_client_status
ON invoices(client_id, status);

CREATE INDEX idx_inventory_warehouse_material
ON inventory(warehouse_id, material_id);

CREATE INDEX idx_timesheets_employee_project
ON timesheets(employee_id, project_id);

