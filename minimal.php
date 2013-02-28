<?php

$k = $argv[1] - 1;

while (2 == fscanf(STDIN, "%d|%d\n", $a, $b)) {
    $values[$b][$a] = 1;
    $pairs[] = array ($a,$b);
}

foreach ($pairs as &$l)
    if (count($values[$l[1]]) > $k)
        echo "$l[0]|$l[1]\n";
?>
