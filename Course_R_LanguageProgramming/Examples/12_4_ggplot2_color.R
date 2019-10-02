library(tidyverse)

weather <- read.csv("weather.csv")

weather$season <- factor(weather$season,
                         levels = c("spring", "summer",  "autumn", "winter"),
                         labels = c("Spring", "Summer", "Autumn", "Winter"))

weather$dir_wind <- factor(weather$dir_wind,
                           levels = c("E", "S", "W", "N"))

ggplot(weather, aes(dir_wind, group = season)) +
  geom_bar(color = "red", 
           fill = "lightblue", 
           position = "dodge")

p_wind <- weather %>% ggplot(aes(dir_wind)) +
  geom_bar(aes(fill = season), position = "dodge")

p_wind
p_wind + scale_fill_discrete()
p_wind + scale_fill_hue()

p_wind + 
  scale_fill_manual(values = c("blue", "green", "yellow", "red"))

library(RColorBrewer)
display.brewer.all()

p_wind + scale_fill_brewer(palette = "Set2")
p_wind + scale_fill_brewer(palette = "Spectral")
p_wind + scale_fill_brewer(palette = "YlGn")

library(ggsci)
p_wind + scale_fill_lancet()


p_temp <- weather %>% ggplot(aes(l_temp, h_temp, fill = rainfall)) +
  geom_point(shape = 21, size = 3) 

p_temp

p_temp + scale_fill_material("red")

p_temp + scale_fill_gradient(low = "lightblue", high = "red")

p_temp + scale_fill_gradient2(low = "green", mid = "red",
                              high = "blue", midpoint = 30)
