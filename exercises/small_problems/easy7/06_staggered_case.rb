# def staggered_case(string)
#   new_string = ''
#   string.chars.map.with_index do |char, i|
#     new_string << if i == 0 || new_string[i - 1].match?(/[a-z]/)
#                     char.upcase
#                   else
#                     char.downcase
#                   end
#   end
#   new_string
# end

# Solution 2.  Further Exploration.
# def staggered_case(string, start_upcase = true, all_char = false)
#   return_string = ''
#   set_upcase = start_upcase

#   string.each_char.with_index do |char, i|
#     if all_char
#       return_string << swap_case(char, set_upcase)
#       set_upcase = !set_upcase
#     else
#       if char.match(/[^A-z]/)
#         return_string << char
#       else
#         return_string << swap_case(char, set_upcase)
#         set_upcase = !set_upcase
#       end
#     end
#   end
#   return_string
# end

# def swap_case(string, set_upcase)
#   set_upcase ? string.upcase : string.downcase
# end

# Solution 3.  Further Exploration.
def staggered_case(string, start_upcase = true, all_char = false)
  return_string = ''
  set_upcase = start_upcase

  string.each_char.with_index do |char, i|
    if !all_char && char.match(/[^A-z]/)
      return_string << char
    else
      return_string << swap_case(char, set_upcase)
      set_upcase = !set_upcase
    end
  end
  return_string
end

def swap_case(string, set_upcase)
  set_upcase ? string.upcase : string.downcase
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
# Further Exploration.
p test = '!!!!I\'m testing "non-alpha chars and the first char.'
p staggered_case(test, true, true)
p staggered_case(test, true, false)
p staggered_case(test, false, true)
p staggered_case(test, false, false)
