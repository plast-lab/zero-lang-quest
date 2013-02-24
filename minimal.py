import sys

pairs = []
values = {}

for line in sys.stdin:
    f,s = map(int,line.split('|'))
    values.setdefault(s,set()).add(f)
    pairs.append((f,s))

for a,b in pairs:
    if len(values[b]) > 1:
        print "%d|%d" % (a,b)
