k=ARGV[0].to_i
require 'set'
pairs = $stdin.map {|line| x,y = line.chop.split('|')}
vals = {}
pairs.each{ |x,y| vals[y] = (vals[y] || Set.new).add(x) }
pairs.each{ |x,y| if(vals[y].size() >= k) then printf "%d|%d\n",x,y end }

