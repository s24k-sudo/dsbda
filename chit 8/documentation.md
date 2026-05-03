# Assignment 8: Integration of Python, Hadoop, and Hive

## Aim
1. Visualize flight information system data (Assignment 3) using Matplotlib and Seaborn.
2. Integrate Python and Hadoop to perform data analysis on the forest fire dataset using MapReduce in PyHadoop.
3. Perform data mining on the forest fire dataset using Hive.

## Components

### Part A: Flight Visualization
- **Flight_Visualization.ipynb**: Contains Python code to visualize delays, carrier performance, and distance correlations for flight data.

### Part B: Forest Fire MapReduce (PyHadoop)
- **ForestFireMapper.py**: Extracts month and burnt area from the dataset.
- **ForestFireReducer.py**: Aggregates the total area burnt per month.
- **Local Test**: `cat forestfires.csv | python ForestFireMapper.py | sort | python ForestFireReducer.py`

### Part C: Forest Fire Data Mining (Hive)
- **ForestFireHive.sql**: Contains HiveQL queries to analyze the forest fire dataset, including total area per month and environmental correlations.

## Datasets
- `2008.csv`: Flight performance data.
- `forestfires.csv`: Forest fire statistics.
