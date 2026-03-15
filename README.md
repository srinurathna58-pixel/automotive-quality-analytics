**Automotive Manufacturing Analytics Dashboard**
**Project Overview**

This project analyzes automotive manufacturing operations using production, quality, and warranty data to identify inefficiencies, defect patterns, and cost drivers.

The objective of this analysis is to provide insights into:

Production performance

Manufacturing quality issues

Supplier defect contribution

Warranty claims and repair costs

The analysis is implemented using SQL-based data modeling and interactive dashboards in Microsoft Power BI.

**Business Problem**

Automotive manufacturers must continuously monitor operational performance across production plants and suppliers to maintain efficiency, reduce defects, and minimize warranty costs.

Key challenges addressed in this project include:

Identifying plants with high downtime or scrap generation

Detecting parts and suppliers contributing to defects

Understanding defect severity and rework costs

Analyzing warranty claim trends and repair costs across regions

Monitoring vehicle models with higher failure rates

The dashboard enables data-driven decision making for manufacturing quality and reliability improvement.

**Dataset Description**

The project uses simulated automotive manufacturing data consisting of three operational domains.

**Production Data**

Contains manufacturing output information.

Columns include:

production_date

vehicle_model

plant

planned_production

actual_production

scrap_units

rework_units

downtime_minutes

**Quality Inspection Data**

Contains defect and inspection results.

Columns include:

inspection_date

vehicle_model

plant

supplier

part_name

defect_type

inspection_method

failure_mode

defect_count

severity_score

**Warranty Claims Data**

Contains field failure and repair information.

Columns include:

claim_date

vehicle_model

plant

supplier

part_name

failure_mode

claim_count

repair_cost

vehicle_age_months

region

**Data Model**

A star schema data warehouse model was implemented to support analytical queries and dashboard reporting.

**Fact Tables**

production_fact
quality_fact
warranty_fact

These tables store quantitative metrics used for analysis.

**Dimension Tables**

date_dimension
vehicle_dimension
plant_dimension
dim_part
dim_defect
dim_inspection
dim_region

Dimension tables provide descriptive attributes used for filtering and grouping.

**Star Schema Architecture**

Fact tables are connected to multiple dimension tables to enable efficient analytical queries.

Example relationships:

production_fact
→ vehicle_dimension
→ plant_dimension
→ date_dimension

quality_fact
→ dim_part
→ dim_defect
→ dim_inspection
→ plant_dimension

warranty_fact
→ dim_region
→ dim_part
→ dim_defect

This structure enables flexible slicing of data across vehicle models, suppliers, plants, and regions.

**Data Processing Workflow**

Data preparation and transformation were performed using SQL.

Steps include:

Raw datasets loaded into PostgreSQL tables

Dimension tables created to normalize descriptive attributes

Fact tables populated with aggregated metrics

SQL views created for analytical queries

Views imported into Power BI for dashboard development

**Analytical Views**

To simplify reporting, analytical views were created.

**Quality Analysis View**

Combines defect metrics with production context.

Includes:

total_defects

defect_rate

severity_score

rework_cost

supplier

part_name

vehicle_model

plant

**Warranty Analysis View**

Aggregates warranty claims and repair cost data.

Includes:

total_claims

warranty_rate

total_repair_cost

vehicle_age_months

region

vehicle_model

**Production Summary View**

Provides aggregated production metrics.

Includes:

planned_production

actual_production

scrap_units

rework_units

downtime_minutes

production_rate

**Dashboard Features**

Interactive dashboards were developed in Power BI to analyze operational performance.

Production Performance Dashboard

**Key metrics:**

Total Production

Scrap Units

Rework Units

Downtime

Production Rate

Visualizations include:

Planned vs Actual Production Trend

Scrap Units by Plant

Downtime by Plant

Production by Vehicle Model

**Manufacturing Quality Analysis**

Key metrics:

Total Defects

Defect Rate

Rework Cost

Severity Score

Visualizations include:

Top Defect Categories

Defects by Part and Supplier

Quarterly Defect Trends

Severity Contribution by Component

**Warranty Analysis Dashboard**

Key metrics:

Total Claims

Warranty Rate

Total Repair Cost

Visualizations include:

Claims by Region

Repair Cost by Vehicle Model

Monthly Warranty Trend

Warranty Cost Distribution

**Key Insights**

Production Analysis

Plant-C recorded the highest downtime, indicating potential production efficiency issues.

Scrap generation is highest in Plant-A, suggesting process quality improvements are needed.

Quality Analysis

Fender Cladding and Rear Bumper components show the highest defect counts.

Supplier-Gamma and Supplier-Beta contribute significantly to defect occurrences.

Warranty Analysis

Offroad-A vehicle platform generates the highest repair cost.

Northern region shows the highest number of warranty claims.

These insights can help manufacturers prioritize process improvements and supplier quality management.

**Tools and Technologies**

Database
PostgreSQL

Query Language
SQL

Data Modeling
Star Schema Data Warehouse Design

Visualization
Power BI

Data Analysis
DAX Measures and SQL Aggregations

**Repository Structure**

automotive-manufacturing-analytics

datasets
raw_data_files

sql
schema.sql
dimension_tables.sql
fact_tables.sql
analytics_views.sql

powerbi
automotive_dashboard.pbix

report
Automotive_Analytics_Project.pdf

README.md

**Skills Demonstrated**

SQL Data Modeling
Star Schema Design
Fact and Dimension Tables
Data Cleaning and Transformation
Analytical SQL Queries
Power BI Dashboard Development
KPI Development
Manufacturing Analytics

**Future Improvements**

Potential extensions for this project include:

Predictive maintenance analysis

Warranty failure prediction using machine learning

Supplier defect risk scoring

Real-time production monitoring

