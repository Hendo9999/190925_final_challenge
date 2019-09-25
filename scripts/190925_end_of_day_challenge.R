#load packages and datasets

library(tidyverse)

BOM_data <- read_csv("data/BOM_data.csv")
BOM_stations <- read_csv("data/BOM_stations.csv")

#For each station, how many days have a minimum temperature, 
#a maximum temperature and a rainfall measurement recorded?

#convert - to NA
#count number of rows with Rainfall 
#separate Temp_min_max first
#count number of rows with number of values

test_NA_conversion <- BOM_data
test1 <- na_if(test_NA_conversion, c("-/-", "-"))
test1


n
na_if()
