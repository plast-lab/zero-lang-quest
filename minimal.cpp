#include <iostream>
#include <list>
#include <map>
#include <set>
#include <utility>
#include <cstdlib>

using namespace std;

int main(int args, char *argv[]) {
    char delim; int a, b, k = atoi(argv[1]);
    map<int, set<int> > values;
    list<pair<int,int> > pairs;

    while (cin >> a >> delim >> b) {
        values[b].insert(a);
        pairs.push_back(make_pair(a,b));
    }

    list<pair<int,int> >::const_iterator it;

    for (it = pairs.begin(); it != pairs.end(); it++)
        if (values[it->second].size() >= k)
            cout << it->first << '|' << it->second << endl;
    return 0;
}
