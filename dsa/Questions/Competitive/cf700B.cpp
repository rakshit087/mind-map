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
     
    int T; 
    cin>>T;
    while(T--)
    {
       ll A,B,n;
       cin>>A>>B>>n;
       vector<ll> Ma;
       vector<ll> Mb;
       for(int i=0;i<n;i++)
       {
			ll a;
			cin>>a;
			Ma.push_back(a);
	   }
	   for(int i=0;i<n;i++)
       {
			ll b;
			cin>>b;
			Mb.push_back(b);
	   }
	   while(1)
	   {
			int killed = 0;
			for(ll i=0; i<n; i++)
			{
				
				B = B-Ma[i];
				Mb[i] = Mb[i] - A;
				if(Mb[i]<=0)
				{
					killed++;
					Ma.erase(Ma.begin()+i);
					Mb.erase(Mb.begin()+i);
					break;	
				}
				if(B<=0)
				{
					break;
				}
			}
			n = n-killed;
			if(n<=0)
			{
				cout<<"YES\n";
				break;
			}
			else if(B<=0)
			{
				cout<<"NO\n";
				break;
			}
			else continue;
	   }
    }
    return 0;
}
