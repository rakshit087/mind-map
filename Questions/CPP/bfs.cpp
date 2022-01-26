class Solution {
  public:
    // Function to return a list containing the DFS traversal of the graph.
    vector<int> ans;
    int visited[10001];
    void dfs(vector<int> adj[],int parent){
        for(auto i:adj[parent]){
        if(!visited[i]){
         visited[i] = 1;
            ans.push_back(i);
            dfs(adj,i);   
        }
        }
    }
    vector<int> dfsOfGraph(int V, vector<int> adj[]) {
        // Code here
        memset(visited,0,sizeof(visited));
        visited[0] = 1;
        ans.push_back(0);
        dfs(adj,0);
        return ans;
    }
};