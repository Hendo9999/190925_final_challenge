#load packages and datasets

library(tidyverse)

BOM_data <- read_csv("data/BOM_data.csv")
BOM_stations <- read_csv("data/BOM_stations.csv")

#For each station, how many days have a minimum temperature, 
#a maximum temperature and a rainfall measurement recorded?

#separate BOM_data temp min max columns
BOM_data_separate <- separate(BOM_data_grouped_station, col=Temp_min_max, into = c("temp_min", "temp_max"), sep = "/")

#rainfall measurement recorded
BOM_rainfall_data<- filter(BOM_data_separate, Rainfall != "-", temp_min != "-", temp_max != "-")
BOM_data_grouped_station <- group_by(BOM_rainfall_data, Station_number)
summarise(BOM_data_grouped_station,  num_rows=n())


#as above with pipes
separate(BOM_data_grouped_station, col=Temp_min_max, into = c("temp_min", "temp_max"), sep = "/") %>%
  filter(Rainfall != "-", temp_min != "-", temp_max != "-") %>%
  group_by(Station_number) %>%
  summarise(BOM_data_grouped_station, num_rows=n())




Bom_temp_min <- filter(BOM_data_separate, temp_min != "-")
head(test2)
?count()
BOM_data_separate           
?is.numeric()
  o
?filter()  

?is.numeric()

mutate

head(BOM_data_separate)
?separate

BOM_data
BOM_stations
rm(test1)
?sub()
BOM_data
head(BOM_data)
grep("-", test_NA_conversion)
?arrange
arrange(BOM_data, Rainfall)
tail(BOM_data)

as.numeric(c("-.1"," 2.7 ","B")) # (-0.1, 2.7, NA) try this code
