#include <bits/stdc++.h>
using namespace std;

class Solution
{
public:
    vector<vector<bool>> board;
    vector<vector<string>> ans;
    vector<vector<string>> solveNQueens(int n)
    {
        this->board.resize(n, vector<bool>(n, false));
        solve(0);
        return ans;
    }
    bool isPlaceable(int row, int col)
    {
        int n = board.size();
        for (int i = 0; i < row; i++)
        {
            if (board[i][col])
                return false;
        }
        int maxLeft = min(row, col);
        for (int i = 1; i <= maxLeft; i++)
        {
            if (board[row - i][col - i])
            {
                return false;
            }
        }
        int maxRight = min(row, (n - col - 1));
        for (int i = 1; i <= maxRight; i++)
        {
            if (board[row - i][col + i])
            {
                return false;
            }
        }
        return true;
    }
    void solve(int row)
    {
        if (board.size() == row)
        {
            vector<string> temp_v;
            for (int i = 0; i < board.size(); i++)
            {
                string temp = "";
                for (int j = 0; j < board.size(); j++)
                {
                    if (board[i][j])
                        temp += "Q";
                    else
                        temp += ".";
                }
                temp_v.push_back(temp);
            }
            ans.push_back(temp_v);
            return;
        }
        for (int col = 0; col < board.size(); col++)
        {
            if (isPlaceable(row, col))
            {
                board[row][col] = true;
                solve(row + 1);
                board[row][col] = false;
            }
        }
    }
};