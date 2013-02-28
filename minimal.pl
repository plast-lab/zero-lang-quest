
while(<STDIN>){
    @tmp = split('\||\n');
    push @pairs, [@tmp];
    $values{$tmp[1]}{$tmp[0]+0} = $tmp[0];
}

foreach(@pairs){
    if(keys(%{$values{@$_[1]}}) >= $ARGV[0]){
        print "@$_[0]|@$_[1]\n";
    }
}
