#Median Maintenance problem
require 'algorithms'

@master_hash = Hash.new
@highheap = Containers::MinHeap.new
@lowheap = Containers::MaxHeap.new

@running_total = 0

@debug = Array.new

File.open(ARGV[0]).each_line{ |l|
  newkey = l.to_i
  @debug.push newkey
  puts newkey.to_s
  if @highheap.min.nil?
    @highheap.push newkey,newkey
  elsif @highheap.min > newkey
    @lowheap.push newkey, newkey
  else
    @highheap.push newkey, newkey
  end
  if @lowheap.size > @highheap.size
    fromlow = @lowheap.pop
    puts "Moving low to high: " + fromlow.to_s
    @highheap.push fromlow
  end
  if @highheap.size > @lowheap.size + 1
    fromhigh = @highheap.pop
    puts "Moving high to low: " + fromhigh.to_s
    @lowheap.push fromhigh
  end
  puts "Low heap: " +  @lowheap.next_key.to_s + " Size: " + @lowheap.size.to_s
  puts "High heap: " + @highheap.next_key.to_s + " Size: " + @highheap.size.to_s
  median = @highheap.next_key.nil? ? @lowheap.next_key : @highheap.next_key
  #puts "Array " + @debug.sort.to_s
  puts "Selected median= " + median.to_s
  @running_total += median
  puts "Running total: " + @running_total.to_s
}

puts "Debug: " + @debug.sort.to_s
puts "Final output: " + (@running_total % 10000).to_s
