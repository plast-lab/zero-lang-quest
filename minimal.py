import sys

pairs = []
values = {}
k = int(sys.argv[1])

for line in sys.stdin:
    f,s = map(int,line.split('|'))
    values.setdefault(s,set()).add(f)
    pairs.append((f,s))

for a,b in pairs:
    if len(values[b]) >= k:
        print "%d|%d" % (a,b)
