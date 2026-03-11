# automotive-quality-analytics
End-to-end automotive manufacturing analytics project using SQL, data modeling, and Power BI

**Automotive Manufacturing Analytics Dashboard**
Project Overview

This project analyzes automotive production, quality defects, and warranty claims using SQL data modeling and Power BI dashboards.

The goal is to identify:

Production performance issues

Manufacturing defect trends

Supplier quality risks

Warranty cost drivers

Tech Stack

Tools used:

SQL (PostgreSQL)

Data Warehouse Modeling

Microsoft Power BI

GitHub

Data Model

A Star Schema data model was designed with:

Fact Tables:

production_fact

quality_fact

warranty_fact

Dimension Tables:

vehicle_dimension

part_dimension

defect_dimension

inspection_dimension

plant_dimension

date_dimension

region_dimension

Analytics Views

SQL views were created to support dashboard analytics:

production_summary

supplier_defects

defect_rate

warranty_cost_analysis

defect_warranty_impact

Dashboard Pages
1 Production Performance

Planned vs actual production

Scrap analysis

Downtime monitoring

2 Quality Analytics

Defect type analysis

Supplier quality comparison

Defect rate trends

3 Warranty Analytics

Warranty claims by region

Repair cost by vehicle model

Warranty cost heatmap

Key Insights

Fender Cladding has the highest defect count across suppliers

East region shows the highest warranty repair cost

Offroad-A platform has the largest warranty expense

Supplier Gamma shows higher defect contribution for multiple parts
