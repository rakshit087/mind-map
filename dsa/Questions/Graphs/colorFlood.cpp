#include <bits/stdc++.h>
using namespace std;
class Solution {
public:
    vector<vector<int>> floodFill(vector<vector<int>>& image, int sr, int sc, int newColor) {
        int m = image.size();
        int n = image[0].size();
        cout<<n<<"\n";
        int old = image[sr][sc];
        vector<vector<bool>> board(n+1,vector<bool>(m+1,false));
        queue<pair<int,int>> q;
        q.push(pair(sr,sc));
        while(!q.empty())
        {
            int x = q.front().first;
            int y = q.front().second;
            q.pop();
            image[x][y] = newColor;
            //Checking to the down
            if(x<m-1 && (board[x+1][y]!=true && image[x+1][y]==old))
            {
                q.push(pair(x+1,y));
                board[x+1][y] = true;
            }
            //Checking to the up
            if(x>0 && (board[x-1][y]!=true && image[x-1][y]==old))
            {
                cout<<"Up"; 
                q.push(pair(x-1,y));
                board[x-1][y] = true;
            }
            //Checking to left
            if(y>0 && board[x][y-1]!=true && image[x][y-1]==old)
            {
                q.push(pair(x,y-1));
                board[x][y-1] = true;
            }
            //Checking right
            if(y<n-1 && (board[x][y+1]!=true && image[x][y+1]==old))
            {
                q.push(pair(x,y+1));
                board[x][y+1] = true;
            }
            
        }
        return image;
    }
};