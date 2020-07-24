n=int(input())
def hano(n,a,b,c):
    if n==1:
        print("{}-->{}".format(a,c),end=" ")
    else:
        hano(n-1,a,c,b)
        print("{}-->{}".format(a,c),end=" ")
        hano(n-1,b,a,c)
hano(n,"A","B","C")
