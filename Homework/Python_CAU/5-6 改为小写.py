strings=str(input())

def low_str(string):
    if len(string)>2:
        str1=string[1:-1]
        str1=str1.lower()
        string=string[0]+str1+string[-1]
        return(string)
    else:
        return(string)
    
group=strings.split(" ")
for i in group:
    print(low_str(i),end=" ")

