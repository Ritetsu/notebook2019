library(tidyverse)
library(readxl)

dir_wind <- read_excel("season_winddir.xlsx")
dir_wind

dir_wind %>% gather(key = dir_wind, 
                    value = dirvalue, 2:5) -> 
  dir_wind_narrow

dir_wind_narrow

ggplot(dir_wind_narrow, aes(dir_wind, dirvalue, fill = season)) +
  geom_col(position = "dodge") 

weather <- read.csv("weather.csv")
ggplot(weather, aes(dir_wind, fill = season)) +
  geom_bar(position = "dodge")

