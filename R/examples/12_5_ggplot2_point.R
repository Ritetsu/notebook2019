library(tidyverse)

weather <- read.csv("weather.csv")

ggplot(weather, aes(l_temp, h_temp)) +
  geom_point()

p <- ggplot(weather, aes(l_temp, h_temp)) 
p + geom_point(shape = 21) 

p + geom_point(aes(shape = rained))

p + geom_point(aes(shape = rained), size = 2.5) + 
  scale_shape_manual(values = c(5, 12)) 

p + geom_point(shape = 1, color = "red", fill = "blue", size = 3)  
p + geom_point(shape = 16, color = "red", fill = "blue", size = 3)  
p + geom_point(shape = 21, color = "red", fill = "blue", size = 3)  
p + geom_point(shape = 1, fill = "blue", size = 3) 
p + geom_point(shape = 16, fill = "blue", size = 3) 
p + geom_point(shape = 21, fill = "blue", size = 3) 

p1 <- p + geom_point(aes(shape = rained, color = rained, 
                         fill = rained), size = 2.5)  
p1 + scale_shape_manual(values = c(0, 14)) 

p1 + scale_shape_manual(values = c(15, 19))

p1 + scale_shape_manual(values = c(21, 25)) 

p2 <- p + geom_point(aes(shape = rained, fill = rained), 
                     color = "green", size = 2.5)  
p2 + scale_shape_manual(values = c(21, 25))

weather %>% filter(rained == "Yes") %>% 
  ggplot(aes(l_temp, h_temp, size = rainfall)) + 
  geom_point(shape = 21) 

p3 <- weather %>% filter(rained == "Yes") %>% 
  ggplot(aes(l_temp, h_temp, size = rainfall)) + 
  geom_point(shape = 21) 
p3 + stat_smooth() 

p3 + stat_smooth(se = F)

p3 + stat_smooth(method = lm, 
                       se = F)
p3 + annotate("text", 
              label = "r^2==0.90", 
              parse = T, x = 6, y = 25) 

weather %>% 
  ggplot(aes(day_num, ave_temp)) + 
  geom_point(aes(color = rainfall), size = 2.5) +
  scale_colour_gradient2(low = "blue", 
                         mid = "green",
                         high = "red", 
                         midpoint = 25)

year_temprain <- weather %>% 
  ggplot(aes(day_num, ave_temp)) + 
  geom_point(aes(color = rainfall), size = 2.5) +
  scale_colour_gradient2(low = "blue", 
                         mid = "green",
                         high = "red", 
                         midpoint = 25) +
  stat_smooth(se = F)

year_temprain

year_temprain <- year_temprain + 
  scale_x_continuous(limits = c(0, 365), breaks = c(0, 120, 240, 360))

year_temprain

year_temprain <- year_temprain + 
  xlab("Day number") +
  ylab("Mean temperature") 

year_temprain

mytheme <- theme_bw() +
  theme(legend.position = c(0.93, 0.85)) +		# 设定图例位置
  theme(axis.text = element_text(size = 10)) +    	# 设定坐标刻度标示字号
  theme(axis.title = element_text(size = 12)) +	# 设定坐标轴标题字号
  theme(panel.grid = element_blank()) 		# 把背景的网格都去掉

year_temprain_theme <- year_temprain + mytheme
year_temprain_theme

ggsave("year_temprain.png", width = 20, height = 16, units = "cm", dpi = 600)

ggsave("year_temprain1.png", 
       plot = year_temprain_theme,
       width = 20, 
       height = 16, 
       units = "cm", 
       dpi = 600)

maize <- read.csv("maize.csv")
head(maize)
dim(maize)

pmaize <- maize %>% 
  ggplot(aes(measured, predicted)) 
pmaize +  geom_point(shape = 19, 
                     color = "red", size = 5)

pmaize1 <- pmaize + geom_point(size = 5, shape = 21, 
         fill = "red", alpha = .2, position = position_jitter(width = 0.14, height = 0.14))

pmaize1

pmaize2 <- pmaize1 + stat_smooth(method = lm, se = F) +
  scale_x_continuous(limits = c(12, 24), breaks = c(12, 16, 20, 24)) +
  scale_y_continuous(limits = c(12, 24), breaks = c(12, 16, 20, 24)) +
  mytheme
pmaize2

ptemprain <- weather %>% filter(rained == "Yes") %>% 
  ggplot(aes(l_temp, h_temp, size = rainfall)) + 
  geom_point(shape = 19) 

ptemprain1 <- ptemprain + 
  xlab("Low temperature") +
  ylab("High temperature") +
  mytheme + 
  theme(legend.position = c(.2, .7))

ptemprain1
