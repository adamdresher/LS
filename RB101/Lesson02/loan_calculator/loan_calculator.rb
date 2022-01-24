# Program defined:
require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def clear_screen
  system("clear")
end

def prompt(message)
  puts("==> #{MESSAGES[message]}")
end

def prompt_(message)
  puts("\n==> #{MESSAGES[message]}")
end

def formatted(input)
  number         = format('%#0.2f', input)
  num_with_comma = []

  number.chars.reverse.each_with_index do |num, index|
    if index % 3 == 0 && ([0, 3].include?(index) == false)
      num_with_comma.push(',')
    end
    num_with_comma.push(num)
  end

  num_with_comma.reverse.join
end

def valid_number?(input)
  input > 0
end

def float?(input)
  case input.to_f.to_s
    when input         then true
    when input + '0'   then true
    when input +'.0'   then true
    when input + '0.0' then true
    else                    false
  end
end

def greeting
  clear_screen
  prompt('hi')
  sleep(1)
  prompt_('name')
  loop do
    name = gets.chomp
    if name == ''
      prompt('invalid_name')
    else
      puts("==> Thanks #{name}, let's calculate your loan!")
      break
    end
  end
end

def get_amount
  sleep(1)
  prompt_('set_amount')
  loop do
    amount = gets.to_i
    if valid_number?(amount)
      puts("==> Okay, the loan amount is set to $#{formatted(amount)}.")
      return amount
    else
      prompt('invalid_amount')
    end
  end
end

def get_duration_years
  sleep(1)
  prompt_('set_duration')
  loop do
    duration = gets.to_i
    valid_number?(duration) ? (return duration) : prompt('invalid_duration')
  end
end

def get_apr
  sleep(1)
  prompt_('set_apr')
  loop do
    apr = gets.chomp
    float?(apr) ? (return apr.to_f) : prompt('invalid_apr')
  end
end

def loan_payment(amount, monthly_rate, duration_months)
  if monthly_rate == 0
    amount / duration_months.to_f
  else
    num = (monthly_rate + 1)**(-duration_months)
    (monthly_rate / (1 - num)) * amount
  end
end

def processing(count)
  clear_screen
  prompt('one_moment')
  count.times do |num|
    dots = '.' * (num + 1)
    puts("Processing#{dots}")
    sleep(0.4)
  end
  puts("Processing#{('.' * count)} Done!")
  sleep(1)
end

def summary(amount, duration_months, payment, rate, total_cost)
  sleep(1)
  clear_screen
  puts("==> Based on the information you've given me, \
here's what you can expect:\n\n\
    The loan amount is $#{formatted(amount)}\n\
    There will be a total of #{duration_months} payments\n\
    The monthly payments will be $#{formatted(payment)}/month\n\
    The monthly interest rate will be approximately #{formatted(rate)}%\n\
    The total interest accrued will be $#{formatted(total_cost - amount)}\n\
    The total cost paid for the loan will be $#{formatted(total_cost)}\n\n")
end

# Program begins:
greeting

loop do
  amount                = get_amount
  duration_months       = get_duration_years * 12
  rate                  = get_apr / 12 # print only
  monthly_rate          = rate / 100
  payment               = loan_payment(amount, monthly_rate, duration_months)
  total_cost            = duration_months * payment

  processing(10)

  summary(amount, duration_months, payment, rate, total_cost)

  prompt('loop?')
  if gets.chomp == 'y'
    prompt('new_loan')
    sleep(1.5)
    clear_screen
  else
    puts('')
    prompt('goodbye')
    break
  end
end
