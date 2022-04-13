# def retirement
#   require 'date'
#   current_year = Date.today.year

#   puts 'What is your age?'
#   age = gets.to_i
#   puts 'What age would you like to retire?'
#   retirement_age = gets.to_i

#   year_born       = current_year - age
#   retirement_year = year_born + retirement_age
#   countdown       = retirement_year - current_year

#   puts "It's #{current_year}.  You will retire in #{retirement_year}."
#   puts "You have only #{countdown} years of work to go!"
# end

# Solution 2.
def retirement
  current_year = Time.now.year

  puts 'What is your age?'
  age = gets.to_i
  puts 'What age would you like to retire?'
  retirement_age = gets.to_i

  year_born       = current_year - age
  retirement_year = year_born + retirement_age
  countdown       = retirement_year - current_year

  puts "It's #{current_year}.  You will retire in #{retirement_year}."
  puts "You have only #{countdown} years of work to go!"
end

p retirement
