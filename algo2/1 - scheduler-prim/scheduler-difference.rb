# Scheduler
# Arranges jobs in decreasing order of weight minus run time.
# Ties are broken by weight

f = File.new('1-jobs.txt')

numlines = f.gets.to_i
puts "Number of lines: " + numlines.to_s

data = Array.new
f.each { |line|
  splitdata = line.split
  data << [splitdata[0].to_i,splitdata[1].to_i]
}

sorted = data.sort_by{|e| [-(e[0] - e[1]), -e[0]] }

running_completion_time = 0
weighted_sum_of_completion_times = 0

sorted.each { |i|
  puts i[0].to_s + ' ' + i[1].to_s + ' ' + (i[0] - i[1]).to_s
  running_completion_time += i[1]
  weighted_sum_of_completion_times += (i[0] * running_completion_time)
  puts "r: " + running_completion_time.to_s + " w: " + weighted_sum_of_completion_times.to_s
}
