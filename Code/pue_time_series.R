---
  title: "Time-Series Analysis"
  name: "Juan C. Campos"
---

# This script cleans my data and sets it up for several time-series analyses
    
# Set working directory
    
setwd("/Users/juancampos/Desktop/")

library(dplyr)


# Read in data for municipal-level time-series analysis

data <- read.csv("pue_thefts_homicides.csv")

# Read in data for state-level time-series analysis

data2 <- read.csv("pue_time.csv")

## STATE-LEVEL TIME-SERIES ANALYSIS

# Extract the thefts and homicide variables and save them as objects

puebla_thefts <- select(data2, thefts)
puebla_homicides <- select(data2, homicides)

# Create a time-series object for thefts

ts_puebla_thefts <- ts(puebla_thefts, start=2011, frequency = 1)

# Plot the time-series object for thefts

plot(ts_puebla_thefts, xlab = "Year", ylab = "Thefts", main = "Oil Thefts in Puebla, 2011-2016")
  
# Create a time-series object for thefts

ts_puebla_homicides <- ts(puebla_homicides, start=2011, frequency = 1)

# Plot the time-serie object for homicides

plot(ts_puebla_homicides, xlab = "Year", ylab = "Homicides", main = "Homicides in Puebla, 2011-2016")


# Plot together the time-series objects for thefts and homicides:

ts.plot(ts_puebla_thefts, ts_puebla_homicides, xlab = "Year", ylab = "Count", main = "Thefts and Homicides in Puebla, 2011-2016", 
        gpars = list(col = c("black", "red")))


## TIME-SERIES ANALYSES FOR SELECT MUNICIPALITIES

# Subset data for ACAJETE:

acajete <- subset(data, MUNICIPIO == "ACAJETE")

# Create objects for thefts and homicides:

acajete_thefts <- select(acajete, oil_thefts)
acajete_homicides <- select(acajete, total_homicides)

# Convert acajete thefts and homicidesdata to time-series using ts function, then plot both:

ts_acajete_thefts <- ts(acajete_thefts, start=2011, frequency = 1)
plot(ts_acajete_thefts, xlab = "Year", ylab = "Thefts", main = "Oil Thefts in Acajete, 2011-2016")

ts_acajete_homicides <- ts(acajete_homicides, start=2011, frequency = 1)
plot(ts_acajete_homicides, xlab = "Year", ylab = "Homicides", main = "DTO Homicides in Acajete, 2011-2016", col = "red")


# Subset data for TEPEACA

tepeaca <- subset(data, MUNICIPIO == "TEPEACA")

# Create objects for thefts and homicides:

tepeaca_thefts <- select(tepeaca, oil_thefts)
tepeaca_homicides <- select(tepeaca, total_homicides)

# Convert tepeaca thefts and homicides data to time-series using ts function, then plot both:

ts_tepeaca_thefts <- ts(tepeaca_thefts, start=2011, frequency = 1)
plot(ts_tepeaca_thefts, xlab = "Year", ylab = "Thefts", main = "Oil Thefts in Tepeaca, 2011-2016")

ts_tepeaca_homicides <- ts(tepeaca_homicides, start=2011, frequency = 1)
plot(ts_tepeaca_homicides, xlab = "Year", ylab = "Homicides", main = "Homicides in Tepeaca, 2011-2016", col = "red")


# Subset data for PALMAR DE BRAVO:

palmar_de_bravo <- subset(data, MUNICIPIO == "PALMAR DE BRAVO")

# Create objects for thefts and homicides:

palmar_de_bravo_thefts <- select(palmar_de_bravo, oil_thefts)
palmar_de_bravo_homicides <- select(palmar_de_bravo, total_homicides)

# Convert palmar de bravo thefts and homicides data to time-series using ts function, then plot both:

ts_palmar_de_bravo_thefts <- ts(palmar_de_bravo_thefts, start=2011, frequency = 1)
plot(ts_palmar_de_bravo_thefts, xlab = "Year", ylab = "Thefts", main = "Oil Thefts in Palmar De Bravo, 2011-2016")

