Author: Juan C. Campos

Institution: University of California, Berkeley

Date: May 11, 2020

Project: Geospatial, time-series, and statistical analyses

## Short Description

In this project I use R and QGIS to create maps of the Mexican state of Puebla at the municipal unit of analysis.  My goal in this visualization assignment is to explore if a relationship exists between oil thefts and drug-trafficking homicides.  I utilize homicide data from SNSP and oil theft data from PEMEX to visualize the intensity of distribution of DTO-DTO conflict and oil thefts throughout Puebla from 2012 to 2016.  These maps show that, although not always occurring in the same municipalities, DTO homicides at least occur in some neighboring municipalities in which oil thefts occur.  That is, these events occur in proximate locations if not necessarily in the same municipalities.

Additionally, I use R to develop a time-series analysis at the state-level and for select municipalities for my two variables from 2011 and 2016.  Although the state-level analysis shows that there might not be a significant relationship between DTO homicides and oil thefts, disaggregating the data to the municipal level reveals that there could be potential correlations in some municipalities.  

Finally, for visualization purposes, I employ a generic bivariate regression to estimate the effects of oil thefts on DTO violence.  The results I find are significant, although this can change later on when I conduct a more comprehensive multivariate analysis with a more accurate specification.

## Dependencies

1. R, version 3.6.1 (2019-07-05) -- "Action of the Toes"
2. QGIS, version 3.12.1-Bucuresti
3. LaTeX, TeXShop, version 4.44

## Files (Data, Code, Results)

### Data (Raw)

1. The oil thefts data is available here: http://gobiernofacil.com/proyectos/robo-de-combustible-en-puebla 
2. The homicides data is available here: https://justiceinmexico.org/data/ 

### Data (Generated)

1.	pue_thefts_homicides.csv
2.	pue_time.csv
3.	pue_shp_thefts (file containing the shapefiles for each year from 2011 to 2016)
4.	puebla_by_year (file containing DTO and homicide data for each year from 2011 to 2016)
  - y_2011.csv
  - y_2012.csv
  - y_2013.csv
  - y_2014.csv
  - y_2015.csv
  - y_2016.csv

### Code

1. pue_geospatial.R (script containing code for cleaning geospatial data)
2. pue_time_series.R (script containing code for the time-series analyses)
3. pue_stat_analysis.R (script containing code for statistical analysis)

### Reults


## More Information

For more information, contact Juan Campos at juan_campos@berkeley.edu
