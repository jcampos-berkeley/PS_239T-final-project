---
  title: "Geospatial Analysis"
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

data <- read.csv("pue_thefts_homicides.csv")

## MERGING PRELIMINARIES

# Rename municipality variable to "CVE_MUN" for merging

data <- rename(data, CVE_MUN = Municipality)

# Create seperate dataframes for each year [otherwise data and shapefile will not merge correctly]

y_2011 <- subset(data, year == 2011)
y_2012 <- subset(data, year == 2012)
y_2013 <- subset(data, year == 2013)
y_2014 <- subset(data, year == 2014)
y_2015 <- subset(data, year == 2015)
y_2016 <- subset(data, year == 2016)

# save seperate year dataframes in new folder named 'puebla_by_year' on desktop

write.csv(y_2011,"/Users/juancampos/Desktop/puebla_by_year//y_2011.csv", row.names = FALSE)
write.csv(y_2012,"/Users/juancampos/Desktop/puebla_by_year//y_2012.csv", row.names = FALSE)
write.csv(y_2013,"/Users/juancampos/Desktop/puebla_by_year//y_2013.csv", row.names = FALSE)
write.csv(y_2014,"/Users/juancampos/Desktop/puebla_by_year//y_2014.csv", row.names = FALSE)
write.csv(y_2015,"/Users/juancampos/Desktop/puebla_by_year//y_2015.csv", row.names = FALSE)
write.csv(y_2016,"/Users/juancampos/Desktop/puebla_by_year//y_2016.csv", row.names = FALSE)

# what is the class of the CVE_MUN variable for original dataset? [knowing this is necessary for merging below]

class(data$CVE_MUN)

# make sure the number of observations are the same for each year

table(data$year)

## READING AND MERGING DATA TO SHAPEFILE FOR EACH YEAR

# 2011

# read shp file

#dbf_shape_2011 <- read.dbf("/Users/juancampos/Desktop/pue_shp_thefts/2011_pue_shp_thefts/pue_municipio.dbf",as.is = T)

# what is the class of CVE_MUN within this shp file?

class(dbf_shape_2011$CVE_MUN)

# if the class is NOT integer, change it to integer

dbf_shape_2011$CVE_MUN<-as.integer(dbf_shape_2011$CVE_MUN)

# check to see if the number of observations in the shp file and original dataframe overlap perfectly

table(dbf_shape_2011$CVE_MUN%in%data$CVE_MUN)

# merge data to shp/dfb

merged_dbf_2011 <- dplyr::inner_join(y_2011, dbf_shape_2011, by = "CVE_MUN")

# overwrite original dbf with merged data [caution: running this more than once adds additional vectors to dbf dataframe]

write.dbf(merged_dbf_2011,"/Users/juancampos/Desktop/pue_shp_thefts/2011_pue_shp_thefts/pue_municipio.dbf")

# the shp file should be ready for QGIS analysis

# 2011

# read shp file

dbf_shape <- read.dbf("/Users/juancampos/Desktop/puebla_shape/pue_municipio.dbf",as.is = T)

# what is the class of CVE_MUN within this shp file?

class(dbf_shape$CVE_MUN)

# if the class is NOT integer, change it to integer

dbf_shape$CVE_MUN<-as.integer(dbf_shape$CVE_MUN)

# check to see if the number of observations in the shp file and original dataframe overlap perfectly

table(dbf_shape$CVE_MUN%in%data$CVE_MUN)

# not sure what this is doing.
#y_2011_2 <- read.csv("/Users/juancampos/Desktop/puebla_by_year//y_2011.csv", stringsAsFactors = F)

table(y_2011$CVE_MUN%in%dbf_shape$CVE_MUN)

# merge data to shp/dfb
merged_dbf_2011 <- dplyr::inner_join(y_2011, dbf_shape, by = "CVE_MUN")

### this overwrites original dbf with merged data.
write.dbf(merged_dbf_2011,"/Users/juancampos/Desktop/puebla_shape/pue_municipio.dbf")


# 2012

# read shp file

#dbf_shape_2012 <- read.dbf("/Users/juancampos/Desktop/pue_shp_thefts/2012_pue_shp_thefts/pue_municipio.dbf",as.is = T)

# what is the class of CVE_MUN within this shp file?

class(dbf_shape_2012$CVE_MUN)

# if the class is NOT integer, change it to integer

dbf_shape_2012$CVE_MUN<-as.integer(dbf_shape_2012$CVE_MUN)

# check to see if the number of observations in the shp file and original dataframe overlap perfectly

table(dbf_shape_2012$CVE_MUN%in%data$CVE_MUN)

# merge data to shp/dfb

merged_dbf_2012 <- dplyr::inner_join(y_2012, dbf_shape_2012, by = "CVE_MUN")

