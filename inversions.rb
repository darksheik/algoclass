
class Inversion
  attr_accessor :master_array
  
  def initialize
    @master_array = []
    File.open(ARGV[0]).each_line{ |l| @master_array << l.to_i }
    merge_sort(@master_array)
  end
 
  private
   
  def merge_sort(m)
    return if m.length <= 1
    left,right = [[],[]]
    middle = (m.length / 2).to_i
  (0..middle-1).each{ |x| left << m[x] }
  (middle..m.length-1).each{ |x| right << m[x] }
  	puts "Left: " + left.to_s
  	puts "Right: " + right.to_s
  	left = merge_sort(left)
    right = merge_sort(right)
    # merge the sublists returned from prior calls to merge_sort()
    # and return the resulting merged sublist
    return merge(left, right)
  end

  def merge(l,r)
    list = []
    lptr = 0
    rptr = 0
    while (lptr < l.length-1 && rptr < r.length-1) do
      if l[lptr] < r[rptr]
      	list << l[lptr]
      	lptr += 1
      else
      	list << r[rptr]
      	rptr += 1
      end
    end
    puts list.to_s
    return list
  end
end

# Driver
i = Inversion.new
puts i.master_array
