print "Enter a :"
a = gets.to_i
print "Enter b :"
b = gets.to_i
print "Enter c :"
c = gets.to_i

d = b**2 - 4 * a * c

puts d

if d > 0
  x_1 = (-b + Math.sqrt(d)) / (2 * a)
  x_2 = (-b - Math.sqrt(d)) / (2 * a)
  puts "D #{d}; #{x_1}, #{x_2}"
elsif d == 0
  x = - (b / 2 * a)
  puts "D = #{d}; #{x}"
else
  puts "D = #{d}; no roots."
end
