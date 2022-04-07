def prompt(message)
  puts("==> #{message}")
end

def get_number
  loop do
    number = gets.to_f
    if valid_number?(number)
      return number
    else
      prompt('Please enter a positive number:')
    end
  end
end

def valid_number?(input)
  input >= 0
end

math = {
        addition:       ['+', nil],
        subtraction:    ['-', nil],
        multiplication: ['*', nil],
        division:       ['/', nil],
        remainder:      ['%', nil],
        power:          ['**', nil]
        }

prompt('Enter the first number:')
first_num = get_number

prompt('Enter the second number:')
second_num = get_number
while second_num == 0.0 
  prompt('Please enter a number greater than 0:')
  second_num = get_number
end

math[:addition][1]       = first_num +  second_num
math[:subtraction][1]    = first_num -  second_num
math[:multiplication][1] = first_num *  second_num
math[:division][1]       = first_num /  second_num
math[:remainder][1]      = first_num %  second_num
math[:power][1]          = first_num ** second_num

math.each_value do |value|
  prompt("#{first_num} #{value[0]} #{second_num} = #{value[1]}")
end

# # Example input:
# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17

# # Ouput:
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103
