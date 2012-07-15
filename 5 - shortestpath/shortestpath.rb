# Dijkstra's "Shortest Path" algorithm tries to determine the quickest route from
# a vertex to another vertex by setting a "score" for each vertex combination.

# This algorithm only works on edges with non-negative lengths.

@master_hash = Hash.new
@a = Hash.new
@b = Hash.new
@startvertex = ARGV[1]
@x = [@startvertex]  # Should be the start vertex.  Will add more as we explore
@b[@startvertex] = []  # Not actually necessary for algorithm, just for understanding

def loop
  #  Set each distance to "infinity"
  @master_hash.keys.each { |k| @a[k] = 1000000 }
  @a[@startvertex] = 0
  while (@master_hash.keys - @x).length > 0 || @notdone == true
    @notdone = false
    @x.each { |explorevertex|
   	  #puts
   	  #puts "***Explorevertex = " + explorevertex.to_s + " @a[explorevertex] = " + @a[explorevertex].to_s 
   	  #puts @master_hash[explorevertex].to_s
   	  sorthash = Hash.new
      toexplore = Array.new
      @master_hash[explorevertex].each { |vertex|
    	  target,edgelength = vertex.split(',')
      	sorthash[target] = edgelength.to_i
      }
    	toexplore = sorthash.sort_by {|key, value| value}
    	#puts "Toexplore " + toexplore.to_s
      toexplore.each { |vertex|
    	  target,edgelength = vertex[0],vertex[1]
    	  #puts "Target: " + target + " @a[target] = " + @a[target].to_s + " Edgelength = " + edgelength.to_s
   	    #puts "Equation " + (@a[explorevertex].to_i + edgelength.to_i).to_s + " < " + @a[target].to_s
   	    if  @a[explorevertex].to_i + edgelength.to_i < @a[target]
          @a[target] = @a[explorevertex].to_i + edgelength.to_i
          #puts "Set vertex " + target + " to " + @a[target].to_s
          @notdone = true  # If anything has been reset, we should evaluate the entire tree again
        end
        @x.push target if !@x.include?(target)
      }
    }
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
