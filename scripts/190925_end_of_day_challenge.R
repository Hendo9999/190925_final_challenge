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
 

#Challenge2 Not completed - comparing with Natalia's results
#Which month saw the lowest average daily temperature difference?
#In addition to the functions you used above, 
  #this question will need a mutate() to calculate the temperature difference.
#The temperature values are stored as characters after you have run separate() 
  #(see the <chr> in the second row if you print the data frame to the console).
#To be able to calculate the difference without an error, 
  #you will need to convert them to numeric values with as.numeric() first.

BOM_data_challenge2 <- separate(BOM_data, col=Temp_min_max, into = c("temp_min", "temp_max"), sep = "/") %>% 
  #filter(temp_min != "-", temp_max != "-") %>%
  mutate(temp_diff = as.numeric(temp_max) - as.numeric(temp_min)) %>%
  group_by(Month) %>%
  summarise(mean_temp_diff = mean(temp_diff)) %>%
  arrange(mean_temp_diff)

BOM_data_challenge2  

BOM_data %>% # BOM_data
  separate(Temp_min_max, into = c("min", 'max')) %>% # Seperate the columns
  filter(min != "", max != "") %>%  # Filtering for rows that have a min and max temp
  mutate(temp_difference = as.numeric(max) - as.numeric(min)) %>% # Find the difference between lowest and higherst temperatures 
  group_by(Month) %>% # Group by month
  summarise(mean_temp_dif = mean(temp_difference)) %>% # Find the average of that new column
  arrange(mean_temp_dif) # Find the lowest average temperature 


BOM_data %>%
  separate(Temp_min_max, into = c("temp_min", "temp_max") %>%
             #filter(temp_min != "", temp_max != "") %>%
             mutate(temp_diff = as.numeric(temp_max) - as.numeric(temp_min)) %>%
             group_by(Month) %>%
             summarise(mean_temp_diff = mean(temp_diff)) %>%
             arrange(mean_temp_diff)

  