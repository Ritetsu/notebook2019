# -*- coding: utf-8 -*-
"""
Created on Sun Apr 21 22:21:09 2019

@author: LiZhe
"""

import pandas as pd
d=-2#gap penalty=-2
#引入打分矩阵
sub_matrix=pd.read_excel('blosum62.xls',header=None)
#看一下
print(sub_matrix)
#定义匹配得分函数
def match_score(a,b):
    for i in range(1,21):
        for j in range(1,21):
            if (a+b)==(sub_matrix.iloc[0,i]+sub_matrix.iloc[j,0]):
                return(sub_matrix.iloc[j,i])
#处理输入的序列
rawseq1=str(input())#SPARKLE
rawseq2=str(input())#TACKLE
seq1="//"+rawseq1
seq2="//"+rawseq2

#生成空的目标表格
aim=pd.DataFrame([[0 for i in range(len(seq1))] for j in range(len(seq2))])
#加入参比序列
for i in range(0,len(seq1)):
    aim.iloc[0,i]=seq1[i]
for j in range(0,len(seq2)):
    aim.iloc[j,0]=seq2[j]
#填补初始gap penalty
for i in range(2,len(seq1)):
    aim.iloc[1,i]=(i-1)*d
for j in range(2,len(seq2)):
    aim.iloc[j,1]=(j-1)*d
#print(aim,end="\n\n")
#计算比对得分
for i in range(2,len(seq1)):
    for j in range(2,len(seq2)):
        aim.iloc[j,i]=max(
                aim.iloc[j-1,i-1]+match_score(aim.iloc[0,i],aim.iloc[j,0]),
                aim.iloc[j-1,i]+d,
                aim.iloc[j,i-1]+d
                )
#回溯
def back_tracing(j,i):
            if i!=1 and j!=1:
                if aim.iloc[j,i]==aim.iloc[j-1,i-1]+match_score(aim.iloc[0,i],aim.iloc[j,0]):
                    print(aim.iloc[j-1,i-1],end=" ")
                    return(back_tracing(j-1,i-1))
                    
                elif aim.iloc[j,i]==aim.iloc[j-1,i]+d:
                    print(aim.iloc[j-1,i],end=" ")
                    global rawseq1
                    rawseq1=rawseq1[:i-1]+'-'+rawseq1[i-1:]
                    return(back_tracing(j-1,i))
                    
                elif aim.iloc[j,i]==aim.iloc[j,i-1]+d:
                    print(aim.iloc[j,i-1],end=" ")
                    global rawseq2
                    rawseq2=rawseq2[:j-1]+'-'+rawseq2[j-1:]
                    return(back_tracing(j,i-1))
#美化输出结果
print("\nResult Matrix:\n{}".format(aim))                    
print("\nTracing:")
back_tracing(len(seq2)-1,len(seq1)-1)
print("\n\nAlignment:\n{}\n{}\n\nRaw Score:\n{}".format(rawseq1,rawseq2,aim.iloc[len(seq2)-1,len(seq1)-1]))



