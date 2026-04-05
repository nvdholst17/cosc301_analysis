# COSC 301 - Analysis Project

Formula 1 Analysis:
To be able to recreate our analysis you must have the following:
- Our provided *pitstop_analysis.sql* file
- MySQL Workbench with the formula1 database loaded
- Tableau Desktop


## How to recreate Q1
Steps:

1. Run the SQL queries
Open the formula1schema.sql file in MySQL Workbench and run the following queries for:
Query #1: year-level averages
Query #2: all-time constructor rankings
Query #3: constructor performance by year
Query #4: top 25 fastest individual stops

2. Export results 
Make sure to export the results as CSV files

3. Load into Tableau
Open Tableau and load in each query as a data source. Create a new worksheet for each data source.

4. Build Result Visualizations
Query #1: Build a line chart with Year on X-axis and Avg Stop Sec on Y axis
Query #2: Horizontal bar chart: Constructor on rows, Avg Stop Sec on columns, Std Dev on color
Query #3: Heatmap: Constructor on rows, Year on columns, Avg Stop Sec on color
Query #4: Dot chart: Driver on rows, Stop Sec as dimension on columns, Constructor on color.

NOTES: 
- the dataset only involves data from 2011 - 2024 for pitstops
- "Lotus" and "Lotus F1" are the same team under different name strings in the dataset, same with "Renault" and "Alpine F1 Team"

## How to recreate Q2

## How to recreate Q3