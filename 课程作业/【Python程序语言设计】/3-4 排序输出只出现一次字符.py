myStr=str(input())
myList=[]
for i in myStr:
    if myStr.count(i)==1:
        myList.append(i)
print(sorted(myList))