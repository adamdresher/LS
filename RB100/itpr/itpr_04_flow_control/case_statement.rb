# case_statement.rb

a = 5

# Standard case format.
case a
  when 5
    puts "my_case is 5"
  when 6
    puts "my_case is 6"
  else
    puts "my_case isn't 5 or 6"
end

# Standard if/else format.
if a = 5,
  puts "my_case is 5"
elsif a = 6
  puts "my_case is 6"
else
  puts "my_case isn't 5 or 6"
end

# More concise if/else format.
if a == 5 then puts "my_case is 5"
elsif a == 6 then puts "my_case is 6"
else puts "my_case isn't 5 or 6"
end

# Case format, refactored to be more concise.
case a
  when 5
    "my_case is 5"
  when 6
    "my_case is 6"
  else
    "my_case isn't 5 or 6"
end

# An alternate form of a case statement.
case
  when a == 5
    puts "my_case is 5"
  when a == 6
    puts "my_case is 6"
  else
    puts "my_case isn't 5 or 6"
end