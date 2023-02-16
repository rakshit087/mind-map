#User function Template for python3
class Solution:
     
    #Function to find if there exists a triplet in the 
    #array A[] which sums up to X.
    def twoSum(self,nums,target):
        required = {}
        for i in range(len(nums)):
            if target - nums[i] in required:
                return True
            else:
                required[nums[i]]=i
        return False

    def find3Numbers(self,A, n, X):
        # Your Code Here'
        two_sum_array = []
        for i in A:
            two_sum_array.append(X-i)
        for i in range(n):
            if(self.twoSum((A[0:i]+A[i+1:]),two_sum_array[i])):
                return 1
        return 0
            

#{ 
#  Driver Code Starts
#Initial Template for Python 3

import atexit
import io
import sys

_INPUT_LINES = sys.stdin.read().splitlines()
input = iter(_INPUT_LINES).__next__
_OUTPUT_BUFFER = io.StringIO()
sys.stdout = _OUTPUT_BUFFER

@atexit.register

def write():
    sys.__stdout__.write(_OUTPUT_BUFFER.getvalue())

if __name__=='__main__':
    t = int(input())
    for i in range(t):
        n,X=map(int,input().strip().split())
        A=list(map(int,input().strip().split()))
        ob=Solution()
        if(ob.find3Numbers(A,n,X)):
            print(1)
        else:
            print(0)
# } Driver Code Ends
