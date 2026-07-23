-- Insert Branches
INSERT INTO branches (
    branch_code,
    branch_name,
    city,
    region,
    address,
    phone,
    email,
    manager_name,
    opening_date
)
VALUES
('BR-001','Jeddah Head Office','Jeddah','Makkah','Prince Sultan Road, Jeddah','+966126000001','jeddah@ancc.sa','Ahmed Al-Harbi','2015-01-10'),
('BR-002','Riyadh Branch','Riyadh','Riyadh','King Fahd Road, Riyadh','+966116000002','riyadh@ancc.sa','Fahad Al-Qahtani','2016-04-15'),
('BR-003','Dammam Branch','Dammam','Eastern Province','King Saud Road, Dammam','+966136000003','dammam@ancc.sa','Mohammed Al-Otaibi','2017-06-20'),
('BR-004','Madinah Branch','Madinah','Madinah','Airport Road, Madinah','+966146000004','madinah@ancc.sa','Salem Al-Zahrani','2018-03-05'),
('BR-005','NEOM Branch','NEOM','Tabuk','NEOM Business District','+966146000005','neom@ancc.sa','Nasser Al-Dosari','2023-02-01');

-- View Branches
SELECT * FROM branches;

-- Insert Departments
INSERT INTO departments (
    department_code,
    branch_id,
    department_name,
    description,
    manager_name
)
VALUES
('DEP-001',1,'Finance','Financial operations','Ahmed Hassan'),
('DEP-002',1,'Human Resources','HR management','Sara Khan'),
('DEP-003',1,'Procurement','Purchasing department','Ali Raza'),
('DEP-004',2,'Engineering','Engineering division','Mohammed Ali'),
('DEP-005',2,'Project Management','Project execution','Faisal Ahmed'),
('DEP-006',3,'Warehouse','Inventory management','John David'),
('DEP-007',4,'Quality Assurance','QA & QC','Usman Tariq'),
('DEP-008',5,'Health & Safety','HSE Department','Omar Abdullah');

-- View Departments
SELECT * FROM departments;

-- Insert Job Positions
INSERT INTO job_positions (
    position_code,
    position_title,
    job_level,
    min_salary,
    max_salary
)
VALUES
('POS-001','General Manager','Executive',25000,50000),
('POS-002','Project Manager','Management',18000,30000),
('POS-003','Site Engineer','Professional',10000,18000),
('POS-004','Procurement Officer','Professional',7000,12000),
('POS-005','Accountant','Professional',6000,12000),
('POS-006','HR Officer','Professional',6000,10000),
('POS-007','Warehouse Supervisor','Supervisor',7000,12000),
('POS-008','Safety Officer','Professional',7000,13000),
('POS-009','Equipment Operator','Technical',4000,8000),
('POS-010','Civil Engineer','Professional',9000,18000);

-- View Job Positions
SELECT * FROM job_positions; 

-- Insert Roles
INSERT INTO roles (
    role_code,
    role_name,
    description,
    is_system_role
)
VALUES
('ROL-001','System Administrator','Full system access',TRUE),
('ROL-002','HR Manager','Human resources',TRUE),
('ROL-003','Procurement Manager','Procurement operations',TRUE),
('ROL-004','Project Manager','Project management',TRUE),
('ROL-005','Finance Officer','Finance operations',TRUE),
('ROL-006','Store Keeper','Warehouse operations',TRUE),
('ROL-007','Engineer','Engineering access',TRUE),
('ROL-008','Employee','Standard employee access',TRUE);

-- View Roles
SELECT * FROM roles;

-- Insert Clients
INSERT INTO clients (
    client_code,
    client_name,
    contact_person,
    email,
    phone,
    country_id,
    city_id,
    address,
    vat_number,
    commercial_registration,
    credit_limit
)
VALUES
('CLI-001','Saudi Binladin Group','Abdullah Al-Qahtani','contact@sbg.sa','+966112345001',1,2,'Riyadh','300000000001','1010000001',5000000),
('CLI-002','NESMA & Partners','Faisal Ahmed','info@nesma.sa','+966122345002',1,1,'Jeddah','300000000002','1010000002',3500000),
('CLI-003','Red Sea Global','Khalid Al-Harbi','projects@redsea.sa','+966142345003',1,6,'NEOM','300000000003','1010000003',8000000),
('CLI-004','Saudi Aramco','Mohammed Al-Otaibi','contracts@aramco.sa','+966132345004',1,3,'Dammam','300000000004','1010000004',10000000),
('CLI-005','Ministry of Health','Ahmed Hassan','moh@gov.sa','+966112345005',1,2,'Riyadh','300000000005','1010000005',6000000);

