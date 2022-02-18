=begin

RPSLS
==============

(Understand the) Problem
------------------------
1. This game is a variation on the Rock Paper Scissors game that adds two more options - Lizard and Spock.

Rules of the game:
scissors cuts paper
paper covers rock
rock crushes lizard
lizard poisons Spock
Spock smashes scissors
scissors decapitates lizard
lizard eats paper
paper disproves Spock
Spock vaporizes rock
rock crushes scissors

2. Typing the full word "rock" or "lizard" is tiring. Update the program so the user can type "r" for "rock," "p" for "paper," etc. Note that if you do bonus #1, you'll have two words that start with "s." How do you resolve that?

3. Keep score of the player's and computer's wins. When either the player or computer reaches three wins, the match is over, and the winning player becomes the grand winner. Don't add your incrementing logic to display_results. Keep your methods simple; they should perform one logical task — no more, no less.

-  Inputs:
	- 

-  Output:
	- 

---

**Problem Domain:**
- 

---

**Implicit Requirements:**
- 

---

**Clarifying Questions:**
1. What happens when the user inputs `ro` for `rock`?
    - Accept input if the sequence matches a sequence of a valid option.
2. What happens when the user inputs `s` for `Spock`, not `scissors?`
    - Require `sp` for `Spock` and `sc` for `scissors`.

---

**Mental Model:**
- Update `rps.rb` to include all winning options with `lizard` and `Spock` by updating the choices and list of all winning options (including the active verb for each scenario).

Update the input validation method to also match the choices' first character's index (first two characters for `Spock` and `scissors`).

Add an initial message that states the game is best 2 out of 3.
Add a win counter hash  at the beginning of the main loop (a key-value for user and one for computer).  After each match, add a point to the winner.  When user or computer reach `3`, declare a winner of the game and ask if the user wants to play again.
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1
  -  Inputs:
  -  Output:
-  Example 2
  -  Inputs:
  -  Output:

---

_Your Test Cases:_

-  Example 3
  -  Inputs:
  -  Output:

---

_Your Edge Cases:_

-  Example 4
  -  Inputs:
  -  Output:

---

Data Structure
--------------
YAML
Hash

---

Algorithm
---------
- START

  - SET yaml for messages

  - SET prompt for messages

  - SET COMPUTER_CHOICES = %w(rock paper scissors lizard Spock)

  - SET rpsls = {
    01: ['scissors', 'cuts', 'paper'],
    02: ['paper', 'covers', 'rock'],
    03: ['rock', 'crushes', 'lizard'],
    04: ['lizard', 'poisons', 'Spock'],
    05: ['Spock', 'smashes', 'scissors'],
    05: ['scissors', 'decapitates', 'lizard'],
    06: ['lizard', 'eats', 'paper'],
    07: ['paper', 'disproves', 'Spock'],
    08: ['Spock', 'vaporizes', 'rock'],
    09: ['rock', 'crushes', 'scissors']
    }

  - SET instructions?
    - PRINT greetings
    - PRINT message offering game instructions
    - LOOP do
      - GET user input (y/n)
      - IF input == y
        - PRINT instructions
        - BREAK
      - ELSIF input == n
        - BREAK
      - ELSE
        - next iteration

  - SET get_user_choice
    - PRINT request for user game choice
    - LOOP do
      - GET user input
      - IF input == rpsls as a string
        - RETURN input
      - ELSE
        - PRINT error and request new input
        - next iteration

  - SET get_computer_choice
    - READ sample of COMPUTER_CHOICES

  - SET check_answer(player1, player2)  # returning a value and returning boolean value.  How can I separate this concisely?  Or maybe this is concisely?
    - LOOP over rpsls
      - IF rpsls[verification][0] == player1 && rpsls[verification] [2] == player2
      - RETURN rpsls[verification] joined as a string

  - SET ouput_winner(user, computer)
    - IF check_answer(user, computer)
      - PRINT check_answers(user, computer)
      - PRINT ' You win!'
    - ELSIF check_answer(computer, user)
      - PRINT check_answers(computer, user)
      - PRINT 'The computer wins!'
    - ELSE
      - PRINT "It's a tie!"

  - SET play_again?
    - PRINT request to play again
    - GET user input (y/n)
    - input == y

  - LOOP
    - READ instructions?
    - SET user = get_user_choice
    - SET computer = get_computer_choice
    - READ output_winner
    - UNLESS play_again?
      - PRINT 'Thanks for playing.  Goodbye!'
      - BREAK
  - END

- END
---

Code
----
=end

# PROGRAM SETUP:

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
    gets()
  end
  puts()
  prompt('begin')
  sleep(0.7)
end

def check_name(input)
  if %w(spock Spock sp Sp).include?(input)
    'Spock'
  else
    input.downcase
  end
end

# returns a value if truthy.  It's being used for two purposes, its boolean and 
# its return value if true.  Is this considered an overly complex method?
def match_win?(first, second)
  RPSLS.each do |scenario|
    if check_name(scenario[0]).start_with?(first)\
    && scenario[2].start_with?(second)
      return scenario
    end
  end
  false
end

def display_match(user, computer)
  if match_win?(user, computer)
    match = match_win?(user, computer)
  elsif match_win?(computer, user)
    match = match_win?(computer, user)
  end
  match.join(' ').insert(-1, '.')
end

def display_winner(user, computer)
  if match_win?(user, computer)
    prompt_alt(display_match(user, computer))
    prompt('user_match')
  elsif match_win?(computer, user)
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
    prompt_alt("You chose: #{user_choice}")
    prompt_alt("Computer chose: #{computer_choice}\n\n")
    display_winner(user_choice, computer_choice)
    puts()

    if match_win?(user_choice, computer_choice) then user     += 1 end
    if match_win?(computer_choice, user_choice) then computer += 1 end

    prompt_alt("The score is now:\n    user:  #{user}\
    computer:  #{computer}")
    winner = nil
    if user == 3
      winner = 'user'
    elsif computer == 3
      winner = 'computer'
    end
    
    gets()
    if winner
      clear_screen
      10.times { puts() }
      prompt("#{winner}_win")
      break
    end
  end
end

# Program BEGINS:

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
# Is an else statement considered having a condition?
