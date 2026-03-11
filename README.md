# automotive-quality-analytics
End-to-end automotive manufacturing analytics project using SQL, data modeling, and Power BI

**Automotive Manufacturing Analytics Dashboard**
**Project Overview**

This project analyzes automotive production, quality defects, and warranty claims using SQL data modeling and Power BI dashboards.

The goal is to identify:

1. Production performance issues
2. Manufacturing defect trends
3. Supplier quality risks
4. Warranty cost drivers

**Tech Stack**

Tools used:

1. SQL (PostgreSQL)

2. Data Warehouse Modeling

3. Microsoft Power BI

4. GitHub

**Data Model**

A Star Schema data model was designed with:

**Fact Tables:**

1. production_fact

2. quality_fact

3. warranty_fact

**Dimension Tables:**

1.vehicle_dimension

2. part_dimension

3. defect_dimension

4. inspection_dimension

5. plant_dimension

6. date_dimension

7. region_dimension

**Analytics Views**

SQL views were created to support dashboard analytics:

1. production_summary

2. supplier_defects

3. defect_rate

4. warranty_cost_analysis

5. defect_warranty_impact

**Dashboard Pages**

1. Production Performance

Planned vs actual production

Scrap analysis

Downtime monitoring

2. Quality Analytics

Defect type analysis

Supplier quality comparison

Defect rate trends

3. Warranty Analytics

Warranty claims by region

Repair cost by vehicle model

Warranty cost heatmap

Key Insights

1. Fender Cladding has the highest defect count across suppliers

2. East region shows the highest warranty repair cost

3. Offroad-A platform has the largest warranty expense

4. Supplier Gamma shows higher defect contribution for multiple parts
