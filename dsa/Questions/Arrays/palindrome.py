class Solution:
    def isPlaindrome(self, S):
        # code here
        if(S==S[::-1]):
            return 1
        return 0