-- View Clients
SELECT * FROM clients;

-- Insert Suppliers
INSERT INTO suppliers (
    supplier_code,
    supplier_name,
    contact_person,
    email,
    phone,
    country_id,
    city_id,
    address,
    vat_number,
    commercial_registration,
    payment_terms,
    supplier_rating
)
VALUES
('SUP-001','Saudi Cement Company','Ahmed Ali','sales@saudicement.sa','+966132221111',1,3,'Dammam','310000000001','2050000001','30 Days',4.80),
('SUP-002','Zamil Steel','Faisal Khan','sales@zamilsteel.sa','+966132221112',1,3,'Dammam','310000000002','2050000002','30 Days',4.70),
('SUP-003','Bahra Electric','Usman Tariq','info@bahra.sa','+966126661113',1,1,'Jeddah','310000000003','2050000003','45 Days',4.50),
('SUP-004','Al Fozan Building Materials','Omar Abdullah','sales@alfozan.sa','+966112221114',1,2,'Riyadh','310000000004','2050000004','30 Days',4.60),
('SUP-005','Saudi Readymix','John David','orders@readymix.sa','+966132221115',1,3,'Dammam','310000000005','2050000005','15 Days',4.90);

-- View Suppliers
SELECT * FROM suppliers;

-- Insert Materials
INSERT INTO materials (
    material_code,
    material_name,
    material_category_id,
    unit_of_measure,
    unit_price,
    reorder_level
)
VALUES
('MAT-001','Ordinary Portland Cement',1,'Bag',18.50,500),
('MAT-002','Reinforcement Steel Bar 16mm',2,'Ton',2850.00,50),
('MAT-003','PVC Pipe 4 Inch',4,'Piece',85.00,100),
('MAT-004','Electrical Cable 4mm',3,'Roll',450.00,30),
('MAT-005','Ceramic Floor Tile',5,'Box',95.00,200),
('MAT-006','Interior Wall Paint',6,'Bucket',180.00,50),
('MAT-007','Split AC Unit 2 Ton',7,'Unit',3200.00,10),
('MAT-008','Safety Helmet',8,'Piece',45.00,100);

-- View Materials
SELECT * FROM materials;

-- Insert Warehouses
INSERT INTO warehouses (
    warehouse_code,
    warehouse_name,
    branch_id,
    city_id,
    address,
    manager_name,
    phone,
    storage_capacity
)
VALUES
('WH-001','Central Warehouse',1,1,'Jeddah Industrial Area','Ahmed Hassan','+966126001111',10000),
('WH-002','Riyadh Warehouse',2,2,'Second Industrial City','Faisal Ahmed','+966116001112',8000),
('WH-003','Dammam Warehouse',3,3,'King Abdulaziz Port','Mohammed Ali','+966136001113',9000),
('WH-004','NEOM Warehouse',5,6,'NEOM Logistics Zone','Omar Abdullah','+966146001114',12000);

-- View Warehouses
SELECT * FROM warehouses;

-- Insert Equipment
INSERT INTO equipment (
    equipment_code,
    equipment_name,
    equipment_category_id,
    serial_number,
    manufacturer,
    model,
    purchase_date,
    purchase_cost,
    current_value
)
VALUES
('EQ-001','Tower Crane',1,'TC2026001','Liebherr','550 EC-H','2023-01-10',1800000,1650000),
('EQ-002','Excavator',1,'EX2026002','Caterpillar','CAT 320','2022-08-15',850000,720000),
('EQ-003','Concrete Mixer Truck',2,'CM2026003','Mercedes','Actros','2021-05-20',650000,500000),
('EQ-004','Laser Level',5,'SL2026004','Leica','Lino L6','2024-02-18',8500,8000),
('EQ-005','Electric Drill',3,'PT2026005','Bosch','GBH 2-28','2024-06-01',1200,1100);

-- View Equipment
SELECT * FROM equipment;

-- Insert Employees
INSERT INTO employees (
    employee_code,
    employee_number,
    first_name,
    last_name,
    gender,
    date_of_birth,
    nationality_id,
    iqama_number,
    email,
    phone,
    emergency_contact,
    branch_id,
    department_id,
    job_position_id,
    manager_id,
    city_id,
    address,
    hire_date,
    basic_salary,
    allowance,
    bank_name,
    iban,
    employment_status
)
SELECT

