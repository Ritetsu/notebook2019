#因变量与一个或多个其他变量之间的关系：一元/多元回归分析
#1一元线性回归的R实现
df_lb <- read.csv('LA_biomass.csv')#导入数据
plot(biomass~LA,data=df_lb)#画散点图
#line(df_lb$biomass~df_lb$LA)
fitlm_lb <- lm(biomass~LA+0,data=df_lb)#建立y关于x的回归方程
summary(fitlm_lb)
#F值和p-value说明回归方程是否显著，intercept的p-value表示截距是否显著（如何去除截距？LA+0
#作业1：如何在图中添加回归线？
#决定系数R2 和 校正后的R2

#2 e.g.多元线性回归的R实现
df_cd <- read.csv('ClimateData.csv')
fitlm_cd <- lm(y~x1+x2+x3+x4+x5+x6,data=df_cd)#+0?
summary(fitlm_cd)
#p-value很大的自变量说明什么？

#逐步回归思想→建模时引入的x2,x3等变量影响不大，应该剔除
#3 e.g.逐步回归
df_cd <- read.csv('ClimateData.csv')
fitlm_cd <- lm(y~x1+x2+x3+x4+x5+x6,data=df_cd)#+0
summary(fitlm_cd)
#用“一切子集回归法”进行逐步回归
steplm_cd <- step(fitlm_cd,direction='both')#backward是向后法，forward是向前法
summary(steplm_cd)
#作业2：结果如何解释？（得到最优回归方程

#得到线性回归模型后，需要进行验证和诊断（1.模型的基本假定2.异常点3.影响点。
#R中残差计算方法：residuals(),rstandard(),rstudent()
y_res <- residuals(steplm_cd)
y_rst <- rstandard(steplm_cd)
print(y_res)
print(y_rst)#可以看出数据中的异常点，如12号数据
#计算预测值
y_fit <- predict(steplm_cd)
#绘制残差散点图
plot(y_res~y_fit)
plot(y_rst~y_fit)#可以看出来在y_rsr=0附近随机波动,说明方差齐次性还可以
#如果齐次性不满足呢？→进行指数对数等的变换√

#方差稳定变换（对数变换）
fitlm_cd_new <- lm(log(y)~x1+x2+x3+x4+x5+x6,data=df_cd[-c(3,12,6,8),])
#去除某个点，data=df_cd[-c(3,12),]→去除了第3和第12个点(相当于第3和第12行全部数据)
steplm_cd_new <- step(fitlm_cd_new)
#回归分析诊断图
par(mfrow=c(2,2))
plot(steplm_cd_new)
influence.measures(steplm_cd_new)#结果中标有*的被认为是强影响点
#异常值应当谨慎删除，要看新的模型效果是否更好

#回归预测
preds <- data.frame(x1=29,x2=1,x3=9,x4=2,x5=6,x6=265)
predict(steplm_cd,newdata=preds,interval='prediction',level=0.95)



#作业1 简单线性回归
Nweight <- read.csv("la_homework01.csv")
Nweight_01 <- lm(N~weight,data=Nweight)
summary(Nweight_01)
#作业2 多元线性逐步回归
xiaomai <- read.csv("la_homework02.csv")
xiaomai_01 <- lm(y~x1+x2+x3+x4,data=xiaomai)
summary(xiaomai_01)
xiaomai_02 <- step(xiaomai_01,direction='both')
summary(xiaomai_02)
#作业3 交互
shuidao <- read.csv("la_homework03.csv")
