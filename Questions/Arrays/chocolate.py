#User function Template for python3
class Solution:

    def findMinDiff(self, A,N,M):
        
        # code here
        A.sort()
        min_dif = A[N-1] - A[0]
        #print(A)
        for i in range(N-M+1):
            dif = A[i+M-1]-A[i] 
            min_dif = min(dif,min_dif)
        return min_dif
#{ 
#  Driver Code Starts
#Initial Template for Python 3

if __name__ == '__main__':

    t = int(input())

    for _ in range(t):
        N = int(input())
        A = [int(x) for x in input().split()]
        M = int(input())


        solObj = Solution()

        print(solObj.findMinDiff(A,N,M))
# } Driver Code Ends
