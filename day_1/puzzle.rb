input = File.read('input').split("\n")

totals = input.reduce([0]) do |counts, calories|
  counts << 0 if calories == ''
  counts[-1] += calories.to_i
  counts
end

puts totals.max
puts totals.max(3).sum
