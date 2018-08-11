hash = {}
sum = 0

loop do
  print "Enter product name: "
  name = gets.chomp
  break if name == "stop"
  print "Enter unit price: "
  price = gets.to_f
  print "Enter quantity: "
  quantity = gets.to_f
  price_quantity = { price: price, quantity: quantity }
  hash[name] = price_quantity
end

hash.each do |name, value|
  puts "#{name} : #{value[:price] * value[:quantity]}"
  sum += value[:price] * value[:quantity]
end

puts "Итог: #{sum} р."
