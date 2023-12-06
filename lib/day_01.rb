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

solution = lambda do
  part1 = File.readlines(AOC.input_file('day_01')).sum do |line|
    line.scan(/\d/).values_at(0, -1).reduce(&:+).to_i
  end

  part2 = File.readlines(AOC.input_file('day_01')).sum do |line|
    first = { digit: '0', idx: Float::INFINITY]
    last = { digit: '0', ridx: -1 }

    DIGITS.flatten.each do |token|
      idx = line.index(token)
      ridx = line.rindex(token)
      
      first = { digit: token, idx: idx } if idx && first[:idx] > idx
      last = { digit: token, ridx: ridx } if ridx && last[:ridx] < ridx
    end

    start = DIGITS[first[:digit]] || first[:digit]
    ed = DIGITS[last[:digit]] || last[:digit]

    (start + ed).to_i
  end

  [part1, part2]
end

AOC.add_solution 1, solution
