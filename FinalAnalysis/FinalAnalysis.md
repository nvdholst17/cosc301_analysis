# Data acquisition/loading

https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020

License: CC0: Public Domain

Download the dataset as a ZIP file or follow the instructions on Kaggle to download via the command line

You can also locate all CSVs in the following [folder](./Files/CSV)

# ETL / cleaning

We cleaned the data by truncating it during the creation of our database.

When we noticed that information was not relevant or mostly NULL, we excluded the column from the schema.

# Storage of cleaned data

We stored the data in a MySQL database, you can create the database using the [Formula 1 Schema](Files/formula1Schema.sql)

# EDA

The [Formula 1 EDA](Files/formula1Queries.sql) looks through the data to make sure we have an even distribution of the data over the last 70 years.

## Plots

The following plots show that there is more data for the recent years versus the older years(1900s).

![Year Histogram](Images/Histogram.png)

![Year Box and Whisker](Images/BoxWhisker.png)

You can recreate these using [Race Years Excel Workbook](Files/RaceYears.xlsx).

## Insight

The main insight we had was that the earlier years (1950 - 1990) do not have as much data or it is not accurate. Therefore in most of our analysis we are only looking at constructors from the recent years, and pit stops in the recent years.

# Reporting

We had three analytic questions we wanted to answer.

## Q1: How do pit stop times vary between constructors and years?

[Pit Stop Analysis](../PitStopAnalysis/PitStopAnalysis.md)

## Q2: How well does each constructor perform on average at specific circuits?

[Circuit Analysis](../CircuitAnalysis/CircuitAnalysis.md)

## Q3: How do regulation changes affect constructor performance?

[Regulation Analysis](../RegulationAnalysis/RegulationAnalysis.md)