#include <bits/stdc++.h>
using namespace std;

#define ll long long
class Solution {
public:
    int dp[21][1001];
    int countSubsetSum(vector<int>& arr,int target, int n)
        {
        for(int i=0;i<=n;i++)
        {
            for(int j=0;j<=target;j++)
            {
                if(j==0)
                    dp[i][j] = 1;
                else
                    dp[i][j] = 0;
            }
        }
        for(int i=1;i<=n;i++)
        {
            for(int j=0;j<=target;j++)
            {
                if(j<arr[i-1])
                {
                    dp[i][j] = dp[i-1][j];
                }
                else
                {
                    dp[i][j] = dp[i-1][j] + dp[i-1][j-arr[i-1]];
                }
            }
        }
        for(int i=0;i<=n;i++)
        {
            for(int j=0;j<=target;j++)
                cout<<dp[i][j]<<" ";
            cout<<"\n";
        
        }
        return dp[n][target];
    }
    int findTargetSumWays(vector<int>& nums, int target) {
        int sum = 0;
        for(int i=0;i<=nums.size()-1;i++)
            sum+=nums[i];
        if((target+sum)%2==0)
        return countSubsetSum(nums,(target+sum)/2,nums.size());
        else
        return 0;
    }   
};