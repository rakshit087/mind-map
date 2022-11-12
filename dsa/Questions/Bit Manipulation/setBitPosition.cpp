class Solution {
  public:
    int count_sets (int n){
	int count=0;
	while( n ) {
		n = n&(n-1);
    count++;
  }
	return count;
    }
    int findPosition(int N) {
        // code here
        int count = count_sets(N);
        if(count>1 || count==0){
            return -1;
        } else {
            return count_sets(N-1)+1;
        }
    }
};