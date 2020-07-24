library(ggplot2)
library(dplyr)

weather <- read.csv("weather.csv")

ave_temp <- weather %>% select(season, ave_temp)

ggplot(ave_temp, aes(season, ave_temp)) +
  geom_boxplot() -> p_boxplot

p_boxplot 

p_boxplot + 
  stat_summary(fun.y = "mean", 
               geom = "point", shape = 21, 
               size = 3, fill = "red") + mytheme

ggplot(ave_temp, aes(season, ave_temp)) +
  geom_boxplot(notch = T) 
  
ggplot(ave_temp, aes(season, ave_temp)) +
  geom_violin()


weather <- read.csv("weather.csv")

weather_temp <- weather %>% select(day_num, season, l_temp, h_temp) %>% 
  gather(key = lh_temp, value = temp, l_temp:h_temp) 

p_boxplot <- ggplot(weather_temp, aes(season, temp, color = lh_temp)) +
  geom_boxplot() + 
  stat_summary(fun.y = mean, geom = "point",
               size = 0.5, shape = 4,
               position = position_dodge(width = 0.5)) 

p_boxplot 
