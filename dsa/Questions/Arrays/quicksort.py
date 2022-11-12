def partition(start,end,array):
    pivot = start
    while start<end:
        #We run the loop until start becomes out of bound or if we find element bigger than pivot
        while start<len(array)-1 and array[start]<array[pivot]:
            start+=1
        while array[end] > pivot:
            end-=1
        #Swap start and end
        if(start < end):
            array[start], array[end] = array[end], array[start]
        #Puts pivot on its correct sorted place.
        array[end], array[pivot] = array[pivot], array[end]
    return end

def quickSort(start, end, array):
    if(low<high):
         p = partition(start, end, array)
         #Sort the array before partition
         quickSort(start,p-1,array)
         quickSort(p+1,end,array)
