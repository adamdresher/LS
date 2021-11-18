# This is Variables, exercise 1.
=begin
puts "Hi! We've never met before, my name is Computer.  What's your name? "
name = gets.chomp

puts "Ah cool!  It's nice to meet you '#{name}'."
puts "Well, that's all I needed from ya.  Gotta jam, ciao!"
=end

# This is Variables, exercise 3.
=begin
puts "Hi! We've never met before, my name is Computer.  What's your name? "
name = gets.chomp

puts "Ah cool!  It's nice to meet you '#{name}'."
puts "Well, that's all I needed from ya.  Gotta jam, ciao!"

10.times { puts name }
=end

# This is Variables, exercise 4.
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