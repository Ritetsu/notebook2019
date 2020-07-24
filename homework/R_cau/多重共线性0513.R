#减少变量的过程也消除了一部分共线性
install.packages("car")
install.packages("ridge")
install.packages("pls")
#car包里的influencePlot()函数能一次性同时检查离群点，强影响点和高杠杆点
#1 e.g.以ClimateData为例
df_cd <- read.csv('ClimateData.csv')
fitlm_cd <- lm(y~x1+x2+x3+x4+x5+x6,data=df_cd)#+0?
steplm_cd <- step(fitlm_cd)
influencePlot(fitlm_cd,id.method = "identity", main = "Influence Plot", sub = "Circle size is proportional to Cook's distance")


#多元线性回归假设验证的另一种方法：gvlma包的gvlma()函数
#2 e.g.检验ClimateData数据集的多重共线性
library(car)
df_cd <- read.csv('ClimateData.csv')
fitlm_cd <- lm(y~x1+x2+x3+x4+x5+x6,data=df_cd)#+0?
steplm_cd <- step(fitlm_cd)
#检验多重共线性
vif(fitlm_cd)
vif(steplm_cd)#逐步回归后，无多重共线性

#强共线性如何解决？
str(longley)#查看其数据结构
lm_long <- lm(GNP.deflator~.,data=longley)
summary(lm_long)
#用方差膨胀因子VIF衡量共线性
library(car)
vif(lm_long,digits=3)
#用cor()函数查看各自变量间的相关系数
plot(longley[,2:7])
cor(longley[,2:7])
#用岭回归处理多重共线性问题
library(ridge)
a <- linearRidge(GNP.deflator~.,data=longley)
summary(a)
#用偏最小二乘回归处理多重共线性问题
library(pls)
ap=plsr(GNP.deflator~.,data=longley)
summary(ap)
RMSEP(ap)
MSEP(ap)
R2(ap)
coef(ap)
par(mfrow=c(1,3))
plot(RMSEP(ap))
plot(MSEP(ap))
plot(R2(ap))
