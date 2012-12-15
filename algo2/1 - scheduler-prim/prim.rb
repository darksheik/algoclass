# Prim's Minimum Spanning Tree
# Finds the smallest-cost tree that spans all vertices
require 'priority_queue'

#f = File.new('3-edges.txt')
f = File.new('3-edges.txt')

splitheader = f.gets.split
numnodes = splitheader[0].to_i
numedges = splitheader[1].to_i
puts "Number of nodes: " + numnodes.to_s
puts "Number of edges: " + numedges.to_s

# Read data from file
data = Hash.new
f.each { |line|
  splitdata = line.split
  startvertex = splitdata[0].to_i
  data[startvertex] ||= []
  data[startvertex] << [splitdata[1].to_i,splitdata[2].to_i]
  endvertex = splitdata[1].to_i
  data[endvertex] ||= []
  data[endvertex] << [splitdata[0].to_i,splitdata[2].to_i]
}

minimum_tree = []
allvertices         = data.keys
discovered_vertices = []
edges_to_undiscovered_vertices = PriorityQueue.new

# Pick the starting node
discovered_vertices << allvertices[Random.rand(allvertices.size)]

#puts data.to_s
#puts discovered_vertices.to_s

while discovered_vertices.size != allvertices.size
  #puts "Discovered " + discovered_vertices.to_s

  data[discovered_vertices.last].each { |edge|
    # edge[0] = Target vertex
    # edge[1] = Edge Cost

    unless discovered_vertices.include?(edge[0])
      edges_to_undiscovered_vertices[edge[1]] << edge
    end
  }

  # Discover the vertex at the current cheapest edge
  cheapest_edge = edges_to_undiscovered_vertices.shift
  #puts "Cheapest is " + cheapest_edge[0].to_s
  #puts "With cost of " + cheapest_edge[1].to_s

  unless discovered_vertices.include?(cheapest_edge[0])
    discovered_vertices << cheapest_edge[0]
    minimum_tree << cheapest_edge
  end
end

#puts minimum_tree.to_s

# Compute cost
sum = 0
minimum_tree.each { |edge| sum += edge[1] }
puts "Total cost: " + sum.to_s


