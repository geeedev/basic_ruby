
hash = {}

loop do
  print "Введите название товара: "
  name = gets.chomp
  break if name == "stop"
  print "Цена за единицу: "
  num = gets.to_i
  print "Количество купленного товара: "
  num1 = gets.to_f

  hash1 = {}
  hash1[num] = num1
  hash[name] = hash1
end

a = 0
hash.each do | k, v |
  v.each do | kk, vv |
    puts "#{k} - #{kk * vv} р."
    a += kk * vv
  end
end
puts "Сумма: #{a} р."
