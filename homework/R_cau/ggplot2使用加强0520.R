##主题和标度
library(ggplot2)
weather <- read.csv("weather.csv")
ggplot(weather,aes(season,fill=dir_wind))+
  geom_bar(position="dodge")
#自己指定映射的颜色
p_weather <- ggplot(weather,aes(season,fill=dir_wind))+
  geom_bar(position="dodge")+scale_fill_manual(values=c("red","blue","yellow","green"))
p_weather
#主题theme:图例,设置图例位置
p_weather+theme(legend.position = c(0.12,0.88))
#建立自己的主题
mytheme <- theme_bw()+
  theme(legend.position = c(0.93,0.85))+
  theme(axis.text=element_text(size=10))+
  theme(axis.title=element_text(size=12))+
  theme(panel.grid=element_blank())
#把主题叠到图形里，成为自己主题样式的图
p_weather+mytheme

##颜色映射：离散型数据
#配色的数据准备
library(tidyverse)
weather <- read.csv("weahter.csv")
#把季节和风向转换为符合习惯的有序因子
weather$season <- factor(weather$season,
                         levels = c("spring", "summer",  "autumn", "winter"),
                         labels = c("Spring", "Summer", "Autumn", "Winter"))
weather$dir_wind <- factor(weather$dir_wind,
                           levels = c("E", "S", "W", "N"))
#设置填充、轮廓颜色
ggplot(weather,aes(dir_wind,group=season))+
  geom_bar(color="red",fill="lightblue",position="dodge")
#实现图形填充颜色的映射
p_wind <- weather %>% ggplot(aes(dir_wind)) +
  geom_bar(aes(fill = season), position = "dodge")
p_wind
#注：上映射的数据season是离散型，ggplot自动调用了颜色标度
#上述指令与下面两条等同
p_wind+scale_fill_discrete()
p_wind+scale_fill_hue()
#颜色映射的手动设定
p_wind+scale_fill_manual(values = c("blue", "green", "yellow", "red"))
#使用RColorBrewer包的调色板
library(RColorBrewer)
display.brewer.all()
p_wind + scale_fill_brewer(palette = "Set2")
#使用ggsci包的调色板
library(ggsci)
p_wind + scale_fill_lancet()
##颜色映射：连续型数据
#先准备数据并绘制基本图形
p_temp <- weather %>% ggplot(aes(l_temp, h_temp, fill = rainfall)) +
  geom_point(shape = 21, size = 3) 
p_temp
#上述相当于调用了缺省的连续数据颜色映射调色板，即：
p_temp+scale_fill_continuous()
#ggsi包也可以用于连续型
library(ggsci)
p_temp+scale_fill_material("red")
#效果更好的还有ggplot2提供的渐变调色板
p_temp+scale_fill_gradient(low="lightblue",high="red")
#还能设定三种区域的渐变
p_temp + scale_fill_gradient2(low = "green", mid = "red",
                              high = "blue", midpoint = 30)
#散点图
#折线图
#点线图

#homework1
data(airquality)
airquality_p <- mutate(airquality,date=as.Date(paste("2015",Month,Day,sep="-")))
head(airquality_p)
p_air <- ggplot(airquality_p,
       aes(date,Temp,size=Ozone))+geom_point(aes(fill=Solar.R),shape=21)
p_air+scale_fill_gradient(low="purple",high="red")
#homework2
weather <- read.csv("weather.csv")
head(weather)
weather_1 <- group_by(weather,month)
weather_2 <- summarise(weather_1,
                       ml_temp=mean(l_temp),
                       mh_temp=mean(h_temp))
head(weather_2)
library(tidyr)
weather_3 <- gather(weather_2,
                    key=temp,
                    value=mlh_temp,
                    2:3)
weather_3
p_point_line <- ggplot(weather_3,aes(month,mlh_temp,
                                     color=factor(temp),
                                     shape=factor(temp)))+
  geom_point(size=3)+
  geom_path(size=1)

p_point_line <- p_point_line+scale_x_continuous(limits = c(0, 12),
                                breaks = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12))+
  scale_color_hue(name="temp")+
  scale_shape_manual(name = "temp",values=c(15,17))+
  theme_bw()+
  theme(legend.position=c(0.2,0.8))+
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_blank())
p_point_line
ggsave("20190520_homework2.png", plot=p_point_line,
       height=12, width=22, units="cm", dpi=600)
