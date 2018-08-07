arr = [0, 1]
arr << arr[-1] + arr[-2] while arr.last < 100
arr.delete(arr.last) if arr.last > 100
puts arr.inspect
