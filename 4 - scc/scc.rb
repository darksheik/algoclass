include Process
s = getrlimit RLIMIT_STACK
puts s.to_s

@master_hash = Hash.new
@reverse_hash = Hash.new

@seen = Array.new
@revscore = Hash.new

@tproc = 0
@fin = Hash.new
@leaders = Hash.new

@stack = 0

def dfs_reverse_loop(g)
  (@totalnodes).downto(1).each { |i|
  	#puts "DFS reverse loop " + i.to_s + " finishing value " + @fin[i].to_s
  	if !@seen[@fin[i]]
  	  @seen[@fin[i]] = @fin[i]
   	  #puts "DFS reverse initiate - oldnode " + @fin[i].to_s  + " newnode " +  i.to_s
  	  dfs(g,@fin[i],i)
  	  #puts "Done with " + @fin[i].to_s + " leader " + i.to_s
  	end
  }
end

def dfs_loop(g)
  (@totalnodes).downto(1).each { |i| 
  	if !@seen[i]
  	  #puts "DFS initiate " + i.to_s
  	  @seen[i] = i  	  
  	  dfs(g,i,nil)
    end
  }
end

def dfs(g,i,l)
  @stack += 1
  puts @stack.to_s
  @seen[i] = i
  this_node = g[i]
  if this_node
    this_node.each { |node|
  	  if !@seen[node]
  	    #puts "Examine " + node.to_s

  	    dfs(g,node,l)
      end 
    }
    @tproc += 1
    @fin[@tproc] = i if !l
    if l
      @leaders[l] ||= Array.new
      @leaders[l].push(i)
      #puts "Pushing " + i.to_s + " on to leader " + l.to_s
    end  
    #puts "Finishing time for node " + i.to_s + " = " + @tproc.to_s
  end
  @stack -= 1
end

File.open(ARGV[0]).each_line{ |l|
  splitline = l.split
  @master_hash[splitline[0].to_i] ||= Array.new
  @reverse_hash[splitline[1].to_i] ||= Array.new
  @master_hash[splitline[0].to_i].push(splitline[1].to_i)
  @reverse_hash[splitline[1].to_i].push(splitline[0].to_i)
}
(@master_hash.keys - @reverse_hash.keys).each { |k| @reverse_hash[k] = [] }
(@reverse_hash.keys - @master_hash.keys).each { |k| @master_hash[k] = [] }	

#puts @master_hash.to_s
#puts @reverse_hash.to_s

puts "Starting first loop"
@totalnodes = @master_hash.length
dfs_loop(@master_hash)
@seen = Array.new
@tproc = 0
puts "Starting Reverse loop"
dfs_reverse_loop(@reverse_hash)



puts "Numnodes (n) = " + @totalnodes.to_s
#puts "SCC Hash " + @leaders.to_s
puts "Total SCCs " + @leaders.length.to_s

# Find 5 largest sccs
@sizes = @leaders.keys.each.collect { |c| @leaders[c].length }

puts "Five largest: " + @sizes.sort.reverse[0..4].to_s