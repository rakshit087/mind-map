class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:
        i = 0
        j = 0
        ans = float("inf")
        sum = 0
        while j < len(nums):
            sum += nums[j]
            if sum < target:
                j += 1
                continue
            elif sum >= target:
                while sum >= target:
                    ans = min(ans,j-i+1)
                    sum -= nums[i]
                    i += 1
                j += 1
        if ans == float("inf"):
            return 0
        else:
            return ans
                
        
