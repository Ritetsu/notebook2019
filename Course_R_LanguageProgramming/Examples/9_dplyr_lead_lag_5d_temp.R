library(tidyverse)

mydat <- 1:5

mydat_lead <- lead(mydat, 2, 0)
mydat_lag <- lag(mydat, 2, -1)

mydat_df <- data.frame(mydat, mydat_lead, mydat_lag)
mydat_df


### Spring ###
library(lubridate)

weather <- read.csv("weather.csv")
head(weather)

new_w <- weather %>% 
  transmute(date = as.Date("2014-01-01") + day_num - 1,
                            temp = ave_temp - 4) 
head(new_w)
View(new_w)

new_w %>% mutate(above_10 = as.numeric(temp >= 10),
    five_days = cumsum(above_10) - cumsum(lag(above_10, 5, 0))) -> 
  new_w2
    
head(new_w2)
View(new_w2)
    
new_w2 %>% filter(five_days == 5) %>% 
  summarise(first(date))


