---
title: "Geospatial Analysis Pt. 2"
name: "Juan C. Campos"
---
  
# This script cleans my data and merges it with the shapefile for the QGIS analysis.
  
# Set working directory
  
getwd()
setwd("/Users/juancampos/Desktop/")

# Upload necessary packages

library(foreign)
library(dplyr)

# Read in data for geospatial analysis

data <- read.csv("mex_data_2.csv")

## MERGING PRELIMINARIES

# Rename municipality variable to "CVE_MUN" for merging

data <- rename(data, ID_1 = state_code)

# Create seperate dataframes for each year [otherwise data and shapefile will not merge correctly]


y_2014 <- subset(data, year == 2014)
y_2015 <- subset(data, year == 2015)
y_2016 <- subset(data, year == 2016)
y_2017 <- subset(data, year == 2017)

# save seperate year dataframes in new folder named 'puebla_by_year' on desktop

write.csv(y_2014,"/Users/juancampos/Desktop/mex_shape//y_2014.csv", row.names = FALSE)
write.csv(y_2015,"/Users/juancampos/Desktop/mex_shape_thefts/mex_shape_2015//y_2015.csv", row.names = FALSE)
write.csv(y_2016,"/Users/juancampos/Desktop/mex_shape_thefts/mex_shape_2016//y_2016.csv", row.names = FALSE)
write.csv(y_2017,"/Users/juancampos/Desktop/mex_shape_thefts/mex_shape_2017//y_2017.csv", row.names = FALSE)


# what is the class of the CVE_MUN variable for original dataset? [knowing this is necessary for merging below]

class(data$ID_1)


class(data$dto_homicides)


data$dto_homicides<-as.integer(data$dto_homicides)

dbf_shape_2014$dto_homicides<-as.integer(dbf_shape_2014$dto_homicides)

# make sure the number of observations are the same for each year

table(data$year)

## READING AND MERGING DATA TO SHAPEFILE FOR EACH YEAR

# 2014

# read shp file

dbf_shape_2014 <- read.dbf("/Users/juancampos/Desktop/mex_shape_thefts/mex_shape_2014/MEX_adm1.dbf",as.is = T)

# what is the class of CVE_MUN within this shp file?

class(dbf_shape_2011$ID_1)

# if the class is NOT integer, change it to integer

dbf_shape_2014$CVE_MUN<-as.integer(dbf_shape_2014$CVE_MUN)

# check to see if the number of observations in the shp file and original dataframe overlap perfectly

table(dbf_shape_2014$ID_1%in%data$ID_1)

# merge data to shp/dfb

merged_dbf_2014 <- dplyr::inner_join(y_2014, dbf_shape_2014, by = "ID_1")

# overwrite original dbf with merged data [caution: running this more than once adds additional vectors to dbf dataframe]

write.dbf(merged_dbf_2014,"/Users/juancampos/Desktop/mex_shape/MEX_adm1.dbf")

# the shp file should be ready for QGIS analysis

# 2015

# read shp file

dbf_shape_2015 <- read.dbf("/Users/juancampos/Desktop/mex_shape_thefts/mex_shape_2015/MEX_adm1.dbf",as.is = T)

# what is the class of CVE_MUN within this shp file?

class(dbf_shape_2015$ID_1)

# if the class is NOT integer, change it to integer

dbf_shape_2015$CVE_MUN<-as.integer(dbf_shape_2015$ID_1)

# check to see if the number of observations in the shp file and original dataframe overlap perfectly

table(dbf_shape_2015$ID_1%in%data$ID_1)

# merge data to shp/dfb

merged_dbf_2015 <- dplyr::inner_join(y_2015, dbf_shape_2015, by = "ID_1")

# overwrite original dbf with merged data [caution: running this more than once adds additional vectors to dbf dataframe]

write.dbf(merged_dbf_2015,"/Users/juancampos/Desktop/mex_shape_thefts/mex_shape_2015/MEX_adm1.dbf")

# the shp file should be ready for QGIS analysis

# 2016

# read shp file

dbf_shape_2016 <- read.dbf("/Users/juancampos/Desktop/mex_shape_thefts/mex_shape_2016/MEX_adm1.dbf",as.is = T)

# what is the class of CVE_MUN within this shp file?

class(dbf_shape_2016$ID_1)

# if the class is NOT integer, change it to integer

dbf_shape_2016$ID_1<-as.integer(dbf_shape_2014$ID_1)

# check to see if the number of observations in the shp file and original dataframe overlap perfectly

table(dbf_shape_2016$ID_1%in%data$ID_1)

# merge data to shp/dfb

merged_dbf_2016 <- dplyr::inner_join(y_2016, dbf_shape_2016, by = "ID_1")

# overwrite original dbf with merged data [caution: running this more than once adds additional vectors to dbf dataframe]

write.dbf(merged_dbf_2016,"/Users/juancampos/Desktop/mex_shape_thefts/mex_shape_2016/MEX_adm1.dbf")

# the shp file should be ready for QGIS analysis
