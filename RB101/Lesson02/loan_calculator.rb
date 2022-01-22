=begin

Mortgage / Car Loan Calculator
==============

(Understand the) Problem
------------------------
Create a mortgage / car loan calculator.  Using three given values (the loan amount, APR, and loan duration), calculate the monthly interest rate, loan duration in months, and monthly payments.

-  Inputs:
	- the loan amount
	- the Annual Percentage Rate (APR)
	- the loan duration
-  Output:
	- monthly interest rate
	- loan duration in months
	- monthly payment
- Tips:
	- use rubocop
	- understand the formats for inputs
	- APR needs to be converted to a monthly interest rate
	- be specific when defining loan duration (months or years)
	- [example loan calculator](https://www.calculator.net/loan-calculator.html)

---

**Problem Domain:**
- math formula (choose more expressive names for local variables):
	- `m = p * (j / (1 - (1 + j)**(-n)))`
	- m = monthly payment
	- p = loan amount
	- j = monthly interest rate
	- n = loan duration in months

---

**Implicit Requirements:**
- calculate monthly interest rate using:   APR
- calculate loan duration in months using: loan duration in years
- calculate the monthly payment using:     loan amount, monthly interest rate, loan duration in months
---

**Clarifying Questions:**
1. Is APR given as an integer (0 - 100) or a float?
  - A float from 0.00 - 100.00.
2. Is the loan amount a float or integer?
  - Integers make the most sense.  People receive loans for whole dollars, not cents.
3. Is the loan duration given in years or months?
  - The problem asks to calculate the loan duration in months.  This implies the given duration is not in months, but instead years.

---

**Mental Model:**
- Create a program that asks user for her/his name, then asks for 3 inputs: loan amount, loan duration, & APR.  Calculate the loan duration in months by multiplying the loan duration in years by 12 months.  Calculate the monthly interest rate by divide APR by 12 months.  Calculate the monthly payment by inputting into the given formula: loan amount, loan duration in months, & monthly interest rate.  Print a summary of the loan details.

Pseudo-Code:
- Create a program that asks user for her/his name, then greets user.
- Ask user for the loan amount, then verify the input is an integer.
- Ask user for the loan duration in years, then verify the input as an integer.
- Ask user for the APR, then verify the input is a float number between 0.00 and 100.00.
- Calculate the loan duration in months.  Multiply loan duration in years by 12.
- Calculate the monthly interest rate.  Divide APR by 12.
- Calculate the monthly payment.  m = p * (j / (1 - (1 + j)**(-n)))
- Print a summary of the loan details.

Pseudo-Code, expanded:
- Ask user for her/his name
  - If name is nil, then ask again
  - Else greets user

- Ask user for the loan amount
  - If loan amount is an integer greater than 0
    - Return input
  - Else ask again

- Ask user for the loan duration in years
  - If loan duration in years is an integer greater than 0
    - Return input
  - Else
    - Ask again

- Ask user for the APR
  - If APR is a float number between 0.00 and 100.00
    - Return input
  - Else
    - Ask again

- Read loan duration in years
  - Multiply loan duration in years by 12
  - Set return to loan duration in months

- Read APR
  - Divide APR by 12
  - Set return to monthly interest rate

- Read loan amount, loan duration in years, monthly interest rate
  - m = p * (j / (1 - (1 + j)**(-n)))
  - Set return to loan payment

- Read loan duration in months, loan payment
  - Multiply loan duration in months by loan payment
  - Set return to total cost

-Read loan amount, total cost
  - Subtract loan amount from total cost
  - Set return to total interest

- Read loan amount, loan duration in months, loan payment, monthly interest rate, total cost, total interest
  - Print a summary of the loan details

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example TEMPLATE
  -  Inputs: (loan_amount, duration_years, apr)
  -  Output: (loan_amount, duration_months, loan_payment, monthly_interest_rate, total_interest, total_cost)

---

_Your Test Cases:_

-  Example 1
  -  Inputs: (24_000, 5, 5.0)
  -  Output: (24_000, 60, 452.91, 0.0042, 3_174.58, 27_174.58)
-  Example 2
  -  Inputs: (100_000, 4, 3.5) # works with `apr = (apr / 100) / 12`
  -  Output: (100_000, 48, 2,235.60, 0.0029, 7_308.81, 107_308.81)
-  Example 3
  -  Inputs: (50_000, 3, 20.0)
  -  Output: (50_000, 36, 1,858.18, 0.0167, 16,894.45, 66,894.45)

---

_Your Edge Cases:_

-  Example 4
  -  Inputs: (10_000, 1, 0.0)
  -  Output: (10_000, 12, 833.33, 0.0, 0.0, 10_000)

---

Data Structure
--------------
Possibly a hash.

---

Algorithm
---------
- START

- SET prompt
  - PRINT formated message

- SET valid_number?
  - IF number > 0
  - RETURN true

- SET float?
  - IF number is a float number
  - RETURN true

- SET formatting
  - SET input to two decimals deep

- SET greeting
  - LOOP
    - GET name = input
    - IF name == nil
      - PRINT error
      - NEXT iteration
    - ELSE
      - PRINT greeting

- SET loan_amount
  - LOOP
    - GET amount = input
    - IF amount == valid_number?
      - RETURN amount
    - ELSE
      - NEXT iteration

- SET loan_duration_in_years
  - LOOP
    - GET duration = input
    - IF duration == valid_number?
      - RETURN duration
    - ELSE
      - NEXT iteration

- SET apr
  - LOOP
  - GET apr = input
  - IF apr == float number (0.00...100.00)
    - RETURN input
  - ELSE
    - NEXT iteration

- SET loan_payment
  - READ amount, monthly_interest_rate, duration_months
  - calculate amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-duration_months)))

