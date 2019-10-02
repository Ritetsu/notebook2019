library(ggplot2)

weather <- read.csv("weather.csv")

ggplot(weather, aes(season, fill = dir_wind)) +
  geom_bar(position = "dodge") 

p_weather <- ggplot(weather, aes(season, fill = dir_wind)) +
  geom_bar(position = "dodge") + 
  scale_fill_manual(values =  c("red","blue", "yellow", "green"))

p_weather

p_weather  + theme(legend.position = c(0.12, 0.88)) 

mytheme <- theme_bw() +
  theme(legend.position = c(0.93, 0.85)) +		# 设定图例位置
  theme(axis.text = element_text(size = 10)) +    	# 设定坐标刻度标示字号
  theme(axis.title = element_text(size = 12)) +	# 设定坐标轴标题字号
  theme(panel.grid = element_blank()) 		# 把背景的网格都去掉

p_weather + mytheme

