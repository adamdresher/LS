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
	- `m = p (j / (1 - (1 + j)**(-n)))`
	- m = monthly payment
	- p = loan amount
	- j = monthly interest rate
	- n = loan duration in months

---

**Implicit Requirements:**
- convert APR to monthly interest rate
- convert loan duration to loan duration in months
- 
---

**Clarifying Questions:**
1. Is APR given as an integer (0 - 100) or a float?
  - 
2. Is the loan amount a float or integer?
  - Integers make the most sense.  People receive loans for whole dollars, not cents.
3. Is the loan duration given in years or months?
  - The problem asks to calculate the loan duration in months.  This implies the given duration is not in months, but instead years.

---

**Mental Model:**
- Create a program asks user for 3 inputs: loan amount (as an integer- whole dollars), APR (as a float number between 0.00 - 100.00), and loan duration (as an integer- years).  Next, divide APR by 12 months to determine monthly interest rate.  Divide the loan duration by 12 months to determine the loan duration in months.  Calculate the monthly payment by inputting new variables into the given formula.  Finally output a string that states the monthly payment, loan duration in months, and monthly interest rate.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1
  -  Inputs:
  -  Output:
-  Example 2
  -  Inputs:
  -  Output:

---

_Your Test Cases:_

-  Example 3
  -  Inputs:
  -  Output:

---

_Your Edge Cases:_

-  Example 4
  -  Inputs:
  -  Output:

---

Data Structure
--------------

---

Algorithm
---------
- START

- DEF greeting

- DEF loan_amount
  - LOOP
    - PRINT request for input
      - GET input as an integer
      - SET amount = input
        - IF amount <= 0
          - PRINT error.
          - restart loop
        - ELSE return amount

- DEF loan_duration_years
  - PRINT request for input
    - GET input and check it's an integer


- DEF annual_percentage_rate
  - PRINT request for input
    - GET input as a float percentage of 100.00


- DEF loan_duration_months
  - READ years
    - SET loan_duration_months = years / 12

- DEF monthly_interest_rate
  - READ apr
    - SET monthly_interest_rate = apr / 12

- DEF monthly_payment
  - READ amount, monthly_interest_rate, loan_duration_months
    - SET monthly_payment = amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))

- DEF summary
  - READ amount, monthly_payment, loan_duration_months, monthly_interest_rate
  - PRINT string

- PRINT greeting
- PRINT loan_amount
  - SET amount = return
- PRINT loan_duration_years
  - SET years = return
- PRINT annual_percentage_rate
  - SET apr = return

- PRINT summary

- END
---

Code
----
=end

def prompt(message)
  puts("==> #{message}")
end

def greeting
  prompt("Welcome to the loan calculator.  What's your name?")
  name = gets.chomp
  prompt("Thanks #{name}, let's get started with your loan.")
  name
end

def loan_amount
  loop do
    prompt("What is the total amount you would like to take out as a loan?")
    amount = gets.to_f

    if amount <= 0
      prompt("Oh I'm sorry, I can only calculate loans greater than zero dollars.\n\
    Would you like to try a different amount?  (Press 'y' to enter a different amount)")
      try_again = gets.chomp.downcase
      unless try_again == 'y'
        prompt("Okay, goodbye.")
        break
      end
    else
      return amount
    end
  end
end

def loan_duration_years
  prompt("How many years would you like the loan to last?")
  gets.to_i
end

def annual_percentage_rate
  prompt("What would you like the APR to be set at?")
  gets.to_f
end

def loan_duration_months(years)
  years * 12
end

def monthly_interest_rate(apr)
  # (apr / 100) / 12
  apr / 12
end

def monthly_payment(amount, loan_duration_months, monthly_interest_rate)
  payments = amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))
  Float(format("%0.2f", payments))
end

def summary(amount, payments, months, rate)
  prompt("Based on the information you've given me, here's what you can expect:\
  \n\nYour loan is $#{amount}.\
  \nYour payments will be $#{payments}/month.\
  \nThere will be #{months} payments.\
  \nThe monthly interest rate will be #{rate}%.")
end

greeting
# if nil # trying to exit program if user chooses no in greeting
#   break
# end
amount = loan_amount
months = loan_duration_months(loan_duration_years)
rate = monthly_interest_rate(annual_percentage_rate)
payments = monthly_payment(amount, months, rate)
summary(amount, payments, months, rate)


# exit program if user chooses not to enter a valid loan amount
# validate name
# validate loan_duration
# validate apr