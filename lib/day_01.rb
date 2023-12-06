DIGITS = {
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def part1
  AOC.input_lines('day_01').sum do |line|
    line.scan(/\d/).values_at(0, -1).join.to_i
  end
end

def part2
  AOC.input_lines('day_01').sum do |line|
    first = { digit: '0', idx: Float::INFINITY }
    last = { digit: '0', ridx: -1 }

    DIGITS.flatten.each do |token|
      idx = line.index(token)
      ridx = line.rindex(token)
      
      first = { digit: token, idx: idx } if idx && first[:idx] > idx
      last = { digit: token, ridx: ridx } if ridx && last[:ridx] < ridx
    end

    first = DIGITS[first[:digit]] || first[:digit]
    last = DIGITS[last[:digit]] || last[:digit]

    (first + last).to_i
  end
end

AOC.add_solution 1, -> { [part1, part2] }
