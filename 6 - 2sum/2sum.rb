#2SUM problem
#Compute the number of target values t in the interval [2500,4000] (inclusive)
#such that there are distinct numbers x,y in the input file that satisfy x+y=t.

@master_hash = Hash.new

File.open(ARGV[0]).each_line{ |l|
  @master_hash[l.chomp] = true
}

(2500..4000).each { |i|

}
puts @master_hash.to_s
