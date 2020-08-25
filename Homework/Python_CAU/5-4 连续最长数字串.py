string=str(input())
a=[]
for i in string:
    if 48>ord(i) or ord(i)>57:
        string=string.replace(i," ")

num=string.split(" ")

for i in num:
    a.append(i)
    
max_index=0
for j in range(1,len(a)-1):
    if len(str(a[j]))>len(str(a[max_index])):
        max_index=j

"""for j in range(len(a)):
    if len(str(a[j]))==len(str(a[max_index])) and a[j]!=a[max_index]:
        print(a[j])"""
        
print(a[max_index])
