# Prim's Minimum Spanning Tree
# Finds thei smallest-cost tree that spans all vertices
require 'priority_queue'

#f = File.new('3-edges.txt')
f = File.new('lecture-example.txt')

splitheader = f.gets.split
numnodes = splitheader[0].to_i
numedges = splitheader[1].to_i
puts "Number of nodes: " + numnodes.to_s
puts "Number of edges: " + numedges.to_s

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
remaining_edges = PriorityQueue.new

puts data.to_s


