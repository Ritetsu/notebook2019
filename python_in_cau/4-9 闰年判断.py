def run(year):
    if (year%100==0 and year%400==0) or (year%4==0 and year%100!=0):
        return 366
    else:
        return 365
n=int(input())
print(run(n))
