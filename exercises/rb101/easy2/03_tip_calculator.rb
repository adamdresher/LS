# def tip_calculator
#   puts 'What is the bill?'
#   bill = gets.to_f
#   puts 'What is the tip percentage?'
#   tip_rate = gets.to_f

#   tip_total = bill * (tip_rate / 100)
#   bill_total = bill + tip_total

#   puts "The tip is #{tip_total}"
#   puts "The total is #{bill_total}"
# end

# Solution 2.  Further Exploration.
def tip_calculator
  puts 'What is the bill?'
  bill = gets.to_f
  puts 'What is the tip percentage?'
  tip_rate = gets.to_f

  tip_total  = bill * (tip_rate / 100)
  bill_total = bill + tip_total
  tip_total  = format('%#.2f', tip_total)
  bill_total = format('%#.2f', bill_total)

  puts "The tip is #{tip_total}"
  puts "The total is #{bill_total}"
end

tip_calculator
