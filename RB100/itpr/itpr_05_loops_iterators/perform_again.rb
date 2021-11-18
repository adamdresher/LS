# This program repeatedly asks user a question until a given answer is input.

loop do
  puts "Do you want to do that again?"
  answer = gets.chomp
  if answer != "y"
    break
  end
end
