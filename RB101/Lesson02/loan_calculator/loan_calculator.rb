require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def prompt(message)
  puts("==> #{MESSAGES[message]}")
end

def prompt2(message)
  puts("==> #{message}")
end

def valid_number?(num)
  num > 0
end

def float?(num)
  Float(num) rescue false
end

def formatting(num)
  format("%#.2f", num)
end

def greeting
  prompt('hi')
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

def loan_amount
  prompt('loan_amount')
  loop do
    amount = gets.to_i
    if valid_number?(amount)
      return amount
    else
      prompt('invalid_amount')
      prompt('new_amount')
    end
  end
end

def loan_duration_in_years
  loop do
    prompt('loan_duration')
    duration = gets.to_i
    valid_number?(duration) ? (return duration) : prompt('invalid_duration')
    # if valid_number?(duration)
    #   return duration
    # else
    #   prompt('invalid_duration')
    # end
  end
end

def apr
  loop do
    prompt('set_apr')
    apr = gets.chomp
    float?(apr) ? (return apr.to_f) : prompt('invalid_apr')
    # if float?(apr)
    #   return apr.to_f
    # else
    #   prompt('invalid_apr')
    # end
  end
end

def loan_payment(amount, monthly_interest_rate, duration_months)
  if monthly_interest_rate == 0
    amount / duration_months.to_f
  else
    num = (monthly_interest_rate + 1)**(-duration_months)
    num = (monthly_interest_rate / (1 - num))
    num * amount
  end
end

greeting
amount = loan_amount
duration_months = loan_duration_in_years * 12
monthly_interest_rate = (apr / 100) / 12
payment = loan_payment(amount, monthly_interest_rate, duration_months)
total_cost = duration_months * payment
total_interest = total_cost - amount

prompt2("Based on the information you've given me, here's what you can expect:\n\n\
Your loan amount is $#{formatting(amount)}.\n\
There will be a total of #{duration_months} payments.\n\
Your monthly payments will be $#{formatting(payment)}/month.\n\
The monthly interest rate will be approximately #{format('%#.4f', monthly_interest_rate)}%.\n\
The total amount of interest accrued will be $#{formatting(total_interest)}.\n\
The total cost paid for the loan will be $#{formatting(total_cost)}.")
