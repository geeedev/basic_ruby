arr = [0, 1]
arr << arr[-1] + arr[-2] while arr[-1] + arr[-2] <= 100
puts arr.inspect
