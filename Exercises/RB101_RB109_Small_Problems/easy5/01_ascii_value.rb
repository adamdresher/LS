# frozen_string_literal: true

# def ascii_value(string)
#   sum = 0
#   string.chars.each { |char| sum += char.ord }
#   sum
# end

# SOLUTION.  REFACTORED.
# def ascii_value(string)
#   sum = 0
#   sum = string.chars.map { |char| sum += char.ord }.last
# end

# SOLUTION.  REFACTORED 2.
# def ascii_value(string)
#   string.chars.reduce(0) { |sum, char| sum += char.ord }
# end

# SOLUTION.  REFACTORED 3.
def ascii_value(string)
  string.chars.map { |char| char.ord }.sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
