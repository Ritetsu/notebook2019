library(tidyverse)

weather <- read.csv("weather.csv")

p_facet <- weather %>% 
  ggplot(aes(l_temp, h_temp)) +
  geom_point() 

p_facet

p_facet + facet_wrap(~month)
p_facet + facet_wrap(~month, 	ncol = 2)
p_facet + facet_wrap(~month, 	nrow = 2)

p_facet +    
  facet_grid(season~rained)
p_facet + facet_grid(season~.)
p_facet + facet_grid(~season)

p_facet + facet_grid(season~rained, 
                     scales = "free") 
p_facet + facet_grid(season~rained, 
                     scales = "free_y") 
p_facet + facet_grid(season~rained, 
                     scales = "free_x") 

p_facet + facet_wrap(~month, scales = "free")

weather2 <- weather
weather2$rained <- factor(weather2$rained,
                          levels = c("Yes", "No"),
                          labels = c("Rain", "No Rain"))                          
p_facet2 <- weather2 %>% 
  ggplot(aes(l_temp, h_temp)) +
  geom_point()  

p_facet2 + 
  facet_grid(season~rained)

p_facet2 + facet_grid(season~rained) +
  theme(text = element_text(size = 20)) +
  theme(strip.text.x = element_text(size = 16),
        strip.text.y = element_text(size = 8),
        strip.background = 
          element_rect(fill = "green"))

