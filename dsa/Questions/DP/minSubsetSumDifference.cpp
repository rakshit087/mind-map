// { Driver Code Starts
#include <bits/stdc++.h>
using namespace std;

 // } Driver Code Ends
class Solution{

  public:
	int minDifference(int arr[], int n)  { 
	    int sum = 0;
	    for (int i = 0; i < n; i++) sum += arr[i];
	    bool dp[n+1][sum+1];
	    int target = sum/2;
	    for(int i=0;i<=n;i++) {
	        for(int j=0;j<=target;j++) {
	            if(j==0) dp[i][j] = true;
	            else dp[i][j] = false;
	        }
	    }
	    for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= target; j++) {
                if (j < arr[i - 1])
                dp[i][j] = dp[i - 1][j];
            if (j >= arr[i - 1])
                dp[i][j] = dp[i - 1][j] || dp[i - 1][j - arr[i - 1]];
            }
	    } 

	    for(int i=target;i>=0;i--) {
            if(dp[n][i]) {
                return(sum-(2*i));
            }
        }
    }
};