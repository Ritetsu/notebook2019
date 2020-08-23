library(tidyverse)

polygon <- data.frame(x = c(1, 2, 2.5, 1.8, 0.9), y = c(1, 1, 1.5, 2, 1.6))
polygon

p <- ggplot(polygon, aes(x, y))

p + geom_line()
p + geom_path(color = "red")
p + geom_polygon()

chinamap <- read.csv("china_mapdata.csv")

head(chinamap)
tail(chinamap)

ggplot(chinamap, aes(x = prov_long, y = prov_lat, 
                     group = group)) + geom_path()

ggplot(chinamap, aes(x = prov_long, y = prov_lat, 
                     group = group)) + geom_path(size = 2) 

ggplot(chinamap, aes(x = prov_long, y = prov_lat, 
                     group = group)) + geom_path() +
      geom_point(aes(x = city_long,y = city_lat), 
                 shape = 1, size = 2)

ggplot(chinamap, aes(x = prov_long, y = prov_lat, 
                     group = group)) +
  geom_polygon(fill = "white", colour = "grey") +
  geom_point(aes(x = city_long,y = city_lat), 
             shape = 1, size = 2) +
  coord_map("mercator") 

northeastchina <- filter(chinamap, 
                         prov_name == "辽宁省" | 
                           prov_name == "吉林省" | 
                           prov_name == "黑龙江省")
head(northeastchina)
tail(northeastchina) 

# 梨树实验站经纬度
position_lishu <- data.frame(lon = 124.43, lat = 43.27)
position_lishu

p <- ggplot(northeastchina, aes(x = prov_long, y = prov_lat,  
                                group = group))+ geom_polygon(fill="white" ) +
  geom_path(colour = "darkgrey") +
  geom_point(aes(x = city_long,y = city_lat), 
             shape = 1, size = 3) +   
  annotate("text",x=124.13,y=41.81,label="沈阳") +
  annotate("text",x=126.02,y=43.82,label="长春") +
  annotate("text",x=127.48,y=45.80,label="哈尔滨") +
  geom_point(x=position_lishu$lon,y=position_lishu$lat)+
  annotate("text",x=125.33,y=43.27,label="梨树站") 
p

p + theme(axis.title = element_blank()) +
  theme(axis.text = element_blank()) +
  theme(axis.ticks = element_blank()) +
  theme(panel.grid = element_blank()) +
  theme(panel.background = element_blank()) +
  theme(legend.position = "none") 


chinamap <- read_csv("china_mapdata.csv")
city_weather <- read_csv("city_weather_july.csv")
head(city_weather)

china_july_weather <- left_join(chinamap, city_weather, 
                                by = "city_name")
head(china_july_weather)

ggplot(china_july_weather, aes(x = prov_long, y = prov_lat,         
                               group = group, fill = temp_max)) +
  geom_polygon() +
  geom_path(colour = "grey") +
  geom_point(aes(city_long, city_lat), shape = 1) +
  scale_fill_gradient2(low = "green", mid = "yellow",        
                       high = "red", midpoint = 26)

ggplot(china_july_weather, aes(x = prov_long, y = prov_lat, 
                               group = group, fill = temp_min)) +
  geom_polygon() +
  geom_path(colour = "grey") +
  geom_point(aes(city_long, city_lat), shape = 1) +
  scale_fill_gradient2(low = "green", mid = "yellow", 
                       high = "red", midpoint = 18)

ggplot(china_july_weather, aes(x = prov_long, y = prov_lat, 
                               group = group, fill = rain)) +
  geom_polygon() +
  geom_path(colour = "grey") +
  geom_point(aes(city_long, city_lat), shape = 1) +
  scale_fill_gradient2(low = "green", mid = "yellow", 
                       high = "red", midpoint = 120)

ggplot(china_july_weather, aes(x = prov_long, y = prov_lat, 
                               group = group, fill = temp_max)) +
  geom_polygon() +
  geom_path(colour = "grey") +
  geom_point(aes(city_long, city_lat, size = rain, 
                 color = temp_min), shape = 1) +
  scale_color_gradientn(colours = rainbow(4)) +
  scale_fill_gradient2(low = "blue", mid = "lightblue",      
                       high = "darkgrey", midpoint = 26)
