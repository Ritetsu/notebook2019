library(tidyverse)

weather <- read.csv("weather.csv")
p_bar <- weather %>% ggplot(aes(dir_wind, fill = season)) 

p_bar + geom_bar()

p_bar + geom_bar(width = 0.3)

p_bar + geom_bar(width = 0.5, position = "fill") +
  scale_y_continuous(breaks = c(0, 0.2, 0.4, 0.6, 0.8, 1.0), 
                     labels = c("0", "20", "40", "60", "80", "100")) +
  ylab("%") 

wind_dir <- read.csv("wind_dir.csv")
dim(wind_dir)
head(wind_dir)
summary(wind_dir)

ggplot(wind_dir, aes(wind_dir, fill = speed_rank)) + 
  geom_bar() 

wind_dir$speed_rank <- factor(wind_dir$speed_rank, 
                              levels = c("5-10", 
                                         "10-15", 
                                         "15-20", 
                                         ">20"))

ggplot(wind_dir, aes(wind_dir, fill = speed_rank)) + 
  geom_bar() 

ggplot(wind_dir, aes(wind_dir, fill = speed_rank)) + 
  geom_bar() +
  coord_polar()   

str(wind_dir)

ggplot(wind_dir, aes(wind_dir, fill = speed_rank)) + 
  geom_histogram() 
  
ggplot(wind_dir, aes(wind_dir, fill = speed_rank)) + 
  geom_histogram(binwidth = 15) + 
  coord_polar() + 
  scale_x_continuous(limits = c(0, 360), 
                     breaks = seq(0,360, by = 45)) +
  scale_fill_brewer(palette = "Set1")


