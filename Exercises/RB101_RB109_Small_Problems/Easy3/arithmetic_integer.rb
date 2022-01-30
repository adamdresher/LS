=begin
Understanding the **Problem**:
- Write a program that prompts the user for two positive integers, and then prints the results of the following maths on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

Questions/Answers:
- What is the input?
    - Prompt user for two positive integers.
- What is the output?
    - Strings for +, -, *, /, remainder, **.
- Do we validate inputs?
    - No.
- 
        
Mental Model:
- Create a program that asks user for a number, then again for a second number.  Calculate the following with the two numbers: addition, subtraction, product, quotient, remainder, and power.  Output the equations with results.

**Examples/Tests**:
```ruby
==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103
````
**Data Structures**:
Possible array.

**Algorithm**:
- START

- SET prompt

- SET hash for math
  - addition: ['+', nil]
  - subtraction: ['-', nil]
  - multiplication: ['*', nil]
  - division: ['/', nil]
  - remainder: ['%', nil]
  - power: ['**', nil]

- PRINT request for first number
- GET first number
- SET first_num = input

- PRINT request for second number
- GET second number
- SET second_num = second number

- SET math[:addition][1]       = first_num +  second_num
- SET math[:subtraction][1]    = first_num -  second_num
- SET math[:multiplication][1] = first_num *  second_num
- SET math[:division][1]       = first_num /  second_num
- SET math[:remainder][1]      = first_num %  second_num
- SET math[:power][1]          = first_num ** second_num

- WHILE iterator < hash length
  - PRINT prompt(first_num + math[operator][0] + second_num = math[opeartor][1])
  - NEXT iteration

- END

**Code**:
=end
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
