#include<bits/stdc++.h>
using namespace std;
int priceCheck(vector<string> products, vector<float> productPrices,vector<string> productsSold,vector<float> soldPrice)
{
    unordered_map<string,float> productHash;
    int sol=0;
    for(int i=0;i<products.size();i++)
    {
        productHash[products[i]] = productPrices[i];
    }
    for(int i=0;i<productsSold.size();i++)
    {
        if(productHash.find(productsSold[i])!=productHash.end())
        {
            if(productHash[productsSold[i]]!=soldPrice[i])
            {
                sol++;
            }
        }
    }
    return sol;
}