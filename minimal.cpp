#include <iostream>
#include <list>
#include <map>
#include <set>
#include <utility>

using namespace std;

int main(void) {
   char delim; int a, b;
   map<int, set<int> > values;
   list<pair<int,int> > pairs;

   while (cin >> a >> delim >> b) {
      values[b].insert(a);
      pairs.push_back(make_pair(a,b));
   }

   list<pair<int,int> >::const_iterator it;

   for (it = pairs.begin(); it != pairs.end(); it++)
      if (values[it->second].size() > 1)
         cout << it->first << '|' << it->second << endl;
   return 0;
}
