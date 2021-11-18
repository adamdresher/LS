Write a program that takes a number from the user between 0 and 100 and reports back whether the number is between 0 and 50, 51 and 100, or above 100.

##### MY SOLUTION
```
puts "Let me try guessing your number."
puts "Okay, my eyes are closed.  Write down a number between 1 - 100: "
answer = gets.chomp.to_i

case
  when answer >= 0 && answer <= 50
    puts "It's between 0 and fifty, isn't it?! **Ruby strikes cool computer pose**"
  when answer > 50 && answer <= 100
    puts "I feel like your number is between fifty-one and one hundred."
  when answer < 0
    puts "Hrmm.  Do you feel that negative energy around us too.  You picked a number below zero, didn't you??"
  else
    puts "Okay, I'm not feeling anything... you picked a number above a hundred, did you? =/"
end
```