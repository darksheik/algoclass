
class Inversion
  attr_accessor :master_array

  def initialize
    @master_array = []
    @inversions = []
    File.open(ARGV[0]).each_line{ |l| @master_array << l.to_i }
    final = merge_sort(@master_array)
    puts "Original: " + @master_array.to_s
    puts "Size: " + final.length.to_s
    puts "Final: " + final.to_s
    puts "Inversions: " + @inversions.to_s
    puts "Inversions count: " + @inversions.length.to_s
  end

  private

  def merge_sort(m)
    return m if m.length <= 1
    left = []
    right = []
    middle = (m.length / 2).to_i
    (0..middle-1).each{ |x| left << m[x] }
    (middle..m.length-1).each{ |x| right << m[x] }
    #left.each do |lcheck|
      #right.each do |rcheck|
        #if lcheck > rcheck
          #@inversions << [lcheck,rcheck]
        #end
      #end
    #end
    left = merge_sort(left)
    right = merge_sort(right)
    # merge the sublists returned from prior calls to merge_sort()
    # and return the resulting merged sublist
    merged = merge_lists(left, right)
    return merged
  end

  def merge_lists(l,r)
    list = []
    lptr = 0
    rptr = 0
    while (lptr < l.length || rptr < r.length) do
      if l[lptr] && r[rptr] && l[lptr] < r[rptr]
        list << l[lptr]
        lptr += 1
      elsif r[rptr]
        if r[rptr] && l[lptr]
          @inversions << [l[lptr],r[rptr]]
        end
        list << r[rptr]
        rptr += 1
      else
        list << l[lptr]
        lptr += 1
      end
    end
    return list
  end
end

# Driver
i = Inversion.new
