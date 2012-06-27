def partition(arr,start,final)

  i = start
  j = i+1

  if(final-start >= 1)
	  puts "Considering start through final:  " + arr[start..final].to_s

    puts "Pivot #{i}"
    while (j <= final)
      puts "Comparing #{arr[j]} < #{arr[start]}"
      if arr[j] && (arr[j] < arr[start])
        arr[i+1], arr[j] = arr[j], arr[i+1]
        i += 1
        j += 1
      else
        j += 1
      end
      puts arr.to_s
    end

    puts "Moving pivot to #{i}"
    arr[start], arr[i] = arr[i], arr[start]
    puts arr.to_s

    puts "Recursion small set " + (i-1).to_s
    partition(arr,start,i-1)
    puts "Recursion large set " + (i+1).to_s
    partition(arr,i+1,final)
    return start
  end
end

x = [108000,1080123,15,87,34,343,333,12504,1,54,1800,6,10,13,5,8,3,2,11,334,2222,212,157344,22222,3333,12345,87581]

pivot1 = partition(x,0,x.length-1)
