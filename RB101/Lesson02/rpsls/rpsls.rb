# Program defined:

require 'yaml'
MESSAGES = YAML.load_file('rpsls.yml')

VALID_CHOICES = %w(rock paper scissors lizard Spock)

RPSLS = [["Scissors", "cuts", "paper"],
         ["Paper", "covers", "rock"],
         ["Rock", "crushes", "lizard"],
         ["Lizard", "poisons", "Spock"],
         ["Spock", "smashes", "scissors"],
         ["Scissors", "decapitates", "lizard"],
         ["Lizard", "eats", "paper"],
         ["Paper", "disproves", "Spock"],
         ["Spock", "vaporizes", "rock"],
         ["Rock", "crushes", "scissors"]]

def prompt(message)
  puts("==> #{MESSAGES[message]}")
end

def prompt_alt(message)
  puts("==> #{message}")
end

def continue
  puts("\n\n")
  prompt('continue')
  gets()
end

def clear_screen
  system('clear')
end

def greetings
  puts()
  prompt('hi')
  prompt('divider')
  puts()
  prompt('game_rules')
  prompt('instructions?')
  if gets.chomp.downcase.start_with?('y')
    puts()
    prompt('instructions')
    RPSLS.each { |string| prompt_alt(string.join(' ') + ('.')) }
    continue
  end
  puts()
  prompt('begin')
  sleep(0.7)
end

def check_name(input)
  if %w(spock spoc spo sp).any?(input.downcase)
    'Spock'
  else
    input.downcase
  end
end

def match?(first, second)
  RPSLS.each do |scenario|
    if check_name(scenario[0]).start_with?(first)\
    && scenario[2].start_with?(second)
      return scenario
    end
  end
  false
end

def display_match(user, computer)
  if match?(user, computer)
    match = match?(user, computer)
  elsif match?(computer, user)
    match = match?(computer, user)
  end
  match.join(' ').insert(-1, '.')
end

def display_winner(user, computer)
  if match?(user, computer)
    prompt_alt(display_match(user, computer))
    prompt('user_match')
  elsif match?(computer, user)
    prompt_alt(display_match(computer, user))
    prompt('computers_match')
  else
    prompt('tie_match')
  end
end

def play_game
  match = 0
  user = 0
  computer = 0

  loop do
    clear_screen
    match += 1
    prompt_alt("Match # #{match}  -  User: #{user}  /  Computer: #{computer}")
    prompt('divider')

    user_choice = ''
    loop do
      prompt_alt("Choose one: #{VALID_CHOICES.join(', ')}")
      user_choice = check_name(gets.chomp)

      if user_choice == ''
        prompt('invalid')
      elsif VALID_CHOICES.any? { |choice| choice.start_with?(user_choice) }
        user_choice == 's' ? prompt('spock') : break
      else
        prompt('invalid')
      end
    end

    computer_choice = check_name(VALID_CHOICES.sample)

    puts()
    user_choice_completed = ''
    RPSLS.each do |phrase|
      if check_name(phrase[0]).start_with?(user_choice)
        user_choice_completed = check_name(phrase[0])
      end
    end

    prompt_alt("You chose: #{user_choice_completed}")
    prompt_alt("Computer chose: #{computer_choice}\n\n")
    display_winner(user_choice, computer_choice)
    puts()

    if match?(user_choice, computer_choice) then user     += 1 end
    if match?(computer_choice, user_choice) then computer += 1 end

    prompt_alt("The score is now:\n    user:  #{user}\
    computer:  #{computer}")
    winner = nil
    if user == 3
      winner = 'user'
    elsif computer == 3
      winner = 'computer'
    else
      continue
    end
    
    
    if winner
      sleep(1.5)
      clear_screen
      10.times { puts() }
      prompt("#{winner}_win")
      break
    end
  end
end

# Program begins:

greetings

loop do
  play_game

  prompt('replay?')
  replay = gets.chomp
  break unless replay.downcase.start_with?('y')
  prompt('replay')
end

prompt('goodbye')

# rubocop raises cops for ABC complexity.
# http://wiki.c2.com/?AbcMetric
# https://en.wikipedia.org/wiki/ABC_Software_Metric
# ABC = <5, 7, 14>
