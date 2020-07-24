library(tidyverse)

weather <- read.csv("weather.csv")

p_facet <- weather %>% 
  ggplot(aes(l_temp, h_temp)) +
  geom_point() 

p_facet

p_facet + 
  expand_limits(x = 0, y = 0) + 	     
  geom_abline(intercept = 0, slope = 1)  

stu <- read.csv("student2018.csv")
stu <- stu %>% group_by(major) %>% summarise(num = n())
p_stu <- ggplot(stu, aes(x = reorder(major, num), y = num)) +
  geom_point(shape = 21, size = 4, fill = "red") +
  coord_flip() 

p_stu

p_stu + theme_bw() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey",
                                          linetype = 5,  # 设置横向粗网格的线型和粗细
                                          size = 0.6)) +
  xlab("专业") +  ylab("人数")

rootdata <- read.csv("root_rld.csv")

p_point_line <- ggplot(rootdata, aes(mean_rld, y,
                                     shape = factor(angle), color = factor(angle))) + 
  geom_point(size = 2) + 
  geom_path(size = 0.35) + 
  geom_errorbarh(aes(y = y, xmax = mean_rld + sd_rld, 
                     xmin = mean_rld - sd_rld), 	# 绘制误差棒
                 height = 1, size = 0.5) + 
  facet_wrap(~cultivar)		# 分面

p_point_line

p_point_line <- p_point_line +
  scale_color_hue(name = "Lateral angle") +
  scale_shape_manual(name = "Lateral angle", values = c(19, 1)) +
  scale_y_continuous(limits = c(-50, 0),
                     breaks = c(0, -10, -20, -30, -40, -50),
                     labels = c(0, 10, 20, 30, 40, 50)) 
p_point_line

p_point_line <- p_point_line +
  ylab("Depth (cm)") + xlab(expression(paste ("RLD (cm/",cm^3,")")))

p_point_line
