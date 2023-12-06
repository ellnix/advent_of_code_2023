module AOC
  class << self
    def solutions
      @solutions ||= {}
    end

    def add_solution(key, solution)
      solutions[key] = solution
    end

    def input_file(name)
      "#{__dir__}/../input/#{name}"
    end
  end
end

Dir["#{__dir__}/day_*"].sort.each { |source_file| require_relative source_file }

days = ARGV.to_a

days.each do |day|
  puts "Day #{day}:"
  puts AOC.solutions[day.to_i].call
end

