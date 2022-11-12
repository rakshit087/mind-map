def pivot(self, arr, m):
    j = 0
    for i in range(1, m):
        if(arr[i] <= arr[j]):
           arr[j], arr[i] = arr[i], arr[j]
           j += 1
        else:
            break

def merge(self, arr1, arr2, n, m):
    for i in range(n):
        if arr1[i] > arr2[0]:
            arr1[i], arr2[0] = arr2[0], arr1[i]
            pivot(arr2, m)
    return arr1,arr2  
