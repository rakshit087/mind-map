class Solution{
    public:
    vector<string> ans;
    void dfs(int i, int j, vector<vector<int>> m, int n, string temp, vector<vector<int>> visited) {
        if(i<0 || j<0 || i>=n || j>=n) return;
        if(visited[i][j]==1 || m[i][j] == 0) return;
        if(i==n-1 && j==n-1) {
            this->ans.push_back(temp);
            return;
        }
        visited[i][j] = 1;
        dfs(i+1,j,m,n,temp+"D",visited);
        dfs(i,j-1,m,n,temp+"L",visited);
        dfs(i,j+1,m,n,temp+"R",visited);
        dfs(i-1,j,m,n,temp+"U",visited);
        visited[i][j] = 0;
    }
    vector<string> findPath(vector<vector<int>> &m, int n) {
        // Your code goes here
        vector<vector<int>> visited(n,vector<int>(n));
        if(m[0][0] == 0) return this->ans;
        if(m[n-1][n-1] == 0) return this->ans;
        string temp = "";
        dfs(0,0,m,n,temp,visited);
        return this->ans;
    }
};