@master_hash = Hash.new

File.open(ARGV[0]).each_line{ |l|
  @master_hash[l.chomp] = true
}

(2500..4000).each { |i|

}
puts @master_hash.to_s
