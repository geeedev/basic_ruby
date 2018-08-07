arr = [10]
arr << arr.last + 5 while arr.last != 100
puts arr.inspect
