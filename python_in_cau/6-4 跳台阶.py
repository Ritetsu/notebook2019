'''n=int(input())
def jump(num):
    if num==1:
        return 1
    if num==2:
        return 2
    else:
        return jump(num-1)+jump(num-2)
print(jump(n))'''

n=int(input())
def jump(num):
    a=1
    b=2
    c=3
    if num==1 or num==2:
        return num
    else:
        for i in range(3,num+1):
            c=a+b
            a=b
            b=c
        return c
print(jump(n))
