RPSLS
==============

### Understanding the Problem
1. This game is a variation on the Rock Paper Scissors game that adds two more options - Lizard and Spock.

        Rules of the game:

        - scissors cuts paper
        - paper covers rock
        - rock crushes lizard
        - lizard poisons Spock
        - Spock smashes scissors
        - scissors decapitates lizard
        - lizard eats paper
        - paper disproves Spock
        - Spock vaporizes rock
        - rock crushes scissors

2. Typing the full word "rock" or "lizard" is tiring. Update the program so the user can type "r" for "rock," "p" for "paper," etc. Note that if you do bonus #1, you'll have two words that start with "s." How do you resolve that?

3. Keep score of the player's and computer's wins. When either the player or computer reaches three wins, the match is over, and the winning player becomes the grand winner. Don't add your incrementing logic to display_results. Keep your methods simple; they should perform one logical task — no more, no less.

**Explicit Requirements:**

- Input: User input.
- Output: Strings.

**Implicit requirements:**

- What happens when the user inputs `ro` for `rock`?
    - Accept input if the sequence matches a sequence of a valid option.
- What happens when the user inputs `s` for `Spock`, not `scissors?`
    - Require `sp` for `Spock` and `sc` for `scissors`.

**Mental Model:**

- Update `rps.rb` to include all winning options with `lizard` and `Spock` by updating the choices and list of all winning options (including the active verb for each scenario).

- Update the input validation method to also match the choices' first character's index (first two characters for `Spock` and `scissors`).

- Add an initial message that states the game is best 2 out of 3.
Add a win counter hash  at the beginning of the main loop (a key-value for user and one for computer).  After each match, add a point to the winner.  When user or computer reach `3`, declare a winner of the game and ask if the user wants to play again.

---
### Examples/Tests
```ruby

```
---
### Data Structures
- YAML
- Hash
- Array

---
### Algorithm
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

  - SET greetings
    - PRINT hello
    - PRINT instructions?
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

  - SET match?(player1, player2)  # returning a value and returning boolean value.  How can I separate this concisely?  Or maybe this is concisely?
    - LOOP over rpsls
      - IF rpsls[verification][0] == player1 && rpsls[verification] [2] == player2
        - RETURN rpsls[verification]
    - RETURN false

  - SET display_match(user, computer)
    - IF user wins
      - RETURN winning message
    - ELSE computer wins
      - RETURN winning message

  - SET display_winner(user, computer)
    - IF check_answer(user, computer)
      - PRINT check_answers(user, computer)
      - PRINT 'You win!'
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
### Code
*see `rpsls.rb`*
