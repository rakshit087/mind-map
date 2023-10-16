class Solution {
public:
    vector<vector<int>> adj;
    int provinces = 0;

    void dfs(int node, vector<int> &visited){
        visited[node] = 1;
        for(auto i:adj[node]){
            if(!visited[i]){
                dfs(i, visited);
            }
        }
    }

    void bfs(int node, vector<int> &visited) {
        queue<int> q;
        q.push(node);
        visited[node] = 1;
        while(!q.empty()) {
            int top = q.front();
            q.pop();
            for(auto i: adj[top]) {
                if(!visited[i]) {
                    visited[i] = 1;
                    q.push(i);
                }
            }
        }
    }

    int findCircleNum(vector<vector<int>>& grid) {
        const int n = grid.size();
        adj = vector<vector<int>> (n);
        vector<int> visited (n,0);
        for(int i=0; i<n; i++) {
            for(int j=0; j<n; j++) {
                if(grid[i][j]) 
                    adj[i].push_back(j);
            }
        }
        
        for(int i=0; i<n; i++) {
            if(!visited[i]) {
                provinces++;
                dfs(i, visited);
            }
        }

        return provinces;
    }
};