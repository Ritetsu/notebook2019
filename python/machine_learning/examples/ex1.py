import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
path='ex1data1.txt'
data=pd.read_csv(path,header=None,names=['Population','Profits'])
data.head()
data.describe()

data.plot(kind='scatter',x='Population',y='Profits',figsize=(12,8))
plt.show()

def computeCost(X,y,theta):
    inner=np.power(((X*theta.T)-y),2)
    return np.sum(inner)/(2*len(X))
data.insert(0,'Ones',1)
cols=data.shape[1]#shape0是列数，shape1是行数
X=data.iloc[:,0:cols-1]
y=data.iloc[:,cols-1:cols]

X=np.matrix(X.values)
y=np.matrix(y.values)
theta=np.matrix(np.array([0,0]))

computeCost(X,y,theta)

#batch gradient decent批量梯度下降
def gradientDescent(X,y,theta,alpha,iters):
    temp=np.matrix(np.zeros(theta.shape))#ravel展平到一行
    parameters=int(theta.ravel().shape[1])#有几个theta
    cost=np.zeros(iters)#储存每次迭代的cost
    
    for i in range(iters):
        error=(X*theta.T)-y
        for j in range(parameters):
            term=np.multiply(error,X[:,j])
            temp[0,j]=theta[0,j]-((alpha/len(X))*np.sum(term))
        theta=temp
        cost[i]=computeCost(X,y,theta)        
    return theta,cost
alpha=0.01
iters=1000
g,cost=gradientDescent(X,y,theta,alpha,iters)
g;cost#g就是模型的theta值
computeCost(X,y,g)#训练模型的代价
#绘图看拟合情况
x=np.linspace(data.Population.min(),data.Population.max(),100)
f=g[0,0]+(g[0,1]*x)#y=ax+b
fig,ax=plt.subplots(figsize=(12,8))
ax.plot(x,f,'r',label='Prediction')
ax.scatter(data.Population,data.Profits,label='Traning Data')
ax.legend(loc=2)
ax.set_xlabel('Population')
ax.set_ylabel('Profits')
ax.set_title('Predicted Profits vs.Population Size')
plt.show()
#绘制代价降低情况
fig,bx=plt.subplots(figsize=(12,8))
bx.plot(np.arange(iters),cost,'r')
bx.set_xlabel('Iterations')
bx.set_ylabel('Cost')
bx.set_title('Error vs. Training Epoch')
plt.show()

#多变量线性回归情况
path2='ex1data2.txt'
data2=pd.read_csv(path2,header=None,names=['Size','Bedrooms','Price'])
data2.head()
#特征归一化
data2=(data2-data2.mean())/data2.std()
data2.head()
#加上“1”列
data2.insert(0,'Ones',1)
cols=data2.shape[1]
X2=data2.iloc[:,0:cols-1]
y2=data2.iloc[:,cols-1:cols]
X2=np.matrix(X2.values)
y2=np.matrix(y2.values)
theta2=np.matrix(np.array([0,0,0]))
g2,cost2=gradientDescent(X2,y2,theta2,alpha,iters)
computeCost(X2,y2,g2)
#快速查看一下训练过程
fig,ax=plt.subplots(figsize=(12,8))#(111,figsize=...)
ax.plot(np.arange(iters),cost2,'r')
ax.set_xlabel('Iterations')
ax.set_ylabel('Cost')
ax.set_title('Error vs. Training Epoch')
plt.show()

#直接用scikit-learn
from sklearn import linear_model
model=linear_model.LinearRegression()
model.fit(X,y)
x=np.array(X[:,1].A1)#什么意思？
f=model.predict(X).flatten()
fig,ax=plt.subplots(figsize=(12,8))
ax.plot(x,f,'r',label='Prediction')
ax.scatter(data.Population,data.Profits,label='Traning Data')
ax.legend(loc=4)#1234为四个角落
ax.set_xlabel('Population')
ax.set_ylabel('Profit')
ax.set_title('Predicted Profit vs. Population Size')
plt.show()

#正规方程法
def normalEqn(X,y):
    theta=np.linalg.inv(X.T@X)@X.T@y#X.T@X即X.T.dot(X)
    return theta
theta3=normalEqn(X,y)
theta3
g#与梯度下降对比一下