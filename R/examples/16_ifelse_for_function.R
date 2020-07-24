x <- -10
if(x < 0)  print("x is less than 0")

x <- 10
if(x < 0)  print("x is less than 0")

x <- 10
if (x < 0)  print("x is less than 0") else print("x is larger than 0")

###
x <- c(-100, 100)
ifelse(x > 0, x, -x)

###
library(tidyverse)

weather <- read.csv("weather.csv")
head(weather)

weather %>% select(season, dir_wind) -> wea
head(wea)

wea$south <- ifelse(wea$dir_wind == "S", 1, 0)
wea$west <- ifelse(wea$dir_wind == "W", 1, 0)
wea$north <- ifelse(wea$dir_wind == "N", 1, 0)
wea$east <- ifelse(wea$dir_wind == "E", 1, 0)

head(wea)
tail(wea)

wea %>% group_by(season) %>% 
  summarise(east = sum(east),
            south = sum(south),
            west = sum(west),
            north = sum(north)) -> neww

neww

write.csv(neww, "season_winddir.csv")



###
x <- 1:4
for (i in x){
  print(i)
}

x <- 1
while(x < 5){
  print(x)
  x = x + 1
}

x <- 1
repeat{
  print(x)
  x = x + 1
  if(x > 4) break
}


##
x_plus_y <- function (x, y) {
  z <- x + y
  return (z)
}

x_plus_y(10, 100)

x_plus_y2 <- function (x, y) x + y
x_plus_y2(2, 3)


