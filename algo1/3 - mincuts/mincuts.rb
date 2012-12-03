# Karger's "Minimum Cut" algorithm
# Note - this algorithm isn't always "correct" in that it may not find the smallest minimum cut
# on an individual run, but repeated trials (say, 100 or so) should be enough to get the correct answer.

@master_hash = Hash.new

def deep_copy(o)
  Marshal.load(Marshal.dump(o))
end

File.open(ARGV[0]).each_line{ |l|
  splitline = l.split
  @master_hash[splitline.shift] = splitline
}

num_trials = ARGV[1].to_i
maximum_cut = nil
minimum_cut = nil

(1..num_trials).each { |trialno|
  trial_hash = deep_copy(@master_hash)
  puts "Trial number " + trialno.to_s
  while trial_hash.keys.length > 2
    #choose a random edge
    random_vertex = trial_hash.keys.sample
    rv = trial_hash[random_vertex]
    random_connected_node = rv.sample
    rn = trial_hash[random_connected_node]

    rn.each {|x|
      rv.push x
      trial_hash[x].map! { |i| i == random_connected_node ? random_vertex : i }
    }

    rv.map!{ |x|
      x == random_connected_node ? random_vertex : x
    }
    rv.delete_if { |x| x == random_vertex }
    trial_hash.delete random_connected_node
  end

  trial_minimum = trial_hash[trial_hash.keys.sample].length
  minimum_cut = trial_minimum if minimum_cut == nil
  maximum_cut = trial_minimum if maximum_cut == nil
  minimum_cut = trial_minimum if trial_minimum < minimum_cut
  maximum_cut = trial_minimum if trial_minimum > maximum_cut
  puts "Smallest Minimum cut: " + minimum_cut.to_s + " Largest: " + maximum_cut.to_s
}


