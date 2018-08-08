arr = ["a", "e", "o", "u", "i"]
hash = {}

("a".."z").each_with_index do |char, index|
hash[char] = index + 1 if arr.include?(char)
end
puts hash
