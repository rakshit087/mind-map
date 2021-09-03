class Solution{
public:
int subset(int arr[],int sum, int n){
    //i => n
    //j => sum
    int dp[n+1][sum+1];
    for(int i=0;i<=n;i++) {
        for(int j=0;j<=sum;j++)
        {
            if(j==0) dp[i][j] = 1;
            else dp[i][j] = 0;
        }
    }
    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=sum;j++)
        {
            if(j>=arr[i-1]){
                dp[i][j] = (dp[i-1][j] || dp[i-1][j-arr[i-1]]);
            } else {
                 dp[i][j] = dp[i-1][j];
            }
        }
    }
    
    return dp[n][sum];
}
    int equalPartition(int N, int arr[])
    {
        // code here
        int sum = 0;
        for(int i=0;i<N;i++)
        {
            sum+=arr[i];
        }
        if(sum%2==0){
            return subset(arr,sum/2,N);
        }
        else
        {
            return 0;
        }
    }
};
