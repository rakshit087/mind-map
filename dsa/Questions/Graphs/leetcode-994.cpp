class Solution {
public:

    vector<vector<int>> dir = {{1,0}, {-1,0}, {0,1}, {0, -1}};
    int time = 0;

    int helper(vector<vector<int>>& grid) {
        queue<vector<int>> q;
        const int n = grid.size();
        const int m = grid[0].size();
        for(int i=0; i<n; i++) {
            for(int j=0; j<m; j++) {
                if(grid[i][j] == 2)
                    q.push({i, j});
            }
        }

        while(!q.empty()) {
            const int queueSize = q.size();
            for(int i=0; i<queueSize; i++) {
                vector<int> rottenOrange = q.front();
                q.pop();
                for(int j=0; j<4; j++) {
                    const int row = rottenOrange[0] + dir[j][0];
                    const int col = rottenOrange[1] + dir[j][1];
                    if(row<0 || col<0 || row>=grid.size() || col>=grid[0].size() || grid[row][col] != 1) 
                        continue;
                    else {
                        grid[row][col] = 2;
                        q.push({row, col});
                    }
                }
            }
            time++;
        }

        return time;

    }

    int orangesRotting(vector<vector<int>>& grid) {
        int time = helper(grid);
        for(int i=0; i<grid.size(); i++) {
            for(int j=0; j<grid[0].size(); j++) {
                if(grid[i][j] == 1)
                   return -1;
            }
        }
        if(time == 0) return 0;
        return time - 1;
    }
};