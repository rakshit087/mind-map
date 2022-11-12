class Solution:
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        merged_array = nums1+nums2
        merged_array.sort()
        n = len(merged_array)
        if(n%2==0):
            return (merged_array[(n//2)-1]+merged_array[n//2])/2
        else:
            return merged_array[n//2]
            
            
