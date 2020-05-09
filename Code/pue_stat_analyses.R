---
  title: "Statistical Analysis"
  name: "Juan C. Campos"
---

# This script attempts to estimate the effects of oil thefts on DTO-related homicides.

setwd("/Users/juancampos/Desktop/")
getwd()

library(ggplot2)
library(stargazer)
library(dplyr)

# Read in data
data <- read.csv("pue_thefts_homicides.csv")

# Make a scatterplot
plot(data$total_homicides, data$oil_thefts, main="Scatterplot", las=1)

# Calculate a correlation
cor(data$total_homicides, data$oil_thefts, method="pearson")

# Estimate a regression
reg <- lm(data$total_homicides ~ data$oil_thefts)

# Display regression results
summary(reg)

#Plot regression results
par(mfrow=c(2,2))
par(mar=c(2,2,2,2))
plot(reg)

# Generate and save text version of stargazer output 
reg %>% stargazer(type = "text", title="OLS Regression", digits=3,  
                 out="../output/table1.txt")

# Generate latex code of stargazer output 
reg %>% stargazer()




