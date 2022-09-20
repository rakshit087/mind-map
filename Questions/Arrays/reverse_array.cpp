class Solution {
public:
    void rotate(vector<int>& nums, int k) {
        int n = nums.size();
        k = k % n;
        vector<int> v1(n-k);
        vector<int> v2(k);
        for(int i=0; i<n;i++){
            if(i<n-k){
                v1.push_back(nums[i]);
            } else {
                v2.push_back(nums[i]);
            }
        }
        std::reverse(v1.begin(),v1.end());
        std::reverse(v2.begin(),v2.end());
        int counter1=0, counter2=0;
        for(int i=0; i<n; i++){
            if(i<n-k)
                nums[i] = v1[counter1++];
            else 
                nums[i] = v2[counter2++];
        }
        std::reverse(nums.begin(),nums.end());
    }
};