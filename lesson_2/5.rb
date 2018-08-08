print "Enter year: "
year = gets.to_i
print "Enter month: "
month = gets.to_i
print "Enter day: "
day = gets.to_i

a = 0

  if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
    months = {
      juanury: 31, february: 29, march: 31, april: 30,
      may:31, june: 30, july: 31, august: 31,
      september: 30, october: 31, november: 30, december: 31
    }
  else
    months = {
      juanury: 31, february: 28, march: 31, april: 30,
      may:31, june: 30, july: 31, august: 31,
      september: 30, october: 31, november: 30, december: 31
    }
  end

  if (1..12).include?(month) && (1..months.values[month - 1]).include?(day)
      arr = []
      months.each_value {| key | arr << key if arr.size != month - 1}
      arr.each {|i| a += i}
      puts a += day
   else
     puts "data error"
     exit
  end
