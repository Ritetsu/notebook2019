import math as m
n=int(input())
a=[]
b=[]
c=[]
for i in range(1000):
    a.append(i)

for i in a:
    k=0
    for j in range(2,int(m.sqrt(i))+1):
        if i%j==0:
            k=1
            break
    if k==0 and i!=0 and i!=1:
        b.append(i)

for i in b:
    if int(str(i)[::-1]) in b:
        c.append(i)

for i in range(n):
    print(c[i],end=" ")
        
    
