#2SUM problem
#Compute the number of target values t in the interval [2500,4000] (inclusive)
#such that there are distinct numbers x,y in the input file that satisfy x+y=t.

@master_hash = Hash.new

File.open(ARGV[0]).each_line{ |l|
  key = l.chomp.to_i
  if key <= 4001
    @master_hash[key] = true
  end
}


puts "Numbers less than 4001 for consideration: " + @master_hash.size.to_s
puts @master_hash.to_s

@finalpairs = Hash.new
@master_hash.keys.each { |x|
  @master_hash.keys.each { |y|
    if x + y >= 2500 && x + y <= 4000 && x != y
      puts "Hit " + x.to_s + " + " + y.to_s + " = " + (x+y).to_s
      @finalpairs[x + y] = true
    end
  }
}

puts "Final output: " + @finalpairs.size.to_s
