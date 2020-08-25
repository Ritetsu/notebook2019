#复习长宽表的转换
install.packages("cowplot")
library(tidyverse)
library(readxl)
dir_wind <- read_excel("season_winddir.xlsx")
dir_wind#宽表，日常所见的表
#变成适合ggplot作图的长表
library(tidyr)
dir_wind %>% gather(key=dir_wind,
                    value=dirvalue,2:5)->
dir_wind_narrow#通过右箭头把值赋给_narrow
#使用ggplot绘制图形
ggplot(dir_wind_narrow, aes(dir_wind, dirvalue, fill = season)) +
  geom_col(position = "dodge") 

#条状图
library(tiyverse)
weather <- read.csv("weather.csv")
p_bar <- weather %>% ggplot(aes(dir_wind,fill=season))
p_bar+geom_bar()
#调整条形图宽度
p_bar+geom_bar(width=0.3)
#百分比堆积条状图
p_bar+geom_bar(width=0.5,position="fill")+
  scale_y_continuous(breaks=c(0,0.2,0.4,0.6,0.8,1.0),
                     labels=c("0","20","40","60","80","100"))+
  ylab("%")#不是特别建议用这种图
#环状图形，风向图
library(tidyverse)
wind_dir <- read.csv("wind_dir.csv")
dim(wind_dir)
head(wind_dir)
summary(wind_dir)
ggplot(wind_dir,aes(wind_dir,fill=speed_rank))+
  geom_bar()+
  coord_polar()
#顺序更改
wind_dir$speed_rank <- factor(wind_dir$speed_rank, 
                              levels = c("5-10", 
                                         "10-15", 
                                         "15-20", 
                                         ">20"))
ggplot(wind_dir,aes(wind_dir,fill=speed_rank))+
  geom_bar()+
  coord_polar()
#从直方图来改进环形风向图
ggplot(wind_dir,aes(wind_dir,fill=speed_rank))+
  geom_histogram(binwidth = 15)#默认把x轴划分成30份，所以有空隙
#将环形的角度完善到360而不是270度
ggplot(wind_dir, aes(wind_dir, fill = speed_rank)) + 
  geom_histogram(binwidth = 15) + 
  coord_polar() + 
  scale_x_continuous(limits = c(0, 360), 
                     breaks = seq(0,360, by = 45)) +
  scale_fill_brewer(palette = "Set1")

#箱线图
library(ggplot2)
library(dplyr)
weather <- read.csv("weather.csv")
ave_temp <- weather %>% select(season, ave_temp)
#普通箱线图，按字母顺序
ggplot(ave_temp, aes(season, ave_temp)) +
  geom_boxplot() -> p_boxplot

p_boxplot 
#添加均值
p_boxplot + 
  stat_summary(fun.y = "mean", 
               geom = "point", shape = 21, 
               size = 3, fill = "red")
#添加凹槽
ggplot(ave_temp, aes(season, ave_temp)) +
  geom_boxplot(notch = T) 
#更改成小提琴图
ggplot(ave_temp, aes(season, ave_temp)) +
  geom_violin()

weather <- read.csv("weather.csv")
#变长表
weather_temp <- weather %>% select(day_num, season, l_temp, h_temp) %>% 
  gather(key = lh_temp, value = temp, l_temp:h_temp) 
#分组显示最高气温和最低气温
p_boxplot <- ggplot(weather_temp, aes(season, temp, color = lh_temp)) +
  geom_boxplot() + 
  stat_summary(fun.y = mean, geom = "point",
               size = 0.5, shape = 4,
               position = position_dodge(width = 0.5)) 
p_boxplot 

#分面图

#homework1
library(nycflights13)
weather_f <- filter(weather,month>5&month<9)
weather_f$origin <- factor(weather_f$origin, 
                              levels = c("EWR", 
                                         "JFK", 
                                         "LGA"))
p_facet <- weather_f %>% ggplot(aes(temp,
                                  dewp))+
  geom_point()
p_facet+theme_bw()+facet_grid(month~origin)

#homework2
airquality_s <- select(airquality,Temp,Wind,Solar.R,Month,Ozone,date)
airquality_p <- ggplot(airquality_s,aes(Temp,Wind,size=Solar.R))+
  geom_point(aes(fill=Solar.R),shape=21)+theme_bw()+theme(legend.position = "none")
airquality_p
airquality_s$Month <- factor(airquality_s$Month,
                             level=c("5","6",
                                     "7","8","9"))
Ozone <- ggplot(airquality_s,aes(Month,Ozone))+
  geom_boxplot()+theme_bw()
Ozone
library(lubridate)
airquality_date <- mutate(airquality,Date=(airquality$Month*30)+airquality$Day)
airquality_date
Temp <- ggplot(airquality_date,aes(Date,Temp))+
  geom_line(size=1)+theme_bw()+
  scale_x_continuous(breaks=c(151,181,211,241,271,289),
                     labels=c("5月","6月","7月","8月","9月","10月"))
Temp
#开始拼接！
library(cowplot)
ggdraw()+
draw_plot(airquality_p,x=0,y=.5,width=.5,height=.5)+
draw_plot(Ozone,x=.5,y=.5,width=.5,height=.5)+
draw_plot(Temp,x=0,y=0,width=1,height=.5)+
  draw_plot_label(label=c("A","B","C"),size=15,
                  x=c(0,0.5,0),y=c(1,1,0.5))
