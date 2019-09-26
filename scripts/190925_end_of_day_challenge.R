#load packages and datasets

library(tidyverse)

BOM_data <- read_csv("data/BOM_data.csv")
BOM_stations <- read_csv("data/BOM_stations.csv")

#For each station, how many days have a minimum temperature, 
#a maximum temperature and a rainfall measurement recorded?

BOM_data_challenge1<- separate(BOM_data, col=Temp_min_max, into = c("temp_min", "temp_max"), sep = "/") %>%
  filter(Rainfall != "-", temp_min != "-", temp_max != "-") %>%
  group_by(Station_number) %>%
  summarise(num_rows=n())


#Challenge2
#Which month saw the lowest average daily temperature difference?
#In addition to the functions you used above, 
  #this question will need a mutate() to calculate the temperature difference.
#The temperature values are stored as characters after you have run separate() 
  #(see the <chr> in the second row if you print the data frame to the console).
#To be able to calculate the difference without an error, 
  #you will need to convert them to numeric values with as.numeric() first.

?as.numeric()

BOM_data_challenge2<- separate(BOM_data, col=Temp_min_max, into = c("temp_min", "temp_max"), sep = "/") %>%
  mutate
  
  as.numeric()

BOM_data
head(BOM_data)