'EMP-' || LPAD(gs::text,5,'0'),

10000 + gs,

(CASE (gs % 10)
WHEN 0 THEN 'Ahmed'
WHEN 1 THEN 'Mohammed'
WHEN 2 THEN 'Abdullah'
WHEN 3 THEN 'Ali'
WHEN 4 THEN 'Omar'
WHEN 5 THEN 'Faisal'
WHEN 6 THEN 'Khalid'
WHEN 7 THEN 'Yousef'
WHEN 8 THEN 'Hassan'
ELSE 'Ibrahim'
END),

(CASE (gs % 10)
WHEN 0 THEN 'Al-Harbi'
WHEN 1 THEN 'Khan'
WHEN 2 THEN 'Ali'
WHEN 3 THEN 'Rahman'
WHEN 4 THEN 'Ahmed'
WHEN 5 THEN 'Qureshi'
WHEN 6 THEN 'Swati'
WHEN 7 THEN 'Al-Qahtani'
WHEN 8 THEN 'David'
ELSE 'Smith'
END),

CASE
WHEN gs % 8 = 0 THEN 'Female'
ELSE 'Male'
END,

DATE '1985-01-01' + ((gs*210) % 9000),

CASE
WHEN gs % 5 = 0 THEN 2
WHEN gs % 7 = 0 THEN 3
WHEN gs % 9 = 0 THEN 4
ELSE 1
END,

'2' || LPAD((100000000 + gs)::text,9,'0'),

LOWER('emp'||gs||'@ancc.sa'),

'+9665' || LPAD((50000000 + gs)::text,8,'0'),

'+9665' || LPAD((60000000 + gs)::text,8,'0'),

((gs-1)%5)+1,

((gs-1)%8)+1,

CASE

WHEN ((gs-1)%8)+1 = 1 THEN 5
WHEN ((gs-1)%8)+1 = 2 THEN 6
WHEN ((gs-1)%8)+1 = 3 THEN 4
WHEN ((gs-1)%8)+1 = 4 THEN 10
WHEN ((gs-1)%8)+1 = 5 THEN 2
WHEN ((gs-1)%8)+1 = 6 THEN 7
WHEN ((gs-1)%8)+1 = 7 THEN 8
ELSE 9

END,

CASE
WHEN gs<=5 THEN NULL
ELSE FLOOR((RANDOM()*5)+1)::INTEGER
END,

CASE
WHEN ((gs-1)%5)+1=5 THEN 6
WHEN ((gs-1)%5)+1=4 THEN 4
WHEN ((gs-1)%5)+1=3 THEN 3
WHEN ((gs-1)%5)+1=2 THEN 2
ELSE 1
END,

'Company Accommodation '||gs,

DATE '2019-01-01' + ((gs*30) % 2200),

5000 + FLOOR(RANDOM()*15000),

1000 + FLOOR(RANDOM()*3000),

CASE (gs % 5)
WHEN 0 THEN 'SNB'
WHEN 1 THEN 'Al Rajhi Bank'
WHEN 2 THEN 'Riyad Bank'
WHEN 3 THEN 'Bank AlJazira'
ELSE 'Saudi Awwal Bank'
END,

'SA03' || LPAD((10000000000000000000 + gs)::text,20,'0'),

'Active'

FROM generate_series(1,50) gs;

-- Employee Count
SELECT COUNT(*)
FROM employees;

-- Employee List
SELECT
employee_code,
first_name,
last_name,
department_id,
job_position_id,
branch_id,
basic_salary
FROM employees
ORDER BY employee_id;

-- Insert Projects
INSERT INTO projects (
    project_code,
    project_name,
    client_id,
    branch_id,
    project_manager_id,
    project_status_id,
    project_type,
    start_date,
    expected_end_date,
    actual_end_date,
    budget,
    estimated_cost,
    actual_cost,
    completion_percentage,
    project_address,
    city_id,
    latitude,
    longitude,
    remarks
)
SELECT

'PRJ-2026-' || LPAD(gs::text,3,'0'),

CASE (gs % 10)
WHEN 0 THEN 'Commercial Office Tower'
WHEN 1 THEN 'Residential Compound'
WHEN 2 THEN 'Hospital Expansion'
WHEN 3 THEN 'University Campus'
WHEN 4 THEN 'Industrial Warehouse'
WHEN 5 THEN 'Road Infrastructure'
WHEN 6 THEN 'Shopping Mall'
WHEN 7 THEN 'Luxury Hotel'
WHEN 8 THEN 'School Construction'
ELSE 'Government Building'
END
|| ' - Phase ' || ((gs-1)%5+1),

