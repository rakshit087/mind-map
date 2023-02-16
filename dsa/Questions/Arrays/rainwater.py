class Solution:
    def trap(self, height: List[int]) -> int:
        max_r, max_l, p_r, p_l = 0, 0, len(height)-1, 0
        print(p_l)
        mizu = 0
        while(p_l<=p_r):
            if height[p_l]<=height[p_r]:
                if(height[p_l]>=max_l):
                    max_l = height[p_l]
                else:
                    mizu+=(max_l-height[p_l])
                p_l+=1
            else:
                if(height[p_r]>=max_r):
                    max_r = height[p_r]
                else:
                    mizu+=(max_r-height[p_r])
                p_r-=1
        return mizu
