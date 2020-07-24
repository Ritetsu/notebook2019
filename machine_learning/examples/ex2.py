# -*- coding: utf-8 -*-
"""
Created on Mon Sep 16 20:15:55 2019

@author: Shinelon
"""
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

path='ex2data1.txt'
data=pd.read_csv(path,header=None,names=['Exam1','Exam2','Admitted'])
data.head()
#两个分数的散点图，并用颜色编码可视化
positive=data[data['Admitted'].isin([1])]
negative=data[data['Admitted'].isin([0])]
fig,ax=plt.subplots(figsize=(12,8))
#c=color；s表示图形大小，默认20
ax.scatter(positive['Exam1'],positive['Exam2'],c='b',marker='o',label='Admitted')
ax.scatter(negative['Exam1'],negative['Exam2'],c='r',marker='o',label='Unadimitted')
ax.legend(loc=4)
ax.set_xlabel('Exam1 Score');ax.set_ylabel('Exam2 Score')
plt.show()#可见两类间有一个清晰分界

#sigmoid函数
def sigmoid(z):
    return 1/(1+np.exp(-z))#exp)-z)即e的-z次方
#检验/观察一下sigmoid函数
nums=np.arange(-10,10,1)
fig,ax=plt.subplots(figsize=(12,8))
ax.plot(nums,sigmoid(nums),'r')
plt.show()

def cost(theta,X,y):
    theta=np.matrix(theta)
    X=np.matrix(X)
    y=np.matrix(y)
    first=np.multiply(-y,np.log(sigmoid(X*theta.T)))
    second=np.multiply((1-y),np.log(1-sigmoid(X*theta.T)))
    return np.sum(first-second)/len(X)
data.insert(0,'ones',1)#在0列和1列间插入1
cols=data.shape[1]
X=data.iloc[:,0:cols-1]
y=data.iloc[:,cols-1:cols]
X=np.array(X.values)
y=np.array(y.values)
theta=np.zeros(3)
cost(theta,X,y)
def gradientDescent(theta,X,y):
    theta=np.matrix(theta)
    X=np.matrix(X)
    y=np.matrix(y)
    parameters=int(theta.ravel().shape[1])
    grad=np.zeros(parameters)
    error=sigmoid(X*theta.T)-y
    for i in range(parameters):
        term=np.multiply(error,X[:,i])
        grad[i]=np.sum(term)/len(X)
    return grad
gradientDescent(theta,X,y)#仅求了一次更新的theta
#用SciPy的TruncatedNewton寻找最优参数
import scipy.optimize as opt
result=opt.fmin_tnc(func=cost,x0=theta,fprime=gradientDescent,args=(X,y))
result#输出theta和代价
cost(result[0],X,y)
#建立预测函数
def predict(theta,X):
    probability=sigmoid(X*theta.T)
    return [1 if x>=0.5 else 0 for x in probability]
theta_min=np.matrix(result[0])#theta_min是1x3数组
predictions=predict(theta_min,X)
correct=[1 if((a==1 and b==1) or (a==0 and b==0))\
         else 0 for (a,b) in zip(predictions,y)]
accuracy=(sum(map(int,correct))/len(correct))
print('accuracy={}'.format(accuracy))#要注意这是训练集的精确度

path2='ex2data2.txt'
data2=pd.read_csv(path2,header=None,names=['Test1','Test2','Accepted'])
data2.head()
positive=data2[data2['Accepted'].isin([1])]
negative=data2[data2['Accepted'].isin([0])]
fig,ax=plt.subplots(figsize=(12,8))
ax.scatter(positive['Test1'],positive['Test2'],s=50,c='b',\
           marker='o',label='Accepted')
ax.scatter(negative['Test1'],negative['Test2'],s=50,c='r',\
           marker='x',label='Rejected')
ax.legend()
ax.set_xlabel('Test1 Score')
ax.set_ylabel('Test2 Score')
plt.show()
#非常复杂，没有线性界限；通过线性构造原始特征的多项式中的特征
degree=5
x1=data2['Test1']
x2=data2['Test2']
data2.insert(3,'ones',1)
for i in range(1,degree):
    for j in range(0,i):
        data2['F'+str(i)+str(j)]=np.power(x1,i-j)*np.power(x2,j)
data2.drop('Test1',axis=1,inplace=True)#axis=0为行，1为列；TRUE为在原数据上改动
data2.drop('Test2',axis=1,inplace=True)        
data2.head()
#正则化代价函数
def costReg(theta,X,y,learningRate):
    theta=np.matrix(theta)
    X=np.matrix(X)
    y=np.matrix(y)
    first=np.multiply(-y,np.log(sigmoid(X*theta.T)))
    second=np.multiply((1-y),np.log(1-sigmoid(X*theta.T)))
    reg=(learningRate/(2*len(X)))*np.sum(np.power(theta[:,1:theta.shape[1]],2))
    return np.sum(first-second)/len(X)+reg
#通过正则化参数加大对theta的惩罚
def gradientReg(theta,X,y,learningRate):
    theta=np.matrix(theta)
    X=np.matrix(X)
    y=np.matrix(y)
    parameters=int(theta.ravel().shape[1])
    grad=np.zeros(parameters)
    error=sigmoid(X*theta.T)-y
    for i in range(parameters):
        term=np.multiply(error,X[:,i])
        if(i==0):
            grad[i]=np.sum(term)/len(X)
        else:
            grad[i]=(np.sum(term)/len(X))+(learningRate/len(X))*theta[:,i]
    return grad#grad即theta
cols=data2.shape[1]
X2=data2.iloc[:,1:cols]
y2=data2.iloc[:,0:1]
X2=np.array(X2.values)
y2=np.array(y2.values)
theta2=np.zeros(11)
learningRate=1
costReg(theta2,X2,y2,learningRate)
gradientReg(theta2,X2,y2,learningRate)
result2=opt.fmin_tnc(func=costReg,x0=theta2,fprime=gradientReg,\
                     args=(X2,y2,learningRate))
result2
#查看杂训练数据上的准确度
theta_min=np.matrix(result2[0])
predictions=predict(theta_min,X2)
correct=[1 if ((a==1 and b==1) or (a==0 and b==0))\
         else 0 for (a,b) in zip(predictions,y2)]
accuracy=(sum(map(int,correct))/len(correct))
print('accuracy2={}%'.format(accuracy*100))
#用sklearn直接实现
from sklearn import linear_model
model=linear_model.LogisticRegression(penalty='l2',\
                                      C=1.0,solver='liblinear')
model.fit(X2,y2.ravel())
model.score(X2,y2)