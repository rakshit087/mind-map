for _ in range(int(input())):
    n = int(input())
    a = list(map(int, input().strip().split()))
    b = [i for i in a if i%2]
    print(*b)