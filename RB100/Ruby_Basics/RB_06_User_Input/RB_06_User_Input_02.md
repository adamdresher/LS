## Your Age in Months
#### Write a program that asks the user for their age in years, and then converts that age to months.
Examples:
```
$ ruby age.rb
>> What is your age in years?
35
You are 420 months old.
```
___
#### Solution
```ruby
puts ">> What is your age in years?"
age = gets.chomp.to_i
age_in_months = age * 12
puts "You are #{age_in_months} months old."
```
___
#### Solution, LS
```ruby
puts '>> What is your age in years?'
age_in_years = gets
age_in_months = 12 * age_in_years.to_i
puts "You are #{age_in_months} months old."
```
#### Discussion
This solution is very similar to that of the previous exercise: we use `#puts` to display a prompt and output our results. and use `#gets` to obtain a value from the user.

In addition, we need to perform a calculation on the input value. To accomplish this, we need to convert the input value (which is a String) to an `Integer`, which we do with the `#to_i` method. We then multiply the result by 12 to get the age in months.
#### Further Exploration
What happens if you enter a non-numeric value for the age?
#### Solution
If `#to_i` is passed a string, it returns `0`.
___
#### Notes
LS is created the first variable to be as clear as the second (`age_in_years` matches `age_in_months`).  This may not be so important with such a small program, but it seems like a good habit to start making.

LS is using single quotations for the normal string and double quotations for the string with interpolation.  The single quotation seems unnecessary, but perhaps it helps with readability (knowing when there is something special in a string by easily identifying the single or double quotations could save time).
