Game = Struct.new(:id, :rounds)

def parse_game(game_line)
  matches = game_line.match(/Game (?<id>\d+): (?<rounds>.+)$/)
  rounds = matches[:rounds].split(';').map do |round_string|
    round_string.split(',').map do |cubes_string|
      number, color = cubes_string.split
      [color, number.to_i]
    end.to_h
  end

  Game.new(matches[:id].to_i, rounds)
end

def parse_games
  AOC.input_lines('day_02').map { |line| parse_game(line) }
end

def part1
  max_cubes = { 'red' => 12, 'green' => 13, 'blue' => 14 }

  parse_games.filter do |game|
    game.rounds.none? do |round|
      round.any? { |color, number| max_cubes[color] < number }
    end
  end.sum(&:id)
end

def part2
  parse_games.sum do |game|
    game.rounds.reduce do |minimums, round|
      minimums.update(round) { |_color, number1, number2| [number1, number2].max }
    end.values.reduce(&:*)
  end
end

AOC.add_solution 2, -> { [part1, part2] }
