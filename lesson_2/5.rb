print "Enter year: "
year = gets.to_i
print "Enter month: "
month = gets.downcase.to_sym
print "Enter day: "
day = gets.to_i

is_leap_year = year % 4 == 0 && year % 100 != 0 || year % 400 == 0

months_days = {
  jan: 31,
  feb: is_leap_year ? 29 : 28,
  mar: 31,
  apr: 30,
  may: 31,
  jun: 30,
  jul: 31,
  aug: 31,
  sep: 30,
  oct: 31,
  nov: 30,
  dec: 31
}

result = 0

months_days.each do |m, d|
  if m = month
    result += day
    break
  else
    result += d
  end
end
