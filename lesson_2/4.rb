hash = {
  a: true, b: false, c: false, d: false, e: true,
  f: false, g: false, h: false, i: true, j: false,
  k: false, l: false, m: false, n: false, o: true,
  p: false, q: false, r: false, s: false, t: false,
  u: true, v: false, w: false, x: false, y: true,
  z: false
}

result = {}

0.upto(21) do |i|
  if hash.to_a[i][1] == true
    result[hash.to_a[i][0]] = i + 1
  end
end

puts result
