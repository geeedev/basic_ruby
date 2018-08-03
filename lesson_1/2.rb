print "Enter base of triangle : "
a = gets.to_f
print "Enter height of triangle : "
h = gets.to_f

if a >= 0 && h >= 0
  s = (a*h)/2
else
  puts "error"
end

puts s
