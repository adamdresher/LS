# frozen_string_literal: true

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}.freeze

def string_to_integer(string)
  number = 0

  string.chars.reverse.each_with_index do |e, i|
    a_digit = DIGITS[e]

    number = if i.zero?
               number + a_digit
             else
               number + a_digit * (10**i)
             end
  end
  number
end

def string_to_signed_integer(string)
  neg_sign = string.start_with?('-')
  signed_integer = string

  signed_integer.slice!(0) if string.start_with?('-', '+')
  signed_integer = string_to_integer(signed_integer)

  neg_sign == true ? signed_integer * -1 : signed_integer
end

# SOLUTION.  FURTHER EXPLORATION.
def string_to_signed_integer_fe(string)
  sign = string.start_with?('-') ? -1 : 1
  number = string.start_with?('-', '+') ? string[1..-1] : string

  string_to_integer(number) * sign
end
