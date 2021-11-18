Modify name.rb again so that it first asks the user for their first name, saves it into a variable, and then does the same for the last name. Then outputs their full name all at once.

##### MY SOLUTION
Updated name.rb

```
puts "Hi! We've never met before, my name is Computer.  What's your first name?"
first_name = gets.chomp
puts " "
puts "Thanks, #{first_name}.  Can I get your last name?"
last_name = gets.chomp
puts " "
name = first_name + " " + last_name
puts "Great thanks!  So your full name is #{name}?"
puts "Don't answer that, it was rhetorical. =P"
puts " "
puts "."
puts ".."
puts "..."
puts "Well, this is awkward."
puts "Yikes- look at the time!  Okay gotta jam, ciao!"
```