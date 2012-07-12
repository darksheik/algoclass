@master_hash = Hash.new
@reverse_hash = Hash.new

def deep_copy(o)
  Marshal.load(Marshal.dump(o))
end

@seen = Array.new
@revscore = Hash.new

def dfs_loop(i)
  dfs(i)
end

def dfs(i)
  @seen[i] = 1
  this_node = @master_hash[i]
  stack = []
  if this_node
    puts this_node.to_s
    this_node.each { |explorenode|
    	if !@seen[explorenode]
      end
    }
      
  end
end

File.open(ARGV[0]).each_line{ |l|
  splitline = l.split
  @master_hash[splitline[0].to_i] ||= Array.new
  @reverse_hash[splitline[1].to_i] ||= Array.new
  @master_hash[splitline[0].to_i].push(splitline[1].to_i)
  @reverse_hash[splitline[1].to_i].push(splitline[0].to_i)
}

puts @master_hash.to_s
puts @reverse_hash.to_s
totalnodes = (@master_hash.keys + @reverse_hash.keys).uniq.length
puts "Numnodes (n) = " + totalnodes.to_s

(totalnodes).downto(1).each { |i| 
	dfs_loop(i)
}
