k=0
a=str(input())
b=str(input())
for i in range(1,len(a)+1):
    if b.startswith(a[-i:]):
        k=i
        continue
print(a[:-k]+b) if k!=0 else print("")
