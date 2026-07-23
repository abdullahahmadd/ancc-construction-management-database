# 🏗️ Al Noor Contracting Co. Construction Project Management & Procurement Database

![Visitors](https://visitor-badge.laobi.icu/badge?page_id=abdullahahmad.ancc-construction-management-database)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-17-blue?logo=postgresql)
![SQL](https://img.shields.io/badge/SQL--success)

---

## Table of Contents

- [Overview](#overview)
- [Business Problem](#business-problem)
- [Stakeholders](#stakeholders)
- [Dataset Description](#dataset-description)
- [Tools & Technologies Used](#tools--technologies-used)
- [Skills Demonstrated](#skills-demonstrated)
- [Key Metrics / KPIs](#key-metrics--kpis)
- [Project Workflow](#project-workflow)
- [Results](#results)
- [Key Insights & Business Recommendations](#key-insights--business-recommendations)
- [Challenges & Solutions](#challenges--solutions)
- [Project Learnings](#project-learnings)
- [Installation Guide](#installation-guide)
- [Author](#author)

---

# Overview

The **Al Noor Contracting Co. Construction Project Management & Procurement Database** is a comprehensive PostgreSQL database project that simulates the operations of a modern construction company. The project models the complete lifecycle of construction projects, including organizational management, procurement, human resources, finance, inventory, contracts, project execution, reporting, and system administration.

Designed using real-world business scenarios, the database demonstrates enterprise-level relational database design, advanced SQL programming, automation, reporting, and performance optimization. It integrates multiple business modules into a centralized system capable of supporting daily operational and management activities.

This project showcases practical implementation of PostgreSQL features including views, user-defined functions, stored procedures, triggers, indexing strategies, materialized views, advanced SQL queries, and business reporting.

---

# Business Problem

Construction companies manage large volumes of interconnected business data across departments such as project management, procurement, finance, inventory, and human resources. When this information is stored in disconnected systems or spreadsheets, organizations face challenges including:

- Data redundancy and inconsistency
- Inefficient procurement tracking
- Limited project visibility
- Poor inventory management
- Delayed financial reporting
- Manual attendance and workforce monitoring
- Difficulty generating executive reports
- Lack of centralized business information

To address these challenges, this project develops a centralized PostgreSQL database that integrates multiple operational modules into a single enterprise database solution.

---

# Stakeholders

This database is designed to support the daily operations and decision-making needs of multiple stakeholders across the organization.

| Stakeholder | Responsibilities |
|-------------|------------------|
| Executive Management | Monitor business performance and strategic reporting |
| Project Managers | Track project progress, budgets, contracts, and timelines |
| Procurement Department | Manage suppliers, purchase orders, and material procurement |
| Finance Department | Process invoices, payments, contracts, and financial reporting |
| Human Resources | Manage employee records, attendance, and workforce information |
| Warehouse Managers | Monitor inventory levels and warehouse operations |
| Site Engineers | Track project sites, equipment assignments, and material availability |
| System Administrators | Manage user accounts, audit logs, database security, and maintenance |

---

# Dataset Description

The project uses a realistic, business-oriented dataset representing the operations of a construction company. Data was generated to simulate enterprise-scale business activities across multiple departments.

### Database Modules

- Organization Structure
- Branch Management
- Departments
- Job Positions
- Employee Management
- User & Role Management
- Client Management
- Supplier Management
- Material Management
- Warehouse Management
- Equipment Management
- Inventory Management
- Project Management
- Project Sites
- Purchase Orders
- Purchase Order Items
- Contracts
- Invoices
- Payments
- Attendance
- Timesheets
- Equipment Assignments
- Audit Logs

### Approximate Data Volume

| Module | Records |
|---------|---------:|
| Employees | 50 |
| Projects | 25 |
| Project Sites | 60 |
| Purchase Orders | 500 |
| Purchase Order Items | 2,500 |
| Contracts | 25 |
| Invoices | 500 |
| Payments | 1,000 |
| Attendance | 18,000+ |
| Timesheets | 100,000 |
| Audit Logs | 350,000 |
| Inventory Records | 32 |
| Clients | 5 |
| Suppliers | 5 |
| Warehouses | 4 |

The database contains over **470,000+ business records**, providing a realistic environment for SQL development, reporting, and performance optimization.

---

# Tools & Technologies Used

## Database

- PostgreSQL 17
- pgAdmin 4

## SQL Features

- DDL
- DML
- DCL
- TCL

## Database Programming

- Views
- Materialized Views
- User-Defined Functions
- Stored Procedures
- Triggers

## Advanced SQL

- Common Table Expressions (CTEs)
- Window Functions
- Ranking Functions
- Aggregate Functions
- CASE Expressions
- JSON Functions
- Date & Time Functions
- String Functions
- Recursive Queries
- Subqueries

## Performance Optimization

- Indexes
- Query Optimization
- EXPLAIN ANALYZE
- Execution Plan Analysis

## Documentation

- Draw.io (ERD)
- Microsoft Word

---

# Skills Demonstrated

### Database Design

- Relational Database Design
- Entity Relationship Modeling
- Normalization
- Primary & Foreign Keys
- Constraints

### SQL Development

- Table Creation
- Data Manipulation
- Complex Joins
- Subqueries
- Aggregate Queries
- Advanced SQL Techniques

### PostgreSQL Programming

- Views
- Materialized Views
- Functions
- Procedures
- Triggers

### Database Administration

- Backup & Restore
- Performance Tuning
- Index Management
- Schema Verification

### Business Intelligence

- Executive Reporting
- Financial Reporting
- HR Reporting
- Project Reporting
- Inventory Reporting

### Business Domains

- Construction Project Management
- Procurement
- Human Resources
- Finance
- Inventory Management
- Contract Management

---

# Key Metrics / KPIs

The database supports business reporting through various operational and executive KPIs.

### Project KPIs

- Total Projects
- Active Projects
- Completed Projects
- Project Completion Percentage
- Budget Utilization
- Project Cost Variance

### Procurement KPIs

- Purchase Orders by Status
- Supplier Performance
- Procurement Spend
- Material Purchase Trends

### Financial KPIs

- Total Revenue
- Outstanding Invoices
- Payment Collection Rate
- VAT Summary
- Contract Value

### Human Resources KPIs

- Total Employees
- Attendance Rate
- Overtime Hours
- Employee Distribution
- Department Headcount

### Inventory KPIs

- Current Stock Levels
- Low Stock Materials
- Warehouse Capacity
- Material Reorder Analysis

### Executive KPIs

- Company Performance Summary
- Branch Performance
- Project Portfolio Overview
- Financial Performance Dashboard

---

# Project Workflow

The development of the **Al Noor Contracting Co. Construction Project Management & Procurement Database** followed a structured database development lifecycle, beginning with business analysis and ending with enterprise reporting and database administration.

---

## Phase 1: Business Requirements Analysis

The project began by analyzing the daily operations of a construction company to understand how different departments interact and what data they generate. The objective was to design a centralized database capable of supporting business operations across multiple functional areas.

### Business Modules Identified

- Organization Management
- Human Resources
- Project Management
- Procurement
- Finance
- Inventory & Warehousing
- Equipment Management
- User & Security Management
- Reporting & Analytics

These modules formed the foundation of the database design.

---

## Phase 2: Database Planning & Design

After defining the business requirements, the database structure was planned using relational database design principles.

Key activities included:

- Identifying business entities
- Defining relationships
- Establishing primary keys
- Creating foreign key relationships
- Applying normalization techniques
- Defining business rules and constraints

This planning phase ensured data consistency, integrity, and scalability.

---

## Phase 3: Entity Relationship Diagram (ERD)

A comprehensive Entity Relationship Diagram (ERD) was created to visualize the relationships between business entities.

The ERD models core operational areas including:

- Branches
- Departments
- Employees
- Clients
- Suppliers
- Projects
- Warehouses
- Materials
- Equipment
- Purchase Orders
- Contracts
- Invoices
- Payments
- Inventory
- Attendance
- Timesheets
- Audit Logs

The ERD served as the blueprint for database implementation.

---

## Phase 4: Database Initialization

The PostgreSQL environment was prepared before creating database objects.

Initialization activities included:

- Verifying the active database
- Confirming the active schema
- Installing required PostgreSQL extensions
- Configuring database metadata
- Validating PostgreSQL server information

This ensured the environment was correctly configured before development.

---

## Phase 5: Schema Development

The database schema was implemented by creating all business tables with appropriate constraints and relationships.

Schema development included:

- Table creation
- Primary keys
- Foreign keys
- Unique constraints
- Check constraints
- Default values
- Identity columns
- Index creation

The schema was then validated using PostgreSQL system catalogs.

---

## Phase 6: Master Data Population

Reference tables were populated with static business data required throughout the system.

Master data included:

- Countries
- Cities
- Project Statuses
- Material Categories
- Equipment Categories
- Payment Methods
- Contract Types

This data establishes standardized values used by transactional modules.

---

## Phase 7: Core Business Data Generation

Core organizational data was populated to simulate a realistic construction company environment.

Business entities created include:

- Branches
- Departments
- Job Positions
- Roles
- Clients
- Suppliers
- Materials
- Warehouses
- Equipment
- Employees
- Projects
- Project Sites
- Inventory

Employee and project records were generated using PostgreSQL's `generate_series()` function combined with randomized business logic to create realistic enterprise-scale datasets.

---

## Phase 8: Procurement Transactions

The procurement module simulates purchasing operations commonly performed by construction companies.

The workflow includes:

Supplier Selection

↓

Purchase Order Creation

↓

Purchase Order Items

↓

VAT Calculation

↓

Discount Calculation

↓

Order Status Tracking

↓

Material Procurement

Each purchase order contains multiple line items with automatically calculated totals, VAT, discounts, and received quantities.

---

## Phase 9: Project Financial Operations

Financial operations were modeled to simulate contract execution and project billing.

This phase includes:

- Contract Management
- Invoice Generation
- Payment Processing
- Outstanding Balance Calculation
- Equipment Assignment Tracking

Business rules were applied to calculate:

- Contract values
- VAT
- Paid amounts
- Outstanding balances
- Payment statuses

---

## Phase 10: Workforce & System Operations

Operational data was generated for internal workforce management.

Modules include:

### User Management

- User Accounts
- Roles
- Login Information

### Human Resources

- Employee Attendance
- Timesheets
- Overtime Records

### System Administration

- Audit Logs
- User Activity
- Login History
- Database Operations

More than **350,000 audit records** were generated to simulate enterprise monitoring.

---

## Phase 11: Database Views

Business-specific views were created to simplify data retrieval and improve reporting.

Views were organized into functional modules:

- HR Views
- Project Views
- Procurement Views
- Finance Views
- Inventory Views

These views provide reusable datasets for reporting and analysis.

---

## Phase 12: User-Defined Functions

Reusable PostgreSQL functions were developed to encapsulate business logic.

Functions perform tasks such as:

- Business calculations
- Employee analytics
- Procurement summaries
- Financial calculations
- Reporting utilities

Using functions reduces code duplication and improves maintainability.

---

## Phase 13: Stored Procedures

Stored procedures automate common business operations.

Examples include:

- HR procedures
- Procurement procedures
- Finance procedures
- Project procedures

These procedures centralize business processes and improve consistency.

---

## Phase 14: Database Triggers

Triggers automate important database events and enforce business rules.

Implemented triggers support:

- Audit logging
- Timestamp updates
- Inventory updates
- Business validation
- Data consistency

This reduces manual intervention and maintains data integrity.

---

## Phase 15: Performance Optimization

Database performance was improved using PostgreSQL optimization techniques.

Optimization methods include:

- Index creation
- Query optimization
- Execution plan analysis
- Performance testing
- Optimized joins

Indexes were created on frequently queried columns to improve response time.

---

## Phase 16: Materialized Views

Materialized views were implemented for reporting scenarios requiring high-performance data retrieval.

Benefits include:

- Faster reporting
- Reduced query execution time
- Precomputed aggregations
- Improved dashboard performance

---

## Phase 17: Advanced SQL Development

Advanced PostgreSQL features were used to solve complex business problems.

Techniques demonstrated include:

- Common Table Expressions (CTEs)
- Recursive Queries
- Window Functions
- Ranking Functions
- JSON Processing
- Aggregate Functions
- CASE Expressions
- Analytical Queries

These techniques showcase advanced SQL capabilities beyond standard CRUD operations.

---

## Phase 18: Business Reporting

A comprehensive reporting module was developed to support management decision-making.

Reports include:

### Executive Reports

- Company Overview
- Branch Performance
- Financial Summary
- Project Portfolio
- Procurement Summary

### HR Reports

- Employee Summary
- Attendance Analysis
- Department Statistics

### Project Reports

- Project Progress
- Budget Monitoring
- Project Completion

### Finance Reports

- Revenue Analysis
- Outstanding Invoices
- Payment Summary

### Inventory Reports

- Current Stock
- Low Inventory Alerts
- Warehouse Summary

These reports transform operational data into actionable business insights.

---

## Phase 19: Database Backup & Recovery

Backup and recovery procedures were prepared to support database maintenance and disaster recovery.

Activities include:

- Database backup
- Schema backup
- Data restoration
- Verification procedures

This ensures business continuity and data protection.

---

## Phase 20: Documentation & Portfolio Preparation

The final phase focused on documenting the project for professional presentation.

Deliverables include:

- Project Design Documentation
- SQL Scripts
- ERD
- Screenshots
- GitHub Repository
- README Documentation

This documentation provides a complete overview of the project and demonstrates practical PostgreSQL database development skills.

---

# Results

The following screenshots demonstrate the implementation of the database across different functional modules, showcasing enterprise database design, SQL development, reporting, and PostgreSQL features.

---

### 1. Project Overview

---

![Project Overview](3.%20Screenshots/01_Project_Overview.png)

---

Shows the PostgreSQL environment, active database, schema information, and server version used throughout the project.

---

### 2. Entity Relationship Diagram (ERD)

---

![Entity Relationship Diagram](3.%20Screenshots/02_Entity_Relationship_Diagram.png)

---

The ERD illustrates the complete relational database structure, including entities, primary keys, foreign keys, and relationships between business modules.

---

### 3. Database Tables

---

![Database Tables](3.%20Screenshots/03a_Database_Tables.png)

---

The database schema contains multiple interconnected tables representing organizational structure, projects, procurement, finance, inventory, and human resources.

---

![Database Tables](3.%20Screenshots/03b_Database_Tables.png)

---

Verification of database objects confirms successful schema creation and organization.

---

### 4. Master Data

---

![Master Data](3.%20Screenshots/04a_Master_Data.png)

---

Reference data including countries, cities, project statuses, and lookup tables supporting business operations.

---

![Master Data](3.%20Screenshots/04b_Master_Data.png)

---

Material categories, equipment categories, payment methods, and contract types used across transactional modules.

---

![Master Data](3.%20Screenshots/04c_Master_Data.png)

---

Business lookup information ensuring standardized values throughout the system.

---

![Master Data](3.%20Screenshots/04d_Master_Data.png)

---

Validation of master data records after successful population.

---

# 5. Core Business Data

---

![Core Business Data](Screenshots/05a_Core_Business_Data.png)

---

Organizational structure including branches, departments, and job positions.

---

![Core Business Data](Screenshots/05b_Core_Business_Data.png)

---

Clients, suppliers, materials, warehouses, and equipment supporting construction operations.

---

![Core Business Data](Screenshots/05c_Core_Business_Data.png)

---

Employee records generated using PostgreSQL functions to simulate a realistic workforce.

---

![Core Business Data](Screenshots/05d_Core_Business_Data.png)

---

Projects, project sites, and inventory records representing ongoing construction activities.

---

![Core Business Data](Screenshots/05e_Core_Business_Data.png)

---

Business entities integrated through relational database design.

---

# 6. Database Views

---

![HR Views](Screenshots/06a_HR_Views.png)

---

HR views simplify employee, attendance, and workforce reporting.

---

![Project Views](Screenshots/06b_Project_Views.png)

---

Project views consolidate project information for operational reporting.

---

![Procurement Views](Screenshots/06c_Procurement_Views.png)

---

Procurement views summarize suppliers, purchase orders, and procurement activities.

---

![Finance & Inventory Views](Screenshots/06d_Finance_Inventory_Views.png)

---

Finance and inventory views provide reusable datasets for business reporting.

---

# 7. PostgreSQL Functions

---

![Functions](Screenshots/07_PostgreSQL_Functions.png)

---

User-defined functions encapsulate reusable business logic and analytical calculations.

---

# 8. Stored Procedures

---

![Stored Procedures](Screenshots/08_Stored_Procedures.png)

---

Stored procedures automate operational workflows across HR, procurement, projects, and finance.

---

# 9. Database Triggers

---

![Triggers](Screenshots/09_Database_Triggers.png)

---

Database triggers automate business rules, maintain audit trails, and ensure data integrity.

---

# 10. Performance Optimization

---

![Performance Optimization](Screenshots/10_Performance_Optimization.png)

---

Indexes and execution plan analysis improve query performance and optimize database operations.

---

# 11. Advanced SQL

---

![Advanced SQL - CTE](Screenshots/11a_Advanced_SQL_CTE.png)

---

Common Table Expressions (CTEs) simplify complex business queries.

---

![Advanced SQL - Window Functions](Screenshots/11b_Advanced_SQL_Window_Functions.png)

---

Window functions perform analytical calculations without additional aggregation.

---

![Advanced SQL - Ranking](Screenshots/11c_Advanced_SQL_Ranking.png)

---

Ranking functions support comparative analysis and business reporting.

---

![Advanced SQL - JSON](Screenshots/11d_Advanced_SQL_JSON.png)

---

JSON processing demonstrates PostgreSQL's capability to manage semi-structured data.

---

# 12. Executive Reports

---

![Executive Report](Screenshots/12a_Executive_Report.png)

---

Executive dashboard summarizing company performance and business operations.

---

![Executive Report](Screenshots/12b_Executive_Report.png)

---

Business performance indicators supporting strategic decision-making.

---

![Executive Report](Screenshots/12c_Executive_Report.png)

---

Project portfolio and operational performance analysis.

---

![Executive Report](Screenshots/12d_Executive_Report.png)

---

Financial overview supporting executive reporting.

---

![Executive Report](Screenshots/12e_Executive_Report.png)

---

Company-wide operational metrics and KPIs.

---

![Executive Report](Screenshots/12f_Executive_Report.png)

---

Executive insights generated from integrated enterprise data.

---

# 13. HR Reports

---

![HR Report](Screenshots/13a_HR_Report.png)

---

Employee workforce analysis and attendance reporting.

---

![HR Report](Screenshots/13b_HR_Report.png)

---

Department-level employee statistics.

---

![HR Report](Screenshots/13c_HR_Report.png)

---

HR operational reporting supporting workforce management.

---

# 14. Project Reports

---

![Project Report](Screenshots/14a_Project_Report.png)

---

Project progress, budgets, and completion tracking.

---

![Project Report](Screenshots/14b_Project_Report.png)

---

Project performance analysis supporting project management.

---

# 15. Finance Reports

---

![Finance Report](Screenshots/15a_Finance_Report.png)

---

Financial summaries including invoices, contracts, and payments.

---

![Finance Report](Screenshots/15b_Finance_Report.png)

---

Revenue and payment analysis.

---

![Finance Report](Screenshots/15c_Finance_Report.png)

---

Financial reporting supporting business decision-making.

---

# 16. Inventory Reports

---

![Inventory Report](Screenshots/16a_Inventory_Report.png)

---

Inventory availability and warehouse stock levels.

---

![Inventory Report](Screenshots/16b_Inventory_Report.png)

---

Material movement and stock monitoring.

---

![Inventory Report](Screenshots/16c_Inventory_Report.png)

---

Inventory insights supporting procurement and warehouse operations.

---

# Results

The following screenshots demonstrate the implementation of the database across different functional modules, showcasing enterprise database design, SQL development, reporting, and PostgreSQL features.

---

# 1. Project Overview

---

![Project Overview](Screenshots/01_Project_Overview.png)

---

Shows the PostgreSQL environment, active database, schema information, and server version used throughout the project.

---

# 2. Entity Relationship Diagram (ERD)

---

![Entity Relationship Diagram](Screenshots/02_Entity_Relationship_Diagram.png)

---

The ERD illustrates the complete relational database structure, including entities, primary keys, foreign keys, and relationships between business modules.

---

# 3. Database Tables

---

![Database Tables](Screenshots/03a_Database_Tables.png)

---

The database schema contains multiple interconnected tables representing organizational structure, projects, procurement, finance, inventory, and human resources.

---

![Database Tables](Screenshots/03b_Database_Tables.png)

---

Verification of database objects confirms successful schema creation and organization.

---

# 4. Master Data

---

![Master Data](Screenshots/04a_Master_Data.png)

---

Reference data including countries, cities, project statuses, and lookup tables supporting business operations.

---

![Master Data](Screenshots/04b_Master_Data.png)

---

Material categories, equipment categories, payment methods, and contract types used across transactional modules.

---

![Master Data](Screenshots/04c_Master_Data.png)

---

Business lookup information ensuring standardized values throughout the system.

---

![Master Data](Screenshots/04d_Master_Data.png)

---

Validation of master data records after successful population.

---

# 5. Core Business Data

---

![Core Business Data](Screenshots/05a_Core_Business_Data.png)

---

Organizational structure including branches, departments, and job positions.

---

![Core Business Data](Screenshots/05b_Core_Business_Data.png)

---

Clients, suppliers, materials, warehouses, and equipment supporting construction operations.

---

![Core Business Data](Screenshots/05c_Core_Business_Data.png)

---

Employee records generated using PostgreSQL functions to simulate a realistic workforce.

---

![Core Business Data](Screenshots/05d_Core_Business_Data.png)

---

Projects, project sites, and inventory records representing ongoing construction activities.

---

![Core Business Data](Screenshots/05e_Core_Business_Data.png)

---

Business entities integrated through relational database design.

---

# 6. Database Views

---

![HR Views](Screenshots/06a_HR_Views.png)

---

HR views simplify employee, attendance, and workforce reporting.

---

![Project Views](Screenshots/06b_Project_Views.png)

---

Project views consolidate project information for operational reporting.

---

![Procurement Views](Screenshots/06c_Procurement_Views.png)

---

Procurement views summarize suppliers, purchase orders, and procurement activities.

---

![Finance & Inventory Views](Screenshots/06d_Finance_Inventory_Views.png)

---

Finance and inventory views provide reusable datasets for business reporting.

---

# 7. PostgreSQL Functions

---

![Functions](Screenshots/07_PostgreSQL_Functions.png)

---

User-defined functions encapsulate reusable business logic and analytical calculations.

---

# 8. Stored Procedures

---

![Stored Procedures](Screenshots/08_Stored_Procedures.png)

---

Stored procedures automate operational workflows across HR, procurement, projects, and finance.

---

# 9. Database Triggers

---

![Triggers](Screenshots/09_Database_Triggers.png)

---

Database triggers automate business rules, maintain audit trails, and ensure data integrity.

---

# 10. Performance Optimization

---

![Performance Optimization](Screenshots/10_Performance_Optimization.png)

---

Indexes and execution plan analysis improve query performance and optimize database operations.

---

# 11. Advanced SQL

---

![Advanced SQL - CTE](Screenshots/11a_Advanced_SQL_CTE.png)

---

Common Table Expressions (CTEs) simplify complex business queries.

---

![Advanced SQL - Window Functions](Screenshots/11b_Advanced_SQL_Window_Functions.png)

---

Window functions perform analytical calculations without additional aggregation.

---

![Advanced SQL - Ranking](Screenshots/11c_Advanced_SQL_Ranking.png)

---

Ranking functions support comparative analysis and business reporting.

---

![Advanced SQL - JSON](Screenshots/11d_Advanced_SQL_JSON.png)

---

JSON processing demonstrates PostgreSQL's capability to manage semi-structured data.

---

# 12. Executive Reports

---

![Executive Report](Screenshots/12a_Executive_Report.png)

---

Executive dashboard summarizing company performance and business operations.

---

![Executive Report](Screenshots/12b_Executive_Report.png)

---

Business performance indicators supporting strategic decision-making.

---

![Executive Report](Screenshots/12c_Executive_Report.png)

---

Project portfolio and operational performance analysis.

---

![Executive Report](Screenshots/12d_Executive_Report.png)

---

Financial overview supporting executive reporting.

---

![Executive Report](Screenshots/12e_Executive_Report.png)

---

Company-wide operational metrics and KPIs.

---

![Executive Report](Screenshots/12f_Executive_Report.png)

---

Executive insights generated from integrated enterprise data.

---

# 13. HR Reports

---

![HR Report](Screenshots/13a_HR_Report.png)

---

Employee workforce analysis and attendance reporting.

---

![HR Report](Screenshots/13b_HR_Report.png)

---

Department-level employee statistics.

---

![HR Report](Screenshots/13c_HR_Report.png)

---

HR operational reporting supporting workforce management.

---

# 14. Project Reports

---

![Project Report](Screenshots/14a_Project_Report.png)

---

Project progress, budgets, and completion tracking.

---

![Project Report](Screenshots/14b_Project_Report.png)

---

Project performance analysis supporting project management.

---

# 15. Finance Reports

---

![Finance Report](Screenshots/15a_Finance_Report.png)

---

Financial summaries including invoices, contracts, and payments.

---

![Finance Report](Screenshots/15b_Finance_Report.png)

---

Revenue and payment analysis.

---

![Finance Report](Screenshots/15c_Finance_Report.png)

---

Financial reporting supporting business decision-making.

---

# 16. Inventory Reports

---

![Inventory Report](Screenshots/16a_Inventory_Report.png)

---

Inventory availability and warehouse stock levels.

---

![Inventory Report](Screenshots/16b_Inventory_Report.png)

---

Material movement and stock monitoring.

---

![Inventory Report](Screenshots/16c_Inventory_Report.png)

---

Inventory insights supporting procurement and warehouse operations.

---

# Key Insights & Business Recommendations

The project demonstrates how a centralized PostgreSQL database can support day-to-day operations and strategic decision-making for a construction company.

## Key Insights

- A centralized relational database improves data consistency across multiple business departments.
- Integrating HR, procurement, finance, inventory, and project management enables better collaboration and operational visibility.
- Database views simplify reporting by providing reusable business datasets.
- Stored procedures and triggers automate repetitive business processes and help maintain data integrity.
- Indexing and query optimization significantly improve query performance for large datasets.
- Materialized views enhance reporting efficiency by reducing execution time for complex analytical queries.
- Executive reports provide management with real-time operational insights for informed decision-making.

## Business Recommendations

- Integrate the database with a web or ERP application for real-time transaction processing.
- Implement role-based security with fine-grained access control for different departments.
- Schedule automated database backups to improve disaster recovery readiness.
- Extend reporting capabilities with BI tools such as Power BI or Tableau.
- Add audit monitoring dashboards for enhanced security and compliance.
- Implement partitioning for high-volume transactional tables to further improve performance.

---

# Challenges & Solutions

| Challenge | Solution |
|-----------|----------|
| Designing relationships across multiple business modules | Developed a normalized relational schema with well-defined primary and foreign keys. |
| Maintaining data consistency | Applied constraints, validation rules, and triggers to enforce business logic. |
| Generating realistic business data | Used PostgreSQL `generate_series()` together with randomized business rules to simulate enterprise datasets. |
| Managing large datasets efficiently | Created indexes and optimized SQL queries using PostgreSQL performance techniques. |
| Simplifying complex SQL queries | Implemented views, Common Table Expressions (CTEs), and user-defined functions. |
| Automating repetitive business operations | Developed stored procedures and database triggers to centralize business logic. |
| Improving reporting performance | Implemented materialized views for frequently accessed analytical reports. |

---

# Project Learnings

This project strengthened both database design knowledge and practical PostgreSQL development skills.

### Technical Learnings

- Enterprise relational database design
- PostgreSQL database development
- Advanced SQL programming
- Query optimization techniques
- Index management
- Materialized views
- Stored procedures
- User-defined functions
- Database triggers
- Backup and recovery strategies

### Business Learnings

- Construction project lifecycle
- Procurement workflow
- Human resource management
- Financial operations
- Inventory management
- Business reporting
- Enterprise database architecture

### Professional Skills

- Database documentation
- Problem solving
- Business analysis
- Data modeling
- SQL debugging
- Performance tuning

---

# Installation Guide

## Prerequisites

- PostgreSQL 17 or later
- pgAdmin 4 (Recommended)

---

## Open PostgreSQL

Launch PostgreSQL and connect using pgAdmin 4 or the PostgreSQL command-line interface.

---

## Create the Database

```sql
CREATE DATABASE ancc_construction_db;
```

---

## Execute SQL Scripts

Run the SQL files in numerical order.

```text
01_Database_Initialization.sql

↓

02_Database_Schema_Verification.sql

↓

Table Creation Scripts

↓

Master Data

↓

Core Business Data

↓

Transaction Data

↓

Views

↓

Functions

↓

Procedures

↓

Triggers

↓

Indexes

↓

Performance Queries

↓

Materialized Views

↓

Advanced SQL

↓

Reports
```

---

## Verify Database Objects

Confirm that all objects have been created successfully:

- Tables
- Views
- Functions
- Procedures
- Triggers
- Materialized Views
- Reports

---

## Explore Reports

Execute the SQL scripts in the Reports module to generate:

- Executive Reports
- HR Reports
- Project Reports
- Finance Reports
- Inventory Reports

---

# Project Highlights

- Enterprise PostgreSQL Database
- Real-World Construction Business Scenario
- Fully Normalized Relational Database
- 30+ Database Tables
- 470,000+ Business Records
- Advanced SQL Techniques
- Views, Functions, Procedures & Triggers
- Performance Optimization
- Materialized Views
- Executive Business Reporting
- Complete Technical Documentation

---

# Author

**Abdullah Ahmad**

BS Software Engineering

Database Developer | Data Analyst

---

## Support

If you found this project useful or interesting, consider giving it a **Star ⭐** on GitHub. Your support helps showcase the project and encourages continued development.

---
