arr = ["a", "e", "o", "u", "i"]

("a".."z").each_with_index {|char, index| puts "#{char} - #{index + 1}" if (arr).include?(char)}
