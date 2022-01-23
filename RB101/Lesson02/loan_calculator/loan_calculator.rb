require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def prompt(message)
  puts("==> #{MESSAGES[message]}")
end
# def prompt(message, custom = '')
  # text = format(MESSAGES[message])
  # text = format(MESSAGES[message], custom: custom)
  # puts("==> #{text}")
# end

def formatted(num)
  format('%#.2f', num)
end

def valid_number?(num)
  num > 0
end

def float?(num)
  Float(num) rescue false
end

def greeting
  system("clear") || system("cls")
  prompt('hi')
  loop do
    name = gets.chomp
    if name == ''
      prompt('invalid_name')
    else
      puts("==> Thanks #{name}, let's calculate your loan!")
      # prompt('valid_name', name)
      break
    end
  end
end

def loan_amount
  sleep(1)
  system("clear") || system("cls")
  prompt('loan_amount')
  loop do
    amount = gets.to_i
    if valid_number?(amount)
      puts("==> Okay, the loan amount is set to $#{formatted(amount)}.")
      # prompt('valid_amount', formatted(amount))
      return amount
    else
      prompt('invalid_amount')
      prompt('new_amount')
    end
  end
end

def loan_duration_in_years
  sleep(1)
  system("clear") || system("cls")
  loop do
    prompt('loan_duration')
    duration = gets.to_i
    valid_number?(duration) ? (return duration) : prompt('invalid_duration')
  end
end

def apr
  sleep(1)
  system("clear") || system("cls")
  prompt('set_apr')
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

greeting

loop do
  amount                = loan_amount
  duration_months       = loan_duration_in_years * 12
  rate                  = apr / 12 # print only
  monthly_rate          = rate / 100
  payment               = loan_payment(amount, monthly_rate, duration_months)

  total_cost            = duration_months * payment
  total_interest        = total_cost - amount
  sleep(1)
  prompt('processing3')
  sleep(0.5)
  prompt('processing2')
  sleep(0.5)
  prompt('processing1')
  sleep(0.5)
  prompt('processing0')
  sleep(1)
  system("clear") || system("cls")
  puts("==> Based on the information you've given me, \
here's what you can expect:\n\n\
    Your loan amount is $#{formatted(amount)}.\n\
    There will be a total of #{duration_months} payments.\n\
    Your monthly payments will be $#{formatted(payment)}/month.\n\
    The monthly interest rate will be approx. #{formatted(rate)}%.\n\
    The total interest accrued will be $#{formatted(total_interest)}.\n\
    The total cost paid for the loan will be $#{formatted(total_cost)}.\n\n")

  prompt('loop?')
  if gets.chomp == 'y'
    prompt('new_loan')
  else
    puts('')
    prompt('goodbye')
    break
  end
end
