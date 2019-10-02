library(tidyverse)

BOM_data <- read_csv("data/BOM_data.csv")
BOM_stations <- read_csv("data/BOM_stations.csv")

#Challenge 1
#For each station, how many days have a minimum temperature, 
#a maximum temperature and a rainfall measurement recorded?


BOM_data
head(BOM_data)
dim(BOM_data)



BOM_data %>% 
  separate(col=Temp_min_max, into = c("temp_min", "temp_max"), sep = "/") %>%
  filter(Rainfall != "-", temp_min != "-", temp_max != "-") %>% 
  group_by(Station_number) %>% 
  summarise(nrow=n())



#Challenge2 
#Which month saw the lowest average daily temperature difference?
#In addition to the functions you used above, 
#this question will need a mutate() to calculate the temperature difference.
#The temperature values are stored as characters after you have run separate() 
#(see the <chr> in the second row if you print the data frame to the console).
#To be able to calculate the difference without an error, 
#you will need to convert them to numeric values with as.numeric() first.

head(BOM_data)

BOM_data %>% 
  separate(col=Temp_min_max, into = c("temp_min", "temp_max"), sep = "/") %>% 
  filter(temp_min !="-", temp_max != "-") %>% 
  mutate(temp_diff = as.numeric(temp_max) - as.numeric(temp_min)) %>% 
  group_by(Month) %>% 
  summarise(mean_temp_diff = mean(temp_diff)) %>% 
  arrange(mean_temp_diff) %>% 
  top_n(-1)#question:#Question - why do I need to use -1 n(bottom of list) after it has been arranged? 



#Which state saw the lowest average daily temperature difference?
# Need to join the BOM dataframes together
#The station data is not in a tidy format however, as each station is recorded in it’s own column. (Why is this data not tidy?)
#To tidy it before merging, you will need to gather() the station data into an intermediate form that has three columns, 
#one for the station ID number, one for the type of data being recorded (the info column in the original data), 
#and one for the actual recorded value itself. (Is this intermediate data tidy?)
#This data frame can then be spread() into a shape with one row for each station. 
#Remember that the key argument to spread() identifies the column that will provide the data for the new column names, 
#and the value argument identifies the column that will provide the data for the new cells.
#Finally, you will want to join the two datasets together to identify the state of each weather station. 
#If you run into errors at this step, check that the two data frames have a shared column to merge, 
#and that they are the same data type (eg. you can’t merge a character column with a numeric column).


#tidy Bom_stations dataset
BOM_stations_gs <- BOM_stations %>%
  gather(key = "Station_number", value = "values",-info) %>% #gather to put station data into a single column
  spread(key = "info", value = "values") #spread so there is one row for each station
BOM_stations_gs$Station_number <- as.numeric(BOM_stations_gs$Station_number) #converts column from character to number format

BOM_data_temp_diff <- BOM_data %>%
  separate(col="Temp_min_max", into = c("temp_min", "temp_max"), sep = "/") %>%
  filter(temp_min != "-", temp_max != "-") %>%
  mutate("temp_diff" = as.numeric(temp_max)-as.numeric(temp_min))

BOM_data_station <- left_join(BOM_data_temp_diff, BOM_stations_gs, by = "Station_number", -elev) %>%  
  group_by(state) %>% 
  summarise(mean_temp_diff = mean(temp_diff)) %>%
  arrange(mean_temp_diff) %>% 
  top_n(-1)#Question - why do I need to use -1 n(bottom of list) after it has been arranged?
BOM_data_station