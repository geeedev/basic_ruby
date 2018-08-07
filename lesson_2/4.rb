arr = ["a", "e", "o", "u", "i"]
hash = {}

("a".."z").each_with_index do |char, index|
  if (arr).include?(char)
    hash[char] = index + 1
  end
end
puts hash
