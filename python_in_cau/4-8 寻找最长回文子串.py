S=str(input())
rS=S[::-1]
sonS=[]
indexSon=[]
lensonS=[]

for i in range(len(S)+1):
    for j in range(1,len(S)+1):
        if rS[i:j] in S:
            sonS.append(rS[i:j])
        else:continue
while"" in sonS:
    sonS.remove("")
for i in sonS:
    lensonS.append(len(i))
indexofAim=lensonS.index(max(lensonS))
print(sonS[indexofAim])
