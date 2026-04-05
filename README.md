# COSC 301 - Analysis Project

Formula 1 Analysis:
To be able to recreate our analysis you must have the following:
- Our provided *pitstop_analysis.sql* file
- MySQL Workbench with the formula1 database loaded
- Tableau Desktop


## How to recreate Q1
Steps:

1. Run the SQL queries
Open the [MySQL Formula 1 Schema](FinalAnalysis/Files/formula1Schema.sql) to create the database. Open in MySQL Workbench and run the following queries for:
Query #1: year-level averages
Query #2: all-time constructor rankings
Query #3: constructor performance by year
Query #4: top 25 fastest individual stops

2. Export results 
Make sure to export the results as CSV files

3. Load into Tableau
Open Tableau and load in each query as a data source. Create a new worksheet for each data source.

4. Build Result Visualizations
Run [Tableau Pit Stop Graphs File](PitStopAnalysis/301projAnalysis.twb) to recreate all graphs

NOTES: 
- the dataset only involves data from 2011 - 2024 for pitstops
- "Lotus" and "Lotus F1" are the same team under different name strings in the dataset, same with "Renault" and "Alpine F1 Team"

## How to recreate Q2

## How to recreate Q3

To recreate Q3 analysis, you need to run the [MySQL Formula 1 Schema](FinalAnalysis/Files/formula1Schema.sql) to create the database.

Then run the [Tableau Regulation Graph File](RegulationAnalysis/RegulationGraphs.twb) to generate all the graphs.
