VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("==> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

# def display_results(player, computer)
#   if    (player == 'rock' && computer == 'scissors') ||
#         (player == 'paper' && computer == 'rock') ||
#         (player == 'scissors' && computer == 'paper')
#     prompt("You won!")
#   elsif (player == 'rock' && computer == 'rock') ||
#         (player == 'paper' && computer == 'paper') ||
#         (player == 'scissors' && computer == 'scissors')
#     prompt("It's a tie!")
#   else
#     prompt("Computer won!")
#   end
# end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  Kernel.puts()
  prompt("You chose: #{choice}")
  prompt("Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing.  Goodbye!")

# rubocop raises cops for ABC complexity.
# http://wiki.c2.com/?AbcMetric
# https://en.wikipedia.org/wiki/ABC_Software_Metric
# ABC = <5, 7, 14>
# Is an else statement considered having a condition?
