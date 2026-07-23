-- Insert Countries
INSERT INTO countries (country_code, country_name)
VALUES
('SAU','Saudi Arabia'),
('PAK','Pakistan'),
('IND','India'),
('EGY','Egypt'),
('PHL','Philippines'),
('JOR','Jordan'),
('USA','United States'),
('GBR','United Kingdom'),
('ARE','United Arab Emirates'),
('TUR','Turkey'); 

-- View Countries
SELECT *
FROM countries;

-- Insert Cities
INSERT INTO cities
(country_id, city_name, region)
VALUES
(1,'Jeddah','Makkah'),
(1,'Riyadh','Riyadh'),
(1,'Dammam','Eastern Province'),
(1,'Madinah','Madinah'),
(1,'Makkah','Makkah'),
(1,'NEOM','Tabuk'),
(2,'Islamabad','Islamabad'),
(2,'Lahore','Punjab'),
(2,'Karachi','Sindh'),
(3,'Mumbai','Maharashtra'),
(4,'Cairo','Cairo'),
(5,'Manila','Metro Manila');

-- View Cities
SELECT *
FROM cities;

-- Insert Project Statuses
INSERT INTO project_statuses
(status_name, description, display_order)
VALUES
('Planning','Project planning stage',1),
('Tendering','Tender process',2),
('Approved','Approved to start',3),
('In Progress','Construction in progress',4),
('On Hold','Temporarily suspended',5),
('Completed','Successfully completed',6),
('Cancelled','Cancelled project',7);

-- View Project Statuses
SELECT *
FROM project_statuses;

-- Insert Material Categories
INSERT INTO material_categories
(category_name, description)
VALUES
('Concrete','Concrete products'),
('Steel','Steel products'),
('Electrical','Electrical materials'),
('Plumbing','Plumbing materials'),
('Finishing','Finishing materials'),
('Paint','Paint materials'),
('HVAC','Heating and cooling materials'),
('Safety','Safety equipment');

-- View Material Categories
SELECT *
FROM material_categories;

-- Insert Equipment Categories
INSERT INTO equipment_categories
(category_name, description)
VALUES
('Heavy Machinery','Construction machinery'),
('Vehicles','Transportation vehicles'),
('Power Tools','Electric tools'),
('Lifting Equipment','Cranes and hoists'),
('Survey Equipment','Surveying devices'),
('Safety Equipment','Construction safety equipment');

-- View Equipment Categories
SELECT *
FROM equipment_categories;

-- Insert Payment Methods
INSERT INTO payment_methods
(method_name, description)
VALUES
('Bank Transfer','Electronic bank transfer'),
('Cheque','Cheque payment'),
('Cash','Cash payment'),
('Credit Card','Credit card payment'),
('Online Payment','Online banking payment');

-- View Payment Methods
SELECT *
FROM payment_methods;

-- Insert Contract Types
INSERT INTO contract_types
(contract_type_name, description)
VALUES
('Fixed Price','Fixed contract value'),
('Unit Price','Payment per unit'),
('Cost Plus','Cost plus profit'),
('Time and Material','Hourly billing'),
('Design Build','Complete turnkey contract');

-- View Contract Types
SELECT *
FROM contract_types; 

