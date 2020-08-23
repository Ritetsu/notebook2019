library(cowplot)

trees <- read.csv("trees.csv")

ptrees <- ggplot(trees, aes(age, circ, color = factor(num))) +
  geom_line(size = 1.2) + geom_point(size = 4)

ptrees <- ptrees + theme_bw() + 
  theme(legend.position = "none") 

ptrees


soilproperty <- read.csv("soilproperty.csv")
head(soilproperty)
soilproperty %>% select(N:Mo) %>% 
  gather(key = element, value = content) -> se_narrow 
  

pse <- ggplot(se_narrow, aes(element, content)) + 
  geom_boxplot()
pse <- pse + scale_y_log10()  
pse <- pse + theme_bw()  + 
  theme(legend.position = "none") 

pse


weather <- read.csv("weather.csv")

prain <- ggplot(weather, aes(day_num, rainfall, color = season)) +
  geom_col()
prain <- prain + theme_bw() + theme(legend.position = "none")

prain

ptemp <- ggplot(weather, aes(l_temp, h_temp, color = rained)) +
  geom_point(size = 3) +
  stat_smooth() +
  theme_bw() + theme(legend.position = "none") 

ptemp


plot_grid(ptrees, pse, prain, ptemp, 
          labels = c("A", "B", "C", "D"), 
          ncol = 2)

plot_grid(ptrees, pse, prain, ptemp, 
          labels = c("A", "B", "C", "D"), 
          ncol = 2, 
          label_x = .55,
          label_y = .95)

ggdraw() +
  draw_plot(ptrees, x = 0, y = .5, width = .5, height = .5) +
  draw_plot(ptemp, x = .5, y = .5, width = .5, height = .5) +
  draw_plot(prain, x = 0, y = 0, width = 1, height = 0.5) +
  draw_plot_label(label = c("A", "B", "C"), size = 15,
                  x = c(0, 0.5, 0), y = c(1, 1, 0.5))

ggdraw() +draw_plot(ptrees,0,0,1,1)+
  draw_plot(prain,0.1,0.55, 0.3,0.4)

