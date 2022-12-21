input = File.read('input')
starting_stacks, rearrangements = input.split("\n\n").map { _1.split("\n") }

stacks_part_1 = Array.new(starting_stacks.count) { [] }
stacks_part_2 = Array.new(starting_stacks.count) { [] }

starting_stacks.each do |line|
  line.chars.each_slice(4).with_index do |chars, i|
    next if chars.first == ' '
    stacks_part_1[i] << chars[1]
    stacks_part_2[i] << chars[1]
  end
end

stacks_part_1.map!(&:reverse)
stacks_part_2.map!(&:reverse)

rearrangements.each do |move|
  amount, from, to = move.delete('^0-9 ').strip.split(' ').map(&:to_i)

  amount.times do
    crate = stacks_part_1[from - 1].pop
    stacks_part_1[to - 1] << crate
  end

  crates = stacks_part_2[from - 1].pop(amount)
  stacks_part_2[to - 1].push(*crates)
end

puts stacks_part_1.map(&:last).join
puts stacks_part_2.map(&:last).join
