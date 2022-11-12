class Solution{
    public:
    // Function to check if given number n is a power of two.
    bool isPowerofTwo(long long x){
        
        // Your code here    
        return (x && !(x & (x - 1)));
        
    }
};