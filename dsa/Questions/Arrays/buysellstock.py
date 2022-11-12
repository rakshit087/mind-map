class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        mx, mn = 0, float('inf')
        for i in prices:
            mn = min(mn, i)
            profit = i - mn
            mx = max(mx, profit)
        return mx
            
        
        