k=ARGV[0].to_i
require 'set'
pairs = $stdin.map {|line| x,y = line.chop.split('|')}
vals = {}
pairs.each{ |x,y| vals[y.to_i] = (vals[y.to_i] || Set.new).add(x.to_i) }
pairs.each{ |x,y| if(vals[y.to_i].size() >= k) then printf "%d|%d\n",x,y end }
