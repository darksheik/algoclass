# Dijkstra's "Shortest Path" algorithm tries to determine the quickest route from
# a vertex to another vertex by setting a "score" for each vertex combination.

# This algorithm only works on edges with non-negative lengths.

@master_hash = Hash.new
@a = Hash.new
@b = Hash.new
@startvertex = ARGV[1]
@x = [@startvertex]  # Should be the start vertex.  Will add more as we explore
@a[@startvertex] = 0
@b[@startvertex] = []  # Not actually necessary for algorithm, just for understanding

def loop
  while @master_hash.keys.length - @x.length > 0
    puts "Working on vertex " + @x.last.to_s + " Master length " + @master_hash.keys.length.to_s + " x length " + @x.length.to_s
    #puts @master_hash[@x.last].to_s
    shortest = 1000000
    shortestvertex = nil
    explorevertex = @x.last
    @master_hash[explorevertex].each { |vertex|
    	target,edgelength = vertex.split(',')
    	if !@x.include?(target)
    	#puts "Target " + target.to_s + " Edgelength " + edgelength.to_s
    	if edgelength.to_i < shortest.to_i
    		shortest = edgelength.to_i
    		shortestvertex = target
    	end
    	#puts "Shortest so far is vertex " + shortestvertex.to_s + " with " + shortest.to_s
    end
    }
    puts "Final shortest is vertex " + shortestvertex.to_s + " with " + shortest.to_s
    @a[shortestvertex] = @a[@x.last].to_i + shortest.to_i
    #puts @a.to_s
    @x.push shortestvertex if shortestvertex
  end
end

File.open(ARGV[0]).each_line{ |l|
  splitline = l.split
  @master_hash[splitline.shift] = splitline
  # Add any target vertices that do not have originating edges
  splitline.each { |sv|
  	targetvertex = sv.split(',')[0]
  	@master_hash[targetvertex] = [] if !@master_hash[targetvertex] 
  }
}

puts @master_hash.to_s
#puts @x.to_s
loop
puts @a.to_s
