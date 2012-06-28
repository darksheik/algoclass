def partition(arr,pivot)

  @comparisons += arr.length-1
  i = pivot.to_i
  j = i+1

  if arr.length > 1
    while (j < arr.length)
      if arr[j] && (arr[j] < arr[i+1])
        arr[i+1], arr[j] = arr[j], arr[i+1]
        i += 1
      end
      j += 1
    end

    arr[pivot], arr[i] = arr[i], arr[pivot]

    partition(arr[0..i-1],pivot)
    partition(arr[i+1..arr.length],pivot)
  end
end

@comparisons = 0
@master_array = []
File.open(ARGV[0]).each_line{ |l| @master_array << l.to_i }
pivot = ARGV[1].to_i
partition(@master_array,pivot)
puts "Final Array: " + @master_array.to_s
puts "Total Comparisons: " + @comparisons.to_s