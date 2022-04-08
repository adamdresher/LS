# frozen_string_literal: true

# def staggered_case(string)
#   string.split('').map.with_index do |char, i|
#     i.even? ? char.upcase : char.downcase
#   end.join
# end

# Solution 2.  Further Exploration.
def staggered_case(string, start_upcase = true)
  string.chars.map.with_index do |char, i|
    check_index = start_upcase ? i.even? : i.odd?

    check_index ? char.upcase : char.downcase
  end.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
