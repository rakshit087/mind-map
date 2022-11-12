#include <bits/stdc++.h>
using namespace std;

class Solution
{
public:
    // Function to find out minimum steps Knight needs to reach target position.
    int minStepToReachTarget(vector<int> &k, vector<int> &t, int n)
    {
        int m[8][2] = {{-2, -1}, {-2, 1}, {-1, 2}, {-1, -2}, {1, 2}, {1, -2}, {2, -1}, {2, 1}};
        queue<pair<int, int>> q;
        q.push({k[0], k[1]});
        vector<vector<int>> vis(n + 1, vector<int>(n + 1, 0));
        vis[k[0]][k[1]] = 1;
        int a = 0;
        while (!q.empty())
        {
            int s = q.size();
            while (s-- > 0)
            {
                pair<int, int> p = q.front();
                q.pop();
                int x = p.first;
                int y = p.second;
                if (x == t[0] && y == t[1])
                {
                    return a;
                }
                for (int i = 0; i < 8; i++)
                {
                    int cx = x + m[i][0];
                    int cy = y + m[i][1];
                    if (cx > 0 && cy > 0 && cx <= n && cy <= n && !vis[cx][cy])
                    {
                        q.push({cx, cy});
                        vis[cx][cy] = 1;
                    }
                }
            }
            a++;
        }
        return a;
    }
};