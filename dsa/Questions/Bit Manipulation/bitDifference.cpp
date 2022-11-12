class Solution{
    public:
    // Function to find number of bits needed to be flipped to convert A to B
    int countBitsFlip(int a, int b){
        
        // Your logic here
        int XOR = a ^ b;
        int count=0;
        while(XOR){
            XOR=XOR&(XOR-1);
            count++;
        }
        return count;
    }
};
