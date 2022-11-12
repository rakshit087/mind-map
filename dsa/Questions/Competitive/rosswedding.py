def helper(p,q,o,z):
    if(p==o and q==z):
        return true
    d1=o-p
    d2=z-q
    if (d1<0 or d2<0):
        return false
    if (d1%2==0 and d2%2==0):
        return true
    else:
        return false

for _ in range(int(input())):
    n = int(input())
    p = abs(int(input()))
    q = abs(int(input()))
    s = input()
    x,y,flag = 0,0,1
    for e in s:
        if (e == '0'):
            flag*=-1
        if (flag==1):
            x+=1
        else:
            y+=1
    if (helper(p,q,x,y) or helper(q,p,x,y)):
        print("YES")
    else:
        print("NO")
