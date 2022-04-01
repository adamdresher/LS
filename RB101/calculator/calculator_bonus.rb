
require 'yaml'
MESSAGES = YAML.load_file('rb101_lesson02_calculator_messages.yml')
LANGUAGE = 'english'

def messages(message, lang='english')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE) # string iterpolation in YAML not functioning
  Kernel.puts("=> #{message}")
end

def valid_number?(input)
  input.chars().all?('0') || input.to_i() != 0
end

def float?(input)
  Float(input) rescue false || input == '0.' # edge case with input '0.'
end

def number?(input)
  valid_number?(input) || float?(input)
end

def operation_to_message(op)
  operation = case op
              when '1'
                'Adding'
              when '2'
                'Subtracting'
              when '3'
                'Multiplying'
              when '4'
                'Dividing'
              end
  operation
end

prompt('welcome')

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

prompt('greeting')

loop do # main loop
  number1 = ''
  loop do
    prompt('first_num')
    number1 = Kernel.gets().chomp()

    if number?(number1)
      number1 = number1.to_f
      break
    else
      prompt('valid_num')
    end
  end

  number2 = ''
  loop do
    prompt('second_num')
    number2 = Kernel.gets().chomp()

    if number?(number2)
      number2 = number2.to_f
      break
    else
      prompt('valid_num')
    end
  end

  operation_prompt = <<-MSG
What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt('operation_prompt') # seems superfluous to reference YAML file until variable is inside it.

  operator = ''
  loop do
    operator = gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('valid_operator')
    end
  end

  prompt('processing')

  result = case operator
           when '1'
             number1 + number2 # moved the #to_f to the assignment loops
           when '2'
             number1 - number2
           when '3'
             number1 * number2
           when '4'
             number1 / number2
           end

  prompt('result')

  prompt('again?')
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt('goodbye')