ts_palmar_de_bravo_homicides <- ts(palmar_de_bravo_homicides, start=2011, frequency = 1)
plot(ts_palmar_de_bravo_homicides, xlab = "Year", ylab = "Homicides", main = "Homicides in Palmar De Bravo, 2011-2016", col = "red")


# Subset data for VENUSTIANO CARRANZA:

venustiano_carranza <- subset(data, MUNICIPIO == "VENUSTIANO CARRANZA")

# Create objects for thefts and homicides:

venustiano_carranza_thefts <- select(venustiano_carranza, oil_thefts)
venustiano_carranza_homicides <- select(venustiano_carranza, total_homicides)

# Convert palmar de bravo thefts and homicides data to time-series using ts function, then plot both:

ts_venustiano_carranza_thefts <- ts(venustiano_carranza_thefts, start=2011, frequency = 1)
plot(ts_venustiano_carranza_thefts, xlab = "Year", ylab = "Thefts", main = "Oil Thefts in Venustiano Carranza, 2011-2016")

ts_venustiano_carranza_homicides <- ts(venustiano_carranza_homicides, start=2011, frequency = 1)
plot(ts_venustiano_carranza_homicides, xlab = "Year", ylab = "Homicides", main = "Homicides in Venustiano Carranza, 2011-2016", col = "red")


# Subset data for TECAMACHALCO:

tecamachalco <- subset(data, MUNICIPIO == "TECAMACHALCO")

# Create objects for thefts and homicides:

tecamachalco_thefts <- select(tecamachalco, oil_thefts)
tecamachalco_homicides <- select(tecamachalco, total_homicides)

# Convert palmar de bravo thefts and homicides data to time-series using ts function, then plot both:

ts_tecamachalco_thefts <- ts(tecamachalco_thefts, start=2011, frequency = 1)
plot(ts_tecamachalco_thefts, xlab = "Year", ylab = "Thefts", main = "Oil Thefts in Tecamachalco, 2011-2016")

ts_tecamachalco_homicides <- ts(tecamachalco_homicides, start=2011, frequency = 1)
plot(ts_tecamachalco_homicides, xlab = "Year", ylab = "Homicides", main = "Homicides in Tecamachalco, 2011-2016", col = "red")


# Subset data for HUAUCHINANGO:

huauchinango <- subset(data, MUNICIPIO == "HUAUCHINANGO")

# create objects for thefts and homicides:

huauchinango_thefts <- select(huauchinango, oil_thefts)
huauchinango_homicides <- select(huauchinango, total_homicides)

# convert palmar de bravo thefts and homicides data to time-series using ts function, then plot both:

ts_huauchinango_thefts <- ts(huauchinango_thefts, start=2011, frequency = 1)
plot(ts_huauchinango_thefts, xlab = "Year", ylab = "Thefts", main = "Oil Thefts in Huauchinango, 2011-2016")

ts_huauchinango_homicides <- ts(huauchinango_homicides, start=2011, frequency = 1)
plot(ts_huauchinango_homicides, xlab = "Year", ylab = "Homicides", main = "Homicides in Huauchinango, 2011-2016", col = "red")


# Subset data for ESPERANZA:

esperanza <- subset(data, MUNICIPIO == "ESPERANZA")

# create objects for thefts and homicides:

esperanza_thefts <- select(esperanza, oil_thefts)
esperanza_homicides <- select(esperanza, total_homicides)

# Convert palmar de bravo thefts and homicides data to time-series using ts function, then plot both:

ts_esperanza_thefts <- ts(esperanza_thefts, start=2011, frequency = 1)
plot(ts_esperanza_thefts, xlab = "Year", ylab = "Thefts", main = "Oil Thefts in Esperanza, 2011-2016")

ts_esperanza_homicides <- ts(esperanza_homicides, start=2011, frequency = 1)
plot(ts_esperanza_homicides, xlab = "Year", ylab = "Homicides", main = "Homicides in Esperanza, 2011-2016", col = "red")

