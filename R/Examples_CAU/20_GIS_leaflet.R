library(leaflet)

m <- leaflet()
at <- addTiles(m)

leaflet() %>% 
  addTiles()%>%
  addMarkers(lng = 116.2752,lat = 40.0263, 
             popup = 'willnight')
