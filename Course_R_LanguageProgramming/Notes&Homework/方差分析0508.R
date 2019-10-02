library(multcomp)
View(litter)
table(dose)
aggregate(weight~dose,data=litter,Fun=mean)

#单因素协方差分析（ANCOVA）
install.packages("HH")
library(HH)
ancova(weight~gesttime+dose,data=litter)

#看协变量对组均值的影响，用effects()计算调整的均值【计算去除协变量效应后的组均值
install.packages("effects")
library(effects)
effect("dose",aov(weight~gesttime+dose,data=litter))

#假设检验评估-1正态性2同方差性（同ANOVA检验）3回归斜率同质性
summary(aov(weight~gesttime*dose,data=litter))#同时得到方差分析和同质性结果

#双因素方差分析1x~A+B,不考虑交互作用 2x~A+B+A:B考虑交互作用
juice <- read.csv("juice.csv")
juice$A <- factor(juice$A)
juice$B <- factor(juice$B)
#双因素方差分析
juice.aov <- aov(X~A+B,data=juice)
summary(juice.aov)#说明A4方法与其他方法差异不显著
#分别对A、B作方差的齐次性检验
bartlett.test(X~A,data=juice)
bartlett.test(X~B,data=juice)#作业，B的方差齐性没通过怎么办【用KW检验kruskal.test()？】

#双因素有交互方差分析（每一双因素水平组合下进行重复试验）
rats <- read.csv("rats.csv")
op <- par(mfrow=c(1,2))
plot(Time~Toxicant+Cure,data=rats)
#作交互作用图
interaction.plot(rats$Toxicant,rats$Cure,rats$Time,trace.label="Cure")
interaction.plot(rats$Cure,rats$Toxicant,rats$Time,trace.label="Toxicant")
#表
rats.aov <- aov(Time~Toxicant+Cure,data=rats)
summary(rats.aov)
#进一步进行齐次性检验，2种方法哦
install.packages("car")
library(car)
leveneTest(rats$Time,rats$Toxicant)
bartlett.test(Time~Toxicant,data=rats)

#homework2；双因素方差分析，无交互
data_1 <- read.csv("homework2_0508.csv")
'data_1$Brand <- factor(data_1$Brand)
data_1$Place <- factor(data_1$Place)'
plot(Number~Brand+Place,data=data_1)
interaction.plot(data_1$Place,data_1$Brand,data_1$Number,trace.label="Brand")
interaction.plot(data_1$Brand,data_1$Place,data_1$Number,trace.label="Place")
data_1.aov <- aov(Number~Place+Brand,data=data_1)
summary(data_1.aov)
bartlett.test(Number~Place,data=data_1)
bartlett.test(Number~Brand,data=data_1)
#homeword3；双因素方差分析，有交互
data_2 <- read.csv("homework3_0508.csv")
plot(Pressure~Method+Time,data=data_2)
interaction.plot(data_2$Method,data_2$Time,data_2$Pressure,trace.label = "Time")
interaction.plot(data_2$Time,data_2$Method,data_2$Pressure,trace.label = "Method")
data_2.aov <- aov(Pressure~Method*Time,data=data_2)
summary(data_2.aov)
#方差齐性检验
bartlett.test(Pressure~Method,data=data_2)
bartlett.test(Pressure~Time,data=data_2)#不符合方差齐性，用KW法？
leveneTest(Pressure~Method,data=data_2)
leveneTest(Pressure~Time,data=data_2)
#kruskal.test(Pressure~Time,data=data_2)
#homework1；
library(ggplot2)
head(PlantGrowth)
plot(PlantGrowth$group,PlantGrowth$weight)#箱线图
ggplot(data=PlantGrowth,aes(group,weight))+geom_point()#ggplot绘制散点图
#完整的报告：一题目二分析过程：根据数据判断用什么方法三代码展示，包括方法和假设/齐次性等
#四结果分析 五结论
ctrl <- filter(PlantGrowth,PlantGrowth$group=='ctrl')
trt1 <- filter(PlantGrowth,PlantGrowth$group=="trt1")
trt2 <- filter(PlantGrowth,PlantGrowth$group=="trt2")
qqnorm(ctrl$weight)
qqline(ctrl$weight)
qqnorm(trt1$weight)
qqline(trt1$weight)
qqnorm(trt2$weight)
qqline(trt2$weight)#绘制qq图判断正态性
shapiro.test(PlantGrowth[which(PlantGrowth[,2]=="ctrl"),]$weight)
shapiro.test(PlantGrowth[which(PlantGrowth[,2]=="trt1"),]$weight)
shapiro.test(PlantGrowth[which(PlantGrowth[,2]=="trt2"),]$weight)
#正态性检验后均大于0.05，接下来方差齐性检验
leveneTest(weight~group,data=PlantGrowth)
#查看离群点
library(car)
outlierTest(aov(weight~group,data=PlantGrowth))
aov.model <- aov(weight~group, data=PlantGrowth)
summary(aov.model)
plot(weight~group, data=PlantGrowth)
