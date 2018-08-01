print "Enter your name : "
user_name = gets.strip
print "Enter your height : "
user_height = gets.to_i

if user_height - 110 > 0
  puts "#{user_name}, your ideal weight: #{user_growth - 110}."
else
  puts "Your weight is optimal."
end
