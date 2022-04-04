# frozen_string_literal: true

# def string_to_integer(string)
#   number = 0

#   string.chars.reverse.each_with_index do |e, i|
#     num = case e
#     when '0' then 0
#     when '1' then 1
#     when '2' then 2
#     when '3' then 3
#     when '4' then 4
#     when '5' then 5
#     when '6' then 6
#     when '7' then 7
#     when '8' then 8
#     when '9' then 9
#     end

#     if i == 0
#       number += num
#     else
#       number += num * (10**i)
#     end
#   end
  
#   number
# end

# Solution.  Further Exploration.
HEXADECIMAL_TO_I = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
}

def hexadecimal_to_integer(hex)
  placeholder = []
  integer = 0

  hex.each_char do |char|
    if ('a'..'f').include?(char) then char.upcase! end
    placeholder << HEXADECIMAL_TO_I[char]
  end

  placeholder.reverse.each_with_index do |e, i|
    integer += (e * 16**i)
  end

  if hex == ''
    puts("<ARGUMENT ERROR: input cannot be an empty string>")
  else
    integer
  end

end

# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570

# Further Exploration.
p hexadecimal_to_integer('4D9f') == 19871
p hexadecimal_to_integer('FFFFFF') == 16777215
p hexadecimal_to_integer('ffffff') == 16777215
p hexadecimal_to_integer('aAbBcC') == 11189196
p hexadecimal_to_integer('') == 0
