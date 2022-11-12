class Solution
{
  public:
    long long int dp[1001][1001];
    Solution() {
        memset(dp,-1,sizeof(dp));
    }
    long long int count( int S[], int n, int target )
    {
       if(target==0)
       return 1;
       if(n==0)
       return 0;
       if(dp[target][n] != -1)
       return dp[target][n];
       else {
           if(target<S[n-1])
           return dp[target][n] = count(S,n-1,target);
           else {
               return dp[target][n] = count(S,n-1,target) + count(S,n,target-S[n-1]);
           }
       }
    }
};