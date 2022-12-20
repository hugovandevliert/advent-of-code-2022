def calculate_priority(char)
  if char == char.upcase
    char.ord - 38
  else
    char.ord - 96
  end
end

input = File.read('input').split("\n")

part_one = input.map do |line|
  compartment_a, compartment_b = line.chars.each_slice(line.length / 2).to_a
  item = (compartment_a & compartment_b).first
  calculate_priority(item)
end.sum

part_two = input.each_slice(3).map do |lines|
  line1, line2, line3 = lines.map(&:chars)
  item = (line1 & line2 & line3).first
  calculate_priority(item)
end.sum

puts part_one
puts part_two
