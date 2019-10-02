# -*- coding: utf-8 -*-
"""
Created on Tue Sep 17 10:43:12 2019

@author: Shinelon
"""
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.io import loadmat
data3=loadmat('ex3data1.mat')
data3['X'].shape,data3['y'].shape

def sigmoid(z):
    return 1/(1+np.exp(-z))
def cost(theta,X,y,learningRate):
    theta=np.matrix(theta)
    X=np.matrix(X)
    y=np.matrix(y)
    first=np.multiply(-y,np.log(sigmoid(X*theta.T)))
    second=np.multiply((1-y),np.log(1-sigmoid(X*theta.T)))
    reg=(learningRate/(2*len(X)))*np.sum(np.power(theta[:,1:theta.shape[1]],2))
    return np.sum(first-second)/len(X)+reg
#向量化的梯度函数（与之前用loop不同
def gradient(theta,X,y,learningRate):
    theta=np.matrix(theta)
    X=np.matrix(X)
    y=np.matritx(y)
    parameters=int(theta.ravel().shape[1])
    error=sigmoid(X*theta.T)-y
    grad=((X.T*error)/len(X)).T+((learningRate/len(X))*theta)
    #注意theta0
    grad[0,0]=np.sum(np.multiply(error,X[:,0]))/len(X)
    return np.array(grad).ravel()
#多分类，k个不同类就有k个分类器
from scipy.optimize import minimize
def one_vs_all(X,y,num_labels,learning_rate):
    rows=X.shape[0]
    params=X.shape[1]
    
    #对于每个分类器都要有theta
    all_theta=np.zeros((num_labels,params+1))
    X=np.insert(X,0,values=np.ones(rows),axis=1)
    
    for i in range(1,num_labels+1):
        theta=np.zeros(params+1)
        y_i=np.array([1 if label == i else 0 for label in y])
        y_i=np.reshape(y_i,(rows,1))
        fmin=minimize(fun=cost,x0=theta,args=(X,y_i,learning_rate),method='TNC',jac=gradient)
        all_theta[i-1,:]=fmin.X
    return all_theta
rows=data3['X'].shape[0]
params=data3['X'].shape[1]
all_theta=np.zeros((10,params+1))
X=np.insert(data3['X'],0,values=np.ones(rows),axis=1)
theta=np.zeros(params+1)
y_0=np.array([1 if label==0 else 0 for label in data3['y']])
y_0=np.reshape(y_0,(rows,1))

def predict_all(X,all_theta):
    rows=X.shape[0]
    params=X.shape[1]
    num_labels=all_theta.shape[0]
    X=np.insert(X,0,values=np.ones(rows),axis=1)
    X=np.matrix(X)
    all_theta=np.matrix(all_theta)
    h=sigmoid(X*all_theta.T)
    h_argmax=np.argmax(h,axis=1)
    h_argmax=h_argmax+1
    return h_argmax

y_pre=predict_all(data3['X'],all_theta)
correct=[1 if a==b else 0 for (a,b) in zip(y_pre,data3['y'])]
accuracy=(sum(map(int,correct))/float(len(correct)))
print('accuracy={}'.format(accuracy))    