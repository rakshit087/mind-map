public class MinJumpsToReachEnd {
    public static void main(String args[]) {
        int[] arr = {2,3,1,4,1,3,6,3,0,0,0,4,1,5};
        //dp will store min jumps to reach that index
        int[] dp = new int[arr.length];
        dp[0] = 0;
        for(int i=1;i<arr.length;i++){
            dp[i] = Integer.MAX_VALUE-1;
        }
        //i is the destination
        for(int i=1; i < arr.length; i++){
            //j is the source
            for(int j=0; j < i; j++){
                //if i is rechable from j
                if(arr[j] + j >= i){
                    //if jumping from j to i is minimum
                    if(dp[i] > dp[j] + 1){
                        dp[i] = dp[j] + 1;
                    }
                }
            }
        }
        System.out.println(dp[dp.length - 1]);
    }
}