- READ greeting

- READ loan_amount
  - SET amount = return value

- READ loan_duration_in_years
  - SET duration_months = loan_duration_in_years * 12

- READ apr
  - SET monthly_interest_rate = (apr / 100) / 12

- SET payment = loan_payment

- SET total_cost = duration_months * loan_payment

- SET total_interst = total_cost - loan_amount

- PRINT summary of loan details with: amount, duration_months, loan_payment, monthly_interest_rate, total_cost, total_interest

- END
---

Code
----
=end

def prompt(message)
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
  loop do
    prompt("Welcome to the loan calculator.  What's your name?")
    name = gets.chomp
    if name.nil?
      prompt("Sorry, please enter your name:")
      next
    else
      prompt("Thanks #{name}, let's calculate your loan!")
      break
    end
  end
end

def loan_amount
  prompt("What is the total amount you would like to take out as a loan?")
  loop do
    amount = gets.to_i
    if valid_number?(amount)
      return amount
    else
      prompt("Oh I'm sorry, I can only calculate loans greater than zero dollars.")
      prompt("Please pick a number greater than zero:")
      next
    end
  end
end

def loan_duration_in_years
  loop do
    prompt("How many years would you like the loan to last?")
    duration = gets.to_i
    if valid_number?(duration)
      return duration
    else
      prompt("Sorry, that's not a valid input.")
      next
    end
  end
end

def apr
  loop do
    prompt("What would you like the APR to be set at?")
    apr = gets.chomp
    if float?(apr)
      return apr.to_f
    else
      prompt("Sorry, that's not a valid input.")
      next
    end
  end
end

def loan_payment(amount, monthly_interest_rate, duration_months)
  if monthly_interest_rate == 0
    amount / duration_months.to_f
  else
    num = (monthly_interest_rate + 1)**(-duration_months)
    num = (monthly_interest_rate / (1 - num))
    num = num * amount
  end
end

greeting
amount = loan_amount
duration_months = loan_duration_in_years * 12
monthly_interest_rate = (apr / 100) / 12
payment = loan_payment(amount, monthly_interest_rate, duration_months)
total_cost = duration_months * payment
total_interest = total_cost - amount

prompt("Based on the information you've given me, here's what you can expect:\n\n\
Your loan amount is $#{amount}.\n\
There will be a total of #{duration_months} payments.\n\
Your monthly payments will be $#{formatting(payment)}/month.\n\
The monthly interest rate will be approximately #{format('%#.4f', monthly_interest_rate)}%.\n\
The total amount of interest accrued will be $#{formatting(total_interest)}.\n\
The total cost paid for the loan will be $#{formatting(total_cost)}.")
