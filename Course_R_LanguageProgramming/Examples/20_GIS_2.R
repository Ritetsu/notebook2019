library(tidyverse)

library(maps)
library(maptools)
library(mapproj)

library(REmap)


chinamap_shp <- readShapePoly("bou2_4p.shp") 

plot(chinamap_shp)

ggplot(chinamap_shp, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "white", colour = "grey")

chinamap_shp_df <- fortify(chinamap_shp)
# fortify为ggplot2函数

class(chinamap_shp)
class(chinamap_shp_df)
head(chinamap_shp_df)
tail(chinamap_shp_df)

chinamap_dbf <- chinamap_shp@data
head(chinamap_dbf)
tail(chinamap_dbf)

attributes(chinamap_dbf$NAME)

nrow(chinamap_shp)
nrow(chinamap_dbf)

# 给dbf数据加上id 
chinamap_dbf_id <- data.frame(chinamap_dbf, id=seq(0:924)-1)
head(chinamap_dbf_id)
tail(chinamap_dbf_id)

# 为与shp数据的id类型一致，转换为字符串
chinamap_dbf_id$id <- as.character(chinamap_dbf_id$id)

chinamapdata <- left_join(chinamap_shp_df, 
                          chinamap_dbf_id, by = "id")
head(chinamapdata)

chinamap_data <- select(chinamapdata, 
                        prov_name = NAME, prov_long = long, prov_lat = lat, 
                        order, id, group, prov_area = AREA)
head(chinamap_data)

prov_city <- read.csv("prov_city_names.csv", 
                      stringsAsFactors = FALSE)
head(prov_city)

prov_city_pos <- get_geo_position(prov_city$city_name)
head(prov_city_pos)

prov_city_pos <- select(prov_city_pos,city_name = city,    
                        city_long = lon, city_lat = lat)
head(prov_city_pos)


provcity <- left_join(prov_city, prov_city_pos, by = "city_name")
head(provcity)

chinamap_data$prov_name <-   
  as.character(chinamap_data$prov_name)

china_mapdata <- left_join(chinamap_data, provcity, 
                           by = "prov_name")
head(china_mapdata)
