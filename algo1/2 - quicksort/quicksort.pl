#!/usr/local/bin/perl

# Quicksort is a "divide and conquer" algorithm that breaks an array into pieces recursively
# and reassembles them in the correct order.

# Runtime is highly dependent on your choice of "pivot", that is, on each iteration a number will
# be chosen to compare all other numbers against, and the two halves on either side of the pivot
# (which are higher and lower than the pivot after the routine completes)
# will be passed to a deeper recursion.

open(FILE,$ARGV[0]);
while ($line = <FILE>) {
	chomp($line);
	push @x, $line;
}
close FILE;

$i = 0;
$j = 1;
$comparisons = 0;

$pivot1 = partition(\@x,0,scalar(@x)-1);

sub choosepivot {
  $choosestart = shift;
  $choosefinal = shift;

	$subarraysize = $choosefinal - $choosestart + 1;
	if ($subarraysize % 2 == 0) {
		$choosemiddle = $subarraysize / 2 - 1;
	} else {
		$choosemiddle = ($subarraysize-1)/2;
	}
  #print "Choosemiddle: $choosemiddle\n";
  $middleindex = $choosestart + $choosemiddle;
  $middlevalue = @x[$middleindex];
  if ($choosemiddle == 0) { $median = $choosestart; }
    else {
    $ab = @x[$choosestart] < @x[$middleindex] ? $choosestart : $middleindex;
    $bc = @x[$middleindex] < @x[$choosefinal] ? $middleindex : $choosefinal;
    $ac = @x[$choosestart] < @x[$choosefinal] ? $choosestart : $choosefinal;

    $median = $ab == $bc ? $ac : $ab == $ac ? $bc : $ab;
  }

	return $median;
}

sub partition {
my $arr = shift;
my $start = shift;
my $final = shift;


my $i = $start;
$j = $i+1;


if($final-$start >= 1) {

  $pivot = choosepivot($start,$final);
  @$arr[$pivot,$start] = @$arr[$start,$pivot];
  while ($j <= $final) {
    $comparisons++;
    if ($$arr[$j] < $$arr[$start]) {
    @$arr[$i+1,$j] = @$arr[$j,$i+1];
      $i++;
      $j++;
    } else {
      $j++;
    }
  }

  @$arr[$start,$i] = @$arr[$i,$start];

  partition($arr,$start,$i-1);
  partition($arr,$i+1,$final);
  } else {  }
return $start;
}
print join(',',@x)."\n";
print "Array size: ".@x.length."\n";
print "Comparisons: $comparisons\n";
