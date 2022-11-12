class Solution {
public:
    int maximumGap(vector<int>& nums) {
       int n=nums.size();
       if(n==1) return 0;
       else {
           int diff=0, tmp;
           sort(nums.begin(), nums.end());
           for(int i=0, j=1; i<n-1&&j<n; i++,j++) {
               tmp=abs(nums[i]-nums[j]);
               if(tmp>diff) diff=tmp;
           }
           return diff;
       }   
    }
};
