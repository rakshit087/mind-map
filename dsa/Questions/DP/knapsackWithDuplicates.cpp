class Solution{
public:
    int dp[1001][1001];
    Solution()
    {
        memset(dp,0,sizeof(dp));
    }
    int knapSack(int N, int W, int val[], int wt[])
    {
        for(int i=1;i<=N;i++)
        {
            for(int j=1;j<=W;j++)
            {
                if(wt[i-1]<=j)
                {
                    dp[i][j] = max(dp[i-1][j],val[i-1]+dp[i][j-wt[i-1]]);
                }
                else 
                {
                    dp[i][j] = dp[i-1][j];
                }
            }
        }
    return dp[N][W];
    }
};
