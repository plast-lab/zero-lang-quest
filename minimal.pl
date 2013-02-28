$k = $ARGV[0] - 1;
while(<STDIN>){
    ($a,$b) = split('\||\n');
    push @pairs, [$a,$b];
    $values{$b+0}{$a+0} = $a;
}
foreach(@pairs){
    if(keys(%{$values{@$_[1]}}) > $k){
	print "@$_[0]|@$_[1]\n";
    }
}
