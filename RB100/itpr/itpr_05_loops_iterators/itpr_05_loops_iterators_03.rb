def countdownCycle(i)
  if i == 0
    puts "Happy New Ye-"
    puts "...oh, sorry.  I got caught up in the moment. =P"
    puts " "
  else
    puts i
    countdownCycle(i - 1)
  end
end

def countdown(i)
  if i <= 0
    puts "Sorry, that's not going to work."
  else
    countdownCycle(i)
  end
end

puts "Okay, what number should we count down from?"
num = gets.chomp.to_i
puts "\n"

countdown(num)