((gs-1)%5)+1,

((gs-1)%5)+1,

FLOOR(RANDOM()*10 + 1)::INTEGER,

((gs-1)%7)+1,

CASE (gs % 5)
WHEN 0 THEN 'Commercial'
WHEN 1 THEN 'Residential'
WHEN 2 THEN 'Infrastructure'
WHEN 3 THEN 'Healthcare'
ELSE 'Government'
END,

DATE '2024-01-01' + ((gs*20) % 700),

DATE '2026-12-31' + ((gs*15) % 900),

NULL,

ROUND((20000000 + RANDOM()*180000000)::numeric,2),

ROUND((18000000 + RANDOM()*170000000)::numeric,2),

0,

FLOOR(RANDOM()*100),

'Construction Site ' || gs,

CASE
WHEN ((gs-1)%5)+1=5 THEN 6
WHEN ((gs-1)%5)+1=4 THEN 4
WHEN ((gs-1)%5)+1=3 THEN 3
WHEN ((gs-1)%5)+1=2 THEN 2
ELSE 1
END,

ROUND((21.0 + RANDOM())::numeric,6),

ROUND((39.0 + RANDOM())::numeric,6),

'Generated project'

FROM generate_series(1,25) gs;

-- Project Count
SELECT COUNT(*)
FROM projects;

-- View Projects
SELECT

project_code,
project_name,
client_id,
project_manager_id,
budget,
completion_percentage,
project_status_id

FROM projects
ORDER BY project_id;

SELECT
employee_id,
employee_code,
first_name,
last_name,
job_position_id
FROM employees
WHERE employee_id<=10;

-- Insert Project Sites
INSERT INTO project_sites (
    site_code,
    project_id,
    site_name,
    city_id,
    address,
    latitude,
    longitude,
    site_area_sq_m,
    supervisor_id,
    start_date,
    expected_completion_date,
    actual_completion_date,
    remarks
)
SELECT

'PS-' || LPAD(gs::text,4,'0'),

((gs - 1) % 25) + 1,

CASE (gs % 5)
    WHEN 0 THEN 'Main Construction Site'
    WHEN 1 THEN 'Site Office'
    WHEN 2 THEN 'Material Storage Yard'
    WHEN 3 THEN 'Utility Zone'
    ELSE 'Worker Accommodation'
END || ' ' || (((gs - 1) / 5) + 1),

CASE
    WHEN ((gs - 1) % 5) + 1 = 5 THEN 6
    WHEN ((gs - 1) % 5) + 1 = 4 THEN 4
    WHEN ((gs - 1) % 5) + 1 = 3 THEN 3
    WHEN ((gs - 1) % 5) + 1 = 2 THEN 2
    ELSE 1
END,

'Project Site Address ' || gs,

ROUND((21.000000 + RANDOM())::numeric,6),

ROUND((39.000000 + RANDOM())::numeric,6),

5000 + FLOOR(RANDOM() * 45000),

FLOOR(RANDOM() * 15 + 1)::INTEGER,

DATE '2024-01-01' + ((gs * 10) % 600),

DATE '2026-12-31' + ((gs * 15) % 800),

NULL,

'Generated project site'

FROM generate_series(1,60) gs;

-- Project Site Count
SELECT COUNT(*)
FROM project_sites;

-- View Project Sites
SELECT
    site_code,
    project_id,
    site_name,
    supervisor_id,
    site_area_sq_m
FROM project_sites
ORDER BY project_site_id;

-- Insert Inventory
INSERT INTO inventory (
    warehouse_id,
    material_id,
    quantity_on_hand,
    minimum_stock,
    maximum_stock,
    last_stock_update
)
SELECT

w.warehouse_id,

m.material_id,

FLOOR(RANDOM() * 900 + 100),

m.reorder_level,

m.reorder_level * 5,

CURRENT_DATE - FLOOR(RANDOM() * 30)::INTEGER

FROM warehouses w
CROSS JOIN materials m;

-- Inventory Count
SELECT COUNT(*)
FROM inventory;

-- View Inventory
SELECT
    warehouse_id,
    material_id,
    quantity_on_hand,
    minimum_stock,
    maximum_stock
FROM inventory
ORDER BY warehouse_id, material_id;

