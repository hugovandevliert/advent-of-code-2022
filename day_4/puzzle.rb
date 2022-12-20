class Range
  # Stolen from Rails :>)
  def overlaps?(other)
    other.begin == self.begin || cover?(other.begin) || other.cover?(self.begin)
  end
end

def line_to_sections(line)
  line.split(',').map do |sections|
    start, last = sections.split('-').map(&:to_i)

    start..last
  end
end

input = File.read('input').split("\n")

part_one = input.map do |line|
  section1, section2 = line_to_sections(line)

  if section1.cover?(section2) || section2.cover?(section1)
    1
  else
    0
  end
end.sum

part_two = input.map do |line|
  section1, section2 = line_to_sections(line)

  if section1.overlaps?(section2) || section2.overlaps?(section1)
    1
  else
    0
  end
end.sum

puts part_one
puts part_two
