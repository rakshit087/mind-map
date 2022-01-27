class Solution
{
public:
    vector<int> singleNumber(vector<int> nums) 
    {
        // Code here.
        int n = nums.size();
        int XOR = nums[0];
        int mask,a=0,b=0;
        vector<int> sol;
        for(int i=1;i<nums.size();i++) XOR = XOR^nums[i];
        mask = XOR & ~(XOR - 1);
        for (int i = 0; i < n; i++) {
            if(nums[i]&mask)
                a=a^nums[i];
            else 
                b=b^nums[i];
        }
        if(a>b){
            sol.push_back(b);
            sol.push_back(a);
        } else {
            sol.push_back(a);
            sol.push_back(b);
        }
        return sol;
    }
};