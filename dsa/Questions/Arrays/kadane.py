def maxSubArraySum(a,n):
    best = a[0]
    current = best
    for i in a:
        if current<0:
            current = i
        else:
            current = current + i
        if current>best:
            best=current
    return best