# overwrite original dbf with merged data [caution: running this more than once adds additional vectors to dbf dataframe]

#write.dbf(merged_dbf_2012,"/Users/juancampos/Desktop/pue_shp_thefts/2012_pue_shp_thefts/pue_municipio.dbf")

# the shp file should be ready for QGIS analysis


# 2013

# read shp file

#dbf_shape_2013 <- read.dbf("/Users/juancampos/Desktop/pue_shp_thefts/2013_pue_shp_thefts/pue_municipio.dbf",as.is = T)

# what is the class of CVE_MUN within this shp file?

class(dbf_shape_2013$CVE_MUN)

# if the class is NOT integer, change it to integer

dbf_shape_2013$CVE_MUN<-as.integer(dbf_shape_2013$CVE_MUN)

# check to see if the number of observations in the shp file and original dataframe overlap perfectly

table(dbf_shape_2013$CVE_MUN%in%data$CVE_MUN)

# merge data to shp/dfb

merged_dbf_2013 <- dplyr::inner_join(y_2013, dbf_shape_2013, by = "CVE_MUN")

# overwrite original dbf with merged data [caution: running this more than once adds additional vectors to dbf dataframe]

#write.dbf(merged_dbf_2013,"/Users/juancampos/Desktop/pue_shp_thefts/2013_pue_shp_thefts/pue_municipio.dbf")

# the shp file should be ready for QGIS analysis


# 2014

#read shp file

#dbf_shape_2014 <- read.dbf("/Users/juancampos/Desktop/pue_shp_thefts/2014_pue_shp_thefts/pue_municipio.dbf",as.is = T)

# what is the class of CVE_MUN within this shp file?

class(dbf_shape_2014$CVE_MUN)

# if the class is NOT integer, change it to integer

dbf_shape_2014$CVE_MUN<-as.integer(dbf_shape_2014$CVE_MUN)

# check to see if the number of observations in the shp file and original dataframe overlap perfectly

table(dbf_shape_2014$CVE_MUN%in%data$CVE_MUN)

# merge data to shp/dfb

merged_dbf_2014 <- dplyr::inner_join(y_2014, dbf_shape_2014, by = "CVE_MUN")

# overwrite original dbf with merged data [caution: running this more than once adds additional vectors to dbf dataframe]

#write.dbf(merged_dbf_2014,"/Users/juancampos/Desktop/pue_shp_thefts/2014_pue_shp_thefts/pue_municipio.dbf")

# the shp file should be ready for QGIS analysis


# 2015

#read shp file

#dbf_shape_2015 <- read.dbf("/Users/juancampos/Desktop/pue_shp_thefts/2015_pue_shp_thefts/pue_municipio.dbf",as.is = T)

# what is the class of CVE_MUN within this shp file?

class(dbf_shape_2015$CVE_MUN)

# if the class is NOT integer, change it to integer

dbf_shape_2015$CVE_MUN<-as.integer(dbf_shape_2015$CVE_MUN)

# check to see if the number of observations in the shp file and original dataframe overlap perfectly

table(dbf_shape_2015$CVE_MUN%in%data$CVE_MUN)

# merge data to shp/dfb

merged_dbf_2015 <- dplyr::inner_join(y_2015, dbf_shape_2015, by = "CVE_MUN")

# overwrite original dbf with merged data [caution: running this more than once adds additional vectors to dbf dataframe]

#write.dbf(merged_dbf_2015,"/Users/juancampos/Desktop/pue_shp_thefts/2015_pue_shp_thefts/pue_municipio.dbf")

# the shp file should be ready for QGIS analysis


# 2016

#read shp file

#dbf_shape_2016 <- read.dbf("/Users/juancampos/Desktop/pue_shp_thefts/2016_pue_shp_thefts/pue_municipio.dbf",as.is = T)

# what is the class of CVE_MUN within this shp file?

class(dbf_shape_2016$CVE_MUN)

# if the class is NOT integer, change it to integer

dbf_shape_2016$CVE_MUN<-as.integer(dbf_shape_2016$CVE_MUN)

# check to see if the number of observations in the shp file and original dataframe overlap perfectly

table(dbf_shape_2016$CVE_MUN%in%data$CVE_MUN)

# merge data to shp/dfb

merged_dbf_2016 <- dplyr::inner_join(y_2016, dbf_shape_2016, by = "CVE_MUN")

# overwrite original dbf with merged data [caution: running this more than once adds additional vectors to dbf dataframe]

#write.dbf(merged_dbf_2016,"/Users/juancampos/Desktop/pue_shp_thefts/2016_pue_shp_thefts/pue_municipio.dbf")

# the shp file should be ready for QGIS analysis

