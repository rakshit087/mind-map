class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        mx = 0
        counter = 0
        it = 0
        st = {}
        while it != len(s):  
            if s[it] not in st:
                counter+=1
                mx = max(counter,mx)
                st[s[it]] = it
                it+=1
            else:
                counter=0
                it = st[s[it]]+1
                st.clear()
                
        return mx
        