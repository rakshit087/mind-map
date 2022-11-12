#include <bits/stdc++.h>
using namespace std;

#define ll long long

int main()
{
#ifndef ONLINE_JUDGE
	freopen("./input.txt", "r", stdin);
#endif

	ios_base::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

	ll T;
	cin >> T;
	while (T--)
	{
		string x;
		cin>>x;
		string sol;
		ll ones=0;
		ll zeroes=0;
		for(int i=0;i<x.length();i++)
		{
			if(x[i]=='0')
			zeroes++;
			else
			ones++;
		}
		if(zeroes==0)
		sol="0";
		else if(ones==0)
		sol="1";
		else if(x[x.length()-1]=="0")
		{
			sol = "1";
			for(int j=0;j<=ones;j++)
			sol=sol+"1";
		}
		else
		{

		}
	}
}
