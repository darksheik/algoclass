def partition(arr,start,final)

  puts start
  i = start.to_i
  j = i+1

  if(final-start >= 1)
    while (j <= final)
      if arr[j] && (arr[j] < arr[start])
        arr[i+1], arr[j] = arr[j], arr[i+1]
        i += 1
      end
      j += 1
    end

    arr[start], arr[i] = arr[i], arr[start]

    partition(arr,start,i-1)
    partition(arr,i+1,final)
    return start
  end
end

@master_array = []
File.open(ARGV[0]).each_line{ |l| @master_array << l.to_i }
pivot = ARGV[1].to_i
partition(@master_array,pivot,@master_array.length-1)
puts @master_array.to_s
