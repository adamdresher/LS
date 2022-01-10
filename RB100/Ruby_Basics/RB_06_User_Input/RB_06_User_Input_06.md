## Passwords
#### Write a program that displays a welcome message, but only after the user enters the correct password, where the password is a string that is defined as a constant in your program. Keep asking for the password until the user enters the correct password.
Examples:
```
$ ruby password.rb
>> Please enter your password:
Hello
>> Invalid password!
>> Please enter your password:
Secret
>> Invalid password!
>> Please enter your password:
SecreT
Welcome!
```
___
#### Solution
```ruby
password = 'wubba lubba dub dub!'
user_input = nil

until user_input == password
  puts '>> Please enter your password:'
  user_input = gets.chomp
  puts 'Invalid entry' if user_input != password
end

puts 'Welcome!'

```
___
#### Solution, LS
```ruby
PASSWORD = 'SecreT'

loop do
  puts '>> Please enter your password:'
  password_try = gets.chomp
  break if password_try == PASSWORD
  puts '>> Invalid password!'
end

puts 'Welcome!'
```
#### Discussion
This exercise introduces a small variation on the pattern we've established in that we don't need to provide access to the entered password outside of the loop, so we don't need to initialize `password_try` before entering the loop.

Entering passwords is one of the few places where user input should be case-sensitive, so we don't attempt to convert the input to a consistent case, but instead compare the entry directly against the stored password.
___
This exercise should not be used as a model for how to deal with passwords in real programs. It has at least 2 major faults:

- The actual password is stored as clear text, not as encrypted form
- The password the user enters is visible for shoulder surfers to see

The purpose of this program is to provide a demonstration of obtaining inputs in different situations.
___
#### Notes
