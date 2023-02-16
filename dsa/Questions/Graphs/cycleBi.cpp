class Solution {
  public:
    bool dfs(int V, vector<int> adj[], int parent, vector<int> &visited){
        visited[V] = 1;
        for(auto child:adj[V]){
            if(!visited[child]){
                 if(dfs(child,adj,V,visited)){
                     return true;
                 }
            } else if(child != parent) return true;
        }
        return false;
    }
    bool bfs(int V, vector<int> adj[], vector<int> &visited){
        queue<pair<int,int>> q;
        q.push({V,-1});
        while(!q.empty()){
            int top = q.front().first;
            int parent = q.front().second;
            q.pop();
            visited[top] = 1;
            for(auto child:adj[top]){
                if(!visited[child]) q.push({child,top});
                else if(child!=parent) return true;
            }
        }
        return false;
    }
    bool isCycle(int V, vector<int> adj[]) {
        vector<int> visited(V+1,0);
        for(int i=0; i<V; i++){
            if(!visited[i]) {
                if(dfs(i,adj,-1,visited)) return true;
            }   
        }
        return false;
    }
};