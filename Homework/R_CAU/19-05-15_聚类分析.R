install.packages('factoextra')
#1.选择变量 2.标准化数据（标准化），常用scale() 3.寻找异常点 ...
#层次聚类→对小样本使用，但效率非常低（每个数据为一类，分别计算与其他的距离
install.packages('flexclust')
library('flexclust')
data(nutrient)
row.names(nutrient) <- tolower(row.names(nutrient))
head(nutrient)
nutrient_scaled <- scale(nutrient)
#先计算距离
d <- dist(nutrient_scaled)
#先不考虑分类数，层次聚类
fit_average <- hclust(d,method="average")
plot(fit_average,hang=-1,main="Average Linkage Clustering")
#Q：取合并距离为4，分成几类？
#快速聚类K-means，先给一个粗略分类，然后根据某种原则判断分类，不合理就用某种规则修改，直到结果合理

k_means <- kmeans(d,3)
library(factoextra)
fviz_cluster(k_means,nutrient)

###判别分析（非编码区预测？
install.packages('MASS')
library('MASS')
data(iris)
head(iris)
colnames(iris) <- tolower(colnames(iris))
head(iris)
ld <- lda(species~sepal.length+sepal.width+petal.length+petal.width,data=iris)
p_iris <- predict(ld)
new_class <- p_iris$class
cbind(iris$species,new_class,p_iris$x)#可以看误判
table(iris$species,p_iris$class)#展现预测结果

#聚类分析 作业2红酒
install.packages('rattle')
library('rattle')
data(wine)
head(wine)
colnames(wine) <- tolower(colnames(wine))
head(wine)
wine <- wine[,-c(1)]#去不掉type？
wine_num <- wine
#wine_num <- as.numeric(wine)
head(wine_num)
wine_scaled <- scale(wine_num)
wine_d <- dist(wine_scaled)
k_means <- kmeans(wine_d,3)
library(factoextra)
fviz_cluster(k_means,wine)#画不出图？
#用pam法分析：
install.packages('cluster')
library(cluster)
pam(wine_d,3)
#聚类分析 作业1
