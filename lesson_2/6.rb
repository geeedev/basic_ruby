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
  hash [product_name: name] = price_quantity
end

hash.each do |name, value|
  puts "#{name[:product_name]} - #{value[:price] * value[:quantity]}"
  sum += value[:price] * value[:quantity]
end

puts sum
